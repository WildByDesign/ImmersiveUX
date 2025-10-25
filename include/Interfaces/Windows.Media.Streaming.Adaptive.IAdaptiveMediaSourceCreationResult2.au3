# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult2
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceCreationResult

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceCreationResult2 = "{1C3243BF-1C44-404B-A201-DF45AC7898E8}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceCreationResult2] = "IAdaptiveMediaSourceCreationResult2"

Global Const $tagIAdaptiveMediaSourceCreationResult2 = $tagIInspectable & _
		"get_ExtendedError hresult(long*);" ; Out $iValue

Func IAdaptiveMediaSourceCreationResult2_GetExtendedError($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "long")
	Return SetError(@error, @extended, $vValue)
EndFunc
