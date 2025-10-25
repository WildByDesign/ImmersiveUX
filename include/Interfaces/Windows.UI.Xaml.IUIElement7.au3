# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElement7
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElement7 = "{CAFC4968-6369-4249-80F9-3D656319E811}"
$__g_mIIDs[$sIID_IUIElement7] = "IUIElement7"

Global Const $tagIUIElement7 = $tagIInspectable & _
		"get_KeyboardAccelerators hresult(ptr*);" & _ ; Out $pValue
		"add_CharacterReceived hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_CharacterReceived hresult(int64);" & _ ; In $iToken
		"add_ProcessKeyboardAccelerators hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ProcessKeyboardAccelerators hresult(int64);" & _ ; In $iToken
		"add_PreviewKeyDown hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PreviewKeyDown hresult(int64);" & _ ; In $iToken
		"add_PreviewKeyUp hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_PreviewKeyUp hresult(int64);" & _ ; In $iToken
		"TryInvokeKeyboardAccelerator hresult(ptr);" ; In $pArgs

Func IUIElement7_GetKeyboardAccelerators($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_AddHdlrCharacterReceived($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 8, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_RemoveHdlrCharacterReceived($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 9, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_AddHdlrProcessKeyboardAccelerators($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 10, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_RemoveHdlrProcessKeyboardAccelerators($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 11, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_AddHdlrPreviewKeyDown($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 12, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_RemoveHdlrPreviewKeyDown($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 13, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_AddHdlrPreviewKeyUp($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 14, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_RemoveHdlrPreviewKeyUp($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 15, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement7_TryInvokeKeyboardAccelerator($pThis, $pArgs)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pArgs And IsInt($pArgs) Then $pArgs = Ptr($pArgs)
	If $pArgs And (Not IsPtr($pArgs)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pArgs)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
