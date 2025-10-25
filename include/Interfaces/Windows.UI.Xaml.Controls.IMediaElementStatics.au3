# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaElementStatics
# Incl. In  : Windows.UI.Xaml.Controls.MediaElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaElementStatics = "{DCCD2CB9-7568-4682-A72A-8DDF2A2665CA}"
$__g_mIIDs[$sIID_IMediaElementStatics] = "IMediaElementStatics"

Global Const $tagIMediaElementStatics = $tagIInspectable & _
		"get_PosterSourceProperty hresult(ptr*);" & _ ; Out $pValue
		"get_SourceProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsMutedProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsAudioOnlyProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AutoPlayProperty hresult(ptr*);" & _ ; Out $pValue
		"get_VolumeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_BalanceProperty hresult(ptr*);" & _ ; Out $pValue
		"get_NaturalVideoHeightProperty hresult(ptr*);" & _ ; Out $pValue
		"get_NaturalVideoWidthProperty hresult(ptr*);" & _ ; Out $pValue
		"get_NaturalDurationProperty hresult(ptr*);" & _ ; Out $pValue
		"get_PositionProperty hresult(ptr*);" & _ ; Out $pValue
		"get_DownloadProgressProperty hresult(ptr*);" & _ ; Out $pValue
		"get_BufferingProgressProperty hresult(ptr*);" & _ ; Out $pValue
		"get_DownloadProgressOffsetProperty hresult(ptr*);" & _ ; Out $pValue
		"get_CurrentStateProperty hresult(ptr*);" & _ ; Out $pValue
		"get_CanSeekProperty hresult(ptr*);" & _ ; Out $pValue
		"get_CanPauseProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AudioStreamCountProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AudioStreamIndexProperty hresult(ptr*);" & _ ; Out $pValue
		"get_PlaybackRateProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsLoopingProperty hresult(ptr*);" & _ ; Out $pValue
		"get_PlayToSourceProperty hresult(ptr*);" & _ ; Out $pValue
		"get_DefaultPlaybackRateProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AspectRatioWidthProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AspectRatioHeightProperty hresult(ptr*);" & _ ; Out $pValue
		"get_RealTimePlaybackProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AudioCategoryProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AudioDeviceTypeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ProtectionManagerProperty hresult(ptr*);" & _ ; Out $pValue
		"get_Stereo3DVideoPackingModeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_Stereo3DVideoRenderModeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsStereo3DVideoProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ActualStereo3DVideoPackingModeProperty hresult(ptr*);" ; Out $pValue

Func IMediaElementStatics_GetPosterSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetIsMutedProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetIsAudioOnlyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetAutoPlayProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetVolumeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetBalanceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetNaturalVideoHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetNaturalVideoWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetNaturalDurationProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetPositionProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetDownloadProgressProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetBufferingProgressProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetDownloadProgressOffsetProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetCurrentStateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetCanSeekProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetCanPauseProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetAudioStreamCountProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 24)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetAudioStreamIndexProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetPlaybackRateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 26)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetIsLoopingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetPlayToSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 28)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetDefaultPlaybackRateProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetAspectRatioWidthProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 30)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetAspectRatioHeightProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetRealTimePlaybackProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 32)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetAudioCategoryProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetAudioDeviceTypeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 34)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetProtectionManagerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 35)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetStereo3DVideoPackingModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 36)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetStereo3DVideoRenderModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetIsStereo3DVideoProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 38)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElementStatics_GetActualStereo3DVideoPackingModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc
