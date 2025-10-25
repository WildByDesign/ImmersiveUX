#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include <APIErrorsConstants.au3>
#include <WinAPI.au3>

If Not IsDeclared("S_FALSE") Then Global Const $S_FALSE = 0x00000001

Global $__g_mIIDs[], $__g_hDLLComBase, $__g_hDLLOle32, $__g_hDLLRoMetaData, $__g_hDLLWinTypes

Func __WinRT_AddHandler($pThis, $iVTableIdx, $pHandler)
	Local $vFailVal = 0
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If (Not $pHandler) Or Not (IsPtr($pHandler)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pHandler, "int64*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>__WinRT_AddHandler

Func __WinRT_AddReverseMappings(ByRef $mMap)
	If Not IsMap($mMap) Then Return
	Local $aKeys = MapKeys($mMap), $vKey
	For $i = 0 To UBound($aKeys) - 1
		$vKey = $aKeys[$i]
		$mMap[String($mMap[$vKey])] = $vKey
	Next
EndFunc   ;==>__WinRT_AddReverseMappings

Func _WinRT_GetEnum($mMap, $vKey)
	If Not IsMap($mMap) Then Return
	Return $mMap[String($vKey)]
EndFunc

Func __WinRT_CreateGUID($sGUID = "{00000000-0000-0000-0000-000000000000}")
	Local $tGUID = DllStructCreate($tagGUID)
	Local $aGUID = StringSplit(StringRegExpReplace($sGUID, "[{}]", ""), "-", 2)
	If UBound($aGUID) <> 5 Then Return SetError($ERROR_INVALID_PARAMETER, 0, False)
	DllStructSetData($tGUID, 1, Dec($aGUID[0]))
	DllStructSetData($tGUID, 2, Dec($aGUID[1]))
	DllStructSetData($tGUID, 3, Dec($aGUID[2]))
	DllStructSetData($tGUID, 4, Binary("0x" & $aGUID[3] & $aGUID[4]))
	Return $tGUID
EndFunc   ;==>__WinRT_CreateGUID

Func __WinRT_FreeMem($pTask)
	If (Not $pTask) Or (Not IsPtr($pTask)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, "")
	DllCall($__g_hDLLOle32, "none", "CoTaskMemFree", "ptr", $pTask)
EndFunc   ;==>__WinRT_FreeMem

Func __WinRT_GetDllError($iError = @error)
	Switch $iError
		Case 0
			$iError = $ERROR_SUCCESS
		Case 1
			$iError = $ERROR_DLL_INIT_FAILED
		Case Else
			$iError = $ERROR_INVALID_PARAMETER
	EndSwitch
	Return $iError
EndFunc   ;==>__WinRT_GetDllError

Func __WinRT_GetFuncAddress($pThis, $iIndex)
	Local Const $PTR_LEN = @AutoItX64 ? 8 : 4
	$iIndex -= 1
	If IsInt($pThis) Then $pThis = Ptr($pThis)
	If (Not $pThis) Or (Not IsPtr($pThis)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, Ptr(0))
	If ($iIndex < 0) Or (Not IsInt($iIndex)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, Ptr(0))
	Local $pVTable = __WinRT_GetPtrAt($pThis)
	Return __WinRT_GetPtrAt($pVTable + ($iIndex * $PTR_LEN))
EndFunc   ;==>__WinRT_GetFuncAddress

Func __WinRT_GetProperty_Bool($pThis, $iVTableIdx)
	Local $vFailVal
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[2] = True))
EndFunc   ;==>__WinRT_GetProperty_Bool

Func __WinRT_GetProperty_HString($pThis, $iVTableIdx)
	Local $vFailVal = ""
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $sString = _WinRT_ReadHString($aCall[2])
	Local $iError = @error
	_WinRT_DeleteHString($aCall[2])
	If $iError Then Return SetError($iError, 0, $vFailVal)
	Return SetError($aCall[0], 0, $sString)
EndFunc   ;==>__WinRT_GetProperty_HString

Func __WinRT_GetProperty_Number($pThis, $iVTableIdx, $sDataType)
	Local $vFailVal = 0
	Switch $sDataType
		Case "int", "long", "float"
			$vFailVal = 0
		Case "uint", "ulong", "dword"
			$vFailVal = -1
		Case "int64", "double"
			$vFailVal = Int(0, $NUMBER_64BIT)
		Case "uint64"
			$vFailVal = Int(-1, $NUMBER_64BIT)
		Case "ptr", "handle", "hwnd"
			$vFailVal = Ptr(0)
		Case "bool"
			$vFailVal = Null
		Case Else
			Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	EndSwitch
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, $sDataType & "*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>__WinRT_GetProperty_Number

Func __WinRT_GetProperty_Ptr($pThis, $iVTableIdx)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>__WinRT_GetProperty_Ptr

Func __WinRT_GetProperty_Struct($pThis, $iVTableIdx, ByRef $tStruct)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tStruct)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_GetProperty_Struct

Func __WinRT_GetPtrAt($pPtr)
	If (Not $pPtr) Or (Not IsPtr($pPtr)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, Ptr(0))
	Local $tPtr = DllStructCreate("ptr", $pPtr)
	Return DllStructGetData($tPtr, 1)
EndFunc   ;==>__WinRT_GetPtrAt

Func __WinRT_ReadGUIDAt($pGUID)
	Local $tGUID, $sGUID
	If (Not $pGUID) Or (Not IsPtr($pGUID)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, "")
	$tGUID = DllStructCreate($tagGUID, $pGUID)
	$sGUID = StringFormat("{%s-%s-%s-%s-%s}", _
			Hex(DllStructGetData($tGUID, 1), 8), _
			Hex(DllStructGetData($tGUID, 2), 4), _
			Hex(DllStructGetData($tGUID, 3), 4), _
			StringMid(DllStructGetData($tGUID, 4), 3, 4), _
			StringMid(DllStructGetData($tGUID, 4), 7, 12))
	Return $sGUID
