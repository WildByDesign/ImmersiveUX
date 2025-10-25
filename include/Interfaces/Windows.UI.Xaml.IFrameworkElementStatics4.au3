# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IFrameworkElementStatics4
# Incl. In  : Windows.UI.Xaml.FrameworkElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IFrameworkElementStatics4 = "{9C41B155-C5D8-4663-BFF2-D8D54FB5DBB3}"
$__g_mIIDs[$sIID_IFrameworkElementStatics4] = "IFrameworkElementStatics4"

Global Const $tagIFrameworkElementStatics4 = $tagIInspectable & _
		"get_AllowFocusOnInteractionProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FocusVisualMarginProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FocusVisualSecondaryThicknessProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FocusVisualPrimaryThicknessProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FocusVisualSecondaryBrushProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FocusVisualPrimaryBrushProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AllowFocusWhenDisabledProperty hresult(ptr*);" ; Out $pValue

Func IFrameworkElementStatics4_GetAllowFocusOnInteractionProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics4_GetFocusVisualMarginProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics4_GetFocusVisualSecondaryThicknessProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics4_GetFocusVisualPrimaryThicknessProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics4_GetFocusVisualSecondaryBrushProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics4_GetFocusVisualPrimaryBrushProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics4_GetAllowFocusWhenDisabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc
