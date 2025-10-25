# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControls2
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControls

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControls2 = "{2B89EFEC-1BEA-451E-8BCD-CFE2D9423262}"
$__g_mIIDs[$sIID_IMediaTransportControls2] = "IMediaTransportControls2"

Global Const $tagIMediaTransportControls2 = $tagIInspectable & _
		"get_IsSkipForwardButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsSkipForwardButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsSkipForwardEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsSkipForwardEnabled hresult(bool);" & _ ; In $bValue
		"get_IsSkipBackwardButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsSkipBackwardButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsSkipBackwardEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsSkipBackwardEnabled hresult(bool);" & _ ; In $bValue
		"get_IsNextTrackButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsNextTrackButtonVisible hresult(bool);" & _ ; In $bValue
		"get_IsPreviousTrackButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsPreviousTrackButtonVisible hresult(bool);" & _ ; In $bValue
		"get_FastPlayFallbackBehaviour hresult(ulong*);" & _ ; Out $iValue
		"put_FastPlayFallbackBehaviour hresult(ulong);" & _ ; In $iValue
		"add_ThumbnailRequested hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ThumbnailRequested hresult(int64);" ; In $iToken

Func IMediaTransportControls2_GetIsSkipForwardButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_SetIsSkipForwardButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_GetIsSkipForwardEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_SetIsSkipForwardEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_GetIsSkipBackwardButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_SetIsSkipBackwardButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_GetIsSkipBackwardEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_SetIsSkipBackwardEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 14, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_GetIsNextTrackButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_SetIsNextTrackButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 16, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_GetIsPreviousTrackButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_SetIsPreviousTrackButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 18, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_GetFastPlayFallbackBehaviour($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 19, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_SetFastPlayFallbackBehaviour($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 20, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_AddHdlrThumbnailRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 21, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls2_RemoveHdlrThumbnailRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 22, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc
