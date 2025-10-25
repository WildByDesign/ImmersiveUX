# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSource = "{4C7332EF-D39F-4396-B4D9-043957A7C964}"
$__g_mIIDs[$sIID_IAdaptiveMediaSource] = "IAdaptiveMediaSource"

Global Const $tagIAdaptiveMediaSource = $tagIInspectable & _
		"get_IsLive hresult(bool*);" & _ ; Out $bValue
		"get_DesiredLiveOffset hresult(int64*);" & _ ; Out $iValue
		"put_DesiredLiveOffset hresult(int64);" & _ ; In $iValue
		"get_InitialBitrate hresult(ulong*);" & _ ; Out $iValue
		"put_InitialBitrate hresult(ulong);" & _ ; In $iValue
		"get_CurrentDownloadBitrate hresult(ulong*);" & _ ; Out $iValue
		"get_CurrentPlaybackBitrate hresult(ulong*);" & _ ; Out $iValue
		"get_AvailableBitrates hresult(ptr*);" & _ ; Out $pValue
		"get_DesiredMinBitrate hresult(ptr*);" & _ ; Out $pValue
		"put_DesiredMinBitrate hresult(ptr);" & _ ; In $pValue
		"get_DesiredMaxBitrate hresult(ptr*);" & _ ; Out $pValue
		"put_DesiredMaxBitrate hresult(ptr);" & _ ; In $pValue
		"get_AudioOnlyPlayback hresult(bool*);" & _ ; Out $bValue
		"get_InboundBitsPerSecond hresult(uint64*);" & _ ; Out $iValue
		"get_InboundBitsPerSecondWindow hresult(int64*);" & _ ; Out $iValue
		"put_InboundBitsPerSecondWindow hresult(int64);" & _ ; In $iValue
		"add_DownloadBitrateChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DownloadBitrateChanged hresult(int64);" & _ ; In $iToken
		"add_PlaybackBitrateChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PlaybackBitrateChanged hresult(int64);" & _ ; In $iToken
		"add_DownloadRequested hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DownloadRequested hresult(int64);" & _ ; In $iToken
		"add_DownloadCompleted hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DownloadCompleted hresult(int64);" & _ ; In $iToken
		"add_DownloadFailed hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DownloadFailed hresult(int64);" ; In $iToken

Func IAdaptiveMediaSource_GetIsLive($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetDesiredLiveOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_SetDesiredLiveOffset($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 9, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetInitialBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_SetInitialBitrate($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetCurrentDownloadBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 12, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetCurrentPlaybackBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 13, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetAvailableBitrates($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetDesiredMinBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_SetDesiredMinBitrate($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 16, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetDesiredMaxBitrate($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_SetDesiredMaxBitrate($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 18, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetAudioOnlyPlayback($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetInboundBitsPerSecond($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 20, "uint64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_GetInboundBitsPerSecondWindow($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 21, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_SetInboundBitsPerSecondWindow($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 22, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_AddHdlrDownloadBitrateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 23, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_RemoveHdlrDownloadBitrateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 24, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_AddHdlrPlaybackBitrateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 25, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_RemoveHdlrPlaybackBitrateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 26, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_AddHdlrDownloadRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 27, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_RemoveHdlrDownloadRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 28, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_AddHdlrDownloadCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 29, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_RemoveHdlrDownloadCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 30, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_AddHdlrDownloadFailed($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 31, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource_RemoveHdlrDownloadFailed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 32, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc
