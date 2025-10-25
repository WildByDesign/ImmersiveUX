# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaTransportControlsStatics3
# Incl. In  : Windows.UI.Xaml.Controls.MediaTransportControls

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaTransportControlsStatics3 = "{5FE05542-0940-11E7-93AE-92361F002671}"
$__g_mIIDs[$sIID_IMediaTransportControlsStatics3] = "IMediaTransportControlsStatics3"

Global Const $tagIMediaTransportControlsStatics3 = $tagIInspectable & _
		"get_ShowAndHideAutomaticallyProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsRepeatEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsRepeatButtonVisibleProperty hresult(ptr*);" ; Out $pValue

Func IMediaTransportControlsStatics3_GetShowAndHideAutomaticallyProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics3_GetIsRepeatEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaTransportControlsStatics3_GetIsRepeatButtonVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc
