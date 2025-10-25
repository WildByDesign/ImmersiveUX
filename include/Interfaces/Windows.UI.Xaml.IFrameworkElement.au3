# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IFrameworkElement
# Incl. In  : Windows.UI.Xaml.FrameworkElement

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IFrameworkElement = "{A391D09B-4A99-4B7C-9D8D-6FA5D01F6FBF}"
$__g_mIIDs[$sIID_IFrameworkElement] = "IFrameworkElement"

Global Const $tagIFrameworkElement = $tagIInspectable & _
		"get_Triggers hresult(ptr*);" & _ ; Out $pValue
		"get_Resources hresult(ptr*);" & _ ; Out $pValue
		"put_Resources hresult(ptr);" & _ ; In $pValue
		"get_Tag hresult(ptr*);" & _ ; Out $pValue
		"put_Tag hresult(ptr);" & _ ; In $pValue
		"get_Language hresult(handle*);" & _ ; Out $hValue
		"put_Language hresult(handle);" & _ ; In $hValue
		"get_ActualWidth hresult(double*);" & _ ; Out $fValue
		"get_ActualHeight hresult(double*);" & _ ; Out $fValue
		"get_Width hresult(double*);" & _ ; Out $fValue
		"put_Width hresult(double);" & _ ; In $fValue
		"get_Height hresult(double*);" & _ ; Out $fValue
		"put_Height hresult(double);" & _ ; In $fValue
		"get_MinWidth hresult(double*);" & _ ; Out $fValue
		"put_MinWidth hresult(double);" & _ ; In $fValue
		"get_MaxWidth hresult(double*);" & _ ; Out $fValue
		"put_MaxWidth hresult(double);" & _ ; In $fValue
		"get_MinHeight hresult(double*);" & _ ; Out $fValue
		"put_MinHeight hresult(double);" & _ ; In $fValue
		"get_MaxHeight hresult(double*);" & _ ; Out $fValue
		"put_MaxHeight hresult(double);" & _ ; In $fValue
		"get_HorizontalAlignment hresult(ulong*);" & _ ; Out $iValue
		"put_HorizontalAlignment hresult(ulong);" & _ ; In $iValue
		"get_VerticalAlignment hresult(ulong*);" & _ ; Out $iValue
		"put_VerticalAlignment hresult(ulong);" & _ ; In $iValue
		"get_Margin hresult(struct*);" & _ ; Out $tValue
		"put_Margin hresult(struct);" & _ ; In $tValue
		"get_Name hresult(handle*);" & _ ; Out $hValue
		"put_Name hresult(handle);" & _ ; In $hValue
		"get_BaseUri hresult(ptr*);" & _ ; Out $pValue
		"get_DataContext hresult(ptr*);" & _ ; Out $pValue
		"put_DataContext hresult(ptr);" & _ ; In $pValue
		"get_Style hresult(ptr*);" & _ ; Out $pValue
		"put_Style hresult(ptr);" & _ ; In $pValue
		"get_Parent hresult(ptr*);" & _ ; Out $pValue
		"get_FlowDirection hresult(ulong*);" & _ ; Out $iValue
		"put_FlowDirection hresult(ulong);" & _ ; In $iValue
		"add_Loaded hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_Loaded hresult(int64);" & _ ; In $iToken
		"add_Unloaded hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_Unloaded hresult(int64);" & _ ; In $iToken
		"add_SizeChanged hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_SizeChanged hresult(int64);" & _ ; In $iToken
		"add_LayoutUpdated hresult(ptr; int64*);" & _ ; In $pHandler, Out $iToken
		"remove_LayoutUpdated hresult(int64);" & _ ; In $iToken
		"FindName hresult(handle; ptr*);" & _ ; In $hName, Out $pResult
		"SetBinding hresult(ptr; ptr);" ; In $pDp, In $pBinding

Func IFrameworkElement_GetTriggers($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetResources($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 8)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetResources($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 9, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetTag($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 10)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetTag($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 11, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetLanguage($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 12)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetLanguage($pThis, $sValue)
	Local $vValue = __WinRT_SetProperty_HString($pThis, 13, $sValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetActualWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 14, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetActualHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 15, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 16, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetWidth($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 17, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 18, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetHeight($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 19, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetMinWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 20, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetMinWidth($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 21, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetMaxWidth($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 22, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetMaxWidth($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 23, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetMinHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 24, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetMinHeight($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 25, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetMaxHeight($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 26, "double")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetMaxHeight($pThis, $fValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 27, "double", $fValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetHorizontalAlignment($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 28, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetHorizontalAlignment($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 29, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetVerticalAlignment($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 30, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetVerticalAlignment($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 31, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetMargin($pThis)
	Local $tagValue = "double;double;double;double;"
	Local $tValue = DllStructCreate($tagValue)
	__WinRT_GetProperty_Struct($pThis, 32, $tValue)
	Return SetError(@error, @extended, $tValue)
EndFunc

Func IFrameworkElement_SetMargin($pThis, $tValue)
	Local $vValue = __WinRT_SetProperty_Struct($pThis, 33, $tValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetName($pThis)
	Local $vValue = __WinRT_GetProperty_HString($pThis, 34)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetName($pThis, $sValue)
	Local $vValue = __WinRT_SetProperty_HString($pThis, 35, $sValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetBaseUri($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 36)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetDataContext($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 37)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetDataContext($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 38, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetStyle($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 39)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetStyle($pThis, $pValue)
	Local $vValue = __WinRT_SetProperty_Ptr($pThis, 40, $pValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetParent($pThis)
	Local $vValue = __WinRT_GetProperty_Ptr($pThis, 41)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_GetFlowDirection($pThis)
	Local $vValue = __WinRT_GetProperty_Number($pThis, 42, "ulong")
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_SetFlowDirection($pThis, $iValue)
	Local $vValue = __WinRT_SetProperty_Number($pThis, 43, "ulong", $iValue)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_AddHdlrLoaded($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 44, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_RemoveHdlrLoaded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 45, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_AddHdlrUnloaded($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 46, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_RemoveHdlrUnloaded($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 47, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_AddHdlrSizeChanged($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 48, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_RemoveHdlrSizeChanged($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 49, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_AddHdlrLayoutUpdated($pThis, $pHandler)
	Local $vValue = __WinRT_AddHandler($pThis, 50, $pHandler)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_RemoveHdlrLayoutUpdated($pThis, $iToken)
	Local $vValue = __WinRT_RemoveHandler($pThis, 51, $iToken)
	Return SetError(@error, @extended, $vValue)
EndFunc

Func IFrameworkElement_FindName($pThis, $sName)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 52)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sName) And (Not IsString($sName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hName = _WinRT_CreateHString($sName)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hName, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hName)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IFrameworkElement_SetBinding($pThis, $pDp, $pBinding)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 53)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pDp And IsInt($pDp) Then $pDp = Ptr($pDp)
	If $pDp And (Not IsPtr($pDp)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pBinding And IsInt($pBinding) Then $pBinding = Ptr($pBinding)
	If $pBinding And (Not IsPtr($pBinding)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pDp, "ptr", $pBinding)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc
