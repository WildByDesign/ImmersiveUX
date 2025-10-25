# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementStatics
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementStatics = "{58D3573B-F52C-45BE-988B-A5869564873C}"
$__g_mIIDs[$sIID_IUIElementStatics] = "IUIElementStatics"

Global Const $tagIUIElementStatics = $tagIInspectable & _
		"get_KeyDownEvent hresult(ptr*);" & _ ; Out $pValue
		"get_KeyUpEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PointerEnteredEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PointerPressedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PointerMovedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PointerReleasedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PointerExitedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PointerCaptureLostEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PointerCanceledEvent hresult(ptr*);" & _ ; Out $pValue
		"get_PointerWheelChangedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_TappedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_DoubleTappedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_HoldingEvent hresult(ptr*);" & _ ; Out $pValue
		"get_RightTappedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_ManipulationStartingEvent hresult(ptr*);" & _ ; Out $pValue
		"get_ManipulationInertiaStartingEvent hresult(ptr*);" & _ ; Out $pValue
		"get_ManipulationStartedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_ManipulationDeltaEvent hresult(ptr*);" & _ ; Out $pValue
		"get_ManipulationCompletedEvent hresult(ptr*);" & _ ; Out $pValue
		"get_DragEnterEvent hresult(ptr*);" & _ ; Out $pValue
		"get_DragLeaveEvent hresult(ptr*);" & _ ; Out $pValue
		"get_DragOverEvent hresult(ptr*);" & _ ; Out $pValue
		"get_DropEvent hresult(ptr*);" & _ ; Out $pValue
		"get_AllowDropProperty hresult(ptr*);" & _ ; Out $pValue
		"get_OpacityProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ClipProperty hresult(ptr*);" & _ ; Out $pValue
		"get_RenderTransformProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ProjectionProperty hresult(ptr*);" & _ ; Out $pValue
		"get_RenderTransformOriginProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsHitTestVisibleProperty hresult(ptr*);" & _ ; Out $pValue
		"get_VisibilityProperty hresult(ptr*);" & _ ; Out $pValue
		"get_UseLayoutRoundingProperty hresult(ptr*);" & _ ; Out $pValue
		"get_TransitionsProperty hresult(ptr*);" & _ ; Out $pValue
		"get_CacheModeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsTapEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsDoubleTapEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsRightTapEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_IsHoldingEnabledProperty hresult(ptr*);" & _ ; Out $pValue
		"get_ManipulationModeProperty hresult(ptr*);" & _ ; Out $pValue
		"get_PointerCapturesProperty hresult(ptr*);" ; Out $pValue

Func IUIElementStatics_GetKeyDownEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetKeyUpEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerEnteredEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerPressedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerMovedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerReleasedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerExitedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerCaptureLostEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 14)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerCanceledEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerWheelChangedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 16)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetTappedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetDoubleTappedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 18)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetHoldingEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 19)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetRightTappedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 20)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetManipulationStartingEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetManipulationInertiaStartingEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 22)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetManipulationStartedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 23)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetManipulationDeltaEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 24)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetManipulationCompletedEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 25)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetDragEnterEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 26)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetDragLeaveEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 27)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetDragOverEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 28)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetDropEvent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 29)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetAllowDropProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 30)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetOpacityProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 31)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetClipProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 32)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetRenderTransformProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 33)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetProjectionProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 34)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetRenderTransformOriginProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 35)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetIsHitTestVisibleProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 36)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetVisibilityProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetUseLayoutRoundingProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 38)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetTransitionsProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetCacheModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 40)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetIsTapEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 41)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetIsDoubleTapEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 42)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetIsRightTapEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 43)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetIsHoldingEnabledProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 44)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetManipulationModeProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 45)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElementStatics_GetPointerCapturesProperty($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 46)
	Return SetError(@error, @extended, $vValue)
EndFunc
