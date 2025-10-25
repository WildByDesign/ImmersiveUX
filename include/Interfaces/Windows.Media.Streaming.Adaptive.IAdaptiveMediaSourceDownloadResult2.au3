# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult2
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadResult

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceDownloadResult2 = "{15552CB7-7B80-4AC4-8660-A4B97F7C70F0}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceDownloadResult2] = "IAdaptiveMediaSourceDownloadResult2"

Global Const $tagIAdaptiveMediaSourceDownloadResult2 = $tagIInspectable & _
		"get_ResourceByteRangeOffset hresult(ptr*);" & _ ; Out $pValue
		"put_ResourceByteRangeOffset hresult(ptr);" & _ ; In $pValue
		"get_ResourceByteRangeLength hresult(ptr*);" & _ ; Out $pValue
		"put_ResourceByteRangeLength hresult(ptr);" ; In $pValue

Func IAdaptiveMediaSourceDownloadResult2_GetResourceByteRangeOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult2_SetResourceByteRangeOffset($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult2_GetResourceByteRangeLength($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult2_SetResourceByteRangeLength($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
