# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.Controls.IMediaPlayerElementFactory
# Incl. In  : Windows.UI.Xaml.Controls.MediaPlayerElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerElementFactory = "{77E525C3-EB17-4B8D-889D-1EA8ABDBD4EF}"
$__g_mIIDs[$sIID_IMediaPlayerElementFactory] = "IMediaPlayerElementFactory"

Global Const $tagIMediaPlayerElementFactory = $tagIInspectable & _
		"CreateInstance hresult(ptr; ptr*; ptr*);" ; In $pBaseInterface, Out $pInnerInterface, Out $pValue

Func IMediaPlayerElementFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
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
