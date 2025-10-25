# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 06 November 2024
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Storage.IStorageItemProperties2
# Incl. In  : Windows.Storage.StorageFile

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IStorageItemProperties2 = "{8E86A951-04B9-4BD2-929D-FEF3F71621D0}"
$__g_mIIDs[$sIID_IStorageItemProperties2] = "IStorageItemProperties2"

Global Const $tagIStorageItemProperties2 = $tagIInspectable & _
		"GetScaledImageAsThumbnailAsync hresult(ulong; ptr*);" & _ ; In $iMode, Out $pOperation
		"GetScaledImageAsThumbnailAsync2 hresult(ulong; ulong; ptr*);" & _ ; In $iMode, In $iRequestedSize, Out $pOperation
		"GetScaledImageAsThumbnailAsync3 hresult(ulong; ulong; ulong; ptr*);" ; In $iMode, In $iRequestedSize, In $iOptions, Out $pOperation

Func IStorageItemProperties2_GetScaledImageAsThumbnailAsync($pThis, $iMode)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IStorageItemProperties2_GetScaledImageAsThumbnailAsync2($pThis, $iMode, $iRequestedSize)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iRequestedSize) And (Not IsInt($iRequestedSize)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ulong", $iRequestedSize, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IStorageItemProperties2_GetScaledImageAsThumbnailAsync3($pThis, $iMode, $iRequestedSize, $iOptions)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iMode) And (Not IsInt($iMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iRequestedSize) And (Not IsInt($iRequestedSize)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iOptions) And (Not IsInt($iOptions)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMode, "ulong", $iRequestedSize, "ulong", $iOptions, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc
