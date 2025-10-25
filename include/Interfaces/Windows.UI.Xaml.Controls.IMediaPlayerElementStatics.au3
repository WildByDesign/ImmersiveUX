# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaPlayerElementStatics
# Incl. In  : Windows.UI.Xaml.Controls.MediaPlayerElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerElementStatics = "{1E7C4020-AC57-42DD-AD1C-3EBC2D7F08BA}"
$__g_mIIDs[$sIID_IMediaPlayerElementStatics] = "IMediaPlayerElementStatics"

Global Const $tagIMediaPlayerElementStatics = $tagIInspectable & _
		"get_SourceProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AreTransportControlsEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_PosterSourceProperty hresult(ptr*);" & _ ; Out $pValue
		"get_StretchProperty hresult(ptr*);" & _ ; Out $pValue
		"get_AutoPlayProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFullWindowProperty hresult(ptr*);" & _ ; Out $pValue
		"get_MediaPlayerProperty hresult(ptr*);" ; Out $pValue

Func IMediaPlayerElementStatics_GetSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElementStatics_GetAreTransportControlsEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElementStatics_GetPosterSourceProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElementStatics_GetStretchProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElementStatics_GetAutoPlayProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElementStatics_GetIsFullWindowProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElementStatics_GetMediaPlayerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc
