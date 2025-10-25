# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IFrameworkElement6
# Incl. In  : Windows.UI.Xaml.FrameworkElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IFrameworkElement6 = "{792A5D91-62A1-40BF-A0CE-F9C131FCB7A7}"
$__g_mIIDs[$sIID_IFrameworkElement6] = "IFrameworkElement6"

Global Const $tagIFrameworkElement6 = $tagIInspectable & _
		"get_ActualTheme hresult(ulong*);" & _ ; Out $iValue
		"add_ActualThemeChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ActualThemeChanged hresult(int64);" ; In $iToken

Func IFrameworkElement6_GetActualTheme($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement6_AddHdlrActualThemeChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 8, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement6_RemoveHdlrActualThemeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 9, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc
