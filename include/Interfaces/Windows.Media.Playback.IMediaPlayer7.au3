# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayer7
# Incl. In  : Windows.Media.Playback.MediaPlayer

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayer7 = "{5D1DC478-4500-4531-B3F4-777A71491F7F}"
$__g_mIIDs[$sIID_IMediaPlayer7] = "IMediaPlayer7"

Global Const $tagIMediaPlayer7 = $tagIInspectable & _
		"get_AudioStateMonitor hresult(ptr*);" ; Out $pValue

Func IMediaPlayer7_GetAudioStateMonitor($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
