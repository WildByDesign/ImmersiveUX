# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCorrelatedTimes
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceCorrelatedTimes

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceCorrelatedTimes = "{05108787-E032-48E1-AB8D-002B0B3051DF}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceCorrelatedTimes] = "IAdaptiveMediaSourceCorrelatedTimes"

Global Const $tagIAdaptiveMediaSourceCorrelatedTimes = $tagIInspectable & _
		"get_Position hresult(ptr*);" & _ ; Out $pValue
		"get_PresentationTimeStamp hresult(ptr*);" & _ ; Out $pValue
		"get_ProgramDateTime hresult(ptr*);" ; Out $pValue

Func IAdaptiveMediaSourceCorrelatedTimes_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceCorrelatedTimes_GetPresentationTimeStamp($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceCorrelatedTimes_GetProgramDateTime($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc
