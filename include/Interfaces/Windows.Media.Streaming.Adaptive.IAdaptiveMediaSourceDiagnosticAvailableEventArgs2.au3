# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs2
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDiagnosticAvailableEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs2 = "{8C6DD857-16A5-4D9F-810E-00BD901B3EF9}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs2] = "IAdaptiveMediaSourceDiagnosticAvailableEventArgs2"

Global Const $tagIAdaptiveMediaSourceDiagnosticAvailableEventArgs2 = $tagIInspectable & _
		"get_ExtendedError hresult(long*);" ; Out $iValue

Func IAdaptiveMediaSourceDiagnosticAvailableEventArgs2_GetExtendedError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc
