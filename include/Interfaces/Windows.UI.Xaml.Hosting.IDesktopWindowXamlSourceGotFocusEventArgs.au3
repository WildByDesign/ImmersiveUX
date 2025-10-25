# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Hosting.IDesktopWindowXamlSourceGotFocusEventArgs
# Incl. In  : Windows.UI.Xaml.Hosting.DesktopWindowXamlSourceGotFocusEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IDesktopWindowXamlSourceGotFocusEventArgs = "{39BE4849-D9CC-5B70-8F05-1AD9A4AAA342}"
$__g_mIIDs[$sIID_IDesktopWindowXamlSourceGotFocusEventArgs] = "IDesktopWindowXamlSourceGotFocusEventArgs"

Global Const $tagIDesktopWindowXamlSourceGotFocusEventArgs = $tagIInspectable & _
		"get_Request hresult(ptr*);" ; Out $pValue

Func IDesktopWindowXamlSourceGotFocusEventArgs_GetRequest($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
