# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadStatistics

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceDownloadStatistics = "{A306CEFB-E96A-4DFF-A9B8-1AE08C01AE98}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceDownloadStatistics] = "IAdaptiveMediaSourceDownloadStatistics"

Global Const $tagIAdaptiveMediaSourceDownloadStatistics = $tagIInspectable & _
		"get_ContentBytesReceivedCount hresult(uint64*);" & _ ; Out $iValue
		"get_TimeToHeadersReceived hresult(ptr*);" & _ ; Out $pValue
		"get_TimeToFirstByteReceived hresult(ptr*);" & _ ; Out $pValue
		"get_TimeToLastByteReceived hresult(ptr*);" ; Out $pValue

Func IAdaptiveMediaSourceDownloadStatistics_GetContentBytesReceivedCount($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "uint64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadStatistics_GetTimeToHeadersReceived($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadStatistics_GetTimeToFirstByteReceived($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadStatistics_GetTimeToLastByteReceived($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc
