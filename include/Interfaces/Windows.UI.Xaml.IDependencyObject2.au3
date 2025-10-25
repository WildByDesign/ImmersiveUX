# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IDependencyObject2
# Incl. In  : Windows.UI.Xaml.DependencyObject

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IDependencyObject2 = "{29FED85D-3D22-43A1-ADD0-17027C08B212}"
$__g_mIIDs[$sIID_IDependencyObject2] = "IDependencyObject2"

Global Const $tagIDependencyObject2 = $tagIInspectable & _
		"RegisterPropertyChangedCallback hresult(ptr; ptr; int64*);" & _ ; In $pDp, In $pCallback, Out $iResult
		"UnregisterPropertyChangedCallback hresult(ptr; int64);" ; In $pDp, In $iToken

Func IDependencyObject2_RegisterPropertyChangedCallback($pThis, $pDp, $pCallback)
	Local $vFailVal = 0
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pCallback And IsInt($pCallback) Then $pCallback = Ptr($pCallback)
	If $pCallback And (Not IsPtr($pCallback)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr", $pCallback, "int64*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IDependencyObject2_UnregisterPropertyChangedCallback($pThis, $pDp, $iToken)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iToken) And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "int64", $iToken)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
