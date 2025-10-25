# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Core.IMediaSourceAppServiceConnectionFactory
# Incl. In  : Windows.Media.Core.MediaSourceAppServiceConnection

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaSourceAppServiceConnectionFactory = "{65B912EB-80B9-44F9-9C1E-E120F6D92838}"
$__g_mIIDs[$sIID_IMediaSourceAppServiceConnectionFactory] = "IMediaSourceAppServiceConnectionFactory"

Global Const $tagIMediaSourceAppServiceConnectionFactory = $tagIInspectable & _
		"Create hresult(ptr; ptr*);" ; In $pAppServiceConnection, Out $pResult

Func IMediaSourceAppServiceConnectionFactory_Create($pThis, $pAppServiceConnection)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pAppServiceConnection And IsInt($pAppServiceConnection) Then $pAppServiceConnection = Ptr($pAppServiceConnection)
	If $pAppServiceConnection And (Not IsPtr($pAppServiceConnection)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pAppServiceConnection, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
