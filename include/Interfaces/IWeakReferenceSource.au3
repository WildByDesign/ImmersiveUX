#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include "IUnknown.au3"

Global Const $sIID_IWeakReferenceSource = "{00000038-0000-0000-C000-000000000046}"
$__g_mIIDs[$sIID_IWeakReferenceSource] = "IWeakReferenceSource"
Global Const $tagIWeakReferenceSource = _
		"GetWeakReference hresult(ptr*);" ;(Out pInstance)

Func IWeakReferenceSource_GetWeakReference($pThis)
	Local $pValue = __WinRT_GetProperty_Ptr($pThis, 4)
	Return SetError(@error, @extended, $pValue)
EndFunc   ;==>IWeakReferenceSource_GetWeakReference
