# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElementOverrides7
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElementOverrides7 = "{B97F7F68-C29B-4C99-A1C3-952619D6E720}"
$__g_mIIDs[$sIID_IUIElementOverrides7] = "IUIElementOverrides7"

Global Const $tagIUIElementOverrides7 = $tagIInspectable & _
		"GetChildrenInTabFocusOrder hresult(ptr*);" & _ ; Out $pResult
		"OnProcessKeyboardAccelerators hresult(ptr);" ; In $pArgs

Func IUIElementOverrides7_GetChildrenInTabFocusOrder($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc

Func IUIElementOverrides7_OnProcessKeyboardAccelerators($pThis, $pArgs)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pArgs And IsInt($pArgs) Then $pArgs = Ptr($pArgs)
	If $pArgs And (Not IsPtr($pArgs)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pArgs)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
