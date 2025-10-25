# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElement3
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElement3 = "{BC2B28F1-26F2-4AAB-B256-3B5350881E37}"
$__g_mIIDs[$sIID_IUIElement3] = "IUIElement3"

Global Const $tagIUIElement3 = $tagIInspectable & _
		"get_Transform3D hresult(ptr*);" & _ ; Out $pValue
		"put_Transform3D hresult(ptr);" & _ ; In $pValue
		"get_CanDrag hresult(bool*);" & _ ; Out $bValue
		"put_CanDrag hresult(bool);" & _ ; In $bValue
		"add_DragStarting hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DragStarting hresult(int64);" & _ ; In $iToken
		"add_DropCompleted hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DropCompleted hresult(int64);" & _ ; In $iToken
		"StartDragAsync hresult(ptr; ptr*);" ; In $pPointerPoint, Out $pOperation

Func IUIElement3_GetTransform3D($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement3_SetTransform3D($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement3_GetCanDrag($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement3_SetCanDrag($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement3_AddHdlrDragStarting($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 11, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement3_RemoveHdlrDragStarting($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 12, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement3_AddHdlrDropCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 13, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement3_RemoveHdlrDropCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 14, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement3_StartDragAsync($pThis, $pPointerPoint)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pPointerPoint And IsInt($pPointerPoint) Then $pPointerPoint = Ptr($pPointerPoint)
	If $pPointerPoint And (Not IsPtr($pPointerPoint)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pPointerPoint, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
