# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControls4
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControls

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControls4 = "{0FB17C58-9F23-11E7-ABC4-CEC278B6B50A}"
$__g_mIIDs[$sIID_IMediaTransportControls4] = "IMediaTransportControls4"

Global Const $tagIMediaTransportControls4 = $tagIInspectable & _
		"get_IsCompactOverlayButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsCompactOverlayButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsCompactOverlayEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsCompactOverlayEnabled hresult(bool);" ; In $bValue

Func IMediaTransportControls4_GetIsCompactOverlayButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls4_SetIsCompactOverlayButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls4_GetIsCompactOverlayEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls4_SetIsCompactOverlayEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
