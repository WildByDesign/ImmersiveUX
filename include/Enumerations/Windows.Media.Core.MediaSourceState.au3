# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Enumeration
# File Name : Windows.Media.Core.MediaSourceState
# Incl. In  : Windows.Media.Core.MediaSource

#include-once
#include "..\WinRTCore.au3"

Global $mMediaSourceState[]
$mMediaSourceState["Initial"] = 0x00000000
$mMediaSourceState["Opening"] = 0x00000001
$mMediaSourceState["Opened"] = 0x00000002
$mMediaSourceState["Failed"] = 0x00000003
$mMediaSourceState["Closed"] = 0x00000004

__WinRT_AddReverseMappings($mMediaSourceState)
