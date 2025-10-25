# *** WinRT by MattyD v1.4 ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 05 October 2024
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Foundation.IAsyncAction
# Incl. In  : Windows.Devices.Sms.DeleteSmsMessageOperation

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAsyncAction = "{5A648006-843A-4DA9-865B-9D26E5DFAD7B}"
$__g_mIIDs[$sIID_IAsyncAction] = "IAsyncAction"

Global Const $tagIAsyncAction = $tagIInspectable & _
		"put_Completed hresult(ptr);" & _ ; In $pHandler
		"get_Completed hresult(ptr*);" & _ ; Out $pHandler
		"GetResults hresult();" ;

Func IAsyncAction_SetCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAsyncAction_GetCompleted($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAsyncAction_GetResults($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
