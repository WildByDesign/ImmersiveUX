# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Enumeration
# File Name : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadCompletedEventArgs

#include-once
#include "..\WinRTCore.au3"

Global $mAdaptiveMediaSourceResourceType[]
$mAdaptiveMediaSourceResourceType["Manifest"] = 0x00000000
$mAdaptiveMediaSourceResourceType["InitializationSegment"] = 0x00000001
$mAdaptiveMediaSourceResourceType["MediaSegment"] = 0x00000002
$mAdaptiveMediaSourceResourceType["Key"] = 0x00000003
$mAdaptiveMediaSourceResourceType["InitializationVector"] = 0x00000004
$mAdaptiveMediaSourceResourceType["MediaSegmentIndex"] = 0x00000005

__WinRT_AddReverseMappings($mAdaptiveMediaSourceResourceType)
