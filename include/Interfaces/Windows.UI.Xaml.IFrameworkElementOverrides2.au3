# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IFrameworkElementOverrides2
# Incl. In  : Windows.UI.Xaml.FrameworkElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IFrameworkElementOverrides2 = "{CB5CD2B9-E3B4-458C-B64E-1434FD1BD88A}"
$__g_mIIDs[$sIID_IFrameworkElementOverrides2] = "IFrameworkElementOverrides2"

Global Const $tagIFrameworkElementOverrides2 = $tagIInspectable & _
		"GoToElementStateCore hresult(handle; bool; bool*);" ; In $hStateName, In $bUseTransitions, Out $bResult

Func IFrameworkElementOverrides2_GoToElementStateCore($pThis, $sStateName, $bUseTransitions)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sStateName) And (Not IsString($sStateName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hStateName = _WinRT_CreateHString($sStateName)
	If ($bUseTransitions) And (Not IsBool($bUseTransitions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hStateName, "bool", $bUseTransitions, "bool*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hStateName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc
