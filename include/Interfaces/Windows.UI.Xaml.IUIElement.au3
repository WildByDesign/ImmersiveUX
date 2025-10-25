# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElement
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElement = "{676D0BE9-B65C-41C6-BA40-58CF87F201C1}"
$__g_mIIDs[$sIID_IUIElement] = "IUIElement"

Global Const $tagIUIElement = $tagIInspectable & _
		"get_DesiredSize hresult(struct*);" & _ ; Out $tValue
		"get_AllowDrop hresult(bool*);" & _ ; Out $bValue
		"put_AllowDrop hresult(bool);" & _ ; In $bValue
		"get_Opacity hresult(double*);" & _ ; Out $fValue
		"put_Opacity hresult(double);" & _ ; In $fValue
		"get_Clip hresult(ptr*);" & _ ; Out $pValue
		"put_Clip hresult(ptr);" & _ ; In $pValue
		"get_RenderTransform hresult(ptr*);" & _ ; Out $pValue
		"put_RenderTransform hresult(ptr);" & _ ; In $pValue
		"get_Projection hresult(ptr*);" & _ ; Out $pValue
		"put_Projection hresult(ptr);" & _ ; In $pValue
		"get_RenderTransformOrigin hresult(struct*);" & _ ; Out $tValue
		"put_RenderTransformOrigin hresult(struct);" & _ ; In $tValue
		"get_IsHitTestVisible hresult(bool*);" & _ ; Out $bValue
		"put_IsHitTestVisible hresult(bool);" & _ ; In $bValue
		"get_Visibility hresult(ulong*);" & _ ; Out $iValue
		"put_Visibility hresult(ulong);" & _ ; In $iValue
		"get_RenderSize hresult(struct*);" & _ ; Out $tValue
		"get_UseLayoutRounding hresult(bool*);" & _ ; Out $bValue
		"put_UseLayoutRounding hresult(bool);" & _ ; In $bValue
		"get_Transitions hresult(ptr*);" & _ ; Out $pValue
		"put_Transitions hresult(ptr);" & _ ; In $pValue
		"get_CacheMode hresult(ptr*);" & _ ; Out $pValue
		"put_CacheMode hresult(ptr);" & _ ; In $pValue
		"get_IsTapEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsTapEnabled hresult(bool);" & _ ; In $bValue
		"get_IsDoubleTapEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsDoubleTapEnabled hresult(bool);" & _ ; In $bValue
		"get_IsRightTapEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsRightTapEnabled hresult(bool);" & _ ; In $bValue
		"get_IsHoldingEnabled hresult(bool*);" & _ ; Out $bValue
		"put_IsHoldingEnabled hresult(bool);" & _ ; In $bValue
		"get_ManipulationMode hresult(ulong*);" & _ ; Out $iValue
		"put_ManipulationMode hresult(ulong);" & _ ; In $iValue
		"get_PointerCaptures hresult(ptr*);" & _ ; Out $pValue
		"add_KeyUp hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_KeyUp hresult(int64);" & _ ; In $iToken
		"add_KeyDown hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_KeyDown hresult(int64);" & _ ; In $iToken
		"add_GotFocus hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_GotFocus hresult(int64);" & _ ; In $iToken
		"add_LostFocus hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_LostFocus hresult(int64);" & _ ; In $iToken
		"add_DragEnter hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DragEnter hresult(int64);" & _ ; In $iToken
		"add_DragLeave hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DragLeave hresult(int64);" & _ ; In $iToken
		"add_DragOver hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DragOver hresult(int64);" & _ ; In $iToken
		"add_Drop hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_Drop hresult(int64);" & _ ; In $iToken
		"add_PointerPressed hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PointerPressed hresult(int64);" & _ ; In $iToken
		"add_PointerMoved hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PointerMoved hresult(int64);" & _ ; In $iToken
		"add_PointerReleased hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PointerReleased hresult(int64);" & _ ; In $iToken
		"add_PointerEntered hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PointerEntered hresult(int64);" & _ ; In $iToken
		"add_PointerExited hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PointerExited hresult(int64);" & _ ; In $iToken
		"add_PointerCaptureLost hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PointerCaptureLost hresult(int64);" & _ ; In $iToken
		"add_PointerCanceled hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PointerCanceled hresult(int64);" & _ ; In $iToken
		"add_PointerWheelChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PointerWheelChanged hresult(int64);" & _ ; In $iToken
		"add_Tapped hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_Tapped hresult(int64);" & _ ; In $iToken
		"add_DoubleTapped hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_DoubleTapped hresult(int64);" & _ ; In $iToken
		"add_Holding hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_Holding hresult(int64);" & _ ; In $iToken
		"add_RightTapped hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_RightTapped hresult(int64);" & _ ; In $iToken
		"add_ManipulationStarting hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ManipulationStarting hresult(int64);" & _ ; In $iToken
		"add_ManipulationInertiaStarting hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ManipulationInertiaStarting hresult(int64);" & _ ; In $iToken
		"add_ManipulationStarted hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ManipulationStarted hresult(int64);" & _ ; In $iToken
		"add_ManipulationDelta hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ManipulationDelta hresult(int64);" & _ ; In $iToken
		"add_ManipulationCompleted hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ManipulationCompleted hresult(int64);" & _ ; In $iToken
		"Measure hresult(struct);" & _ ; In $tAvailableSize
		"Arrange hresult(struct);" & _ ; In $tFinalRect
		"CapturePointer hresult(ptr; bool*);" & _ ; In $pValue, Out $bResult
		"ReleasePointerCapture hresult(ptr);" & _ ; In $pValue
		"ReleasePointerCaptures hresult();" & _ ; 
		"AddHandler hresult(ptr; ptr; bool);" & _ ; In $pRoutedEvent, In $pHandler, In $bHandledEventsToo
		"RemoveHandler hresult(ptr; ptr);" & _ ; In $pRoutedEvent, In $pHandler
		"TransformToVisual hresult(ptr; ptr*);" & _ ; In $pVisual, Out $pResult
		"InvalidateMeasure hresult();" & _ ; 
		"InvalidateArrange hresult();" & _ ; 
		"UpdateLayout hresult();" ; 

