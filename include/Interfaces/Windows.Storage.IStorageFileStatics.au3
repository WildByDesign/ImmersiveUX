# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 06 November 2024
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Storage.IStorageFileStatics
# Incl. In  : Windows.Storage.StorageFile

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IStorageFileStatics = "{5984C710-DAF2-43C8-8BB4-A4D3EACFD03F}"
$__g_mIIDs[$sIID_IStorageFileStatics] = "IStorageFileStatics"

Global Const $tagIStorageFileStatics = $tagIInspectable & _
		"GetFileFromPathAsync hresult(handle; ptr*);" & _ ; In $hPath, Out $pOperation
		"GetFileFromApplicationUriAsync hresult(ptr; ptr*);" & _ ; In $pUri, Out $pOperation
		"CreateStreamedFileAsync hresult(handle; ptr; ptr; ptr*);" & _ ; In $hDisplayNameWithExtension, In $pDataRequested, In $pThumbnail, Out $pOperation
		"ReplaceWithStreamedFileAsync hresult(ptr; ptr; ptr; ptr*);" & _ ; In $pFileToReplace, In $pDataRequested, In $pThumbnail, Out $pOperation
		"CreateStreamedFileFromUriAsync hresult(handle; ptr; ptr; ptr*);" & _ ; In $hDisplayNameWithExtension, In $pUri, In $pThumbnail, Out $pOperation
		"ReplaceWithStreamedFileFromUriAsync hresult(ptr; ptr; ptr; ptr*);" ; In $pFileToReplace, In $pUri, In $pThumbnail, Out $pOperation

Func IStorageFileStatics_GetFileFromPathAsync($pThis, $sPath)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sPath) And (Not IsString($sPath)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hPath = _WinRT_CreateHString($sPath)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hPath, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hPath)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IStorageFileStatics_GetFileFromApplicationUriAsync($pThis, $pUri)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pUri, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IStorageFileStatics_CreateStreamedFileAsync($pThis, $sDisplayNameWithExtension, $pDataRequested, $pThumbnail)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sDisplayNameWithExtension) And (Not IsString($sDisplayNameWithExtension)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDisplayNameWithExtension = _WinRT_CreateHString($sDisplayNameWithExtension)
	If $pDataRequested And IsInt($pDataRequested) Then $pDataRequested = Ptr($pDataRequested)
	If $pDataRequested And (Not IsPtr($pDataRequested)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pThumbnail And IsInt($pThumbnail) Then $pThumbnail = Ptr($pThumbnail)
	If $pThumbnail And (Not IsPtr($pThumbnail)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hDisplayNameWithExtension, "ptr", $pDataRequested, "ptr", $pThumbnail, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDisplayNameWithExtension)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc

Func IStorageFileStatics_ReplaceWithStreamedFileAsync($pThis, $pFileToReplace, $pDataRequested, $pThumbnail)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFileToReplace And IsInt($pFileToReplace) Then $pFileToReplace = Ptr($pFileToReplace)
	If $pFileToReplace And (Not IsPtr($pFileToReplace)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pDataRequested And IsInt($pDataRequested) Then $pDataRequested = Ptr($pDataRequested)
	If $pDataRequested And (Not IsPtr($pDataRequested)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pThumbnail And IsInt($pThumbnail) Then $pThumbnail = Ptr($pThumbnail)
	If $pThumbnail And (Not IsPtr($pThumbnail)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFileToReplace, "ptr", $pDataRequested, "ptr", $pThumbnail, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc

Func IStorageFileStatics_CreateStreamedFileFromUriAsync($pThis, $sDisplayNameWithExtension, $pUri, $pThumbnail)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sDisplayNameWithExtension) And (Not IsString($sDisplayNameWithExtension)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDisplayNameWithExtension = _WinRT_CreateHString($sDisplayNameWithExtension)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pThumbnail And IsInt($pThumbnail) Then $pThumbnail = Ptr($pThumbnail)
	If $pThumbnail And (Not IsPtr($pThumbnail)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hDisplayNameWithExtension, "ptr", $pUri, "ptr", $pThumbnail, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDisplayNameWithExtension)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc

Func IStorageFileStatics_ReplaceWithStreamedFileFromUriAsync($pThis, $pFileToReplace, $pUri, $pThumbnail)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFileToReplace And IsInt($pFileToReplace) Then $pFileToReplace = Ptr($pFileToReplace)
	If $pFileToReplace And (Not IsPtr($pFileToReplace)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pThumbnail And IsInt($pThumbnail) Then $pThumbnail = Ptr($pThumbnail)
	If $pThumbnail And (Not IsPtr($pThumbnail)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFileToReplace, "ptr", $pUri, "ptr", $pThumbnail, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc
