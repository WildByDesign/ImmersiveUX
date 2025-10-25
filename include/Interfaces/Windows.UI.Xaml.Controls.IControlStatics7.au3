# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControlStatics7
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControlStatics7 = "{AEE1CA45-C910-5DAB-A266-FDF50C0BEDD2}"
$__g_mIIDs[$sIID_IControlStatics7] = "IControlStatics7"

Global Const $tagIControlStatics7 = $tagIInspectable & _
		"get_BackgroundSizingProperty hresult(ptr*);" & _ ; Out $pValue
		"get_CornerRadiusProperty hresult(ptr*);" ; Out $pValue

Func IControlStatics7_GetBackgroundSizingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlStatics7_GetCornerRadiusProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc
