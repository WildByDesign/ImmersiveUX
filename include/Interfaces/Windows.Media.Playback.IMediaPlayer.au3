# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayer
# Incl. In  : Windows.Media.Playback.MediaPlayer

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayer = "{381A83CB-6FFF-499B-8D64-2885DFC1249E}"
$__g_mIIDs[$sIID_IMediaPlayer] = "IMediaPlayer"

Global Const $tagIMediaPlayer = $tagIInspectable & _
		"get_AutoPlay hresult(bool*);" & _ ; Out $bValue
		"put_AutoPlay hresult(bool);" & _ ; In $bValue
		"get_NaturalDuration hresult(int64*);" & _ ; Out $iValue
		"get_Position hresult(int64*);" & _ ; Out $iValue
		"put_Position hresult(int64);" & _ ; In $iValue
		"get_BufferingProgress hresult(double*);" & _ ; Out $fValue
		"get_CurrentState hresult(ulong*);" & _ ; Out $iValue
		"get_CanSeek hresult(bool*);" & _ ; Out $bValue
		"get_CanPause hresult(bool*);" & _ ; Out $bValue
		"get_IsLoopingEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsLoopingEnabled hresult(bool);" & _ ; In $bValue
		"get_IsProtected hresult(bool*);" & _ ; Out $bValue
		"get_IsMuted hresult(bool*);" & _ ; Out $bValue
		"put_IsMuted hresult(bool);" & _ ; In $bValue
		"get_PlaybackRate hresult(double*);" & _ ; Out $fValue
		"put_PlaybackRate hresult(double);" & _ ; In $fValue
		"get_Volume hresult(double*);" & _ ; Out $fValue
		"put_Volume hresult(double);" & _ ; In $fValue
		"get_PlaybackMediaMarkers hresult(ptr*);" & _ ; Out $pValue
		"add_MediaOpened hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_MediaOpened hresult(int64);" & _ ; In $iToken
		"add_MediaEnded hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_MediaEnded hresult(int64);" & _ ; In $iToken
		"add_MediaFailed hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_MediaFailed hresult(int64);" & _ ; In $iToken
		"add_CurrentStateChanged hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_CurrentStateChanged hresult(int64);" & _ ; In $iToken
		"add_PlaybackMediaMarkerReached hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_PlaybackMediaMarkerReached hresult(int64);" & _ ; In $iToken
		"add_MediaPlayerRateChanged hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_MediaPlayerRateChanged hresult(int64);" & _ ; In $iToken
		"add_VolumeChanged hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_VolumeChanged hresult(int64);" & _ ; In $iToken
		"add_SeekCompleted hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_SeekCompleted hresult(int64);" & _ ; In $iToken
		"add_BufferingStarted hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_BufferingStarted hresult(int64);" & _ ; In $iToken
		"add_BufferingEnded hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_BufferingEnded hresult(int64);" & _ ; In $iToken
		"Play hresult();" & _ ; 
		"Pause hresult();" & _ ; 
		"SetUriSource hresult(ptr);" ; In $pValue

Func IMediaPlayer_GetAutoPlay($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_SetAutoPlay($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetNaturalDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_SetPosition($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetBufferingProgress($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 12, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetCurrentState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 13, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetCanSeek($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetCanPause($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetIsLoopingEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_SetIsLoopingEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 17, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetIsProtected($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetIsMuted($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_SetIsMuted($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 20, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetPlaybackRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 21, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_SetPlaybackRate($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 22, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetVolume($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 23, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_SetVolume($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 24, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_GetPlaybackMediaMarkers($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrMediaOpened($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 26, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrMediaOpened($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 27, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrMediaEnded($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 28, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrMediaEnded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 29, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrMediaFailed($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 30, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrMediaFailed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 31, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrCurrentStateChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 32, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrCurrentStateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 33, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrPlaybackMediaMarkerReached($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 34, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrPlaybackMediaMarkerReached($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 35, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrMediaPlayerRateChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 36, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrMediaPlayerRateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 37, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrVolumeChanged($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 38, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrVolumeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 39, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrSeekCompleted($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 40, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrSeekCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 41, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrBufferingStarted($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 42, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrBufferingStarted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 43, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_AddHdlrBufferingEnded($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 44, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_RemoveHdlrBufferingEnded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 45, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer_Play($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 46)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaPlayer_Pause($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 47)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaPlayer_SetUriSource($pThis, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 48)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
