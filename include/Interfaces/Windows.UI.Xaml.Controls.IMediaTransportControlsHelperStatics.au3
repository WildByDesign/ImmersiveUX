# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControlsHelperStatics
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControlsHelper

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControlsHelperStatics = "{5A772047-A9A1-4625-9270-7F49875D4394}"
$__g_mIIDs[$sIID_IMediaTransportControlsHelperStatics] = "IMediaTransportControlsHelperStatics"

Global Const $tagIMediaTransportControlsHelperStatics = $tagIInspectable & _
		"get_DropoutOrderProperty hresult(ptr*);" & _ ; Out $pValue
		"GetDropoutOrder hresult(ptr; ptr*);" & _ ; In $pElement, Out $pResult
		"SetDropoutOrder hresult(ptr; ptr);" ; In $pElement, In $pValue

Func IMediaTransportControlsHelperStatics_GetDropoutOrderProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsHelperStatics_GetDropoutOrder($pThis, $pElement)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IMediaTransportControlsHelperStatics_SetDropoutOrder($pThis, $pElement, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pElement And IsInt($pElement) Then $pElement = Ptr($pElement)
	If $pElement And (Not IsPtr($pElement)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pElement, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
