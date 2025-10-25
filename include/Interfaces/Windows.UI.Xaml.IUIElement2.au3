# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElement2
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElement2 = "{676D0BF9-B66C-41D6-BA50-58CF87F201D1}"
$__g_mIIDs[$sIID_IUIElement2] = "IUIElement2"

Global Const $tagIUIElement2 = $tagIInspectable & _
		"get_CompositeMode hresult(ulong*);" & _ ; Out $iValue
		"put_CompositeMode hresult(ulong);" & _ ; In $iValue
		"CancelDirectManipulations hresult(bool*);" ; Out $bResult

Func IUIElement2_GetCompositeMode($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 7, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement2_SetCompositeMode($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 8, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement2_CancelDirectManipulations($pThis)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc
