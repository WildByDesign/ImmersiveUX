# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Hosting.IDesktopWindowXamlSource
# Incl. In  : Windows.UI.Xaml.Hosting.DesktopWindowXamlSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IDesktopWindowXamlSource = "{D585BFE1-00FF-51BE-BA1D-A1329956EA0A}"
$__g_mIIDs[$sIID_IDesktopWindowXamlSource] = "IDesktopWindowXamlSource"

Global Const $tagIDesktopWindowXamlSource = $tagIInspectable & _
		"get_Content hresult(ptr*);" & _ ; Out $pValue
		"put_Content hresult(ptr);" & _ ; In $pValue
		"get_HasFocus hresult(bool*);" & _ ; Out $bValue
		"add_TakeFocusRequested hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_TakeFocusRequested hresult(int64);" & _ ; In $iToken
		"add_GotFocus hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_GotFocus hresult(int64);" & _ ; In $iToken
		"NavigateFocus hresult(ptr; ptr*);" ; In $pRequest, Out $pResult

Func IDesktopWindowXamlSource_GetContent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IDesktopWindowXamlSource_SetContent($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IDesktopWindowXamlSource_GetHasFocus($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IDesktopWindowXamlSource_AddHdlrTakeFocusRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 10, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IDesktopWindowXamlSource_RemoveHdlrTakeFocusRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 11, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IDesktopWindowXamlSource_AddHdlrGotFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 12, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IDesktopWindowXamlSource_RemoveHdlrGotFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 13, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IDesktopWindowXamlSource_NavigateFocus($pThis, $pRequest)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pRequest And IsInt($pRequest) Then $pRequest = Ptr($pRequest)
	If $pRequest And (Not IsPtr($pRequest)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pRequest, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
