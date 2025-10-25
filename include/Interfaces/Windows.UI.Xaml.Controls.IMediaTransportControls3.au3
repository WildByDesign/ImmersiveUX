# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControls3
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControls

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControls3 = "{5086430E-0940-11E7-93AE-92361F002671}"
$__g_mIIDs[$sIID_IMediaTransportControls3] = "IMediaTransportControls3"

Global Const $tagIMediaTransportControls3 = $tagIInspectable & _
		"get_ShowAndHideAutomatically hresult(bool*);" & _ ; Out $bValue
		"put_ShowAndHideAutomatically hresult(bool);" & _ ; In $bValue
		"get_IsRepeatEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsRepeatEnabled hresult(bool);" & _ ; In $bValue
		"get_IsRepeatButtonVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsRepeatButtonVisible hresult(bool);" & _ ; In $bValue
		"Show hresult();" & _ ; 
		"Hide hresult();" ; 

Func IMediaTransportControls3_GetShowAndHideAutomatically($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls3_SetShowAndHideAutomatically($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls3_GetIsRepeatEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls3_SetIsRepeatEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls3_GetIsRepeatButtonVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls3_SetIsRepeatButtonVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControls3_Show($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IMediaTransportControls3_Hide($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
