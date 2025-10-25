#include-once
#include "..\WinRTCore.au3"
#include "IDesktopWindowXamlSourceNative.au3"

Global Const $sIID_IDesktopWindowXamlSourceNative2 = "{e3dcd8c7-3057-4692-99c3-7b7720afda31}"
$__g_mIIDs[$sIID_IDesktopWindowXamlSourceNative2] = "IDesktopWindowXamlSourceNative2"

Func IDesktopWindowXamlSourceNative2_PreTranslateMessage($pThis, $tMessage)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 6)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tMessage) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tMessage, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

