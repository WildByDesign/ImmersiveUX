# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElement8
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElement8 = "{3AB70E85-D508-4477-B6F8-0E435701C836}"
$__g_mIIDs[$sIID_IUIElement8] = "IUIElement8"

Global Const $tagIUIElement8 = $tagIInspectable & _
		"get_KeyTipTarget hresult(ptr*);" & _ ; Out $pValue
		"put_KeyTipTarget hresult(ptr);" & _ ; In $pValue
		"get_KeyboardAcceleratorPlacementTarget hresult(ptr*);" & _ ; Out $pValue
		"put_KeyboardAcceleratorPlacementTarget hresult(ptr);" & _ ; In $pValue
		"get_KeyboardAcceleratorPlacementMode hresult(ulong*);" & _ ; Out $iValue
		"put_KeyboardAcceleratorPlacementMode hresult(ulong);" & _ ; In $iValue
		"add_BringIntoViewRequested hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_BringIntoViewRequested hresult(int64);" ; In $iToken

Func IUIElement8_GetKeyTipTarget($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement8_SetKeyTipTarget($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement8_GetKeyboardAcceleratorPlacementTarget($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement8_SetKeyboardAcceleratorPlacementTarget($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement8_GetKeyboardAcceleratorPlacementMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 11, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement8_SetKeyboardAcceleratorPlacementMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 12, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement8_AddHdlrBringIntoViewRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 13, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement8_RemoveHdlrBringIntoViewRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 14, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc
