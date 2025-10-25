# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayerRateChangedEventArgs
# Incl. In  : Windows.Media.Playback.MediaPlayerRateChangedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerRateChangedEventArgs = "{40600D58-3B61-4BB2-989F-FC65608B6CAB}"
$__g_mIIDs[$sIID_IMediaPlayerRateChangedEventArgs] = "IMediaPlayerRateChangedEventArgs"

Global Const $tagIMediaPlayerRateChangedEventArgs = $tagIInspectable & _
		"get_NewRate hresult(double*);" ; Out $fValue

Func IMediaPlayerRateChangedEventArgs_GetNewRate($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc
