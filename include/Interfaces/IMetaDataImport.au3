#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
;#Tidy_Parameters=/sf

#include-Once
#include "IUnknown.au3"

Global Const $sIID_IMetaDataImport = "{7DAC8207-D3AE-4C75-9B67-92801A497D44}"
$__g_mIIDs[$sIID_IMetaDataImport] = "IMetaDataImport"
Global Const $tagIMetaDataImport = $tagIUnknown & _
		"CloseEnum none(ptr);" & _ ;(In pEnum)
		"CountEnum hresult(ptr; uint*);" & _ ;(In pEnum, Out iCount)
		"ResetEnum hresult(ptr; uint);" & _ ;(In pEnum, In iPos)
		"EnumTypeDefs hresult(ptr*; struct*; uint; uint*);" & _ ;(In Out pEnum, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumInterfaceImpls hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In iDefTkn, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumTypeRefs hresult(ptr*; struct*; uint; uint*);" & _ ;(In Out pEnum, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"FindTypeDefByName hresult(wstr, ulong; ulong*);" & _ ;(In sTypeDef, In iEncClassTkn, Out iToken)
		"GetScopeProps hresult(struct*, uint, uint*, struct*);" & _ ;(InOut tName, In iBuffLen, Out iNameLen, Out tVersGUID)
		"GetModuleFromScope hresult(ulong*);" & _ ;(Out iModuleTkn)
		"GetTypeDefProps hresult(ulong; struct*; uint; uint*; dword*; ulong*);" & _ ;(In iToken, Out tTypeDef, In iBuffLen, Out iTypeDefLen, Out iFlags, Out iExtendsToken)
		"GetInterfaceImplProps hresult(ulong; ulong*; ulong*);" & _ ;(In iToken, Out iClassToken, Out iIfaceImplTkn)
		"GetTypeRefProps hresult(ulong; ulong*; struct*; uint; uint*);" & _ ;(In iToken, Out iResScopeTkn, Out tTypeRef, In iBuffLen, Out iTypeRefLen)
		"ResolveTypeRef hresult(ulong; struct*; ptr*; ulong*);" & _ ;(In iToken, In tRefIID, Out pIScope, Out iTypeDefTkn)
		"EnumMembers hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In iTypeDefTkn, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumMembersWithName hresult(ptr*; ulong; wstr; struct*; uint; uint*);" & _ ;(In Out pEnum, In iTypeDefTkn, In sName, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumMethods hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In iTypeDefTkn, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumMethodsWithName hresult(ptr*; ulong; wstr; struct*; uint; uint*);" & _ ;(In Out pEnum, In iTypeDefTkn, In sName, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumFields hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In iTypeDefTkn, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumFieldsWithName hresult(ptr*; ulong; wstr; struct*; uint; uint*);" & _ ;(In Out pEnum, In iTypeDefTkn, In sName, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumParams hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In iMethodDefTkn, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumMemberRefs hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In iParentToken, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumMethodImpls hresult(ptr*; ulong; struct*; struct*; uint; uint*);" & _ ;(In Out pEnum, In iTypeDefTkn, Out tBodyTknArr, Out tDeclTknArr, In iMaxTokens, Out iNumTokens)
		"EnumPermissionSets hresult(ptr*; ulong; dword; struct*; uint; uint*);" & _ ;(In Out pEnum, In iToken, In iActions, Out tPermsTknArr, In iMaxTokens, Out iNumTokens)
		"FindMember hresult(ulong; wstr; struct*; uint; ulong*);" & _ ;(In iTypeDefTkn, In sName, In tSigBlob, In iSigLen, Out iMemberDefTkn)
		"FindMethod hresult(ulong; wstr; struct*; uint; ulong*);" & _ ;(In iTypeDefTkn, In sName, In tSigBlob, In iSigLen, Out iMethodDefTkn)
		"FindField hresult(ulong; wstr; struct*; uint; ulong*);" & _ ;(In iTypeDefTkn, In sName, In tSigBlob, In iSigLen, Out iFieldDefTkn)
		"FindMemberRef hresult(ulong; wstr; struct*; uint; ulong*);" & _ ;(In iTypeDefTkn, In sName, In tSigBlob, In iSigLen, Out iMemberRefTkn)
		"GetMethodProps hresult(ulong; ulong*; struct*; uint; uint*; dword*; ptr*; uint*; ulong*; dword*);" & _ ;(In iMethodDefTkn, Out iTypeDefTkn, Out tMethodStr, In iBuffLen, Out iMethodStrLen, Out iAttribFlags, Out pSigBlob, Out iSigBlobSize, Out iRelVAdd, Out iImplFlags)
		"GetMemberRefProps hresult(ulong; ulong*; struct*; uint; uint*; ptr*; uint*);" & _ ;(In iMemberRefTkn, Out iTypeDefTkn, Out tMethodRefStr, In iBuffLen, Out iMethodRefStrLen, Out pSigBlob, Out iSigBlobSize)
		"EnumProperties hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In TypeDefTkn, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumEvents hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In TypeDefTkn, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"GetEventProps hresult(ulong; ulong*; struct*; uint; uint*; dword*; ulong*; ulong*; ulong*; ulong*; struct*; uint; uint*);" & _ ;(In iEventTkn, Out iTypeDefTkn, Out tEventStr, In iBuffLen, Out iEventLen, Out iEventFlags, Out iEventTypeTkn, Out iMthdDefAddOn, Out iMthdDefRemoveOn, Out iMthdDefFire, Out tOtherMthdTknArr, In iMaxTokens, Out iNumTokens)
		"EnumMethodSemantics hresult(ptr*; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In MethodDefTkn, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"GetMethodSemantics hresult(ulong; ulong; dword*);" & _ ;(In iMethodTkn, In EventPropTkn, Out iSemanticsFlags)
		"GetClassLayout hresult(ulong; dword*; struct*; uint; uint*; uint*);" & _ ;(In iTypeDefTkn, Out iPackSize, Out tFieldOffsetArr, In In iMaxArrSize, Out iArrSize, out iClassSize)
		"GetFieldMarshal hresult(ulong; ptr*; uint*);" & _ ;(In iToken, Out pSigBlob, Out iSigBlobSize)
		"GetRVA hresult(ulong; ulong*; dword*);" & _ ;(In iToken, Out iRelVAdd, Out iImplFlags)
		"GetPermissionSetProps hresult(ulong; dword*; ptr*; ulong*);" & _ ;(In iPermTkn, Out iAction, Out pSigBlob, Out iSigBlobSize)
		"GetSigFromToken hresult(ulong, ptr*, uint*);" & _ ;(In iToken, Out pSigBlob, Out iSigBlobSize)
		"GetModuleRefProps hresult(ulong; struct*; uint; uint*; dword; ulong*);" & _ ;(In iToken, Out tModName, In iBuffLen, Out iModNameLen)
		"EnumModuleRefs hresult(ptr*; struct*; uint; uint*);" & _ ;(In Out pEnum, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"GetTypeSpecFromToken hresult(ulong; ptr*; uint*);" & _ ;(In iTypeSpecTkn, Out pSigBlob, Out iSigBlobSize)
		"GetNameFromToken hresult(ulong, ptr*);" & _ ;(In iToken, Out pUTF8Name) - obsolete.
		"EnumUnresolvedMethods hresult(ptr*; struct*; uint; uint*);" & _ ;(In Out pEnum, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"GetUserString hresult(ulong; struct*; uint; uint*);" & _ ;(In iToken, Out tString, In iBuffLen, Out iStringLen)
		"GetPinvokeMap hresult(ulong; dword*; struct*; uint; uint*; ulong*);" & _ ;(In iToken, Out iMapFlags, Out tImportName, In iBuffSIze, Out iNameLen, Out iImportDllToken)
		"EnumSignatures hresult(ptr*; struct*; uint; uint*);" & _ ;(In Out pEnum, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumTypeSpecs hresult(ptr*; struct*; uint; uint*);" & _ ;(In Out pEnum, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"EnumUserStrings hresult(ptr*; struct*; uint; uint*);" & _ ;(In Out pEnum, Out tTokenArr, In iMaxTokens, Out iNumTokens)
		"GetParamForMethodIndex hresult(ulong; ulong; ulong*);" & _ ;(In iToken, In iSeq, Out iParamDefToken)
		"EnumCustomAttributes hresult(ptr*; ulong; ulong; struct*; uint; uint*);" & _ ;(In Out pEnum, In iScopeToken, In iConstructionTkn, Out tCustAttribArr, In iMaxTokens, Out iNumTokens)
		"GetCustomAttributeProps hresult(ulong; ulong*; ulong*; ptr*; ulong*);" & _ ;(In iToken, Out iModToken, Out iTypeTkn, Out pValue, Out iValueSize)
		"FindTypeRef hresult(ulong; wstr; ulong*);" & _ ;(In iRefScopeTkn, In sName, Out iTypeRefTkn)
		"GetMemberProps hresult(ulong; ulong*; struct*; uint; uint*; dword*; ptr*; uint*; ulong*; dword*; ulong*; struct*; uint*);" & _ ;(In iMemberTkn, Out iTypeDefTkn, Out tMemberStr, In iBuffLen, Out iMemberStrLen, Out iAttribFlags, Out pSigBlob, Out iSigBlobSize, Out iRelVAdd, Out iImplFlags, Out iValType, Out pValString, Out iValStringLen)
		"GetFieldProps hresult(ulong; ulong*; struct*; uint; uint*; dword*; ptr*; uint*; dword*; struct*; uint*);" & _ ;(In iFieldDef, Out iTypeDefTkn, Out tFieldStr, In iBuffLen, Out iFieldStrStrLen, Out iAttribFlags, Out pSigBlob, Out iSigBlobSize, Out iValType, Out pValString, Out iValStringLen)
		"GetPropertyProps hresult(ulong; ulong*; struct*; uint; uint*; dword*; ptr*; uint*; dword*; ptr*; uint*; ulong*; ulong*; struct*; uint; uint*)" & _ ;(In iPropTkn, Out iTypeDefTkn, Out tPropStr, In iBuffLen, Out iPropStrLen, Out iPropFlags, Out pSigBlob, Out iSigBlobSize, Out iValType, Out pValString, Out iValStringLen, Out iSetterTkn, Out iGetterTkn, Out tOtherMthdArr, In iMaxMthdArrSize, Out iMthdArrSize)
		"GetParamProps hresult(ulong; ulong*; uint*; struct*; uint; uint*; dword*; dword*; struct*; uint*);" & _ ;(In iParamDefTkn, Out iMethodDefTkn, In iSeq, Out tParamStr, In iBuffLen, Out iParamStrLen, Out iAttribFlags, Out iValType, Out pValString, Out iValStringLen)
		"GetCustomAttributeByName hresult(ulong; wstr; ptr*; uint*);" & _ ;(In iToken, In sName, out pAttribArr, out iArraySize)
		"IsValidToken bool(ptr);" & _ ;(In iToken)
		"GetNestedClassProps hresult(ulong; ulong*);" & _ ;(In iToken, Out iEnclClassTkn)
		"GetNativeCallConvFromSig hresult(struct*; uint; ulong*);" & _ ;(In tSigBlob, In iSigBlobSize, Out iCallConv)
		"IsGlobal hresult(ulong; bool*);" ;(In iToken, Out iGlobal)

Global Const $ELEMENT_TYPE_VOID = 0x1
Global Const $ELEMENT_TYPE_BOOLEAN = 0x2
Global Const $ELEMENT_TYPE_CHAR = 0x3
Global Const $ELEMENT_TYPE_I1 = 0x4
Global Const $ELEMENT_TYPE_U1 = 0x5
Global Const $ELEMENT_TYPE_I2 = 0x6
Global Const $ELEMENT_TYPE_U2 = 0x7
Global Const $ELEMENT_TYPE_I4 = 0x8
Global Const $ELEMENT_TYPE_U4 = 0x9
Global Const $ELEMENT_TYPE_I8 = 0xa
Global Const $ELEMENT_TYPE_U8 = 0xb
Global Const $ELEMENT_TYPE_R4 = 0xc
Global Const $ELEMENT_TYPE_R8 = 0xd
Global Const $ELEMENT_TYPE_STRING = 0xe
Global Const $ELEMENT_TYPE_BYREF = 0x10
Global Const $ELEMENT_TYPE_VALUETYPE = 0x11
Global Const $ELEMENT_TYPE_CLASS = 0x12
Global Const $ELEMENT_TYPE_VAR = 0x13
Global Const $ELEMENT_TYPE_GENERICINST = 0x15
Global Const $ELEMENT_TYPE_I = 0x18
Global Const $ELEMENT_TYPE_U = 0x19
Global Const $ELEMENT_TYPE_OBJECT = 0x1C
Global Const $ELEMENT_TYPE_SZARRAY = 0x1D
Global Const $ELEMENT_TYPE_CMOD_OPT = 0x20
Global Const $ELEMENT_TYPE_CMOD_REQ = 0x21

Global Const $MDT_Module = 0x00000000
Global Const $MDT_TypeRef = 0x01000000
Global Const $MDT_TypeDef = 0x02000000
Global Const $MDT_FieldDef = 0x04000000
Global Const $MDT_MethodDef = 0x06000000
Global Const $MDT_ParamDef = 0x08000000
Global Const $MDT_InterfaceImpl = 0x09000000
Global Const $MDT_MemberRef = 0x0a000000
Global Const $MDT_CustomAttribute = 0x0c000000
Global Const $MDT_Permission = 0x0e000000
Global Const $MDT_Signature = 0x11000000
Global Const $MDT_Event = 0x14000000
Global Const $MDT_Property = 0x17000000
Global Const $MDT_ModuleRef = 0x1a000000
Global Const $MDT_TypeSpec = 0x1b000000
Global Const $MDT_Assembly = 0x20000000
Global Const $MDT_AssemblyRef = 0x23000000
Global Const $MDT_File = 0x26000000
Global Const $MDT_ExportedType = 0x27000000
Global Const $MDT_ManifestResource = 0x28000000
Global Const $MDT_GenericParam = 0x2a000000
Global Const $MDT_MethodSpec = 0x2b000000
Global Const $MDT_GenericParamConstraint = 0x2c000000
Global Const $MDT_String = 0x70000000
Global Const $MDT_Name = 0x71000000
Global Const $MDT_BaseType = 0x72000000

Global $mCorElementTag[]
$mCorElementTag[$ELEMENT_TYPE_BOOLEAN] = "bool"
$mCorElementTag[$ELEMENT_TYPE_CHAR] = "char"
$mCorElementTag[$ELEMENT_TYPE_I1] = "byte"
$mCorElementTag[$ELEMENT_TYPE_U1] = "byte"
$mCorElementTag[$ELEMENT_TYPE_I2] = "short"
$mCorElementTag[$ELEMENT_TYPE_U2] = "ushort"
$mCorElementTag[$ELEMENT_TYPE_I4] = "long"
$mCorElementTag[$ELEMENT_TYPE_U4] = "ulong"
$mCorElementTag[$ELEMENT_TYPE_I8] = "int64"
$mCorElementTag[$ELEMENT_TYPE_U8] = "uint64"
$mCorElementTag[$ELEMENT_TYPE_R4] = "float"
$mCorElementTag[$ELEMENT_TYPE_R8] = "double"
$mCorElementTag[$ELEMENT_TYPE_STRING] = "string"

Func IMetaDataImport_CloseEnum($pThis, ByRef $pEnum)
	Local $vFailVal = False
	If (Not IsPtr($pEnum)) Or (Not $pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 4)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	DllCallAddress("none", $pFunc, "ptr", $pThis, "ptr", $pEnum)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = Ptr(0)
	Return True
EndFunc   ;==>IMetaDataImport_CloseEnum

Func IMetaDataImport_CountEnum($pThis, $pEnum)
	Local $vFailVal = -1
	If (Not IsPtr($pEnum)) Or (Not $pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 5)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pEnum, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>IMetaDataImport_CountEnum

Func IMetaDataImport_ResetEnum($pThis, $pEnum, $iPos)
	Local $vFailVal = False
	If (Not IsInt($iPos)) Or ($iPos < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 6)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr", $pEnum, "uint", $iPos)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[0] = $S_OK))
EndFunc   ;==>IMetaDataImport_ResetEnum

Func IMetaDataImport_EnumTypeDefs($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 7, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumTypeDefs

Func IMetaDataImport_EnumInterfaceImpls($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 8, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumInterfaceImpls

Func IMetaDataImport_EnumTypeRefs($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 9, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumTypeRefs

Func IMetaDataImport_FindTypeDefByName($pThis, $sName, $iEncClassTkn)
	Local $vFailVal = -1
	If $sName And (Not IsString($sName)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $iEncClassTkn Then
		Local $iTokenType = BitAND(0xFF000000, $iEncClassTkn)
		If $iTokenType <> $MDT_TypeRef And $iTokenType <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	EndIf
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 10)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "wstr", $sName, "ulong", $iEncClassTkn, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc   ;==>IMetaDataImport_FindTypeDefByName

Func IMetaDataImport_GetScopeProps($pThis, ByRef $sName, ByRef $sModuleVers)
	Local $vFailVal = False
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 11)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "wstr", "", "ulong", 0, "ulong*", 0, "ptr", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	If $aCall[4] Then
		Local $tBuffer = DllStructCreate(StringFormat("wchar[%d]", $aCall[4]))
		Local $tModuleVers = DllStructCreate($tagGUID)
		$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tBuffer, "ulong", $aCall[4], "ulong*", 0, "struct*", $tModuleVers)
		If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
		$sModuleVers = __WinRT_ReadGUIDAt(DllStructGetPtr($tModuleVers))
		$sName = DllStructGetData($tBuffer, 1)
	Else
		$sName = ""
		$sModuleVers = ""
	EndIf
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetScopeProps

Func IMetaDataImport_GetModuleFromScope($pThis)
	Local $vFailVal = -1
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 12)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[2])
EndFunc   ;==>IMetaDataImport_GetModuleFromScope

Func IMetaDataImport_GetTypeDefProps($pThis, $iTypeDefTkn, ByRef $sTypeName, ByRef $iFlags, ByRef $iExtendsTkn)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 13)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tTypeName = DllStructCreate(StringFormat("wchar[%d]", $aCall[5]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "struct*", $tTypeName, "uint", $aCall[5], "uint*", 0, "dword*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iFlags = $aCall[6]
	$iExtendsTkn = $aCall[7]
	$sTypeName = DllStructGetData($tTypeName, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetTypeDefProps

Func IMetaDataImport_GetInterfaceImplProps($pThis, $iIfaceImplTkn, ByRef $iClassToken, ByRef $iIfaceToken)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iIfaceImplTkn) <> $MDT_InterfaceImpl Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 14)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iIfaceImplTkn, "ulong*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iClassToken = $aCall[3]
	$iIfaceToken = $aCall[4]
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetInterfaceImplProps

Func IMetaDataImport_GetTypeRefProps($pThis, $iTypeRefTkn, ByRef $iResScopeTkn, ByRef $sTypeName)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iTypeRefTkn) <> $MDT_TypeRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 15)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeRefTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tTypeName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeRefTkn, "ulong*", 0, "struct*", $tTypeName, "uint", $aCall[6], "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iResScopeTkn = $aCall[3]
	$sTypeName = DllStructGetData($tTypeName, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetTypeRefProps

Func IMetaDataImport_ResolveTypeRef($pThis, $iTypeRefTkn, $sRefIID, ByRef $pIScope, ByRef $iTypeDefTkn)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iTypeRefTkn) <> $MDT_TypeRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $tRefIID = __WinRT_CreateGUID($sRefIID)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 16)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeRefTkn, "struct*", $tRefIID, "ptr*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pIScope = $aCall[4]
	$iTypeDefTkn = $aCall[5]
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_ResolveTypeRef

Func IMetaDataImport_EnumMembers($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 17, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMembers

Func IMetaDataImport_EnumMembersWithName($pThis, ByRef $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenAndNameProc($pThis, 18, $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMembersWithName

Func IMetaDataImport_EnumMethods($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 19, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMethods

Func IMetaDataImport_EnumMethodsWithName($pThis, ByRef $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenAndNameProc($pThis, 20, $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMethodsWithName

Func IMetaDataImport_EnumFields($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 21, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumFields

Func IMetaDataImport_EnumFieldsWithName($pThis, ByRef $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenAndNameProc($pThis, 22, $pEnum, $iTypeDefTkn, $sName, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumFieldsWithName

Func IMetaDataImport_EnumParams($pThis, ByRef $pEnum, $iMethodDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 23, $pEnum, $iMethodDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumParams

Func IMetaDataImport_EnumMemberRefs($pThis, ByRef $pEnum, $iParentTkn, $iMaxTokens)
	Local $vFailVal[0]
	Local $iTokenType = BitAND(0xFF000000, $iParentTkn)
	Local $aValidTknTypes = [$MDT_TypeDef, $MDT_TypeRef, $MDT_MethodDef, $MDT_ModuleRef]
	For $i = 0 To UBound($aValidTknTypes) - 1
		If $iTokenType = $aValidTknTypes[$i] Then ExitLoop
	Next
	If $i = UBound($aValidTknTypes) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 24, $pEnum, $iParentTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMemberRefs

Func IMetaDataImport_EnumMethodImpls($pThis, ByRef $pEnum, $iTypeDefTkn, ByRef $aBodyTkns, ByRef $aDeclTkns, $iMaxTokens)
	Local $vFailVal = False
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 25)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tBodyTkns = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pBodyTkns = DllStructGetPtr($tBodyTkns)
	Local $tDeclTkns = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pDeclTkns = DllStructGetPtr($tDeclTkns)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iTypeDefTkn, "ptr", $pBodyTkns, "ptr", $pDeclTkns, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[7]]
	$aBodyTkns = $aTokens
	$aDeclTkns = $aTokens
	For $i = 0 To UBound($aTokens) - 1
		$aBodyTkns[$i] = DllStructGetData($tBodyTkns, 1, $i + 1)
		$aDeclTkns[$i] = DllStructGetData($tDeclTkns, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>__IMetaDataImport_EnumMethodImpls

Func IMetaDataImport_EnumPermissionSets($pThis, ByRef $pEnum, $iToken, $iSecActions, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $iToken And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 26)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iToken, "dword", $iSecActions, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[7]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($aTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>__IMetaDataImport_EnumPermissionSets

Func IMetaDataImport_FindMember($pThis, $iTypeDefTkn, $sName, $dSignature = 0)
	Local $vFailVal = -1
	If $iTypeDefTkn And BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iValue = __IMetaDataImport_FindProc($pThis, 27, $iTypeDefTkn, $sName, $dSignature)
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IMetaDataImport_FindMember

Func IMetaDataImport_FindMethod($pThis, $iTypeDefTkn, $sName, $dSignature = 0)
	Local $vFailVal = -1
	If $iTypeDefTkn And BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iValue = __IMetaDataImport_FindProc($pThis, 28, $iTypeDefTkn, $sName, $dSignature)
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IMetaDataImport_FindMethod

Func IMetaDataImport_FindField($pThis, $iTypeDefTkn, $sName, $dSignature = 0)
	Local $vFailVal = -1
	If $iTypeDefTkn And  BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iValue = __IMetaDataImport_FindProc($pThis, 29, $iTypeDefTkn, $sName, $dSignature)
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IMetaDataImport_FindField

Func IMetaDataImport_FindMemberRef($pThis, $iTypeRefTkn, $sName, $dSignature = 0)
	Local $vFailVal = -1
	If $iTypeRefTkn And BitAND(0xFF000000, $iTypeRefTkn) <> $MDT_TypeRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iValue = __IMetaDataImport_FindProc($pThis, 30, $iTypeRefTkn, $sName, $dSignature)
	Return SetError(@error, @extended, $iValue)
EndFunc   ;==>IMetaDataImport_FindMemberRef

Func IMetaDataImport_GetMethodProps($pThis, $iMethodDefTkn, ByRef $iTypeDefTkn, ByRef $sMethodName, ByRef $iAttribFlags, ByRef $dSignature, ByRef $iRelVAddress, ByRef $iImplFlags)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 31)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodDefTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ptr", 0, "uint*", 0, "uint*", 0, "dword*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodDefTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "uint*", 0, "dword*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sMethodName = DllStructGetData($tName, 1)
	If @error Then $sMethodName = ""
	$iAttribFlags = $aCall[7]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[9]), $aCall[8])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iRelVAddress = $aCall[10]
	$iImplFlags = $aCall[11]
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetMethodProps

Func IMetaDataImport_GetMemberRefProps($pThis, $iMemberRefTkn, ByRef $iTypeTkn, ByRef $sMemberName, ByRef $dSignature)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iMemberRefTkn) <> $MDT_MemberRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 32)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMemberRefTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "ptr", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMemberRefTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeTkn = $aCall[3]
	$sMemberName = DllStructGetData($tName, 1)
	If @error Then $sMemberName = ""
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[8]), $aCall[7])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetMemberRefProps

Func IMetaDataImport_EnumProperties($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 33, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumProperties

Func IMetaDataImport_EnumEvents($pThis, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 34, $pEnum, $iTypeDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumEvents

Func IMetaDataImport_GetEventProps($pThis, $iEventTkn, ByRef $iTypeDefTkn, ByRef $sEventName, ByRef $iEventFlags, ByRef $iMthdTknAddOn, ByRef $iMthdTknRemoveOn, ByRef $iMthdTknFire, ByRef $aMthdTknsOther, $iMaxOtherMethods)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iEventTkn) <> $MDT_Event Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxOtherMethods)) Or ($iMaxOtherMethods < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 35)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iEventTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "uint*", 0, "uint*", 0, "uint*", 0, "ptr", 0, "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxOtherMethods))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iEventTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "uint*", 0, "uint*", 0, "uint*", 0, "struct*", $tTokens, "uint", $iMaxOtherMethods, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sEventName = DllStructGetData($tName, 1)
	If @error Then $sEventName = ""
	$iEventFlags = $aCall[7]
	$iMthdTknAddOn = $aCall[8]
	$iMthdTknRemoveOn = $aCall[9]
	$iMthdTknFire = $aCall[10]
	Local $aTokens[$aCall[13]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, $i + 1)
	Next
	$aMthdTknsOther = $aTokens
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetEventProps

Func IMetaDataImport_EnumMethodSemantics($pThis, ByRef $pEnum, $iMethodDefTkn, $iMaxTokens)
	Local $vFailVal[0]
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $aValue = __IMetaDataImport_EnumWithTokenProc($pThis, 36, $pEnum, $iMethodDefTkn, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumMethodSemantics

Func IMetaDataImport_GetMethodSemantics($pThis, $iMethodDefTkn, $iEventPropTkn)
	Local $vFailVal = -1
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If BitAND(0xFF000000, $iEventPropTkn) <> $MDT_Property Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 37)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodDefTkn, "ulong", $iEventPropTkn, "dword*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError(@error, 0, $aCall[4])
EndFunc   ;==>IMetaDataImport_GetMethodSemantics

Func IMetaDataImport_GetClassLayout($pThis, $iTypeDefTkn, ByRef $iPackSize, ByRef $aFieldOffsets, ByRef $iClassSize)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 38)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "uint*", 0, "ptr", 0, "uint", 0, "uint*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tOffsets = DllStructCreate(StringFormat("ulong[%d];", 2 * $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "uint*", 0, "struct*", $tOffsets, "uint", $aCall[6], "uint*", 0, "uint*", 0)
	$iPackSize = $aCall[3]
	Local $aOffsets[$aCall[6]][2]
	For $i = 0 To UBound($aOffsets) - 1
		$aOffsets[$i + 1][0] = DllStructGetData($tOffsets, 1, 2 * $i + 1)
		$aOffsets[$i + 1][1] = DllStructGetData($tOffsets, 1, 2 * $i + 2)
	Next
	$aFieldOffsets = $aOffsets
	$iClassSize = $aCall[7]
	Return SetError(@error, 0, True)
EndFunc   ;==>IMetaDataImport_GetClassLayout

Func IMetaDataImport_GetFieldMarshal($pThis, $iToken)
	Local $vFailVal = Binary("0x")
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 39)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tSig = DllStructCreate(StringFormat("byte[%d];", $aCall[4]), $aCall[3])
	Return SetError(@error, 0, DllStructGetData($tSig, 1))
EndFunc   ;==>IMetaDataImport_GetFieldMarshal

Func IMetaDataImport_GetRVA($pThis, $iToken, ByRef $iRVA, ByRef $iImplFlags)
	Local $vFailVal = False
	Local $iTokenType = BitAND(0xFF000000, $iToken)
	If $iTokenType <> $MDT_MethodDef And $iTokenType <> $MDT_FieldDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 40)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "ulong*", 0, "dword*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iRVA = $aCall[3]
	$iImplFlags = $aCall[4]
	Return SetError(@error, 0, True)
EndFunc   ;==>IMetaDataImport_GetRVA

Func IMetaDataImport_GetPermissionSetProps($pThis, $iPermTkn, ByRef $iAction, ByRef $dSignature)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iPermTkn) <> $MDT_Permission Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 41)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iPermTkn, "ulong*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tSig = DllStructCreate(StringFormat("byte[%d];", $aCall[5]), $aCall[4])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iAction = $aCall[3]
	Return SetError(@error, 0, True)
EndFunc   ;==>IMetaDataImport_GetPermissionSetProps

Func IMetaDataImport_GetSigFromToken($pThis, $iToken)
	Local $vFailVal = Binary("0x")
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 42)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tSig = DllStructCreate(StringFormat("byte[%d];", $aCall[4]), $aCall[3])
	Local $dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	Return SetError(@error, 0, $dSignature)
EndFunc   ;==>IMetaDataImport_GetSigFromToken

Func IMetaDataImport_GetModuleRefProps($pThis, $iModuleRefTkn)
	Local $vFailVal = ""
	If BitAND(0xFF000000, $iModuleRefTkn) <> $MDT_ModuleRef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 43)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iModuleRefTkn, "wstr", "", "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[5]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iModuleRefTkn, "struct*", $tName, "uint", $aCall[5], "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, DllStructGetData($tName, 1))
EndFunc   ;==>IMetaDataImport_GetModuleRefProps

Func IMetaDataImport_EnumModuleRefs($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 44, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumModuleRefs

Func IMetaDataImport_GetTypeSpecFromToken($pThis, $iTypeSpecTkn)
	Local $vFailVal = Binary("0x")
	If BitAND(0xFF000000, $iTypeSpecTkn) <> $MDT_TypeSpec Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 45)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeSpecTkn, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[4]), $aCall[3])
	Return SetError($aCall[0], 0, DllStructGetData($tSig, 1))
EndFunc

Func IMetaDataImport_GetNameFromToken($pThis, $iToken) ;Returns ptr to UTF8 string, obsolete - so cant be bothered to decode string at this time.
	Local $vFailVal = Ptr(0)
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 46)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IMetaDataImport_EnumUnresolvedMethods($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 47, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumUnresolvedMethods

Func IMetaDataImport_GetUserString($pThis, $iStringTkn)
	Local $vFailVal = ""
	If BitAND(0xFF000000, $iStringTkn) <> $MDT_String Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 48)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iStringTkn, "wstr", "", "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tString = DllStructCreate(StringFormat("wchar[%d]", $aCall[5]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iStringTkn, "struct*", $tString, "uint", $aCall[5], "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, DllStructGetData($tString, 1))
EndFunc

Func IMetaDataImport_GetPinvokeMap($pThis, $iToken, ByRef $iMapFlags, ByRef $sImportName, ByRef $iImportDllTkn)
	Local $vFailVal = False
	Local $iTokenType = BitAND(0xFF000000, $iToken)
	If $iTokenType <> $MDT_MethodDef And $iTokenType <> $MDT_FieldDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 49)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "dword*", 0, "wstr", "", "uint", 0, "uint*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "dword*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iMapFlags = $aCall[3]
	$sImportName = DllStructGetData($tName, 1)
	If @error Then $sImportName = ""
	$iImportDllTkn = $aCall[7]
	Return SetError($aCall[0], 0, True)
EndFunc

Func IMetaDataImport_EnumSignatures($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 50, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumSignatures

Func IMetaDataImport_EnumTypeSpecs($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 51, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumTypeSpecs

Func IMetaDataImport_EnumUserStrings($pThis, ByRef $pEnum, $iMaxTokens)
	Local $aValue = __IMetaDataImport_EnumProc($pThis, 52, $pEnum, $iMaxTokens)
	Return SetError(@error, @extended, $aValue)
EndFunc   ;==>IMetaDataImport_EnumUserStrings

Func IMetaDataImport_GetParamForMethodIndex($pThis, $iMethodDefTkn, $iSequence)
	Local $vFailVal = 0
	If BitAND(0xFF000000, $iMethodDefTkn) <> $MDT_MethodDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $iSequence < 0 Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 53)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMethodDefTkn, "uint", $iSequence, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IMetaDataImport_EnumCustomAttributes($pThis, ByRef $pEnum, $iToken, $iTokenType, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iToken)) And ($iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iTokenType)) And ($iTokenType) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 54)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iToken, "ulong", $iTokenType, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[7]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc

Func IMetaDataImport_GetCustomAttributeProps($pThis, $iCustomAttribTkn, ByRef $iObjectTkn, ByRef $iTypeTkn, ByRef $dValue)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iCustomAttribTkn) <> $MDT_CustomAttribute Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 55)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iCustomAttribTkn, "ulong*", 0, "ulong*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iObjectTkn = $aCall[3]
	$iTypeTkn = $aCall[4]
	Local $tValue = DllStructCreate(StringFormat("byte[%d]", $aCall[6]), $aCall[5])
	$dValue = DllStructGetData($tValue, 1)
	Return SetError($aCall[0], 0, True)
