# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSource4
# Incl. In  : Windows.Media.Core.MediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSource4 = "{BDAFAD57-8EFF-4C63-85A6-84DE0AE3E4F2}"
$__g_mIIDs[$sIID_IMediaSource4] = "IMediaSource4"

Global Const $tagIMediaSource4 = $tagIInspectable & _
		"get_AdaptiveMediaSource hresult(ptr*);" & _ ; Out $pValue
		"get_MediaStreamSource hresult(ptr*);" & _ ; Out $pValue
		"get_MseStreamSource hresult(ptr*);" & _ ; Out $pValue
		"get_Uri hresult(ptr*);" & _ ; Out $pValue
		"OpenAsync hresult(ptr*);" ; Out $pOperation

Func IMediaSource4_GetAdaptiveMediaSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource4_GetMediaStreamSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource4_GetMseStreamSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource4_GetUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource4_OpenAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc
