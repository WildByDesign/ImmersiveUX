# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControl7
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControl7 = "{3550DBE1-E561-5934-A3EF-7DB8BF6E3B45}"
$__g_mIIDs[$sIID_IControl7] = "IControl7"

Global Const $tagIControl7 = $tagIInspectable & _
		"get_BackgroundSizing hresult(ulong*);" & _ ; Out $iValue
		"put_BackgroundSizing hresult(ulong);" & _ ; In $iValue
		"get_CornerRadius hresult(struct*);" & _ ; Out $tValue
		"put_CornerRadius hresult(struct);" ; In $tValue

Func IControl7_GetBackgroundSizing($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl7_SetBackgroundSizing($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl7_GetCornerRadius($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 9, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IControl7_SetCornerRadius($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 10, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