EndFunc

Func IMetaDataImport_FindTypeRef($pThis, $iResScopeTkn, $sName)
	Local $vFailVal = -1
	Local $iTokenType = BitAND(0xFF000000, $iResScopeTkn)
	Local $aValidTknTypes = [$MDT_ModuleRef, $MDT_AssemblyRef, $MDT_TypeRef]
	For $i = 0 To UBound($aValidTknTypes) - 1
		If $iTokenType = $aValidTknTypes[$i] Then ExitLoop
	Next
	If $iResScopeTkn And (Not IsInt($iResScopeTkn)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsString($sName)) Or (Not $sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 56)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iResScopeTkn, "wstr", $sName, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IMetaDataImport_GetMemberProps($pThis, $iMemberTkn, ByRef $iTypeDefTkn, ByRef $sMemberName, ByRef $iAttribFlags, ByRef $dSignature, ByRef $iRelVAddress, ByRef $iImplFlags, ByRef $iDefValueType, ByRef $vDefValue)
	Local $vFailVal = False
	If $iMemberTkn And (Not IsInt($iMemberTkn)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 57)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMemberTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "uint*", 0, "dword*", 0, "dword*", 0, "ptr", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iMemberTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "uint*", 0, "dword*", 0, "dword*", 0, "ptr", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sMemberName = DllStructGetData($tName, 1)
	If @error Then $sMemberName = ""
	$iAttribFlags = $aCall[7]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[9]), $aCall[8])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iRelVAddress = $aCall[10]
	$iImplFlags = $aCall[11]
	$iDefValueType = $aCall[12]
	Local $tValue
	Switch $aCall[12]
		Case $ELEMENT_TYPE_STRING
			$tValue = DllStructCreate(StringFormat("wchar[%d]", $aCall[14]), $aCall[13])
		Case Else
			$tValue = DllStructCreate($mCorElementTag[$aCall[12]], $aCall[13])
	EndSwitch
	$vDefValue = DllStructGetData($tValue, 1)
	Return SetError($aCall[0], 0, True)
EndFunc

Func IMetaDataImport_GetFieldProps($pThis, $iFieldDefTkn, ByRef $iTypeDefTkn, ByRef $sFieldName, ByRef $iAttribFlags, ByRef $dSignature, ByRef $iValueType, ByRef $vValue)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iFieldDefTkn) <> $MDT_FieldDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 58)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iFieldDefTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iFieldDefTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sFieldName = DllStructGetData($tName, 1)
	If @error Then $sFieldName = ""
	$iAttribFlags = $aCall[7]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[9]), $aCall[8])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iValueType = $aCall[10]
	Local $tValue
	Switch $aCall[10]
		Case $ELEMENT_TYPE_STRING
			$tValue = DllStructCreate(StringFormat("wchar[%d]", $aCall[12]), $aCall[11])
		Case Else
			$tValue = DllStructCreate($mCorElementTag[$aCall[10]], $aCall[11])
	EndSwitch
	$vValue = DllStructGetData($tValue, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetFieldProps

Func IMetaDataImport_GetPropertyProps($pThis, $iPropertyTkn, ByRef $iTypeDefTkn, ByRef $sPropertyName, ByRef $iPropertyFlags, ByRef $dSignature, ByRef $iDefValueType, ByRef $vDefValue, ByRef $iMthdTknSetter, ByRef $iMthdTknGetter, ByRef $aMthdTknsOther, $iMaxOtherMethods)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iPropertyTkn) <> $MDT_Property Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxOtherMethods)) Or ($iMaxOtherMethods < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 59)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iPropertyTkn, "ulong*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "ulong*", 0, "ulong*", 0, "ptr", 0, "uint", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[6]))
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxOtherMethods))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iPropertyTkn, "ulong*", 0, "struct*", $tName, "uint", $aCall[6], "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "dword*", 0, "ptr*", 0, "uint*", 0, "ulong*", 0, "ulong*", 0, "struct*", $tTokens, "uint", $iMaxOtherMethods, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iTypeDefTkn = $aCall[3]
	$sPropertyName = DllStructGetData($tName, 1)
	If @error Then $sPropertyName = ""
	$iPropertyFlags = $aCall[7]
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $aCall[9]), $aCall[8])
	$dSignature = DllStructGetData($tSig, 1)
	If @error Then $dSignature = Binary("0x")
	$iDefValueType = $aCall[10]
	Local $tValue
	Switch $aCall[10]
		Case $ELEMENT_TYPE_STRING
			$tValue = DllStructCreate(StringFormat("wchar[%d]", $aCall[12]), $aCall[11])
		Case Else
			$tValue = DllStructCreate($mCorElementTag[$aCall[10]], $aCall[11])
	EndSwitch
	$vDefValue = DllStructGetData($tValue, 1)
	$iMthdTknSetter = $aCall[13]
	$iMthdTknGetter = $aCall[14]
	Local $aTokens[$aCall[17]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, $i + 1)
	Next
	$aMthdTknsOther = $aTokens
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetPropertyProps

