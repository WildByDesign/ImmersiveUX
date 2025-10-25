# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControlsStatics2
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControls

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControlsStatics2 = "{1728CFDC-561F-4386-A7F8-090D95F68D96}"
$__g_mIIDs[$sIID_IMediaTransportControlsStatics2] = "IMediaTransportControlsStatics2"

Global Const $tagIMediaTransportControlsStatics2 = $tagIInspectable & _
		"get_IsSkipForwardButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsSkipForwardEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsSkipBackwardButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsSkipBackwardEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsNextTrackButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsPreviousTrackButtonVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_FastPlayFallbackBehaviourProperty hresult(ptr*);" ; Out $pValue

Func IMediaTransportControlsStatics2_GetIsSkipForwardButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics2_GetIsSkipForwardEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics2_GetIsSkipBackwardButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics2_GetIsSkipBackwardEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics2_GetIsNextTrackButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics2_GetIsPreviousTrackButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics2_GetFastPlayFallbackBehaviourProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc
