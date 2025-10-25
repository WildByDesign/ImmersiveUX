# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSource5
# Incl. In  : Windows.Media.Core.MediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSource5 = "{331A22AE-ED2E-4A22-94C8-B743A92B3022}"
$__g_mIIDs[$sIID_IMediaSource5] = "IMediaSource5"

Global Const $tagIMediaSource5 = $tagIInspectable & _
		"get_DownloadOperation hresult(ptr*);" ; Out $pValue

Func IMediaSource5_GetDownloadOperation($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
