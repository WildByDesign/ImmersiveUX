# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSourceStatics3
# Incl. In  : Windows.Media.Core.MediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSourceStatics3 = "{453A30D6-2BEA-4122-9F73-EACE04526E35}"
$__g_mIIDs[$sIID_IMediaSourceStatics3] = "IMediaSourceStatics3"

Global Const $tagIMediaSourceStatics3 = $tagIInspectable & _
		"CreateFromMediaFrameSource hresult(ptr; ptr*);" ; In $pFrameSource, Out $pResult

Func IMediaSourceStatics3_CreateFromMediaFrameSource($pThis, $pFrameSource)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFrameSource And IsInt($pFrameSource) Then $pFrameSource = Ptr($pFrameSource)
	If $pFrameSource And (Not IsPtr($pFrameSource)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFrameSource, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
