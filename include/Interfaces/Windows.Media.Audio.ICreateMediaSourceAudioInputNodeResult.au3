# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Audio.ICreateMediaSourceAudioInputNodeResult
# Incl. In  : Windows.Media.Audio.CreateMediaSourceAudioInputNodeResult

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_ICreateMediaSourceAudioInputNodeResult = "{46A658A3-53C0-4D59-9E51-CC1D1044A4C4}"
$__g_mIIDs[$sIID_ICreateMediaSourceAudioInputNodeResult] = "ICreateMediaSourceAudioInputNodeResult"

Global Const $tagICreateMediaSourceAudioInputNodeResult = $tagIInspectable & _
		"get_Status hresult(ulong*);" & _ ; Out $iValue
		"get_Node hresult(ptr*);" ; Out $pValue

Func ICreateMediaSourceAudioInputNodeResult_GetStatus($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func ICreateMediaSourceAudioInputNodeResult_GetNode($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc
