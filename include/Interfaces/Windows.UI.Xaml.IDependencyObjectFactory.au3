# *** WinRT by MattyD v1.5 (Preview) ***
# This project is still in early development. Expect bugs in some libraries!
# --------------------------------------------------------------------------
# Generated : 29 April 2025
# Platform  : WIN_11 23H2 22631
# File Type : Interface
# File Name : Windows.UI.Xaml.IDependencyObjectFactory
# Incl. In  : Windows.UI.Xaml.DependencyObject

#include-once
#include "..\WinRTCore.au3"
#include "IInspectable.au3"

Global Const $sIID_IDependencyObjectFactory = "{9A03AF92-7D8A-4937-884F-ECF34FE02ACB}"
$__g_mIIDs[$sIID_IDependencyObjectFactory] = "IDependencyObjectFactory"

Global Const $tagIDependencyObjectFactory = $tagIInspectable & _
		"CreateInstance hresult(ptr; ptr*; ptr*);" ; In $pBaseInterface, Out $pInnerInterface, Out $pValue

Func IDependencyObjectFactory_CreateInstance($pThis, $pBaseInterface, ByRef $pInnerInterface)
	Local $vFailVal = Ptr(0)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 7)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	If $pBaseInterface And IsInt($pBaseInterface) Then $pBaseInterface = Ptr($pBaseInterface)
	If $pBaseInterface And (Not IsPtr($pBaseInterface)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pBaseInterface, "ptr*", 0, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pInnerInterface = $aCall[3]
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc
