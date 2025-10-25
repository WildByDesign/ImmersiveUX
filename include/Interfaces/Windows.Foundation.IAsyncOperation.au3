#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include "IInspectable.au3"

Global Const $tagIAsyncOperation = $tagIInspectable & _
		"SetCompleted hresult(ptr);" & _ ;(In pHandler) - Sets a cusotm method to be called on completion
		"Completed hresult(ptr*);" & _ ;(Out pHandler) - Gets the above
		"GetResults hresult(ptr);" ;(Out pResult) - Get Result

Func IAsyncOperation_Completed($pThis)
	Local $pValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $pValue)
EndFunc   ;==>IAsyncOperation_Completed

Func IAsyncOperation_GetResults($pThis, $sDataType, $pData = Ptr(0))
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $sDataType = "ptr" And (Not $pData) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, $sDataType, $pData)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IAsyncOperation_GetResults

Func IAsyncOperation_SetCompleted($pThis, $pHandler)
	Local $vFailVal = False
	If (Not $pHandler) Or (Not IsPtr($pHandler)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pHandler)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IAsyncOperation_SetCompleted
