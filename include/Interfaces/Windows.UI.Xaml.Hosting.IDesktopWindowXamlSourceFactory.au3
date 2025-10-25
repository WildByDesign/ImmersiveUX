# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Hosting.IDesktopWindowXamlSourceFactory
# Incl. In  : Windows.UI.Xaml.Hosting.DesktopWindowXamlSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IDesktopWindowXamlSourceFactory = "{5CD61DC0-2561-56E1-8E75-6E44173805E3}"
$__g_mIIDs[$sIID_IDesktopWindowXamlSourceFactory] = "IDesktopWindowXamlSourceFactory"

Global Const $tagIDesktopWindowXamlSourceFactory = $tagIInspectable & _
		"CreateInstance hresult(ptr; ptr*; ptr*);" ; In $pBaseInterface, Out $pInnerInterface, Out $pValue

Func IDesktopWindowXamlSourceFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc
