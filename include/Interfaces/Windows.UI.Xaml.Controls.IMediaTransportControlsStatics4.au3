# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControlsStatics4
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControls

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControlsStatics4 = "{0FB18144-9F23-11E7-ABC4-CEC278B6B50A}"
$__g_mIIDs[$sIID_IMediaTransportControlsStatics4] = "IMediaTransportControlsStatics4"

Global Const $tagIMediaTransportControlsStatics4 = $tagIInspectable & _
		"get_IsCompactOverlayButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsCompactOverlayEnabledProperty hresult(ptr*);" ; Out $pValue

Func IMediaTransportControlsStatics4_GetIsCompactOverlayButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics4_GetIsCompactOverlayEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc
