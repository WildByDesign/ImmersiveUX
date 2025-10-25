# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaElement2
# Incl. In  : Windows.UI.Xaml.Controls.MediaElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaElement2 = "{FD53DA65-B186-4654-BFDB-180ED26CAD07}"
$__g_mIIDs[$sIID_IMediaElement2] = "IMediaElement2"

Global Const $tagIMediaElement2 = $tagIInspectable & _
		"get_AreTransportControlsEnabled hresult(bool*);" & _ ; Out $bValue
		"put_AreTransportControlsEnabled hresult(bool);" & _ ; In $bValue
		"get_Stretch hresult(ulong*);" & _ ; Out $iValue
		"put_Stretch hresult(ulong);" & _ ; In $iValue
		"get_IsFullWindow hresult(bool*);" & _ ; Out $bValue
		"put_IsFullWindow hresult(bool);" & _ ; In $bValue
		"SetMediaStreamSource hresult(ptr);" & _ ; In $pSource
		"get_PlayToPreferredSourceUri hresult(ptr*);" & _ ; Out $pValue
		"put_PlayToPreferredSourceUri hresult(ptr);" ; In $pValue

Func IMediaElement2_GetAreTransportControlsEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement2_SetAreTransportControlsEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement2_GetStretch($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 9, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement2_SetStretch($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 10, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement2_GetIsFullWindow($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement2_SetIsFullWindow($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement2_SetMediaStreamSource($pThis, $pSource)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pSource And IsInt($pSource) Then $pSource = Ptr($pSource)
	If $pSource And (Not IsPtr($pSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pSource)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaElement2_GetPlayToPreferredSourceUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaElement2_SetPlayToPreferredSourceUri($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 15, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
