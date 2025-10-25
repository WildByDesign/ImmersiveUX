# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSourceStatics2
# Incl. In  : Windows.Media.Core.MediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSourceStatics2 = "{EEE161A4-7F13-4896-B8CB-DF0DE5BCB9F1}"
$__g_mIIDs[$sIID_IMediaSourceStatics2] = "IMediaSourceStatics2"

Global Const $tagIMediaSourceStatics2 = $tagIInspectable & _
		"CreateFromMediaBinder hresult(ptr; ptr*);" ; In $pBinder, Out $pResult

Func IMediaSourceStatics2_CreateFromMediaBinder($pThis, $pBinder)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBinder And IsInt($pBinder) Then $pBinder = Ptr($pBinder)
	If $pBinder And (Not IsPtr($pBinder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBinder, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
