# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceAdvancedSettings
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceAdvancedSettings

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceAdvancedSettings = "{55DB1680-1AEB-47DC-AA08-9A11610BA45A}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceAdvancedSettings] = "IAdaptiveMediaSourceAdvancedSettings"

Global Const $tagIAdaptiveMediaSourceAdvancedSettings = $tagIInspectable & _
		"get_AllSegmentsIndependent hresult(bool*);" & _ ; Out $bValue
		"put_AllSegmentsIndependent hresult(bool);" & _ ; In $bValue
		"get_DesiredBitrateHeadroomRatio hresult(ptr*);" & _ ; Out $pValue
		"put_DesiredBitrateHeadroomRatio hresult(ptr);" & _ ; In $pValue
		"get_BitrateDowngradeTriggerRatio hresult(ptr*);" & _ ; Out $pValue
		"put_BitrateDowngradeTriggerRatio hresult(ptr);" ; In $pValue

Func IAdaptiveMediaSourceAdvancedSettings_GetAllSegmentsIndependent($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceAdvancedSettings_SetAllSegmentsIndependent($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 8, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceAdvancedSettings_GetDesiredBitrateHeadroomRatio($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceAdvancedSettings_SetDesiredBitrateHeadroomRatio($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 10, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceAdvancedSettings_GetBitrateDowngradeTriggerRatio($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IAdaptiveMediaSourceAdvancedSettings_SetBitrateDowngradeTriggerRatio($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 12, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc
