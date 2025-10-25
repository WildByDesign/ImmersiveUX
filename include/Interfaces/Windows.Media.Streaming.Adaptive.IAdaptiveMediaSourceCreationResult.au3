# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceCreationResult

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceCreationResult = "{4686B6B2-800F-4E31-9093-76D4782013E7}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceCreationResult] = "IAdaptiveMediaSourceCreationResult"

Global Const $tagIAdaptiveMediaSourceCreationResult = $tagIInspectable & _
		"get_Status hresult(ulong*);" & _ ; Out $iValue
		"get_MediaSource hresult(ptr*);" & _ ; Out $pValue
		"get_HttpResponseMessage hresult(ptr*);" ; Out $pValue

Func IAdaptiveMediaSourceCreationResult_GetStatus($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceCreationResult_GetMediaSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceCreationResult_GetHttpResponseMessage($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc
