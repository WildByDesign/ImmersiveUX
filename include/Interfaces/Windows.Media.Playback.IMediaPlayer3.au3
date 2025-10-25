# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayer3
# Incl. In  : Windows.Media.Playback.MediaPlayer

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayer3 = "{EE0660DA-031B-4FEB-BD9B-92E0A0A8D299}"
$__g_mIIDs[$sIID_IMediaPlayer3] = "IMediaPlayer3"

Global Const $tagIMediaPlayer3 = $tagIInspectable & _
		"add_IsMutedChanged hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_IsMutedChanged hresult(int64);" & _ ; In $iToken
		"add_SourceChanged hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_SourceChanged hresult(int64);" & _ ; In $iToken
		"get_AudioBalance hresult(double*);" & _ ; Out $fValue
		"put_AudioBalance hresult(double);" & _ ; In $fValue
		"get_RealTimePlayback hresult(bool*);" & _ ; Out $bValue
		"put_RealTimePlayback hresult(bool);" & _ ; In $bValue
		"get_StereoscopicVideoRenderMode hresult(ulong*);" & _ ; Out $iValue
		"put_StereoscopicVideoRenderMode hresult(ulong);" & _ ; In $iValue
		"get_BreakManager hresult(ptr*);" & _ ; Out $pValue
		"get_CommandManager hresult(ptr*);" & _ ; Out $pValue
		"get_AudioDevice hresult(ptr*);" & _ ; Out $pValue
		"put_AudioDevice hresult(ptr);" & _ ; In $pValue
		"get_TimelineController hresult(ptr*);" & _ ; Out $pValue
		"put_TimelineController hresult(ptr);" & _ ; In $pValue
		"get_TimelineControllerPositionOffset hresult(int64*);" & _ ; Out $iValue
		"put_TimelineControllerPositionOffset hresult(int64);" & _ ; In $iValue
		"get_PlaybackSession hresult(ptr*);" & _ ; Out $pValue
		"StepForwardOneFrame hresult();" & _ ; 
		"StepBackwardOneFrame hresult();" & _ ; 
		"GetAsCastingSource hresult(ptr*);" ; Out $pReturnValue

Func IMediaPlayer3_AddHdlrIsMutedChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_RemoveHdlrIsMutedChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_AddHdlrSourceChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 9, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_RemoveHdlrSourceChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 10, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetAudioBalance($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 11, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_SetAudioBalance($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 12, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetRealTimePlayback($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_SetRealTimePlayback($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 14, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetStereoscopicVideoRenderMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_SetStereoscopicVideoRenderMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetBreakManager($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetCommandManager($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetAudioDevice($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_SetAudioDevice($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 20, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetTimelineController($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_SetTimelineController($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 22, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetTimelineControllerPositionOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 23, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_SetTimelineControllerPositionOffset($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 24, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_GetPlaybackSession($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer3_StepForwardOneFrame($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 26)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaPlayer3_StepBackwardOneFrame($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 27)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaPlayer3_GetAsCastingSource($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 28)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc
