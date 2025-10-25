#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include "..\WinRTCore.au3"

Global Const $sIID_IUnknown = "{00000000-0000-0000-C000-000000000046}"
$__g_mIIDs[$sIID_IUnknown] = "IUnknown"
Global Const $tagIUnknown = _
		"QueryInterface hresult(struct*; ptr*);" & _ ;(In tGUID, Out pInterface)
		"AddRef ulong();" & _
		"RemoveRef ulong();"

Func IUnknown_AddRef($pThis)
	Local $vFailVal = -1
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 2)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return $aCall[0]
EndFunc   ;==>IUnknown_AddRef

Func IUnknown_QueryInterface($pThis, $sIID)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 1)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tIID = __WinRT_CreateGUID($sIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tIID, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IUnknown_QueryInterface

Func IUnknown_Release($pThis)
	Local $vFailVal = -1
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 3)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("ulong", $pFunc, "ptr", $pThis)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return $aCall[0]
EndFunc   ;==>IUnknown_RemoveRef
