# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource2
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSource2 = "{17890342-6760-4BB9-A58A-F7AA98B08C0E}"
$__g_mIIDs[$sIID_IAdaptiveMediaSource2] = "IAdaptiveMediaSource2"

Global Const $tagIAdaptiveMediaSource2 = $tagIInspectable & _
		"get_AdvancedSettings hresult(ptr*);" ; Out $pValue

Func IAdaptiveMediaSource2_GetAdvancedSettings($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
