# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementStatics7
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementStatics7 = "{DA9B4493-A695-4145-AE93-888024396A0F}"
$__g_mIIDs[$sIID_IUIElementStatics7] = "IUIElementStatics7"

Global Const $tagIUIElementStatics7 = $tagIInspectable & _
		"get_PreviewKeyDownEvent hresult(ptr*);" & _ ; Out $pValue
		"get_CharacterReceivedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PreviewKeyUpEvent hresult(ptr*);" ; Out $pValue

Func IUIElementStatics7_GetPreviewKeyDownEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics7_GetCharacterReceivedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics7_GetPreviewKeyUpEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc
