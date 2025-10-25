# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Composition.ICompositionSupportsSystemBackdrop

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_ICompositionSupportsSystemBackdrop = "{397DAFE4-B6C2-5BB9-951D-F5707DE8B7BC}"
$__g_mIIDs[$sIID_ICompositionSupportsSystemBackdrop] = "ICompositionSupportsSystemBackdrop"

Global Const $tagICompositionSupportsSystemBackdrop = $tagIInspectable & _
		"get_SystemBackdrop hresult(ptr*);" & _ ; Out $pValue
		"put_SystemBackdrop hresult(ptr);" ; In $pValue

Func ICompositionSupportsSystemBackdrop_GetSystemBackdrop($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 0)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func ICompositionSupportsSystemBackdrop_SetSystemBackdrop($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 1, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
