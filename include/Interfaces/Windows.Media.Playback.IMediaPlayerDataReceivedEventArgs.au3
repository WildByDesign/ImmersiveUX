# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayerDataReceivedEventArgs
# Incl. In  : Windows.Media.Playback.MediaPlayerDataReceivedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerDataReceivedEventArgs = "{C75A9405-C801-412A-835B-83FC0E622A8E}"
$__g_mIIDs[$sIID_IMediaPlayerDataReceivedEventArgs] = "IMediaPlayerDataReceivedEventArgs"

Global Const $tagIMediaPlayerDataReceivedEventArgs = $tagIInspectable & _
		"get_Data hresult(ptr*);" ; Out $pValue

Func IMediaPlayerDataReceivedEventArgs_GetData($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
