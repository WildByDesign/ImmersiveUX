# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementOverrides9
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementOverrides9 = "{9A6E5973-6D63-54F2-90FA-62813B20B7B9}"
$__g_mIIDs[$sIID_IUIElementOverrides9] = "IUIElementOverrides9"

Global Const $tagIUIElementOverrides9 = $tagIInspectable & _
		"PopulatePropertyInfoOverride hresult(handle; ptr);" ; In $hPropertyName, In $pAnimationPropertyInfo

Func IUIElementOverrides9_PopulatePropertyInfoOverride($pThis, $sPropertyName, $pAnimationPropertyInfo)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sPropertyName) And (Not IsString($sPropertyName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hPropertyName = _WinRT_CreateHString($sPropertyName)
	If $pAnimationPropertyInfo And IsInt($pAnimationPropertyInfo) Then $pAnimationPropertyInfo = Ptr($pAnimationPropertyInfo)
	If $pAnimationPropertyInfo And (Not IsPtr($pAnimationPropertyInfo)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hPropertyName, "ptr", $pAnimationPropertyInfo)
	Local $iError = @error
	_WinRT_DeleteHString($hPropertyName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
