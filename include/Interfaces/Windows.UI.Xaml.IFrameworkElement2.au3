# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IFrameworkElement2
# Incl. In  : Windows.UI.Xaml.FrameworkElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IFrameworkElement2 = "{F19104BE-422A-4904-A52F-EE72010429E5}"
$__g_mIIDs[$sIID_IFrameworkElement2] = "IFrameworkElement2"

Global Const $tagIFrameworkElement2 = $tagIInspectable & _
		"get_RequestedTheme hresult(ulong*);" & _ ; Out $iValue
		"put_RequestedTheme hresult(ulong);" & _ ; In $iValue
		"add_DataContextChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DataContextChanged hresult(int64);" & _ ; In $iToken
		"GetBindingExpression hresult(ptr; ptr*);" ; In $pDp, Out $pResult

Func IFrameworkElement2_GetRequestedTheme($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement2_SetRequestedTheme($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement2_AddHdlrDataContextChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 9, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement2_RemoveHdlrDataContextChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 10, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement2_GetBindingExpression($pThis, $pDp)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
