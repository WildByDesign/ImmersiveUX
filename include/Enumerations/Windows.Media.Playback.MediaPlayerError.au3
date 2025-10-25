# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Enumeration
# File Name : Windows.Media.Playback.MediaPlayerError
# Incl. In  : Windows.Media.Playback.MediaPlayerFailedEventArgs

#include-once
#include "..\WinRTCore.au3"

Global $mMediaPlayerError[]
$mMediaPlayerError["Unknown"] = 0x00000000
$mMediaPlayerError["Aborted"] = 0x00000001
$mMediaPlayerError["NetworkError"] = 0x00000002
$mMediaPlayerError["DecodingError"] = 0x00000003
$mMediaPlayerError["SourceNotSupported"] = 0x00000004

__WinRT_AddReverseMappings($mMediaPlayerError)
