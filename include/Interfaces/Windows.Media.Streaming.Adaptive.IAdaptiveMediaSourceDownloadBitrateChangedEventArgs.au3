# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadBitrateChangedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs = "{670C0A44-E04E-4EFF-816A-17399F78F4BA}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs] = "IAdaptiveMediaSourceDownloadBitrateChangedEventArgs"

Global Const $tagIAdaptiveMediaSourceDownloadBitrateChangedEventArgs = $tagIInspectable & _
		"get_OldValue hresult(ulong*);" & _ ; Out $iValue
		"get_NewValue hresult(ulong*);" ; Out $iValue

Func IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_GetOldValue($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_GetNewValue($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc
