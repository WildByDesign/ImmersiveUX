# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayerFailedEventArgs
# Incl. In  : Windows.Media.Playback.MediaPlayerFailedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerFailedEventArgs = "{2744E9B9-A7E3-4F16-BAC4-7914EBC08301}"
$__g_mIIDs[$sIID_IMediaPlayerFailedEventArgs] = "IMediaPlayerFailedEventArgs"

Global Const $tagIMediaPlayerFailedEventArgs = $tagIInspectable & _
		"get_Error hresult(ulong*);" & _ ; Out $iValue
		"get_ExtendedErrorCode hresult(long*);" & _ ; Out $iValue
		"get_ErrorMessage hresult(handle*);" ; Out $hValue

Func IMediaPlayerFailedEventArgs_GetError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerFailedEventArgs_GetExtendedErrorCode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaPlayerFailedEventArgs_GetErrorMessage($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc
