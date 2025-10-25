# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaElementStatics2
# Incl. In  : Windows.UI.Xaml.Controls.MediaElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaElementStatics2 = "{9EE7F826-F154-4DC6-8014-A6EBA987F847}"
$__g_mIIDs[$sIID_IMediaElementStatics2] = "IMediaElementStatics2"

Global Const $tagIMediaElementStatics2 = $tagIInspectable & _
		"get_AreTransportControlsEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_StretchProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFullWindowProperty hresult(ptr*);" & _ ; Out $pValue
		"get_PlayToPreferredSourceUriProperty hresult(ptr*);" ; Out $pValue

Func IMediaElementStatics2_GetAreTransportControlsEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics2_GetStretchProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics2_GetIsFullWindowProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics2_GetPlayToPreferredSourceUriProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc
