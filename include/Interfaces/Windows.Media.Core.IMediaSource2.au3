# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSource2
# Incl. In  : Windows.Media.Core.MediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSource2 = "{2EB61048-655F-4C37-B813-B4E45DFA0ABE}"
$__g_mIIDs[$sIID_IMediaSource2] = "IMediaSource2"

Global Const $tagIMediaSource2 = $tagIInspectable & _
		"add_OpenOperationCompleted hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_OpenOperationCompleted hresult(int64);" & _ ; In $iToken
		"get_CustomProperties hresult(ptr*);" & _ ; Out $pValue
		"get_Duration hresult(ptr*);" & _ ; Out $pValue
		"get_IsOpen hresult(bool*);" & _ ; Out $bValue
		"get_ExternalTimedTextSources hresult(ptr*);" & _ ; Out $pValue
		"get_ExternalTimedMetadataTracks hresult(ptr*);" ; Out $pValue

Func IMediaSource2_AddHdlrOpenOperationCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource2_RemoveHdlrOpenOperationCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource2_GetCustomProperties($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource2_GetDuration($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource2_GetIsOpen($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource2_GetExternalTimedTextSources($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSource2_GetExternalTimedMetadataTracks($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc
