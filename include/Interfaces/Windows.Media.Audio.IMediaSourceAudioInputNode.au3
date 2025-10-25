# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Audio.IMediaSourceAudioInputNode
# Incl. In  : Windows.Media.Audio.MediaSourceAudioInputNode

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSourceAudioInputNode = "{99D8983B-A88A-4041-8E4F-DDBAC0C91FD3}"
$__g_mIIDs[$sIID_IMediaSourceAudioInputNode] = "IMediaSourceAudioInputNode"

Global Const $tagIMediaSourceAudioInputNode = $tagIInspectable & _
		"put_PlaybackSpeedFactor hresult(double);" & _ ; In $fValue
		"get_PlaybackSpeedFactor hresult(double*);" & _ ; Out $fValue
		"get_Position hresult(int64*);" & _ ; Out $iValue
		"Seek hresult(int64);" & _ ; In $iPosition
		"get_StartTime hresult(ptr*);" & _ ; Out $pValue
		"put_StartTime hresult(ptr);" & _ ; In $pValue
		"get_EndTime hresult(ptr*);" & _ ; Out $pValue
		"put_EndTime hresult(ptr);" & _ ; In $pValue
		"get_LoopCount hresult(ptr*);" & _ ; Out $pValue
		"put_LoopCount hresult(ptr);" & _ ; In $pValue
		"get_Duration hresult(int64*);" & _ ; Out $iValue
		"get_MediaSource hresult(ptr*);" & _ ; Out $pValue
		"add_MediaSourceCompleted hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_MediaSourceCompleted hresult(int64);" ; In $iToken

Func IMediaSourceAudioInputNode_SetPlaybackSpeedFactor($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 7, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_GetPlaybackSpeedFactor($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_Seek($pThis, $iPosition)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iPosition) And (Not IsInt($iPosition)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "int64", $iPosition)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaSourceAudioInputNode_GetStartTime($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_SetStartTime($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 12, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_GetEndTime($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_SetEndTime($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_GetLoopCount($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_SetLoopCount($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 16, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_GetDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 17, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_GetMediaSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_AddHdlrMediaSourceCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 19, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAudioInputNode_RemoveHdlrMediaSourceCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 20, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc
