# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IUIElement4
# Incl. In  : Windows.UI.Xaml.UIElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IUIElement4 = "{69145CD4-199A-4657-9E57-E99E8F136712}"
$__g_mIIDs[$sIID_IUIElement4] = "IUIElement4"

Global Const $tagIUIElement4 = $tagIInspectable & _
		"get_ContextFlyout hresult(ptr*);" & _ ; Out $pValue
		"put_ContextFlyout hresult(ptr);" & _ ; In $pValue
		"get_ExitDisplayModeOnAccessKeyInvoked hresult(bool*);" & _ ; Out $bValue
		"put_ExitDisplayModeOnAccessKeyInvoked hresult(bool);" & _ ; In $bValue
		"get_IsAccessKeyScope hresult(bool*);" & _ ; Out $bValue
		"put_IsAccessKeyScope hresult(bool);" & _ ; In $bValue
		"get_AccessKeyScopeOwner hresult(ptr*);" & _ ; Out $pValue
		"put_AccessKeyScopeOwner hresult(ptr);" & _ ; In $pValue
		"get_AccessKey hresult(handle*);" & _ ; Out $hValue
		"put_AccessKey hresult(handle);" & _ ; In $hValue
		"add_ContextRequested hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ContextRequested hresult(int64);" & _ ; In $iToken
		"add_ContextCanceled hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_ContextCanceled hresult(int64);" & _ ; In $iToken
		"add_AccessKeyDisplayRequested hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_AccessKeyDisplayRequested hresult(int64);" & _ ; In $iToken
		"add_AccessKeyDisplayDismissed hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_AccessKeyDisplayDismissed hresult(int64);" & _ ; In $iToken
		"add_AccessKeyInvoked hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_AccessKeyInvoked hresult(int64);" ; In $iToken

Func IUIElement4_GetContextFlyout($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_SetContextFlyout($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 8, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_GetExitDisplayModeOnAccessKeyInvoked($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 9)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_SetExitDisplayModeOnAccessKeyInvoked($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 10, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_GetIsAccessKeyScope($pThis)
	Local $vValue = __WinRT_GetProperty_Bool($pThis, 11)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_SetIsAccessKeyScope($pThis, $bValue)
	Local $vValue = __WinRT_SetProperty_Bool($pThis, 12, $bValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_GetAccessKeyScopeOwner($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 13)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_SetAccessKeyScopeOwner($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 14, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_GetAccessKey($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 15)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_SetAccessKey($pThis, $sValue)
	Local $vValue = __WinRT_SetProperty_HString($pThis, 16, $sValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_AddHdlrContextRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 17, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_RemoveHdlrContextRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 18, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_AddHdlrContextCanceled($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 19, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_RemoveHdlrContextCanceled($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 20, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_AddHdlrAccessKeyDisplayRequested($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 21, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_RemoveHdlrAccessKeyDisplayRequested($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 22, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_AddHdlrAccessKeyDisplayDismissed($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 23, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_RemoveHdlrAccessKeyDisplayDismissed($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 24, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_AddHdlrAccessKeyInvoked($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 25, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IUIElement4_RemoveHdlrAccessKeyInvoked($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 26, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc
