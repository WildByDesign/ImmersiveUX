# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementStatics9
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementStatics9 = "{71467E77-8CA3-5ED7-95DB-D51CDAD77F81}"
$__g_mIIDs[$sIID_IUIElementStatics9] = "IUIElementStatics9"

Global Const $tagIUIElementStatics9 = $tagIInspectable & _
		"get_CanBeScrollAnchorProperty hresult(ptr*);" ; Out $pValue

Func IUIElementStatics9_GetCanBeScrollAnchorProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
