# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 06 November 2024
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Storage.IStorageFilePropertiesWithAvailability
# Incl. In  : Windows.Storage.BulkAccess.FileInformation

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IStorageFilePropertiesWithAvailability = "{AFCBBE9B-582B-4133-9648-E44CA46EE491}"
$__g_mIIDs[$sIID_IStorageFilePropertiesWithAvailability] = "IStorageFilePropertiesWithAvailability"

Global Const $tagIStorageFilePropertiesWithAvailability = $tagIInspectable & _
		"get_IsAvailable hresult(bool*);" ; Out $bValue

Func IStorageFilePropertiesWithAvailability_GetIsAvailable($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc
