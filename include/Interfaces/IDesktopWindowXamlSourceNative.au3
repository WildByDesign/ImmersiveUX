#include-once
#include "..\WinRTCore.au3"
#include "IUnknown.au3"

Global Const $sIID_IDesktopWindowXamlSourceNative = "{3CBCF1BF-2F76-4E9C-96AB-E84B37972554}"
$__g_mIIDs[$sIID_IDesktopWindowXamlSourceNative] = "IDesktopWindowXamlSourceNative"

Func IDesktopWindowXamlSourceNative_AttachToWindow($pThis, $hParentWnd)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $hParentWnd And (Not IsHWnd($hParentWnd)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "hwnd", $hParentWnd)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc

Func IDesktopWindowXamlSourceNative_GetWindowHandle($pThis)
	Local $vFailVal = HWnd(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 5)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "hwnd*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError(@error, @extended, $aCall[2])
EndFunc