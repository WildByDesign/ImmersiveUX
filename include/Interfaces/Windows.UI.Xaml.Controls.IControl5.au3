# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControl5
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControl5 = "{5EBB51D5-9E58-49B7-BC2D-0155FF118664}"
$__g_mIIDs[$sIID_IControl5] = "IControl5"

Global Const $tagIControl5 = $tagIInspectable & _
		"get_DefaultStyleResourceUri hresult(ptr*);" & _ ; Out $pValue
		"put_DefaultStyleResourceUri hresult(ptr);" ; In $pValue

Func IControl5_GetDefaultStyleResourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl5_SetDefaultStyleResourceUri($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
