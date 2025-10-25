# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaPlayerPresenterStatics
# Incl. In  : Windows.UI.Xaml.Controls.MediaPlayerPresenter

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerPresenterStatics = "{84D774FE-EAD4-4957-B42B-223158CA0DE7}"
$__g_mIIDs[$sIID_IMediaPlayerPresenterStatics] = "IMediaPlayerPresenterStatics"

Global Const $tagIMediaPlayerPresenterStatics = $tagIInspectable & _
		"get_MediaPlayerProperty hresult(ptr*);" & _ ; Out $pValue
		"get_StretchProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsFullWindowProperty hresult(ptr*);" ; Out $pValue

Func IMediaPlayerPresenterStatics_GetMediaPlayerProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerPresenterStatics_GetStretchProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerPresenterStatics_GetIsFullWindowProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc
