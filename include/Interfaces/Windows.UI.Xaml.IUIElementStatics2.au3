# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementStatics2
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementStatics2 = "{58D3574B-F53C-45BE-989B-A5869564874C}"
$__g_mIIDs[$sIID_IUIElementStatics2] = "IUIElementStatics2"

Global Const $tagIUIElementStatics2 = $tagIInspectable & _
		"get_CompositeModeProperty hresult(ptr*);" ; Out $pValue

Func IUIElementStatics2_GetCompositeModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
