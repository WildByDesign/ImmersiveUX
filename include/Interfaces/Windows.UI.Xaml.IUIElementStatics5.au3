# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementStatics5
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementStatics5 = "{59BD7D91-8FA3-4C65-BA1B-40DF38556CBB}"
$__g_mIIDs[$sIID_IUIElementStatics5] = "IUIElementStatics5"

Global Const $tagIUIElementStatics5 = $tagIInspectable & _
		"get_LightsProperty hresult(ptr*);" & _ ; Out $pValue
		"get_KeyTipPlacementModeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_KeyTipHorizontalOffsetProperty hresult(ptr*);" & _ ; Out $pValue
		"get_KeyTipVerticalOffsetProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusKeyboardNavigationProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusUpNavigationStrategyProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusDownNavigationStrategyProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusLeftNavigationStrategyProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusRightNavigationStrategyProperty hresult(ptr*);" & _ ; Out $pValue
		"get_HighContrastAdjustmentProperty hresult(ptr*);" & _ ; Out $pValue
		"get_TabFocusNavigationProperty hresult(ptr*);" ; Out $pValue

Func IUIElementStatics5_GetLightsProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetKeyTipPlacementModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetKeyTipHorizontalOffsetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetKeyTipVerticalOffsetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetXYFocusKeyboardNavigationProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetXYFocusUpNavigationStrategyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetXYFocusDownNavigationStrategyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetXYFocusLeftNavigationStrategyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetXYFocusRightNavigationStrategyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetHighContrastAdjustmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics5_GetTabFocusNavigationProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc
