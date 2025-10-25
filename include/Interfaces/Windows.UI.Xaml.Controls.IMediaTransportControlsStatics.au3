# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControlsStatics
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControls

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControlsStatics = "{590EA907-D2EF-4C1A-9429-B4B15D64FD56}"
$__g_mIIDs[$sIID_IMediaTransportControlsStatics] = "IMediaTransportControlsStatics"

Global Const $tagIMediaTransportControlsStatics = $tagIInspectable & _
		"get_IsFullWindowButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFullWindowEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsZoomButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsZoomEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFastForwardButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFastForwardEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFastRewindButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFastRewindEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsStopButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsStopEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsVolumeButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsVolumeEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsPlaybackRateButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsPlaybackRateEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsSeekBarVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsSeekEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsCompactProperty hresult(ptr*);" ; Out $pValue

Func IMediaTransportControlsStatics_GetIsFullWindowButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsFullWindowEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsZoomButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsZoomEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsFastForwardButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsFastForwardEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsFastRewindButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsFastRewindEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsStopButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsStopEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsVolumeButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsVolumeEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsPlaybackRateButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsPlaybackRateEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsSeekBarVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsSeekEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics_GetIsCompactProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc
