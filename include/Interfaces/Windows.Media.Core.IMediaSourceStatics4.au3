# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSourceStatics4
# Incl. In  : Windows.Media.Core.MediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSourceStatics4 = "{281B3BFC-E50A-4428-A500-9C4ED918D3F0}"
$__g_mIIDs[$sIID_IMediaSourceStatics4] = "IMediaSourceStatics4"

Global Const $tagIMediaSourceStatics4 = $tagIInspectable & _
		"CreateFromDownloadOperation hresult(ptr; ptr*);" ; In $pDownloadOperation, Out $pResult

Func IMediaSourceStatics4_CreateFromDownloadOperation($pThis, $pDownloadOperation)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDownloadOperation And IsInt($pDownloadOperation) Then $pDownloadOperation = Ptr($pDownloadOperation)
	If $pDownloadOperation And (Not IsPtr($pDownloadOperation)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDownloadOperation, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