Func IUIElement_GetDesiredSize($pThis)
	Local $tagValue = "float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 7, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IUIElement_GetAllowDrop($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetAllowDrop($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 9, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetOpacity($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 10, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetOpacity($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 11, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetClip($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetClip($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 13, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetRenderTransform($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetRenderTransform($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 15, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetProjection($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetProjection($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 17, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetRenderTransformOrigin($pThis)
	Local $tagValue = "float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 18, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IUIElement_SetRenderTransformOrigin($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 19, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetIsHitTestVisible($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetIsHitTestVisible($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 21, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetVisibility($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 22, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetVisibility($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 23, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetRenderSize($pThis)
	Local $tagValue = "float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 24, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IUIElement_GetUseLayoutRounding($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetUseLayoutRounding($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 26, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetTransitions($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetTransitions($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 28, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetCacheMode($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetCacheMode($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 30, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetIsTapEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetIsTapEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 32, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetIsDoubleTapEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetIsDoubleTapEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 34, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetIsRightTapEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 35)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetIsRightTapEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 36, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetIsHoldingEnabled($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetIsHoldingEnabled($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 38, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetManipulationMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 39, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_SetManipulationMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 40, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_GetPointerCaptures($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 41)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrKeyUp($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 42, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrKeyUp($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 43, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrKeyDown($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 44, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrKeyDown($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 45, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrGotFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 46, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrGotFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 47, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrLostFocus($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 48, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrLostFocus($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 49, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrDragEnter($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 50, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrDragEnter($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 51, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrDragLeave($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 52, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrDragLeave($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 53, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrDragOver($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 54, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrDragOver($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 55, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrDrop($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 56, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrDrop($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 57, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrPointerPressed($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 58, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrPointerPressed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 59, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrPointerMoved($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 60, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrPointerMoved($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 61, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrPointerReleased($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 62, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrPointerReleased($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 63, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrPointerEntered($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 64, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrPointerEntered($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 65, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrPointerExited($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 66, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrPointerExited($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 67, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrPointerCaptureLost($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 68, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrPointerCaptureLost($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 69, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrPointerCanceled($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 70, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrPointerCanceled($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 71, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrPointerWheelChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 72, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrPointerWheelChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 73, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrTapped($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 74, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrTapped($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 75, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrDoubleTapped($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 76, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrDoubleTapped($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 77, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrHolding($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 78, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrHolding($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 79, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrRightTapped($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 80, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrRightTapped($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 81, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrManipulationStarting($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 82, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrManipulationStarting($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 83, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrManipulationInertiaStarting($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 84, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrManipulationInertiaStarting($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 85, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrManipulationStarted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 86, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrManipulationStarted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 87, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrManipulationDelta($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 88, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrManipulationDelta($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 89, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_AddHdlrManipulationCompleted($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 90, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_RemoveHdlrManipulationCompleted($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 91, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement_Measure($pThis, $tAvailableSize)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 92)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tAvailableSize) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct", $tAvailableSize)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement_Arrange($pThis, $tFinalRect)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 93)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tFinalRect) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct", $tFinalRect)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement_CapturePointer($pThis, $pValue)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 94)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IUIElement_ReleasePointerCapture($pThis, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 95)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement_ReleasePointerCaptures($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 96)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement_AddHandler($pThis, $pRoutedEvent, $pHandler, $bHandledEventsToo)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 97)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pRoutedEvent And IsInt($pRoutedEvent) Then $pRoutedEvent = Ptr($pRoutedEvent)
	If $pRoutedEvent And (Not IsPtr($pRoutedEvent)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pHandler And IsInt($pHandler) Then $pHandler = Ptr($pHandler)
	If $pHandler And (Not IsPtr($pHandler)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($bHandledEventsToo) And (Not IsBool($bHandledEventsToo)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pRoutedEvent, "ptr", $pHandler, "bool", $bHandledEventsToo)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement_RemoveHandler($pThis, $pRoutedEvent, $pHandler)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 98)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pRoutedEvent And IsInt($pRoutedEvent) Then $pRoutedEvent = Ptr($pRoutedEvent)
	If $pRoutedEvent And (Not IsPtr($pRoutedEvent)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pHandler And IsInt($pHandler) Then $pHandler = Ptr($pHandler)
	If $pHandler And (Not IsPtr($pHandler)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pRoutedEvent, "ptr", $pHandler)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement_TransformToVisual($pThis, $pVisual)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 99)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pVisual And IsInt($pVisual) Then $pVisual = Ptr($pVisual)
	If $pVisual And (Not IsPtr($pVisual)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pVisual, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IUIElement_InvalidateMeasure($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 100)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement_InvalidateArrange($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 101)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement_UpdateLayout($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 102)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
