# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IBackgroundMediaPlayerStatics
# Incl. In  : Windows.Media.Playback.BackgroundMediaPlayer

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IBackgroundMediaPlayerStatics = "{856DDBC1-55F7-471F-A0F2-68AC4C904592}"
$__g_mIIDs[$sIID_IBackgroundMediaPlayerStatics] = "IBackgroundMediaPlayerStatics"

Global Const $tagIBackgroundMediaPlayerStatics = $tagIInspectable & _
		"get_Current hresult(ptr*);" & _ ; Out $pPlayer
		"add_MessageReceivedFromBackground hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_MessageReceivedFromBackground hresult(int64);" & _ ; In $iToken
		"add_MessageReceivedFromForeground hresult(ptr; int64*);" & _ ; In $pValue, Out $iToken
		"remove_MessageReceivedFromForeground hresult(int64);" & _ ; In $iToken
		"SendMessageToBackground hresult(ptr);" & _ ; In $pValue
		"SendMessageToForeground hresult(ptr);" & _ ; In $pValue
		"IsMediaPlaying hresult(bool*);" & _ ; Out $bIsMediaPlaying
		"Shutdown hresult();" ; 

Func IBackgroundMediaPlayerStatics_GetCurrent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IBackgroundMediaPlayerStatics_AddHdlrMessageReceivedFromBackground($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IBackgroundMediaPlayerStatics_RemoveHdlrMessageReceivedFromBackground($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 9, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IBackgroundMediaPlayerStatics_AddHdlrMessageReceivedFromForeground($pThis, $pValue)
	Local $vValue = __WinRT_AddHandler($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IBackgroundMediaPlayerStatics_RemoveHdlrMessageReceivedFromForeground($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 11, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IBackgroundMediaPlayerStatics_SendMessageToBackground($pThis, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IBackgroundMediaPlayerStatics_SendMessageToForeground($pThis, $pValue)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pValue And IsInt($pValue) Then $pValue = Ptr($pValue)
	If $pValue And (Not IsPtr($pValue)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pValue)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc

Func IBackgroundMediaPlayerStatics_IsMediaPlaying($pThis)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc

Func IBackgroundMediaPlayerStatics_Shutdown($pThis)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
