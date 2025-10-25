# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControlProtected
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControlProtected = "{1791587A-2A7C-4981-A2D8-AB99FFFC65B9}"
$__g_mIIDs[$sIID_IControlProtected] = "IControlProtected"

Global Const $tagIControlProtected = $tagIInspectable & _
		"get_DefaultStyleKey hresult(ptr*);" & _ ; Out $pValue
		"put_DefaultStyleKey hresult(ptr);" & _ ; In $pValue
		"GetTemplateChild hresult(handle; ptr*);" ; In $hChildName, Out $pResult

Func IControlProtected_GetDefaultStyleKey($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlProtected_SetDefaultStyleKey($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControlProtected_GetTemplateChild($pThis, $sChildName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sChildName) And (Not IsString($sChildName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hChildName = _WinRT_CreateHString($sChildName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hChildName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hChildName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
