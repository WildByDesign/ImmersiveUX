# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 06 November 2024
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Storage.IStorageFile
# Incl. In  : Windows.Storage.BulkAccess.FileInformation

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IStorageFile = "{FA3F6186-4214-428C-A64C-14C9AC7315EA}"
$__g_mIIDs[$sIID_IStorageFile] = "IStorageFile"

Global Const $tagIStorageFile = $tagIInspectable & _
		"get_FileType hresult(handle*);" & _ ; Out $hValue
		"get_ContentType hresult(handle*);" & _ ; Out $hValue
		"OpenAsync hresult(ulong; ptr*);" & _ ; In $iAccessMode, Out $pOperation
		"OpenTransactedWriteAsync hresult(ptr*);" & _ ; Out $pOperation
		"CopyAsync hresult(ptr; ptr*);" & _ ; In $pDestinationFolder, Out $pOperation
		"CopyAsync2 hresult(ptr; handle; ptr*);" & _ ; In $pDestinationFolder, In $hDesiredNewName, Out $pOperation
		"CopyAsync3 hresult(ptr; handle; ulong; ptr*);" & _ ; In $pDestinationFolder, In $hDesiredNewName, In $iOption, Out $pOperation
		"CopyAndReplaceAsync hresult(ptr; ptr*);" & _ ; In $pFileToReplace, Out $pOperation
		"MoveAsync hresult(ptr; ptr*);" & _ ; In $pDestinationFolder, Out $pOperation
		"MoveAsync2 hresult(ptr; handle; ptr*);" & _ ; In $pDestinationFolder, In $hDesiredNewName, Out $pOperation
		"MoveAsync3 hresult(ptr; handle; ulong; ptr*);" & _ ; In $pDestinationFolder, In $hDesiredNewName, In $iOption, Out $pOperation
		"MoveAndReplaceAsync hresult(ptr; ptr*);" ; In $pFileToReplace, Out $pOperation

Func IStorageFile_GetFileType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IStorageFile_GetContentType($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IStorageFile_OpenAsync($pThis, $iAccessMode)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($iAccessMode) And (Not IsInt($iAccessMode)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iAccessMode, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IStorageFile_OpenTransactedWriteAsync($pThis)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc

Func IStorageFile_CopyAsync($pThis, $pDestinationFolder)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IStorageFile_CopyAsync2($pThis, $pDestinationFolder, $sDesiredNewName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sDesiredNewName) And (Not IsString($sDesiredNewName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredNewName = _WinRT_CreateHString($sDesiredNewName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "handle", $hDesiredNewName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredNewName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IStorageFile_CopyAsync3($pThis, $pDestinationFolder, $sDesiredNewName, $iOption)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sDesiredNewName) And (Not IsString($sDesiredNewName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredNewName = _WinRT_CreateHString($sDesiredNewName)
	If ($iOption) And (Not IsInt($iOption)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "handle", $hDesiredNewName, "ulong", $iOption, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredNewName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc

Func IStorageFile_CopyAndReplaceAsync($pThis, $pFileToReplace)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFileToReplace And IsInt($pFileToReplace) Then $pFileToReplace = Ptr($pFileToReplace)
	If $pFileToReplace And (Not IsPtr($pFileToReplace)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFileToReplace, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IStorageFile_MoveAsync($pThis, $pDestinationFolder)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IStorageFile_MoveAsync2($pThis, $pDestinationFolder, $sDesiredNewName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sDesiredNewName) And (Not IsString($sDesiredNewName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredNewName = _WinRT_CreateHString($sDesiredNewName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "handle", $hDesiredNewName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredNewName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IStorageFile_MoveAsync3($pThis, $pDestinationFolder, $sDesiredNewName, $iOption)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 17)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDestinationFolder And IsInt($pDestinationFolder) Then $pDestinationFolder = Ptr($pDestinationFolder)
	If $pDestinationFolder And (Not IsPtr($pDestinationFolder)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sDesiredNewName) And (Not IsString($sDesiredNewName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hDesiredNewName = _WinRT_CreateHString($sDesiredNewName)
	If ($iOption) And (Not IsInt($iOption)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDestinationFolder, "handle", $hDesiredNewName, "ulong", $iOption, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hDesiredNewName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc

Func IStorageFile_MoveAndReplaceAsync($pThis, $pFileToReplace)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 18)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pFileToReplace And IsInt($pFileToReplace) Then $pFileToReplace = Ptr($pFileToReplace)
	If $pFileToReplace And (Not IsPtr($pFileToReplace)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pFileToReplace, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc
