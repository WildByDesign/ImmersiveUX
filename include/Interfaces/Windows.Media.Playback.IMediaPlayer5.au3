# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayer5
# Incl. In  : Windows.Media.Playback.MediaPlayer

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayer5 = "{CFE537FD-F86A-4446-BF4D-C8E792B7B4B3}"
$__g_mIIDs[$sIID_IMediaPlayer5] = "IMediaPlayer5"

Global Const $tagIMediaPlayer5 = $tagIInspectable & _
		"add_VideoFrameAvailable hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_VideoFrameAvailable hresult(int64);" & _ ; In $iToken
		"get_IsVideoFrameServerEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsVideoFrameServerEnabled hresult(bool);" & _ ; In $bValue
		"CopyFrameToVideoSurface hresult(ptr);" & _ ; In $pDestination
		"CopyFrameToVideoSurface2 hresult(ptr; struct);" & _ ; In $pDestination, In $tTargetRectangle
		"CopyFrameToStereoscopicVideoSurfaces hresult(ptr; ptr);" ; In $pDestinationLeftEye, In $pDestinationRightEye

Func IMediaPlayer5_AddHdlrVideoFrameAvailable($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer5_RemoveHdlrVideoFrameAvailable($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer5_GetIsVideoFrameServerEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer5_SetIsVideoFrameServerEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer5_CopyFrameToVideoSurface($pThis, $pDestination)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaPlayer5_CopyFrameToVideoSurface2($pThis, $pDestination, $tTargetRectangle)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestination And IsInt($pDestination) Then $pDestination = Ptr($pDestination)
	If $pDestination And (Not IsPtr($pDestination)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If Not IsDllStruct($tTargetRectangle) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestination, "struct", $tTargetRectangle)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaPlayer5_CopyFrameToStereoscopicVideoSurfaces($pThis, $pDestinationLeftEye, $pDestinationRightEye)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationLeftEye And IsInt($pDestinationLeftEye) Then $pDestinationLeftEye = Ptr($pDestinationLeftEye)
	If $pDestinationLeftEye And (Not IsPtr($pDestinationLeftEye)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pDestinationRightEye And IsInt($pDestinationRightEye) Then $pDestinationRightEye = Ptr($pDestinationRightEye)
	If $pDestinationRightEye And (Not IsPtr($pDestinationRightEye)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationLeftEye, "ptr", $pDestinationRightEye)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
