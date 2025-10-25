#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include "IUnknown.au3"

Global Const $sIID_ISupportErrorInfo = "{DF0B3D60-548F-101B-8E65-08002B2BD119}"
$__g_mIIDs[$sIID_ISupportErrorInfo] = "ISupportErrorInfo"
Global Const $tagISupportErrorInfo = "InterfaceSupportsErrorInfo hresult(struct*);" ;(In tRIID)

Func ISupportErrorInfo_InterfaceSupportsErrorInfo($pThis, $tRiid)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If Not IsDllStruct($tRiid) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tRiid)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[0] = $S_OK)
EndFunc   ;==>ISupportErrorInfo_InterfaceSupportsErrorInfo
