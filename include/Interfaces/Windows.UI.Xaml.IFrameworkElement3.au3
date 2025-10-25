# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IFrameworkElement3
# Incl. In  : Windows.UI.Xaml.FrameworkElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IFrameworkElement3 = "{C81C2720-5C52-4BBE-A199-2B1E34F00F70}"
$__g_mIIDs[$sIID_IFrameworkElement3] = "IFrameworkElement3"

Global Const $tagIFrameworkElement3 = $tagIInspectable & _
		"add_Loading hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_Loading hresult(int64);" ; In $iToken

Func IFrameworkElement3_AddHdlrLoading($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement3_RemoveHdlrLoading($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc
