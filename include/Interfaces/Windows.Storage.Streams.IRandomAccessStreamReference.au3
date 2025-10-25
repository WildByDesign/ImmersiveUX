# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 06 November 2024
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Storage.Streams.IRandomAccessStreamReference
# Incl. In  : Windows.Services.TargetedContent.TargetedContentFile

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IRandomAccessStreamReference = "{33EE3134-1DD6-4E3A-8067-D1C162E8642B}"
$__g_mIIDs[$sIID_IRandomAccessStreamReference] = "IRandomAccessStreamReference"

Global Const $tagIRandomAccessStreamReference = $tagIInspectable & _
		"OpenReadAsync hresult(ptr*);" ; Out $pOperation

Func IRandomAccessStreamReference_OpenReadAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc
