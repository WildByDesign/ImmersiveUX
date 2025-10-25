# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementStatics4
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementStatics4 = "{1D157D61-16AF-411F-B774-272375A4AC2C}"
$__g_mIIDs[$sIID_IUIElementStatics4] = "IUIElementStatics4"

Global Const $tagIUIElementStatics4 = $tagIInspectable & _
		"get_ContextFlyoutProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ExitDisplayModeOnAccessKeyInvokedProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsAccessKeyScopeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AccessKeyScopeOwnerProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AccessKeyProperty hresult(ptr*);" ; Out $pValue

Func IUIElementStatics4_GetContextFlyoutProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics4_GetExitDisplayModeOnAccessKeyInvokedProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics4_GetIsAccessKeyScopeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics4_GetAccessKeyScopeOwnerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics4_GetAccessKeyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc
