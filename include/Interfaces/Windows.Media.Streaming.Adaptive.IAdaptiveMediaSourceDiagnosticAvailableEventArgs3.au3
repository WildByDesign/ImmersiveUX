# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs3
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDiagnosticAvailableEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs3 = "{C3650CD5-DAEB-4103-84DA-68769AD513FF}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs3] = "IAdaptiveMediaSourceDiagnosticAvailableEventArgs3"

Global Const $tagIAdaptiveMediaSourceDiagnosticAvailableEventArgs3 = $tagIInspectable & _
		"get_ResourceDuration hresult(ptr*);" & _ ; Out $pValue
		"get_ResourceContentType hresult(handle*);" ; Out $hValue

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs3_GetResourceDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs3_GetResourceContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc
