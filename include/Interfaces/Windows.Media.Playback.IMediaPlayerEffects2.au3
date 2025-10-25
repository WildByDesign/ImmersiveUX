# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Playback.IMediaPlayerEffects2
# Incl. In  : Windows.Media.Playback.MediaPlayer

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IMediaPlayerEffects2 = "{FA419A79-1BBE-46C5-AE1F-8EE69FB3C2C7}"
$__g_mIIDs[$sIID_IMediaPlayerEffects2] = "IMediaPlayerEffects2"

Global Const $tagIMediaPlayerEffects2 = $tagIInspectable & _
		"AddVideoEffect hresult(handle; bool; ptr);" ; In $hActivatableClassId, In $bEffectOptional, In $pEffectConfiguration

Func IMediaPlayerEffects2_AddVideoEffect($pThis, $sActivatableClassId, $bEffectOptional, $pEffectConfiguration)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sActivatableClassId) And (Not IsString($sActivatableClassId)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hActivatableClassId = _WinRT_CreateHString($sActivatableClassId)
	If ($bEffectOptional) And (Not IsBool($bEffectOptional)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pEffectConfiguration And IsInt($pEffectConfiguration) Then $pEffectConfiguration = Ptr($pEffectConfiguration)
	If $pEffectConfiguration And (Not IsPtr($pEffectConfiguration)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hActivatableClassId, "bool", $bEffectOptional, "ptr", $pEffectConfiguration)
	Local $iError = @error
	_WinRT_DeleteHString($hActivatableClassId)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