Func IMetaDataImport_GetParamProps($pThis, $iParamDefTkn, ByRef $iMethodDefTkn, ByRef $iSequence, ByRef $sParamName, ByRef $iAttribFlags, ByRef $iValueType, ByRef $vValue)
	Local $vFailVal = False
	If BitAND(0xFF000000, $iParamDefTkn) <> $MDT_ParamDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 60)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iParamDefTkn, "ulong*", 0, "uint*", 0, "wstr", "", "uint", 0, "uint*", 0, "dword*", 0, "dword*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tName = DllStructCreate(StringFormat("wchar[%d]", $aCall[7]))
	$aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iParamDefTkn, "ulong*", 0, "uint*", 0, "struct*", $tName, "uint", $aCall[7], "uint*", 0, "dword*", 0, "dword*", 0, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$iMethodDefTkn = $aCall[3]
	$iSequence = $aCall[4]
	$sParamName = DllStructGetData($tName, 1)
	If @error Then $sParamName = ""
	$iAttribFlags = $aCall[8]
	$iValueType = $aCall[9]
	Local $tValue
	Switch $aCall[9]
		Case $ELEMENT_TYPE_STRING
			$tValue = DllStructCreate(StringFormat("wchar[%d]", $aCall[11]), $aCall[10])
		Case Else
			$tValue = DllStructCreate($mCorElementTag[$aCall[9]], $aCall[10])
	EndSwitch
	$vValue = DllStructGetData($tValue, 1)
	Return SetError($aCall[0], 0, True)
EndFunc   ;==>IMetaDataImport_GetParamProps

Func IMetaDataImport_GetCustomAttributeByName($pThis, $iObjectTkn, $sName)
	Local $vFailVal = Binary("0x")
	If $iObjectTkn And (Not IsInt($iObjectTkn)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsString($sName)) Or (Not $sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 61)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iObjectTkn, "wstr", $sName, "ptr*", 0, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Local $tData = DllStructCreate(StringFormat("byte[%d]", $aCall[5]), $aCall[4])
	Local $dData = (@error) ? $vFailVal : DllStructGetData($tData, 1)
	Return SetError($aCall[0], 0, $dData)
EndFunc

Func IMetaDataImport_IsValidToken($pThis, $iToken)
	Local $vFailVal = False
	If $iToken And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 62)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("bool", $pFunc, "ptr", $pThis, "ulong", $iToken)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return ($aCall[0] = True)
EndFunc

Func IMetaDataImport_GetNestedClassProps($pThis, $iTypeDefTkn)
	Local $vFailVal = -1
	If BitAND(0xFF000000, $iTypeDefTkn) <> $MDT_TypeDef Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 63)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iTypeDefTkn, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc

Func IMetaDataImport_GetNativeCallConvFromSig($pThis, $dSignature)
	Local $vFailVal = -1
	If Not IsBinary($dSignature) Or (Not $dSignature) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iSigLen = BinaryLen($dSignature)
	Local $tSig = DllStructCreate(StringFormat("byte[%d]", $iSigLen))
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 64)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "struct*", $tSig, "uint", $iSigLen, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[4])
EndFunc

Func IMetaDataImport_IsGlobal($pThis, $iToken)
	Local $vFailVal
	If $iToken And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, 65)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "bool*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, ($aCall[3] = True))
EndFunc

Func __IMetaDataImport_EnumProc($pThis, $iVTableIdx, ByRef $pEnum, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[5]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>__IMetaDataImport_EnumProc

Func __IMetaDataImport_EnumWithTokenProc($pThis, $iVTableIdx, ByRef $pEnum, $iToken, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iToken, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[6]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>__IMetaDataImport_EnumWithTokenProc

Func __IMetaDataImport_EnumWithTokenAndNameProc($pThis, $iVTableIdx, ByRef $pEnum, $iToken, $sName, $iMaxTokens)
	Local $vFailVal[0]
	If (Not IsPtr($pEnum)) And ($pEnum) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iToken)) Or (Not $iToken) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsInt($iMaxTokens)) Or ($iMaxTokens < 0) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsString($sName)) Or (Not $sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $tTokens = DllStructCreate(StringFormat("ulong[%d]", $iMaxTokens))
	Local $pTokens = DllStructGetPtr($tTokens)
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ptr*", $pEnum, "ulong", $iToken, "wstr", $sName, "ptr", $pTokens, "uint", $iMaxTokens, "uint*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	$pEnum = $aCall[2]
	Local $aTokens[$aCall[6]]
	For $i = 0 To UBound($aTokens) - 1
		$aTokens[$i] = DllStructGetData($tTokens, 1, $i + 1)
	Next
	Return SetError($aCall[0], 0, $aTokens)
EndFunc   ;==>__IMetaDataImport_EnumWithTokenAndNameProc

Func __IMetaDataImport_FindProc($pThis, $iVTableIdx, $iToken, $sName, ByRef $dSignature)
	Local $vFailVal = -1
	If $iToken And (Not IsInt($iToken)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If (Not IsString($sName)) Or (Not $sName) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	If $dSignature And (Not IsBinary($dSignature)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $pFunc = __WinRT_GetFuncAddress($pThis, $iVTableIdx)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	Local $pSig, $iSigLen
	If $dSignature Then
		$iSigLen = BinaryLen($dSignature)
		Local $tSig = DllStructCreate(StringFormat("byte[%d]", $iSigLen))
		DllStructSetData($tSig, 1, $dSignature)
		$pSig = DllStructGetPtr($tSig)
	EndIf
	Local $aCall = DllCallAddress("long", $pFunc, "ptr", $pThis, "ulong", $iToken, "wstr", $sName, "ptr", $pSig, "uint", $iSigLen, "ulong*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[6])
EndFunc   ;==>__IMetaDataImport_FindProc
