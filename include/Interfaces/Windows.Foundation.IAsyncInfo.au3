#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include "IInspectable.au3"

Global Const $sIID_IAsyncInfo = "{00000036-0000-0000-c000-000000000046}"
$__g_mIIDs[$sIID_IAsyncInfo] = "IAsyncInfo"
Global Const $tagIAsyncInfo = $tagIInspectable & _
		"get_Id hresult(ulong*);" & _ ;(Out iId)
		"get_Status hresult(ulong*);" & _ ;(Out iStatus)
		"get_ErrorCode hresult(hresult*);" & _ ;(Out iErrorCode)
		"Cancel hresult();" & _
		"Close hresult();"

Global Enum $ASYNC_Started = 0, $ASYNC_Completed, $ASYNC_Canceled, $ASYNC_Error
Global $mAsyncStatus[]
$mAsyncStatus[$ASYNC_Started] = "Started"
$mAsyncStatus[$ASYNC_Completed] = "Completed"
$mAsyncStatus[$ASYNC_Canceled] = "Canceled"
$mAsyncStatus[$ASYNC_Error] = "Error"
__WinRT_AddReverseMappings($mAsyncStatus)

Func IAsyncInfo_Cancel($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, (($aCall[0] = $S_OK) Or ($aCall[0] = $S_FALSE)))
EndFunc   ;==>IAsyncInfo_Cancel

Func IAsyncInfo_Close($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, (($aCall[0] = $S_OK) Or ($aCall[0] = $S_FALSE)))
EndFunc   ;==>IAsyncInfo_Close

Func IAsyncInfo_GetErrorCode($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 9, "long")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IAsyncInfo_ErrorCode

Func IAsyncInfo_GetId($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IAsyncInfo_Id

Func IAsyncInfo_GetStatus($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IAsyncInfo_Status
