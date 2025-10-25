# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaElement3
# Incl. In  : Windows.UI.Xaml.Controls.MediaElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaElement3 = "{479F6F13-0FDB-4ED8-928A-4D39169C3CD2}"
$__g_mIIDs[$sIID_IMediaElement3] = "IMediaElement3"

Global Const $tagIMediaElement3 = $tagIInspectable & _
		"get_TransportControls hresult(ptr*);" & _ ; Out $pValue
		"put_TransportControls hresult(ptr);" & _ ; In $pValue
		"add_PartialMediaFailureDetected hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PartialMediaFailureDetected hresult(int64);" & _ ; In $iToken
		"SetPlaybackSource hresult(ptr);" & _ ; In $pSource
		"GetAsCastingSource hresult(ptr*);" ; Out $pResult

Func IMediaElement3_GetTransportControls($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement3_SetTransportControls($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement3_AddHdlrPartialMediaFailureDetected($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 9, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement3_RemoveHdlrPartialMediaFailureDetected($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 10, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement3_SetPlaybackSource($pThis, $pSource)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pSource And IsInt($pSource) Then $pSource = Ptr($pSource)
	If $pSource And (Not IsPtr($pSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pSource)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement3_GetAsCastingSource($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc
