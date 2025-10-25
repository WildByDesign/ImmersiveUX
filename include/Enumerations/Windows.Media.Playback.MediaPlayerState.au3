# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Enumeration
# File Name : Windows.Media.Playback.MediaPlayerState
# Incl. In  : Windows.Media.Playback.MediaPlayer

#include-once
#include "..\WinRTCore.au3"

Global $mMediaPlayerState[]
$mMediaPlayerState["Closed"] = 0x00000000
$mMediaPlayerState["Opening"] = 0x00000001
$mMediaPlayerState["Buffering"] = 0x00000002
$mMediaPlayerState["Playing"] = 0x00000003
$mMediaPlayerState["Paused"] = 0x00000004
$mMediaPlayerState["Stopped"] = 0x00000005

__WinRT_AddReverseMappings($mMediaPlayerState)
