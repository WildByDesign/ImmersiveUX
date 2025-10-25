# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayerSurface
# Incl. In  : Windows.Media.Playback.MediaPlayerSurface

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerSurface = "{0ED653BC-B736-49C3-830B-764A3845313A}"
$__g_mIIDs[$sIID_IMediaPlayerSurface] = "IMediaPlayerSurface"

Global Const $tagIMediaPlayerSurface = $tagIInspectable & _
		"get_CompositionSurface hresult(ptr*);" & _ ; Out $pValue
		"get_Compositor hresult(ptr*);" & _ ; Out $pValue
		"get_MediaPlayer hresult(ptr*);" ; Out $pValue

Func IMediaPlayerSurface_GetCompositionSurface($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerSurface_GetCompositor($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerSurface_GetMediaPlayer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc
