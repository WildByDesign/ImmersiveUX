# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Miracast.IMiracastReceiverMediaSourceCreatedEventArgs
# Incl. In  : Windows.Media.Miracast.MiracastReceiverMediaSourceCreatedEventArgs

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMiracastReceiverMediaSourceCreatedEventArgs = "{17CF519E-1246-531D-945A-6B158E39C3AA}"
$__g_mIIDs[$sIID_IMiracastReceiverMediaSourceCreatedEventArgs] = "IMiracastReceiverMediaSourceCreatedEventArgs"

Global Const $tagIMiracastReceiverMediaSourceCreatedEventArgs = $tagIInspectable & _
		"get_Connection hresult(ptr*);" & _ ; Out $pValue
		"get_MediaSource hresult(ptr*);" & _ ; Out $pValue
		"get_CursorImageChannelSettings hresult(ptr*);" & _ ; Out $pValue
		"GetDeferral hresult(ptr*);" ; Out $pResult

Func IMiracastReceiverMediaSourceCreatedEventArgs_GetConnection($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMiracastReceiverMediaSourceCreatedEventArgs_GetMediaSource($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMiracastReceiverMediaSourceCreatedEventArgs_GetCursorImageChannelSettings($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMiracastReceiverMediaSourceCreatedEventArgs_GetDeferral($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc
