# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaElement
# Incl. In  : Windows.UI.Xaml.Controls.MediaElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaElement = "{A38ED2CF-13DE-4299-ADE2-AE18F74ED353}"
$__g_mIIDs[$sIID_IMediaElement] = "IMediaElement"

Global Const $tagIMediaElement = $tagIInspectable & _
		"get_PosterSource hresult(ptr*);" & _ ; Out $pValue
		"put_PosterSource hresult(ptr);" & _ ; In $pValue
		"get_Source hresult(ptr*);" & _ ; Out $pValue
		"put_Source hresult(ptr);" & _ ; In $pValue
		"get_IsMuted hresult(bool*);" & _ ; Out $bValue
		"put_IsMuted hresult(bool);" & _ ; In $bValue
		"get_IsAudioOnly hresult(bool*);" & _ ; Out $bValue
		"get_AutoPlay hresult(bool*);" & _ ; Out $bValue
		"put_AutoPlay hresult(bool);" & _ ; In $bValue
		"get_Volume hresult(double*);" & _ ; Out $fValue
		"put_Volume hresult(double);" & _ ; In $fValue
		"get_Balance hresult(double*);" & _ ; Out $fValue
		"put_Balance hresult(double);" & _ ; In $fValue
		"get_NaturalVideoHeight hresult(long*);" & _ ; Out $iValue
		"get_NaturalVideoWidth hresult(long*);" & _ ; Out $iValue
		"get_NaturalDuration hresult(struct*);" & _ ; Out $tValue
		"get_Position hresult(int64*);" & _ ; Out $iValue
		"put_Position hresult(int64);" & _ ; In $iValue
		"get_DownloadProgress hresult(double*);" & _ ; Out $fValue
		"get_BufferingProgress hresult(double*);" & _ ; Out $fValue
		"get_DownloadProgressOffset hresult(double*);" & _ ; Out $fValue
		"get_CurrentState hresult(ulong*);" & _ ; Out $iValue
		"get_Markers hresult(ptr*);" & _ ; Out $pValue
		"get_CanSeek hresult(bool*);" & _ ; Out $bValue
		"get_CanPause hresult(bool*);" & _ ; Out $bValue
		"get_AudioStreamCount hresult(long*);" & _ ; Out $iValue
		"get_AudioStreamIndex hresult(ptr*);" & _ ; Out $pValue
		"put_AudioStreamIndex hresult(ptr);" & _ ; In $pValue
		"get_PlaybackRate hresult(double*);" & _ ; Out $fValue
		"put_PlaybackRate hresult(double);" & _ ; In $fValue
		"get_IsLooping hresult(bool*);" & _ ; Out $bValue
		"put_IsLooping hresult(bool);" & _ ; In $bValue
		"get_PlayToSource hresult(ptr*);" & _ ; Out $pValue
		"get_DefaultPlaybackRate hresult(double*);" & _ ; Out $fValue
		"put_DefaultPlaybackRate hresult(double);" & _ ; In $fValue
		"get_AspectRatioWidth hresult(long*);" & _ ; Out $iValue
		"get_AspectRatioHeight hresult(long*);" & _ ; Out $iValue
		"get_RealTimePlayback hresult(bool*);" & _ ; Out $bValue
		"put_RealTimePlayback hresult(bool);" & _ ; In $bValue
		"get_AudioCategory hresult(ulong*);" & _ ; Out $iValue
		"put_AudioCategory hresult(ulong);" & _ ; In $iValue
		"get_AudioDeviceType hresult(ulong*);" & _ ; Out $iValue
		"put_AudioDeviceType hresult(ulong);" & _ ; In $iValue
		"get_ProtectionManager hresult(ptr*);" & _ ; Out $pValue
		"put_ProtectionManager hresult(ptr);" & _ ; In $pValue
		"get_Stereo3DVideoPackingMode hresult(ulong*);" & _ ; Out $iValue
		"put_Stereo3DVideoPackingMode hresult(ulong);" & _ ; In $iValue
		"get_Stereo3DVideoRenderMode hresult(ulong*);" & _ ; Out $iValue
		"put_Stereo3DVideoRenderMode hresult(ulong);" & _ ; In $iValue
		"get_IsStereo3DVideo hresult(bool*);" & _ ; Out $bValue
		"add_MediaOpened hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_MediaOpened hresult(int64);" & _ ; In $iToken
		"add_MediaEnded hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_MediaEnded hresult(int64);" & _ ; In $iToken
		"add_MediaFailed hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_MediaFailed hresult(int64);" & _ ; In $iToken
		"add_DownloadProgressChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DownloadProgressChanged hresult(int64);" & _ ; In $iToken
		"add_BufferingProgressChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_BufferingProgressChanged hresult(int64);" & _ ; In $iToken
		"add_CurrentStateChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_CurrentStateChanged hresult(int64);" & _ ; In $iToken
		"add_MarkerReached hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_MarkerReached hresult(int64);" & _ ; In $iToken
		"add_RateChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_RateChanged hresult(int64);" & _ ; In $iToken
		"add_VolumeChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_VolumeChanged hresult(int64);" & _ ; In $iToken
		"add_SeekCompleted hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_SeekCompleted hresult(int64);" & _ ; In $iToken
		"Stop hresult();" & _ ; 
		"Play hresult();" & _ ; 
		"Pause hresult();" & _ ; 
		"CanPlayType hresult(handle; ulong*);" & _ ; In $hType, Out $iResult
		"SetSource hresult(ptr; handle);" & _ ; In $pStream, In $hMimeType
		"GetAudioStreamLanguage hresult(ptr; handle*);" & _ ; In $pIndex, Out $hResult
		"AddAudioEffect hresult(handle; bool; ptr);" & _ ; In $hEffectID, In $bEffectOptional, In $pEffectConfiguration
		"AddVideoEffect hresult(handle; bool; ptr);" & _ ; In $hEffectID, In $bEffectOptional, In $pEffectConfiguration
		"RemoveAllEffects hresult();" & _ ; 
		"get_ActualStereo3DVideoPackingMode hresult(ulong*);" ; Out $iValue

