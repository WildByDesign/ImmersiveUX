# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElement9
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElement9 = "{B4A04776-4E88-50CA-8F2B-08940D6C5F94}"
$__g_mIIDs[$sIID_IUIElement9] = "IUIElement9"

Global Const $tagIUIElement9 = $tagIInspectable & _
		"get_CanBeScrollAnchor hresult(bool*);" & _ ; Out $bValue
		"put_CanBeScrollAnchor hresult(bool);" & _ ; In $bValue
		"get_OpacityTransition hresult(ptr*);" & _ ; Out $pValue
		"put_OpacityTransition hresult(ptr);" & _ ; In $pValue
		"get_Translation hresult(struct*);" & _ ; Out $tValue
		"put_Translation hresult(struct);" & _ ; In $tValue
		"get_TranslationTransition hresult(ptr*);" & _ ; Out $pValue
		"put_TranslationTransition hresult(ptr);" & _ ; In $pValue
		"get_Rotation hresult(float*);" & _ ; Out $fValue
		"put_Rotation hresult(float);" & _ ; In $fValue
		"get_RotationTransition hresult(ptr*);" & _ ; Out $pValue
		"put_RotationTransition hresult(ptr);" & _ ; In $pValue
		"get_Scale hresult(struct*);" & _ ; Out $tValue
		"put_Scale hresult(struct);" & _ ; In $tValue
		"get_ScaleTransition hresult(ptr*);" & _ ; Out $pValue
		"put_ScaleTransition hresult(ptr);" & _ ; In $pValue
		"get_TransformMatrix hresult(struct*);" & _ ; Out $tValue
		"put_TransformMatrix hresult(struct);" & _ ; In $tValue
		"get_CenterPoint hresult(struct*);" & _ ; Out $tValue
		"put_CenterPoint hresult(struct);" & _ ; In $tValue
		"get_RotationAxis hresult(struct*);" & _ ; Out $tValue
		"put_RotationAxis hresult(struct);" & _ ; In $tValue
		"StartAnimation hresult(ptr);" & _ ; In $pAnimation
		"StopAnimation hresult(ptr);" ; In $pAnimation

Func IUIElement9_GetCanBeScrollAnchor($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_SetCanBeScrollAnchor($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetOpacityTransition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_SetOpacityTransition($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetTranslation($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 11, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IUIElement9_SetTranslation($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 12, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetTranslationTransition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_SetTranslationTransition($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetRotation($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "float")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_SetRotation($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 16, "float", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetRotationTransition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 17)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_SetRotationTransition($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 18, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetScale($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 19, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IUIElement9_SetScale($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 20, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetScaleTransition($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 21)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_SetScaleTransition($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 22, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetTransformMatrix($pThis)
	Local $tagValue = "float;float;float;float;float;float;float;float;float;float;float;float;float;float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 23, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IUIElement9_SetTransformMatrix($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 24, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetCenterPoint($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 25, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IUIElement9_SetCenterPoint($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 26, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_GetRotationAxis($pThis)
	Local $tagValue = "float;float;float;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 27, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IUIElement9_SetRotationAxis($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 28, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement9_StartAnimation($pThis, $pAnimation)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 29)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pAnimation And IsInt($pAnimation) Then $pAnimation = Ptr($pAnimation)
	If $pAnimation And (Not IsPtr($pAnimation)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pAnimation)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IUIElement9_StopAnimation($pThis, $pAnimation)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 30)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pAnimation And IsInt($pAnimation) Then $pAnimation = Ptr($pAnimation)
	If $pAnimation And (Not IsPtr($pAnimation)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pAnimation)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
