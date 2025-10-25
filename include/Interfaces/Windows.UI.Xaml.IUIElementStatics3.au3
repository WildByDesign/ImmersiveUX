# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementStatics3
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementStatics3 = "{D1F87ADE-ECA1-4561-A32B-64601B4E0597}"
$__g_mIIDs[$sIID_IUIElementStatics3] = "IUIElementStatics3"

Global Const $tagIUIElementStatics3 = $tagIInspectable & _
		"get_Transform3DProperty hresult(ptr*);" & _ ; Out $pValue
		"get_CanDragProperty hresult(ptr*);" & _ ; Out $pValue
		"TryStartDirectManipulation hresult(ptr; bool*);" ; In $pValue, Out $bResult

Func IUIElementStatics3_GetTransform3DProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics3_GetCanDragProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics3_TryStartDirectManipulation($pThis, $pValue)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
