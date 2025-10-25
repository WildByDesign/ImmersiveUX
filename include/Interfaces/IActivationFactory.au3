#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include "IInspectable.au3"

Global Const $sIID_IActivationFactory = "{00000035-0000-0000-C000-000000000046}"
$__g_mIIDs[$sIID_IActivationFactory] = "IActivationFactory"
Global Const $tagIActivationFactory = $tagIInspectable & _
		"ActivateInstance hresult(ptr*);" ;(Out pInstance)

Func IActivationFactory_ActivateInstance($pThis)
	Local $pValue = __WinRT_GetProperty_Ptr($pThis, 7)
	Return SetError(@error, @extended, $pValue)
EndFunc   ;==>IActivationFactory_ActivateInstance
