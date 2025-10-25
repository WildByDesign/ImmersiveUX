#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-once
#include "Interfaces\IActivationFactory.au3"
#include "Interfaces\Windows.Foundation.IAsyncInfo.au3"
#include "Interfaces\Windows.Foundation.IAsyncOperation.au3"
#include "Interfaces\Windows.Foundation.IAsyncAction.au3"
#include "Interfaces\Windows.Foundation.Collections.IVectorView.au3"
#include "Enumerations\Windows.Foundation.AsyncStatus.au3"
#include "Interfaces\IReference.au3"

Func _WinRT_GetReference($pReference, $sDataType, $pStruct = 0)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pReference, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sDataType = "ptr" And (Not $pStruct) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pReference, $sDataType, $pStruct)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc

Func _WinRT_DisplayError($iError = @error, $iScriptLineNumber = @ScriptLineNumber)
	Local $sMsg
	If $iError = 1 Then
		$sMsg = "The operation was successful but returned False."
	Else
		$sMsg = _WinAPI_GetErrorMessage($iError)
	EndIf
	ConsoleWrite(StringFormat("(%d,0) [0x%08X] %s\r\n", $iScriptLineNumber, $iError, StringStripWS($sMsg, 3)))
EndFunc   ;==>_WinRT_DisplayError

Func _WinRT_DisplayClass($pObject, $iScriptLineNumber = @ScriptLineNumber)
	Local $sClass = IInspectable_GetRuntimeClassName($pObject)
	If @error Then
		_WinRT_DisplayError()
	Else
		ConsoleWrite(StringFormat("(%d,0) Class: %s\r\n", $iScriptLineNumber, $sClass))
	EndIf
EndFunc

Func _WinRT_DisplayInterfaces($pObject, $iScriptLineNumber = @ScriptLineNumber)
	ConsoleWrite(StringFormat("(%d,0) Supported Interfaces:\r\n", $iScriptLineNumber))
	Local $sClass = IInspectable_GetRuntimeClassName($pObject)
	If $sClass Then ConsoleWrite(StringFormat("Class: %s\r\n", $sClass))
	Local $aIIDs = IInspectable_GetIids($pObject), $sInterface
	If @error Then
		ConsoleWrite(StringFormat("Operation Failed. (%s)\r\n", StringStripWS(_WinAPI_GetErrorMessage(@error), 3)))
		Return
	EndIf
	For $i = 0 To UBound($aIIDs) - 1
		$sInterface = $__g_mIIDs[$aIIDs[$i]]
		$sInterface = ($sInterface) ? StringFormat("%s - %s", $aIIDs[$i], $sInterface) : $aIIDs[$i]
		ConsoleWrite($sInterface & @CRLF)
	Next
	ConsoleWrite(@CRLF)
EndFunc   ;==>_WinRT_DisplayInterfaces

Func _WinRT_WaitForAsync(ByRef $pAsync, $sDataType, $iTimeout = 500)
	Local $pAsyncInfo = IUnknown_QueryInterface($pAsync, $sIID_IAsyncInfo)
	If @error Then Return SetError(@error, @extended, -1)

	Local $hTimer = TimerInit()
	Local $iStatus, $iError, $vResult = Null
	Do
		$iStatus  = IAsyncInfo_GetStatus($pAsyncInfo)
		If TimerDiff($hTimer) > $iTimeout Then ExitLoop
		Sleep(10)
	Until $iStatus <> _WinRT_GetEnum($mAsyncStatus, "Started")
	Switch $iStatus
		Case _WinRT_GetEnum($mAsyncStatus, "Started")
			$iStatus = -1
			$iError = $WAIT_TIMEOUT
		Case Else
			$iError = IAsyncInfo_GetErrorCode($pAsyncInfo)
	EndSwitch

	If $iStatus = _WinRT_GetEnum($mAsyncStatus, "Completed") Then
		IUnknown_QueryInterface($pAsync, $sIID_IAsyncAction)
		If Not @error Then
			$vResult = ($iError = $S_OK)
		Else
			$vResult = IAsyncOperation_GetResults($pAsync, $sDataType)
			If @error Then $iError = @error
		EndIf
	EndIf
	_WinRT_DeleteObject($pAsync)

	Return SetError($iError, $iStatus, $vResult)
EndFunc

Func _WinRT_DeleteObject(ByRef $pObject)
	Local $iRefCount
	Do
		$iRefCount = IUnknown_Release($pObject)
		If @error Then Return SetError(@error, @extended, False)
	Until $iRefCount = 0

	If Not $iRefCount Then $pObject = Ptr(0)

	Return ($iRefCount = 0)
EndFunc

Func _WinRT_ColCount($pCollection)
	Local $iCount = IVectorView_GetSize($pCollection)
	Return SetError(@error, @extended, $iCount)
EndFunc

Func _WinRT_ColGetAt($pCollection, $iIndex)
	Local $pObject = IVectorView_GetAt($pCollection, $iIndex)
	Return SetError(@error, @extended, $pObject)
EndFunc

Func _WinRT_ColGetNext($pCollection)
	Local Static $pThis, $iIndex
	If $pThis <> $pCollection Then
		$pThis = $pCollection
		$iIndex = 0
	Else
		$iIndex += 1
	EndIf

	Local $pObject = _WinRT_ColGetAt($pThis, $iIndex)
	Return SetError(@error, @extended, $pObject)
EndFunc
