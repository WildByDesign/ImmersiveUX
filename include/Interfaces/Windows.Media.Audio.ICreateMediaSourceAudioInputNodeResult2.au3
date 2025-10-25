# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Audio.ICreateMediaSourceAudioInputNodeResult2
# Incl. In  : Windows.Media.Audio.CreateMediaSourceAudioInputNodeResult

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_ICreateMediaSourceAudioInputNodeResult2 = "{63514CE8-6A1A-49E3-97EC-28FD5BE114E5}"
$__g_mIIDs[$sIID_ICreateMediaSourceAudioInputNodeResult2] = "ICreateMediaSourceAudioInputNodeResult2"

Global Const $tagICreateMediaSourceAudioInputNodeResult2 = $tagIInspectable & _
		"get_ExtendedError hresult(long*);" ; Out $iValue

Func ICreateMediaSourceAudioInputNodeResult2_GetExtendedError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc
