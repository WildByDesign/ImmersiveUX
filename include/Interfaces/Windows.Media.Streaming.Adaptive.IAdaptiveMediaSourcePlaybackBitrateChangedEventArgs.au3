# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourcePlaybackBitrateChangedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = "{23A29F6D-7DDA-4A51-87A9-6FA8C5B292BE}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs] = "IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs"

Global Const $tagIAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = $tagIInspectable & _
		"get_OldValue hresult(ulong*);" & _ ; Out $iValue
		"get_NewValue hresult(ulong*);" & _ ; Out $iValue
		"get_AudioOnly hresult(bool*);" ; Out $bValue

Func IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetOldValue($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetNewValue($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_GetAudioOnly($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc
