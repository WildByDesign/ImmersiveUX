# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IFrameworkElementStatics
# Incl. In  : Windows.UI.Xaml.FrameworkElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IFrameworkElementStatics = "{48383032-FBEB-4F8A-AED2-EE21FB27A57B}"
$__g_mIIDs[$sIID_IFrameworkElementStatics] = "IFrameworkElementStatics"

Global Const $tagIFrameworkElementStatics = $tagIInspectable & _
		"get_TagProperty hresult(ptr*);" & _ ; Out $pValue
		"get_LanguageProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ActualWidthProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ActualHeightProperty hresult(ptr*);" & _ ; Out $pValue
		"get_WidthProperty hresult(ptr*);" & _ ; Out $pValue
		"get_HeightProperty hresult(ptr*);" & _ ; Out $pValue
		"get_MinWidthProperty hresult(ptr*);" & _ ; Out $pValue
		"get_MaxWidthProperty hresult(ptr*);" & _ ; Out $pValue
		"get_MinHeightProperty hresult(ptr*);" & _ ; Out $pValue
		"get_MaxHeightProperty hresult(ptr*);" & _ ; Out $pValue
		"get_HorizontalAlignmentProperty hresult(ptr*);" & _ ; Out $pValue
		"get_VerticalAlignmentProperty hresult(ptr*);" & _ ; Out $pValue
		"get_MarginProperty hresult(ptr*);" & _ ; Out $pValue
		"get_NameProperty hresult(ptr*);" & _ ; Out $pValue
		"get_DataContextProperty hresult(ptr*);" & _ ; Out $pValue
		"get_StyleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FlowDirectionProperty hresult(ptr*);" ; Out $pValue

Func IFrameworkElementStatics_GetTagProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetLanguageProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetActualWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetActualHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetMinWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetMaxWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetMinHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetMaxHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetHorizontalAlignmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetVerticalAlignmentProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetMarginProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetNameProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetDataContextProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetStyleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElementStatics_GetFlowDirectionProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc
