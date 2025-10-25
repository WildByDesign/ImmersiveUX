# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 08 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceStatics
# Incl. In  : Windows.Media.Streaming.Adaptive.AdaptiveMediaSource

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IAdaptiveMediaSourceStatics = "{50A6BD5D-66EF-4CD3-9579-9E660507DC3F}"
$__g_mIIDs[$sIID_IAdaptiveMediaSourceStatics] = "IAdaptiveMediaSourceStatics"

Global Const $tagIAdaptiveMediaSourceStatics = $tagIInspectable & _
		"IsContentTypeSupported hresult(handle; bool*);" & _ ; In $hContentType, Out $bResult
		"CreateFromUriAsync hresult(ptr; ptr*);" & _ ; In $pUri, Out $pResult
		"CreateFromUriAsync2 hresult(ptr; ptr; ptr*);" & _ ; In $pUri, In $pHttpClient, Out $pResult
		"CreateFromStreamAsync hresult(ptr; ptr; handle; ptr*);" & _ ; In $pStream, In $pUri, In $hContentType, Out $pResult
		"CreateFromStreamAsync2 hresult(ptr; ptr; handle; ptr; ptr*);" ; In $pStream, In $pUri, In $hContentType, In $pHttpClient, Out $pResult

Func IAdaptiveMediaSourceStatics_IsContentTypeSupported($pThis, $sContentType)
	Local $vFailVal = Null
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If ($sContentType) And (Not IsString($sContentType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hContentType = _WinRT_CreateHString($sContentType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "handle", $hContentType, "bool*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hContentType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IAdaptiveMediaSourceStatics_CreateFromUriAsync($pThis, $pUri)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 8)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pUri, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IAdaptiveMediaSourceStatics_CreateFromUriAsync2($pThis, $pUri, $pHttpClient)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pHttpClient And IsInt($pHttpClient) Then $pHttpClient = Ptr($pHttpClient)
	If $pHttpClient And (Not IsPtr($pHttpClient)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pUri, "ptr", $pHttpClient, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IAdaptiveMediaSourceStatics_CreateFromStreamAsync($pThis, $pStream, $pUri, $sContentType)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sContentType) And (Not IsString($sContentType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hContentType = _WinRT_CreateHString($sContentType)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream, "ptr", $pUri, "handle", $hContentType, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hContentType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[5])
EndFunc

Func IAdaptiveMediaSourceStatics_CreateFromStreamAsync2($pThis, $pStream, $pUri, $sContentType, $pHttpClient)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pStream And IsInt($pStream) Then $pStream = Ptr($pStream)
	If $pStream And (Not IsPtr($pStream)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $pUri And IsInt($pUri) Then $pUri = Ptr($pUri)
	If $pUri And (Not IsPtr($pUri)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($sContentType) And (Not IsString($sContentType)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $hContentType = _WinRT_CreateHString($sContentType)
	If $pHttpClient And IsInt($pHttpClient) Then $pHttpClient = Ptr($pHttpClient)
	If $pHttpClient And (Not IsPtr($pHttpClient)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pStream, "ptr", $pUri, "handle", $hContentType, "ptr", $pHttpClient, "ptr*", 0)
	Local $iError = @error
	_WinRT_DeleteHString($hContentType)
	If $iError Then Return SetError(__WinRT_GetDllError($iError), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[6])
EndFunc
