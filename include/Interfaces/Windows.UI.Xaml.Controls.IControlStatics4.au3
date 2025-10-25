# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControlStatics4
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControlStatics4 = "{59FDA728-C05A-4EC2-8A4B-06AD69B66E15}"
$__g_mIIDs[$sIID_IControlStatics4] = "IControlStatics4"

Global Const $tagIControlStatics4 = $tagIInspectable & _
		"get_IsFocusEngagementEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFocusEngagedProperty hresult(ptr*);" & _ ; Out $pValue
		"get_RequiresPointerProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusLeftProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusRightProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusUpProperty hresult(ptr*);" & _ ; Out $pValue
		"get_XYFocusDownProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ElementSoundModeProperty hresult(ptr*);" ; Out $pValue

Func IControlStatics4_GetIsFocusEngagementEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics4_GetIsFocusEngagedProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics4_GetRequiresPointerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics4_GetXYFocusLeftProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics4_GetXYFocusRightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics4_GetXYFocusUpProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics4_GetXYFocusDownProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics4_GetElementSoundModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc
