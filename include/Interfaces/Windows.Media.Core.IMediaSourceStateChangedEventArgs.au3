# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSourceStateChangedEventArgs
# Incl. In  : Windows.Media.Core.MediaSourceStateChangedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSourceStateChangedEventArgs = "{0A30AF82-9071-4BAC-BC39-CA2A93B717A9}"
$__g_mIIDs[$sIID_IMediaSourceStateChangedEventArgs] = "IMediaSourceStateChangedEventArgs"

Global Const $tagIMediaSourceStateChangedEventArgs = $tagIInspectable & _
		"get_OldState hresult(ulong*);" & _ ; Out $iValue
		"get_NewState hresult(ulong*);" ; Out $iValue

Func IMediaSourceStateChangedEventArgs_GetOldState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceStateChangedEventArgs_GetNewState($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc
