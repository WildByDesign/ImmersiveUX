# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControlStatics2
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControlStatics2 = "{32233E36-AB74-4A25-A556-45293135B2C5}"
$__g_mIIDs[$sIID_IControlStatics2] = "IControlStatics2"

Global Const $tagIControlStatics2 = $tagIInspectable & _
		"get_IsTextScaleFactorEnabledProperty hresult(ptr*);" ; Out $pValue

Func IControlStatics2_GetIsTextScaleFactorEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
