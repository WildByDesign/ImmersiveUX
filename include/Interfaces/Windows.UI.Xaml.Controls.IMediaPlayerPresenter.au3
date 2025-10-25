# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaPlayerPresenter
# Incl. In  : Windows.UI.Xaml.Controls.MediaPlayerPresenter

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerPresenter = "{77A92326-0C5B-41FC-BF49-15F6C3524B6B}"
$__g_mIIDs[$sIID_IMediaPlayerPresenter] = "IMediaPlayerPresenter"

Global Const $tagIMediaPlayerPresenter = $tagIInspectable & _
		"get_MediaPlayer hresult(ptr*);" & _ ; Out $pValue
		"put_MediaPlayer hresult(ptr);" & _ ; In $pValue
		"get_Stretch hresult(ulong*);" & _ ; Out $iValue
		"put_Stretch hresult(ulong);" & _ ; In $iValue
		"get_IsFullWindow hresult(bool*);" & _ ; Out $bValue
		"put_IsFullWindow hresult(bool);" ; In $bValue

Func IMediaPlayerPresenter_GetMediaPlayer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerPresenter_SetMediaPlayer($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerPresenter_GetStretch($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerPresenter_SetStretch($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 10, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerPresenter_GetIsFullWindow($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerPresenter_SetIsFullWindow($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
