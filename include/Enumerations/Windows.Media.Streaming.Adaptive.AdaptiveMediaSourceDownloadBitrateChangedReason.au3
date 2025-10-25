# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Enumeration
# File Name : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadBitrateChangedReason
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadBitrateChangedEventArgs

#include-once
#include "..\WinRTCore.au3"

Global $mAdaptiveMediaSourceDownloadBitrateChangedReason[]
$mAdaptiveMediaSourceDownloadBitrateChangedReason["SufficientInboundBitsPerSecond"] = 0x00000000
$mAdaptiveMediaSourceDownloadBitrateChangedReason["InsufficientInboundBitsPerSecond"] = 0x00000001
$mAdaptiveMediaSourceDownloadBitrateChangedReason["LowBufferLevel"] = 0x00000002
$mAdaptiveMediaSourceDownloadBitrateChangedReason["PositionChanged"] = 0x00000003
$mAdaptiveMediaSourceDownloadBitrateChangedReason["TrackSelectionChanged"] = 0x00000004
$mAdaptiveMediaSourceDownloadBitrateChangedReason["DesiredBitratesChanged"] = 0x00000005
$mAdaptiveMediaSourceDownloadBitrateChangedReason["ErrorInPreviousBitrate"] = 0x00000006

__WinRT_AddReverseMappings($mAdaptiveMediaSourceDownloadBitrateChangedReason)
