# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Audio.IAudioInputNode2
# Incl. In  : Windows.Media.Audio.MediaSourceAudioInputNode

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAudioInputNode2 = "{905156B7-CA68-4C6D-A8BC-E3EE17FE3FD2}"
$__g_mIIDs[$sIID_IAudioInputNode2] = "IAudioInputNode2"

Global Const $tagIAudioInputNode2 = $tagIInspectable & _
		"get_Emitter hresult(ptr*);" ; Out $pValue

Func IAudioInputNode2_GetEmitter($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
