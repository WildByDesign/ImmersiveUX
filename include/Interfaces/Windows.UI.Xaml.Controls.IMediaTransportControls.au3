# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControls
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControls

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControls = "{D6F69E7D-0825-49A9-9FCE-5586D8694F0C}"
$__g_mIIDs[$sIID_IMediaTransportControls] = "IMediaTransportControls"

Global Const $tagIMediaTransportControls = $tagIInspectable & _
		"get_IsFullWindowButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsFullWindowButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsFullWindowEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsFullWindowEnabled hresult(bool);" & _ ; In $bValue
		"get_IsZoomButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsZoomButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsZoomEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsZoomEnabled hresult(bool);" & _ ; In $bValue
		"get_IsFastForwardButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsFastForwardButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsFastForwardEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsFastForwardEnabled hresult(bool);" & _ ; In $bValue
		"get_IsFastRewindButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsFastRewindButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsFastRewindEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsFastRewindEnabled hresult(bool);" & _ ; In $bValue
		"get_IsStopButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsStopButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsStopEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsStopEnabled hresult(bool);" & _ ; In $bValue
		"get_IsVolumeButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsVolumeButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsVolumeEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsVolumeEnabled hresult(bool);" & _ ; In $bValue
		"get_IsPlaybackRateButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsPlaybackRateButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsPlaybackRateEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsPlaybackRateEnabled hresult(bool);" & _ ; In $bValue
		"get_IsSeekBarVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsSeekBarVisible hresult(bool);" & _ ; In $bValue
		"get_IsSeekEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsSeekEnabled hresult(bool);" & _ ; In $bValue
		"get_IsCompact hresult(bool*);" & _ ; Out $bValue
		"put_IsCompact hresult(bool);" ; In $bValue

Func IMediaTransportControls_GetIsFullWindowButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsFullWindowButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsFullWindowEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsFullWindowEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsZoomButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsZoomButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsZoomEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsZoomEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 14, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsFastForwardButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsFastForwardButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 16, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsFastForwardEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsFastForwardEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 18, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsFastRewindButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsFastRewindButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 20, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsFastRewindEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsFastRewindEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 22, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsStopButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsStopButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 24, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsStopEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsStopEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 26, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsVolumeButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsVolumeButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 28, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsVolumeEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsVolumeEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 30, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsPlaybackRateButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsPlaybackRateButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 32, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsPlaybackRateEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsPlaybackRateEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 34, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsSeekBarVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 35)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsSeekBarVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 36, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsSeekEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsSeekEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 38, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_GetIsCompact($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls_SetIsCompact($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 40, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
