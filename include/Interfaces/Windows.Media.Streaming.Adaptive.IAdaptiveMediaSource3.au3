# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource3
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSource3 = "{BA7023FD-C334-461B-A36E-C99F54F7174A}"
$__g_mIIDs[$sIID_IAdaptiveMediaSource3] = "IAdaptiveMediaSource3"

Global Const $tagIAdaptiveMediaSource3 = $tagIInspectable & _
		"get_MinLiveOffset hresult(ptr*);" & _ ; Out $pValue
		"get_MaxSeekableWindowSize hresult(ptr*);" & _ ; Out $pValue
		"get_DesiredSeekableWindowSize hresult(ptr*);" & _ ; Out $pValue
		"put_DesiredSeekableWindowSize hresult(ptr);" & _ ; In $pValue
		"get_Diagnostics hresult(ptr*);" & _ ; Out $pValue
		"GetCorrelatedTimes hresult(ptr*);" ; Out $pValue

Func IAdaptiveMediaSource3_GetMinLiveOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource3_GetMaxSeekableWindowSize($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource3_GetDesiredSeekableWindowSize($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource3_SetDesiredSeekableWindowSize($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource3_GetDiagnostics($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSource3_GetCorrelatedTimes($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc
