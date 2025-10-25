# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Enumeration
# File Name : Windows.Media.Audio.MediaSourceAudioInputNodeCreationStatus
# Incl. In  : Windows.Media.Audio.CreateMediaSourceAudioInputNodeResult

#include-once
#include "..\WinRTCore.au3"

Global $mMediaSourceAudioInputNodeCreationStatus[]
$mMediaSourceAudioInputNodeCreationStatus["Success"] = 0x00000000
$mMediaSourceAudioInputNodeCreationStatus["FormatNotSupported"] = 0x00000001
$mMediaSourceAudioInputNodeCreationStatus["NetworkError"] = 0x00000002
$mMediaSourceAudioInputNodeCreationStatus["UnknownFailure"] = 0x00000003

__WinRT_AddReverseMappings($mMediaSourceAudioInputNodeCreationStatus)
