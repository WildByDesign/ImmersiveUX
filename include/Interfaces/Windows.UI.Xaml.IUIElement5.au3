# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElement5
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElement5 = "{8EED9BC2-A58C-4453-AF0F-A92EE06D0317}"
$__g_mIIDs[$sIID_IUIElement5] = "IUIElement5"

Global Const $tagIUIElement5 = $tagIInspectable & _
		"get_Lights hresult(ptr*);" & _ ; Out $pValue
		"get_KeyTipPlacementMode hresult(ulong*);" & _ ; Out $iValue
		"put_KeyTipPlacementMode hresult(ulong);" & _ ; In $iValue
		"get_KeyTipHorizontalOffset hresult(double*);" & _ ; Out $fValue
		"put_KeyTipHorizontalOffset hresult(double);" & _ ; In $fValue
		"get_KeyTipVerticalOffset hresult(double*);" & _ ; Out $fValue
		"put_KeyTipVerticalOffset hresult(double);" & _ ; In $fValue
		"get_XYFocusKeyboardNavigation hresult(ulong*);" & _ ; Out $iValue
		"put_XYFocusKeyboardNavigation hresult(ulong);" & _ ; In $iValue
		"get_XYFocusUpNavigationStrategy hresult(ulong*);" & _ ; Out $iValue
		"put_XYFocusUpNavigationStrategy hresult(ulong);" & _ ; In $iValue
		"get_XYFocusDownNavigationStrategy hresult(ulong*);" & _ ; Out $iValue
		"put_XYFocusDownNavigationStrategy hresult(ulong);" & _ ; In $iValue
		"get_XYFocusLeftNavigationStrategy hresult(ulong*);" & _ ; Out $iValue
		"put_XYFocusLeftNavigationStrategy hresult(ulong);" & _ ; In $iValue
		"get_XYFocusRightNavigationStrategy hresult(ulong*);" & _ ; Out $iValue
		"put_XYFocusRightNavigationStrategy hresult(ulong);" & _ ; In $iValue
		"get_HighContrastAdjustment hresult(ulong*);" & _ ; Out $iValue
		"put_HighContrastAdjustment hresult(ulong);" & _ ; In $iValue
		"get_TabFocusNavigation hresult(ulong*);" & _ ; Out $iValue
		"put_TabFocusNavigation hresult(ulong);" & _ ; In $iValue
		"add_GettingFocus hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_GettingFocus hresult(int64);" & _ ; In $iToken
		"add_LosingFocus hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_LosingFocus hresult(int64);" & _ ; In $iToken
		"add_NoFocusCandidateFound hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_NoFocusCandidateFound hresult(int64);" & _ ; In $iToken
		"StartBringIntoView hresult();" & _ ; 
		"StartBringIntoView2 hresult(ptr);" ; In $pOptions

Func IUIElement5_GetLights($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetKeyTipPlacementMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 8, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetKeyTipPlacementMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 9, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetKeyTipHorizontalOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetKeyTipHorizontalOffset($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetKeyTipVerticalOffset($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 12, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetKeyTipVerticalOffset($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 13, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetXYFocusKeyboardNavigation($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 14, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetXYFocusKeyboardNavigation($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 15, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetXYFocusUpNavigationStrategy($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 16, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetXYFocusUpNavigationStrategy($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 17, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetXYFocusDownNavigationStrategy($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 18, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetXYFocusDownNavigationStrategy($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 19, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetXYFocusLeftNavigationStrategy($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 20, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetXYFocusLeftNavigationStrategy($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 21, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetXYFocusRightNavigationStrategy($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 22, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetXYFocusRightNavigationStrategy($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 23, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetHighContrastAdjustment($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 24, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetHighContrastAdjustment($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 25, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_GetTabFocusNavigation($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 26, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_SetTabFocusNavigation($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 27, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_AddHdlrGettingFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 28, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_RemoveHdlrGettingFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 29, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_AddHdlrLosingFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 30, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_RemoveHdlrLosingFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 31, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_AddHdlrNoFocusCandidateFound($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 32, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_RemoveHdlrNoFocusCandidateFound($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 33, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement5_StartBringIntoView($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 34)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement5_StartBringIntoView2($pThis, $pOptions)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 35)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pOptions And IsInt($pOptions) Then $pOptions = Ptr($pOptions)
	If $pOptions And (Not IsPtr($pOptions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pOptions)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