Func IMediaElement_GetPosterSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetPosterSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetIsMuted($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetIsMuted($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetIsAudioOnly($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetAutoPlay($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetAutoPlay($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 15, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetVolume($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 16, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetVolume($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 17, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetBalance($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 18, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetBalance($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 19, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetNaturalVideoHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 20, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetNaturalVideoWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 21, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetNaturalDuration($pThis)
	Local $tagValue = "int64;ulong;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 22, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IMediaElement_GetPosition($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 23, "int64")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetPosition($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 24, "int64", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetDownloadProgress($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 25, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetBufferingProgress($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 26, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetDownloadProgressOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 27, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetCurrentState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 28, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetMarkers($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetCanSeek($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 30)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetCanPause($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetAudioStreamCount($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 32, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetAudioStreamIndex($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetAudioStreamIndex($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 34, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetPlaybackRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 35, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetPlaybackRate($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 36, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetIsLooping($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetIsLooping($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 38, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetPlayToSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetDefaultPlaybackRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 40, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetDefaultPlaybackRate($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 41, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetAspectRatioWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 42, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetAspectRatioHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 43, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetRealTimePlayback($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 44)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetRealTimePlayback($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 45, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetAudioCategory($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 46, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetAudioCategory($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 47, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetAudioDeviceType($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 48, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetAudioDeviceType($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 49, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetProtectionManager($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 50)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetProtectionManager($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 51, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetStereo3DVideoPackingMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 52, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetStereo3DVideoPackingMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 53, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetStereo3DVideoRenderMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 54, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_SetStereo3DVideoRenderMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 55, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_GetIsStereo3DVideo($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 56)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrMediaOpened($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 57, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrMediaOpened($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 58, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrMediaEnded($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 59, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrMediaEnded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 60, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrMediaFailed($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 61, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrMediaFailed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 62, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrDownloadProgressChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 63, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrDownloadProgressChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 64, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrBufferingProgressChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 65, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrBufferingProgressChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 66, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrCurrentStateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 67, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrCurrentStateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 68, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrMarkerReached($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 69, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrMarkerReached($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 70, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrRateChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 71, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrRateChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 72, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrVolumeChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 73, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrVolumeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 74, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_AddHdlrSeekCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 75, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_RemoveHdlrSeekCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 76, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement_Stop($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 77)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement_Play($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 78)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement_Pause($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 79)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement_CanPlayType($pThis, $sType)
	Local $vFailVal = -1
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 80)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sType) And (Not IsString($sType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hType = _WinRT_CreateHString($sType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hType, "ulong*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IMediaElement_SetSource($pThis, $pStream, $sMimeType)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 81)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sMimeType) And (Not IsString($sMimeType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hMimeType = _WinRT_CreateHString($sMimeType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream, "handle", $hMimeType)
	Local $iError = @error
	_WinRT_DeleteHString($hMimeType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement_GetAudioStreamLanguage($pThis, $pIndex)
	Local $vFailVal = ""
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 82)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pIndex And IsInt($pIndex) Then $pIndex = Ptr($pIndex)
	If $pIndex And (Not IsPtr($pIndex)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pIndex, "handle*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $sResult = _WinRT_ReadHString($aCall[3])
	_WinRT_DeleteHString($aCall[3])
	Return SetError($aCall[0], 0, $sResult)
EndFunc

Func IMediaElement_AddAudioEffect($pThis, $sEffectID, $bEffectOptional, $pEffectConfiguration)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 83)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sEffectID) And (Not IsString($sEffectID)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hEffectID = _WinRT_CreateHString($sEffectID)
	If ($bEffectOptional) And (Not IsBool($bEffectOptional)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pEffectConfiguration And IsInt($pEffectConfiguration) Then $pEffectConfiguration = Ptr($pEffectConfiguration)
	If $pEffectConfiguration And (Not IsPtr($pEffectConfiguration)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hEffectID, "bool", $bEffectOptional, "ptr", $pEffectConfiguration)
	Local $iError = @error
	_WinRT_DeleteHString($hEffectID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement_AddVideoEffect($pThis, $sEffectID, $bEffectOptional, $pEffectConfiguration)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 84)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sEffectID) And (Not IsString($sEffectID)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hEffectID = _WinRT_CreateHString($sEffectID)
	If ($bEffectOptional) And (Not IsBool($bEffectOptional)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pEffectConfiguration And IsInt($pEffectConfiguration) Then $pEffectConfiguration = Ptr($pEffectConfiguration)
	If $pEffectConfiguration And (Not IsPtr($pEffectConfiguration)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hEffectID, "bool", $bEffectOptional, "ptr", $pEffectConfiguration)
	Local $iError = @error
	_WinRT_DeleteHString($hEffectID)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement_RemoveAllEffects($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 85)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement_GetActualStereo3DVideoPackingMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 86, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc
