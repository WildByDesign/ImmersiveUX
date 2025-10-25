# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaPlayerElement
# Incl. In  : Windows.UI.Xaml.Controls.MediaPlayerElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerElement = "{3B4CA526-2E25-4598-BC71-D491F8E8DE39}"
$__g_mIIDs[$sIID_IMediaPlayerElement] = "IMediaPlayerElement"

Global Const $tagIMediaPlayerElement = $tagIInspectable & _
		"get_Source hresult(ptr*);" & _ ; Out $pValue
		"put_Source hresult(ptr);" & _ ; In $pValue
		"get_TransportControls hresult(ptr*);" & _ ; Out $pValue
		"put_TransportControls hresult(ptr);" & _ ; In $pValue
		"get_AreTransportControlsEnabled hresult(bool*);" & _ ; Out $bValue
		"put_AreTransportControlsEnabled hresult(bool);" & _ ; In $bValue
		"get_PosterSource hresult(ptr*);" & _ ; Out $pValue
		"put_PosterSource hresult(ptr);" & _ ; In $pValue
		"get_Stretch hresult(ulong*);" & _ ; Out $iValue
		"put_Stretch hresult(ulong);" & _ ; In $iValue
		"get_AutoPlay hresult(bool*);" & _ ; Out $bValue
		"put_AutoPlay hresult(bool);" & _ ; In $bValue
		"get_IsFullWindow hresult(bool*);" & _ ; Out $bValue
		"put_IsFullWindow hresult(bool);" & _ ; In $bValue
		"get_MediaPlayer hresult(ptr*);" & _ ; Out $pValue
		"SetMediaPlayer hresult(ptr);" ; In $pMediaPlayer

Func IMediaPlayerElement_GetSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_SetSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_GetTransportControls($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_SetTransportControls($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_GetAreTransportControlsEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_SetAreTransportControlsEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_GetPosterSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_SetPosterSource($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_GetStretch($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_SetStretch($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_GetAutoPlay($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_SetAutoPlay($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 18, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_GetIsFullWindow($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_SetIsFullWindow($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 20, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_GetMediaPlayer($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerElement_SetMediaPlayer($pThis, $pMediaPlayer)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 22)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pMediaPlayer And IsInt($pMediaPlayer) Then $pMediaPlayer = Ptr($pMediaPlayer)
	If $pMediaPlayer And (Not IsPtr($pMediaPlayer)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pMediaPlayer)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
