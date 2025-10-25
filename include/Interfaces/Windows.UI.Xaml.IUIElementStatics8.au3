# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementStatics8
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementStatics8 = "{17BE3487-4875-4915-B0B1-A4C0F851DF3F}"
$__g_mIIDs[$sIID_IUIElementStatics8] = "IUIElementStatics8"

Global Const $tagIUIElementStatics8 = $tagIInspectable & _
		"get_BringIntoViewRequestedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_ContextRequestedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_KeyTipTargetProperty hresult(ptr*);" & _ ; Out $pValue
		"get_KeyboardAcceleratorPlacementTargetProperty hresult(ptr*);" & _ ; Out $pValue
		"get_KeyboardAcceleratorPlacementModeProperty hresult(ptr*);" & _ ; Out $pValue
		"RegisterAsScrollPort hresult(ptr);" ; In $pElement

Func IUIElementStatics8_GetBringIntoViewRequestedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics8_GetContextRequestedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics8_GetKeyTipTargetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics8_GetKeyboardAcceleratorPlacementTargetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics8_GetKeyboardAcceleratorPlacementModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics8_RegisterAsScrollPort($pThis, $pElement)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
