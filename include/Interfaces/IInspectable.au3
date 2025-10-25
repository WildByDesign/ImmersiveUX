#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include "IUnknown.au3"

Global Const $sIID_IInspectable = "{AF86E2E0-B12D-4C6A-9C5A-D7AA65101E90}"
$__g_mIIDs[$sIID_IInspectable] = "IInspectable"
Global Const $tagIInspectable = _
		"GetIids hresult(uint*; ptr*);" & _ ;(Out iCount, Out pGUIDArray)
		"GetRuntimeClassName hresult(ptr*);" & _ ;(Out hsClassName)
		"GetTrustLevel hresult(uint*);" ;(Out iTrustLevel)

Global Enum $TLVL_BaseTrust = 0, $TLVL_PartialTrust, $TLVL_FullTrust ;TrustLevel for GetTrustLevel
Global $mTrustlevel[]
$mTrustlevel[$TLVL_BaseTrust] = "BaseTrust"
$mTrustlevel[$TLVL_PartialTrust] = "PartialTrust"
$mTrustlevel[$TLVL_FullTrust] = "FullTrust"
__WinRT_AddReverseMappings($mTrustlevel)

Func IInspectable_GetIids($pThis)
	Local $vFailVal[0]
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "uint*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $iCount = $aCall[2], $asIIDs[$iCount]
	For $i = 0 To $iCount - 1
		$asIIDs[$i] = __WinRT_ReadGUIDAt(Ptr($aCall[3] + ($i * 16)))
	Next
	__WinRT_FreeMem($aCall[3])
	Return SetError($aCall[0], 0, $asIIDs)
EndFunc   ;==>IInspectable_GetIids

Func IInspectable_GetRuntimeClassName($pThis)
	Local $sValue = __WinRT_GetProperty_HString($pThis, 5)
	Return SetError(@error, @extended, $sValue)
EndFunc   ;==>IInspectable_GetRuntimeClassName

Func IInspectable_GetTrustLevel($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 6, "ulong")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IInspectable_GetTrustLevel
