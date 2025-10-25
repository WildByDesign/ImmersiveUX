# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSourceAppServiceConnection
# Incl. In  : Windows.Media.Core.MediaSourceAppServiceConnection

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSourceAppServiceConnection = "{61E1EA97-1916-4810-B7F4-B642BE829596}"
$__g_mIIDs[$sIID_IMediaSourceAppServiceConnection] = "IMediaSourceAppServiceConnection"

Global Const $tagIMediaSourceAppServiceConnection = $tagIInspectable & _
		"add_InitializeMediaStreamSourceRequested hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_InitializeMediaStreamSourceRequested hresult(int64);" & _ ; In $iToken
		"Start hresult();" ; 

Func IMediaSourceAppServiceConnection_AddHdlrInitializeMediaStreamSourceRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 7, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAppServiceConnection_RemoveHdlrInitializeMediaStreamSourceRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 8, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IMediaSourceAppServiceConnection_Start($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
