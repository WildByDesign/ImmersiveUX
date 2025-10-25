# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControlOverrides6
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControlOverrides6 = "{E194C96A-D8CC-4339-A0E1-2E9C420879EC}"
$__g_mIIDs[$sIID_IControlOverrides6] = "IControlOverrides6"

Global Const $tagIControlOverrides6 = $tagIInspectable & _
		"OnPreviewKeyDown hresult(ptr);" & _ ; In $pE
		"OnPreviewKeyUp hresult(ptr);" & _ ; In $pE
		"OnCharacterReceived hresult(ptr);" ; In $pE

Func IControlOverrides6_OnPreviewKeyDown($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IControlOverrides6_OnPreviewKeyUp($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IControlOverrides6_OnCharacterReceived($pThis, $pE)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pE And IsInt($pE) Then $pE = Ptr($pE)
	If $pE And (Not IsPtr($pE)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pE)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
