# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IFrameworkElement4
# Incl. In  : Windows.UI.Xaml.FrameworkElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IFrameworkElement4 = "{6B765BB3-FBA3-4404-BDEE-1A45D1CA5F21}"
$__g_mIIDs[$sIID_IFrameworkElement4] = "IFrameworkElement4"

Global Const $tagIFrameworkElement4 = $tagIInspectable & _
		"get_AllowFocusOnInteraction hresult(bool*);" & _ ; Out $bValue
		"put_AllowFocusOnInteraction hresult(bool);" & _ ; In $bValue
		"get_FocusVisualMargin hresult(struct*);" & _ ; Out $tValue
		"put_FocusVisualMargin hresult(struct);" & _ ; In $tValue
		"get_FocusVisualSecondaryThickness hresult(struct*);" & _ ; Out $tValue
		"put_FocusVisualSecondaryThickness hresult(struct);" & _ ; In $tValue
		"get_FocusVisualPrimaryThickness hresult(struct*);" & _ ; Out $tValue
		"put_FocusVisualPrimaryThickness hresult(struct);" & _ ; In $tValue
		"get_FocusVisualSecondaryBrush hresult(ptr*);" & _ ; Out $pValue
		"put_FocusVisualSecondaryBrush hresult(ptr);" & _ ; In $pValue
		"get_FocusVisualPrimaryBrush hresult(ptr*);" & _ ; Out $pValue
		"put_FocusVisualPrimaryBrush hresult(ptr);" & _ ; In $pValue
		"get_AllowFocusWhenDisabled hresult(bool*);" & _ ; Out $bValue
		"put_AllowFocusWhenDisabled hresult(bool);" ; In $bValue

Func IFrameworkElement4_GetAllowFocusOnInteraction($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_SetAllowFocusOnInteraction($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_GetFocusVisualMargin($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 9, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IFrameworkElement4_SetFocusVisualMargin($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 10, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_GetFocusVisualSecondaryThickness($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 11, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IFrameworkElement4_SetFocusVisualSecondaryThickness($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 12, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_GetFocusVisualPrimaryThickness($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 13, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IFrameworkElement4_SetFocusVisualPrimaryThickness($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 14, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_GetFocusVisualSecondaryBrush($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_SetFocusVisualSecondaryBrush($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 16, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_GetFocusVisualPrimaryBrush($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_SetFocusVisualPrimaryBrush($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 18, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_GetAllowFocusWhenDisabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement4_SetAllowFocusWhenDisabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 20, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
