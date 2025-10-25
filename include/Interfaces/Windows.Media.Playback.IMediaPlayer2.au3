# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayer2
# Incl. In  : Windows.Media.Playback.MediaPlayer

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayer2 = "{3C841218-2123-4FC5-9082-2F883F77BDF5}"
$__g_mIIDs[$sIID_IMediaPlayer2] = "IMediaPlayer2"

Global Const $tagIMediaPlayer2 = $tagIInspectable & _
		"get_SystemMediaTransportControls hresult(ptr*);" & _ ; Out $pValue
		"get_AudioCategory hresult(ulong*);" & _ ; Out $iValue
		"put_AudioCategory hresult(ulong);" & _ ; In $iValue
		"get_AudioDeviceType hresult(ulong*);" & _ ; Out $iValue
		"put_AudioDeviceType hresult(ulong);" ; In $iValue

Func IMediaPlayer2_GetSystemMediaTransportControls($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer2_GetAudioCategory($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer2_SetAudioCategory($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 9, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer2_GetAudioDeviceType($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayer2_SetAudioDeviceType($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