EndFunc   ;==>__WinRT_ReadGUIDAt

Func __WinRT_RemoveHandler($pThis, $iVTableIdx, $iToken)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If (Not $iToken) Or Not (IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "int64", $iToken)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_RemoveHandler

Func __WinRT_SetProperty_Bool($pThis, $iVTableIdx, $bValue)
	Local $vFailVal
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool", ($bValue = True))
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_Bool

Func __WinRT_SetProperty_HString($pThis, $iVTableIdx, $sValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $hsString = _WinRT_CreateHString($sValue)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hsString)
	Local $iError = @error
	_WinRT_DeleteHString($hsString)
	If $iError Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_HString

Func __WinRT_SetProperty_Number($pThis, $iVTableIdx, $sDataType, $iValue)
	Local $vFailVal = False
	Switch $sDataType
		Case "int", "long", "float"
			$vFailVal = 0
		Case "uint", "ulong", "dword"
			$vFailVal = -1
		Case "int64", "double"
			$vFailVal = Int(0, $NUMBER_64BIT)
		Case "uint64"
			$vFailVal = Int(-1, $NUMBER_64BIT)
		Case "ptr", "handle", "hwnd"
			$vFailVal = Ptr(0)
		Case "bool"
			$vFailVal = Null
		Case Else
			Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	EndSwitch
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, $sDataType, $iValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_Number

Func __WinRT_SetProperty_Ptr($pThis, $iVTableIdx, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_Ptr

Func __WinRT_SetProperty_Struct($pThis, $iVTableIdx, ByRef $tStruct)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If (Not IsDllStruct($tStruct)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tStruct)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>__WinRT_SetProperty_Struct

Func _WinRT_ActivateInstance($sClassID)
	Local $aCall, $hsClassID, $iError
	$hsClassID = _WinRT_CreateHString($sClassID)
	If @error Then Return SetError(@error, @extended, Ptr(0))
	$aCall = DllCall($__g_hDLLComBase, "long", "RoActivateInstance", "handle", $hsClassID, "ptr*", 0)
	$iError = @error
	_WinRT_DeleteHString($hsClassID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, Ptr(0))
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>_WinRT_ActivateInstance

Func _WinRT_CreateHString($sString)
	Local $aCall = DllCall($__g_hDLLComBase, "long", "WindowsCreateString", "wstr", $sString, "uint", StringLen($sString), "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, Ptr(0))
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>_WinRT_CreateHString

Func _WinRT_DeleteHString(ByRef $hString)
	Local $aCall = DllCall($__g_hDLLComBase, "long", "WindowsDeleteString", "ptr", $hString)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, Ptr(0))
	$hString = 0
	Return SetError($aCall[0], 0, $aCall[0] = 0)
EndFunc   ;==>_WinRT_DeleteHString

Func _WinRT_GetActivationFactory($sClassID, $sIID)
	Local $aCall, $hsClassID, $tIID, $iError
	$tIID = __WinRT_CreateGUID($sIID)
	If Not @error Then $hsClassID = _WinRT_CreateHString($sClassID)
	If @error Then Return SetError(@error, @extended, Ptr(0))
	$aCall = DllCall($__g_hDLLComBase, "long", "RoGetActivationFactory", "handle", $hsClassID, "struct*", $tIID, "ptr*", 0)
	$iError = @error
	_WinRT_DeleteHString($hsClassID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, Ptr(0))
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>_WinRT_GetActivationFactory

Func _WinRT_GetMetaDataFile($sClassID, $pIMetaDataDispenserEx, ByRef $sFilePath, ByRef $pIMetaDataImport2, ByRef $iTypeDefTkn)
	Local $aCall, $hsClassID, $iError, $vFailVal = True
	$hsClassID = _WinRT_CreateHString($sClassID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	$aCall = DllCall($__g_hDLLWinTypes, "long", "RoGetMetaDataFile", "handle", $hsClassID, "ptr", $pIMetaDataDispenserEx, "handle*", 0, "ptr*", 0, "ulong*", 0)
	$iError = @error
	_WinRT_DeleteHString($hsClassID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	$sFilePath = _WinRT_ReadHString($aCall[3])
	_WinRT_DeleteHString($aCall[3])
	$pIMetaDataImport2 = $aCall[4]
	$iTypeDefTkn = $aCall[5]
	Return SetError($aCall[0], 0, False)
EndFunc   ;==>_WinRT_GetMetaDataFile

Func _WinRT_ReadHString(ByRef $hString)
	Local $aCall = DllCall($__g_hDLLComBase, "wstr", "WindowsGetStringRawBuffer", "ptr", $hString, "int*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, "")
	Return SetExtended($aCall[1], $aCall[0])
EndFunc   ;==>_WinRT_ReadHString

Func _WinRT_Shutdown()
	DllClose($__g_hDLLComBase)
	DllClose($__g_hDLLOle32)
	DllClose($__g_hDLLRoMetaData)
	DllClose($__g_hDLLWinTypes)
EndFunc   ;==>_WinRT_Shutdown

Func _WinRT_Startup()
	$__g_hDLLComBase = DllOpen("Combase.dll")
	$__g_hDLLOle32 = DllOpen("Ole32.dll")
	$__g_hDLLRoMetaData = DllOpen("RoMetaData.dll")
	$__g_hDLLWinTypes = DllOpen("WinTypes.dll")
	__WinRT_AddReverseMappings($__g_mIIDs)
EndFunc   ;==>_WinRT_Startup
