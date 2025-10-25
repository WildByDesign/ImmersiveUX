# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Hosting.IWindowsXamlManagerStatics
# Incl. In  : Windows.UI.Xaml.Hosting.WindowsXamlManager

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IWindowsXamlManagerStatics = "{28258A12-7D82-505B-B210-712B04A58882}"
$__g_mIIDs[$sIID_IWindowsXamlManagerStatics] = "IWindowsXamlManagerStatics"

Global Const $tagIWindowsXamlManagerStatics = $tagIInspectable & _
		"InitializeForCurrentThread hresult(ptr*);" ; Out $pResult

Func IWindowsXamlManagerStatics_InitializeForCurrentThread($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc
