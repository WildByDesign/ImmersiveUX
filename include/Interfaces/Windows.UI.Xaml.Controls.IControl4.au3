# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IControl4
# Incl. In  : Windows.UI.Xaml.Controls.Control

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IControl4 = "{0E18AEEE-5F2E-44EA-8513-D3875C0A7513}"
$__g_mIIDs[$sIID_IControl4] = "IControl4"

Global Const $tagIControl4 = $tagIInspectable & _
		"get_IsFocusEngagementEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsFocusEngagementEnabled hresult(bool);" & _ ; In $bValue
		"get_IsFocusEngaged hresult(bool*);" & _ ; Out $bValue
		"put_IsFocusEngaged hresult(bool);" & _ ; In $bValue
		"get_RequiresPointer hresult(ulong*);" & _ ; Out $iValue
		"put_RequiresPointer hresult(ulong);" & _ ; In $iValue
		"get_XYFocusLeft hresult(ptr*);" & _ ; Out $pValue
		"put_XYFocusLeft hresult(ptr);" & _ ; In $pValue
		"get_XYFocusRight hresult(ptr*);" & _ ; Out $pValue
		"put_XYFocusRight hresult(ptr);" & _ ; In $pValue
		"get_XYFocusUp hresult(ptr*);" & _ ; Out $pValue
		"put_XYFocusUp hresult(ptr);" & _ ; In $pValue
		"get_XYFocusDown hresult(ptr*);" & _ ; Out $pValue
		"put_XYFocusDown hresult(ptr);" & _ ; In $pValue
		"get_ElementSoundMode hresult(ulong*);" & _ ; Out $iValue
		"put_ElementSoundMode hresult(ulong);" & _ ; In $iValue
		"add_FocusEngaged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_FocusEngaged hresult(int64);" & _ ; In $iToken
		"add_FocusDisengaged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_FocusDisengaged hresult(int64);" & _ ; In $iToken
		"RemoveFocusEngagement hresult();" ; 

Func IControl4_GetIsFocusEngagementEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_SetIsFocusEngagementEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_GetIsFocusEngaged($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_SetIsFocusEngaged($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_GetRequiresPointer($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 11, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_SetRequiresPointer($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 12, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_GetXYFocusLeft($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_SetXYFocusLeft($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_GetXYFocusRight($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_SetXYFocusRight($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 16, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_GetXYFocusUp($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_SetXYFocusUp($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 18, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_GetXYFocusDown($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_SetXYFocusDown($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 20, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_GetElementSoundMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 21, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_SetElementSoundMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 22, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_AddHdlrFocusEngaged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 23, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_RemoveHdlrFocusEngaged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 24, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_AddHdlrFocusDisengaged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 25, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_RemoveHdlrFocusDisengaged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 26, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IControl4_RemoveFocusEngagement($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 27)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
