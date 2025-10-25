# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs3
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadCompletedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceDownloadCompletedEventArgs3 = "{0F8A8BD1-93B2-47C6-BADC-8BE2C8F7F6E8}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceDownloadCompletedEventArgs3] = "IAdaptiveMediaSourceDownloadCompletedEventArgs3"

Global Const $tagIAdaptiveMediaSourceDownloadCompletedEventArgs3 = $tagIInspectable & _
		"get_ResourceDuration hresult(ptr*);" & _ ; Out $pValue
		"get_ResourceContentType hresult(handle*);" ; Out $hValue

Func IAdaptiveMediaSourceDownloadCompletedEventArgs3_GetResourceDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadCompletedEventArgs3_GetResourceContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc
