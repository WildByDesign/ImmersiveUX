# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs3
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadRequestedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceDownloadRequestedEventArgs3 = "{333C50FD-4F62-4481-AB44-1E47B0574225}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceDownloadRequestedEventArgs3] = "IAdaptiveMediaSourceDownloadRequestedEventArgs3"

Global Const $tagIAdaptiveMediaSourceDownloadRequestedEventArgs3 = $tagIInspectable & _
		"get_ResourceDuration hresult(ptr*);" & _ ; Out $pValue
		"get_ResourceContentType hresult(handle*);" ; Out $hValue

Func IAdaptiveMediaSourceDownloadRequestedEventArgs3_GetResourceDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadRequestedEventArgs3_GetResourceContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc
