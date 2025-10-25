# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadResult

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceDownloadResult = "{F4AFDC73-BCEE-4A6A-9F0A-FEC41E2339B0}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceDownloadResult] = "IAdaptiveMediaSourceDownloadResult"

Global Const $tagIAdaptiveMediaSourceDownloadResult = $tagIInspectable & _
		"get_ResourceUri hresult(ptr*);" & _ ; Out $pValue
		"put_ResourceUri hresult(ptr);" & _ ; In $pValue
		"get_InputStream hresult(ptr*);" & _ ; Out $pValue
		"put_InputStream hresult(ptr);" & _ ; In $pValue
		"get_Buffer hresult(ptr*);" & _ ; Out $pValue
		"put_Buffer hresult(ptr);" & _ ; In $pValue
		"get_ContentType hresult(handle*);" & _ ; Out $hValue
		"put_ContentType hresult(handle);" & _ ; In $hValue
		"get_ExtendedStatus hresult(ulong*);" & _ ; Out $iValue
		"put_ExtendedStatus hresult(ulong);" ; In $iValue

Func IAdaptiveMediaSourceDownloadResult_GetResourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_SetResourceUri($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_GetInputStream($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_SetInputStream($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_GetBuffer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_SetBuffer($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 12, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_GetContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_SetContentType($pThis, $sValue)
	Local $vValue = __WinRT_SetProperty_HString($pThis, 14, $sValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_GetExtendedStatus($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadResult_SetExtendedStatus($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
