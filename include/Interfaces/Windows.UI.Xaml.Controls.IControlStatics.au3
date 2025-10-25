# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControlStatics
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControlStatics = "{473B305B-877D-4C35-8FCA-46A05F96607A}"
$__g_mIIDs[$sIID_IControlStatics] = "IControlStatics"

Global Const $tagIControlStatics = $tagIInspectable & _
		"get_FontSizeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FontFamilyProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FontWeightProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FontStyleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FontStretchProperty hresult(ptr*);" & _ ; Out $pValue
		"get_CharacterSpacingProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ForegroundProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsTabStopProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_TabIndexProperty hresult(ptr*);" & _ ; Out $pValue
		"get_TabNavigationProperty hresult(ptr*);" & _ ; Out $pValue
		"get_TemplateProperty hresult(ptr*);" & _ ; Out $pValue
		"get_PaddingProperty hresult(ptr*);" & _ ; Out $pValue
		"get_HorizontalContentAlignmentProperty hresult(ptr*);" & _ ; Out $pValue
		"get_VerticalContentAlignmentProperty hresult(ptr*);" & _ ; Out $pValue
		"get_BackgroundProperty hresult(ptr*);" & _ ; Out $pValue
		"get_BorderThicknessProperty hresult(ptr*);" & _ ; Out $pValue
		"get_BorderBrushProperty hresult(ptr*);" & _ ; Out $pValue
		"get_DefaultStyleKeyProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FocusStateProperty hresult(ptr*);" ; Out $pValue

Func IControlStatics_GetFontSizeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetFontFamilyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetFontWeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetFontStyleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetFontStretchProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetCharacterSpacingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetForegroundProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetIsTabStopProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetIsEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetTabIndexProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetTabNavigationProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetTemplateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetPaddingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetHorizontalContentAlignmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetVerticalContentAlignmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetBackgroundProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetBorderThicknessProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetBorderBrushProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 24)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetDefaultStyleKeyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics_GetFocusStateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 26)
	Return SetError(@error, @extended, $vValue)
EndFunc
