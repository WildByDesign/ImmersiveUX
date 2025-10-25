#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#Tidy_Parameters=/sf

#include-Once
#include "IInspectable.au3"

Global Const $tagIID_IVectorView = $tagIInspectable & _
		"GetAt hresult(ulong; ptr*);" & _ ;(In iIndex, Out pItem)
		"GetSize hresult(ulong*);" & _ ;(Out iSize)
		"IndexOf hresult(ptr; ulong*; bool*);" & _ ;(In pItem, Out iIndex, Out bFound)
		"GetMany hresult(ulong; ulong; ptr*; ulong*);" ;(In iStartIndex, In iItemsToRetrieve??, Out pItemArray, Out iItemsRetrieved)

Func IVectorView_GetAt($pThis, $iIndex)
	Local $vFailVal = Ptr(0)
	If ($iIndex < 0) Or Not IsInt($iIndex) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iIndex, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IVectorView_GetAt

Func IVectorView_GetMany($pThis, $iStart, $iNumToRetrieve = 0)
	Local $vFailVal = Ptr(0)
	If ($iStart < 0) Or (Not IsInt($iStart)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If ($iNumToRetrieve < 0) Or (Not IsInt($iNumToRetrieve)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "uint", $iStart, "uint", $iNumToRetrieve, "ptr*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], $aCall[5], $aCall[4])
EndFunc   ;==>IVectorView_GetMany

Func IVectorView_IndexOf($pThis, $pItem)
	Local $vFailVal = -1
	If (Not $pItem) Or (Not IsPtr($pItem)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 9)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pItem, "ulong*", 0, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IVectorView_IndexOf

Func IVectorView_GetSize($pThis)
	Local $iValue = __WinRT_GetProperty_Number($pThis, 8, "uint")
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IVectorView_Size
