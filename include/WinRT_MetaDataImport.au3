#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
;~ #Tidy_Parameters=/sf

#include-Once
#include "WinRT.au3"
#include "Interfaces\IMetaDataDispenser.au3"
#include "Interfaces\IMetaDataImport.au3"

Global Const $sCLSID_CorMetaDataDispenser = "{E5CB7A31-7512-11D2-89CE-0080C792E5D8}"

Global $aCustomAttribTypes[] = ["Windows.Foundation.Metadata.ActivatableAttribute", _
		"Windows.Foundation.Metadata.AllowForWebAttribute", _
		"Windows.Foundation.Metadata.AllowMultipleAttribute", _
		"Windows.Foundation.Metadata.ApiContractAttribute", _
		"Windows.Foundation.Metadata.ApiInformation", _
		"Windows.Foundation.Metadata.AttributeNameAttribute", _
		"Windows.Foundation.Metadata.AttributeTargets", _
		"Windows.Foundation.Metadata.AttributeUsageAttribute", _
		"Windows.Foundation.Metadata.ComposableAttribute", _
		"Windows.Foundation.Metadata.CompositionType", _
		"Windows.Foundation.Metadata.ContractVersionAttribute", _
		"Windows.Foundation.Metadata.CreateFromStringAttribute", _
		"Windows.Foundation.Metadata.DefaultAttribute", _
		"Windows.Foundation.Metadata.DefaultOverloadAttribute", _
		"Windows.Foundation.Metadata.DeprecatedAttribute", _
		"Windows.Foundation.Metadata.DeprecationType", _
		"Windows.Foundation.Metadata.DualApiPartitionAttribute", _
		"Windows.Foundation.Metadata.ExclusiveToAttribute", _
		"Windows.Foundation.Metadata.ExperimentalAttribute", _
		"Windows.Foundation.Metadata.FastAbiAttribute", _
		"Windows.Foundation.Metadata.FeatureAttribute", _
		"Windows.Foundation.Metadata.FeatureStage", _
		"Windows.Foundation.Metadata.GCPressureAmount", _
		"Windows.Foundation.Metadata.GCPressureAttribute", _
		"Windows.Foundation.Metadata.GuidAttribute", _
		"Windows.Foundation.Metadata.HasVariantAttribute", _
		"Windows.Foundation.Metadata.IApiInformationStatics", _
		"Windows.Foundation.Metadata.InternalAttribute", _
		"Windows.Foundation.Metadata.LengthIsAttribute", _
		"Windows.Foundation.Metadata.MarshalingBehaviorAttribute", _
		"Windows.Foundation.Metadata.MarshalingType", _
		"Windows.Foundation.Metadata.MetadataMarshalAttribute", _
		"Windows.Foundation.Metadata.MuseAttribute", _
		"Windows.Foundation.Metadata.NoExceptionAttribute", _
		"Windows.Foundation.Metadata.OverloadAttribute", _
		"Windows.Foundation.Metadata.OverridableAttribute", _
		"Windows.Foundation.Metadata.Platform", _
		"Windows.Foundation.Metadata.PlatformAttribute", _
		"Windows.Foundation.Metadata.PreviousContractVersionAttribute", _
		"Windows.Foundation.Metadata.ProtectedAttribute", _
		"Windows.Foundation.Metadata.RangeAttribute", _
		"Windows.Foundation.Metadata.RemoteAsyncAttribute", _
		"Windows.Foundation.Metadata.StaticAttribute", _
		"Windows.Foundation.Metadata.ThreadingAttribute", _
		"Windows.Foundation.Metadata.ThreadingModel", _
		"Windows.Foundation.Metadata.VariantAttribute", _
		"Windows.Foundation.Metadata.VersionAttribute", _
		"Windows.Foundation.Metadata.WebHostHiddenAttribute"]

Func _MetaData_OpenScope($pDispenser, $sMetaDataFile)
	Local $pIface = IMetaDataDispenser_OpenScope($pDispenser, $sMetaDataFile, $CorOpenFlg_ofRead, $sIID_IMetaDataImport)
	Return SetError(@error, @extended, $pIface)
EndFunc   ;==>_MetaData_OpenScope

Func _MetaData_GetDispenser()
	Local $aCall, $tCLSID, $tIID, $vFailVal = Ptr(0)
	$tCLSID = __WinRT_CreateGUID($sCLSID_CorMetaDataDispenser)
	If Not @error Then $tIID = __WinRT_CreateGUID($sIID_IMetaDataDispenser)
	If @error Then Return SetError(@error, @extended, $vFailVal)
	$aCall = DllCall($__g_hDLLRoMetaData, "long", "MetaDataGetDispenser", "struct*", $tCLSID, "struct*", $tIID, "ptr*", 0)
	If @error Then Return SetError(__WinRT_GetDllError(), 0, $vFailVal)
	Return SetError($aCall[0], 0, $aCall[3])
EndFunc   ;==>_MetaData_GetDispenser

Func _MetaData_GetMetaDataFile($sClassID)
	Local $sFilePath, $pIMetaDataImport2, $iTypeDefTkn
	_WinRT_GetMetaDataFile($sClassID, 0, $sFilePath, $pIMetaDataImport2, $iTypeDefTkn)
	If @error Then Return SetError(@error, @extended, "")
	Return $sFilePath
EndFunc   ;==>_MetaData_GetMetaDataFile


Func _MetaData_EnumModuleRefs($pScope, ByRef $pEnum, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumModuleRefs($pScope, $pEnum, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumModuleRefs($pScope, $pEnum, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc


Func _MetaData_EnumTypeDefs($pScope, ByRef $pEnum, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumTypeDefs($pScope, $pEnum, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumTypeDefs($pScope, $pEnum, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumTypeDefs

Func _MetaData_EnumTypeRefs($pScope, ByRef $pEnum, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumTypeRefs($pScope, $pEnum, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumTypeRefs($pScope, $pEnum, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumTypeRefs

Func _MetaData_EnumMethods($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumMethods($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumMethods($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumMethods

Func _MetaData_EnumFields($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumFields($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumFields($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumFields

Func _MetaData_EnumProperties($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumProperties($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumProperties($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumProperties

Func _MetaData_EnumParams($pScope, ByRef $pEnum, $iMethodDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumParams($pScope, $pEnum, $iMethodDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumParams($pScope, $pEnum, $iMethodDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumParams

Func _MetaData_EnumInterfaceImpls($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumInterfaceImpls($pScope, $pEnum, $iTypeDefTkn, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumInterfaceImpls($pScope, $pEnum, $iTypeDefTkn, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumInterfaceImpls

Func _MetaData_EnumMethodImpls($pScope, ByRef $pEnum, $iTypeDefTkn, $iMaxTokens = 1)
	Local $aBodyTkns, $aDeclTkns, $vFailVal[0]
	IMetaDataImport_EnumMethodImpls($pScope, $pEnum, $iTypeDefTkn, $aBodyTkns, $aDeclTkns, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $vFailVal)
		IMetaDataImport_EnumMethodImpls($pScope, $pEnum, $iTypeDefTkn, $aBodyTkns, $aDeclTkns, $iMaxTokens)
		If @error Then Return SetError($S_False, 0, $vFailVal)
	EndIf
	Local $aTokens[UBound($aBodyTkns)][2]
	For $i = 0 To UBound($aBodyTkns) - 1
		$aTokens[$i][0] = $aBodyTkns[$i]
		$aTokens[$i][1] = $aDeclTkns[$i]
	Next
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumMethodImpls

Func _MetaData_EnumCustomAttributes($pScope, ByRef $pEnum, $iToken, $iTokenType = 0, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumCustomAttributes($pScope, $pEnum, $iToken, $iTokenType, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumCustomAttributes($pScope, $pEnum, $iToken, $iTokenType, $iMaxTokens)
		If @error Then Return SetError($S_False, 0, $aTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumMethodImpls

Func _MetaData_EnumTypeSpecs($pScope, ByRef $pEnum, $iMaxTokens = 1)
	Local $aTokens = IMetaDataImport_EnumTypeSpecs($pScope, $pEnum, ($iMaxTokens = -1) ? 0 : $iMaxTokens)
	If @error = $S_False And $iMaxTokens = -1 Then
		$iMaxTokens = _MetaData_CountEnum($pScope, $pEnum)
		If @error Then Return SetError($S_False, 0, $aTokens)
		$aTokens = IMetaDataImport_EnumTypeSpecs($pScope, $pEnum, $iMaxTokens)
	EndIf
	Return SetError(@error, @extended, $aTokens)
EndFunc   ;==>_MetaData_EnumParams

Func _MetaData_ResetEnum($pScope, $pEnum, $iPos)
	Local $bSuccess = IMetaDataImport_ResetEnum($pScope, $pEnum, $iPos)
	Return SetError(@error, @extended, $bSuccess)
EndFunc   ;==>_MetaData_ResetEnum

Func _MetaData_CloseEnum($pScope, ByRef $pEnum)
	Local $bSuccess = IMetaDataImport_CloseEnum($pScope, $pEnum)
	Return SetError(@error, @extended, $bSuccess)
EndFunc   ;==>_MetaData_CloseEnum

Func _MetaData_CountEnum($pScope, ByRef $pEnum)
	Local $iCount = IMetaDataImport_CountEnum($pScope, $pEnum)
	Return SetError(@error, @extended, $iCount)
EndFunc   ;==>_MetaData_CountEnum

Func _MetaData_FindTypeDef($pScope, $sName, $iEncClassTkn = 0)
	Local $iTypeDefTkn = IMetaDataImport_FindTypeDefByName($pScope, $sName, $iEncClassTkn)
	Return SetError(@error, @extended, $iTypeDefTkn)
EndFunc   ;==>_MetaData_FindTypeDef

Func _MetaData_FindTypeRef($pScope, $sName, $iResScopeTkn = Default)
	If $iResScopeTkn = Default Then
		$iResScopeTkn = IMetaDataImport_GetModuleFromScope($pScope)
		If @error Then SetError(@error, @extended, $iResScopeTkn)
	EndIf
	Local $iTypeRefTkn = IMetaDataImport_FindTypeRef($pScope, $iResScopeTkn, $sName)
	Return SetError(@error, @extended, $iTypeRefTkn)
EndFunc   ;==>_MetaData_FindTypeRef

Func _MetaData_FindMember($pScope, $sName, $dSig = 0)
	Local $iMemberTkn = -1
	SetError($ERROR_INVALID_PARAMETER)
	If _MetaData_IsTypeDefTkn Then
		$iMemberTkn = IMetaDataImport_FindMember($pScope, $sName, $dSig)
	ElseIf _MetaData_IsTypeRefTkn Then
		$iMemberTkn = IMetaDataImport_FindMemberRef($pScope, $sName, $dSig)
	EndIf
	Return SetError(@error, @extended, $iMemberTkn)
EndFunc

Func _MetaData_GetNestedClassProps($pScope, $iTypeDefTkn)
	Local $iEnclTypeDefTkn = IMetaDataImport_GetNestedClassProps($pScope, $iTypeDefTkn)
	Return SetError(@error, @extended, $iEnclTypeDefTkn)
EndFunc


Func _MetaData_GetTypeDefProps($pScope, $iTypeDefTkn)
	Local $sTypeName, $iFlags, $iExtendsTkn
	IMetaDataImport_GetTypeDefProps($pScope, $iTypeDefTkn, $sTypeName, $iFlags, $iExtendsTkn)
	Local $aProps[] = [$sTypeName, $iFlags, $iExtendsTkn]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetTypeDefProps

Func _MetaData_GetTypeRefProps($pScope, $iTypeRefTkn)
	Local $iResScopeTkn, $sTypeName
	IMetaDataImport_GetTypeRefProps($pScope, $iTypeRefTkn, $iResScopeTkn, $sTypeName)
	Local $aProps[] = [$iResScopeTkn, $sTypeName]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetTypeRefProps

Func _MetaData_GetScopeProps($pScope)
	Local $sName, $sVersionGUID
	IMetaDataImport_GetScopeProps($pScope, $sName, $sVersionGUID)
	Local $aProps[] = [$sName, $sVersionGUID]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetScopeProps

Func _MetaData_GetMethodProps($pScope, $iMethodDefTkn)
	Local $iTypeDefTkn, $sMethodName, $iAttribFlags, $dSignature, $iRelVAddress, $iImplFlags
	IMetaDataImport_GetMethodProps($pScope, $iMethodDefTkn, $iTypeDefTkn, $sMethodName, $iAttribFlags, $dSignature, $iRelVAddress, $iImplFlags)
	Local $aProps[] = [$iTypeDefTkn, $sMethodName, $iAttribFlags, $dSignature, $iRelVAddress, $iImplFlags]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetMethodProps

Func _MetaData_GetFieldProps($pScope, $iFieldDefTkn)
	Local $iTypeDefTkn, $sFieldName, $iAttribFlags, $dSignature, $iValType, $vValue
	IMetaDataImport_GetFieldProps($pScope, $iFieldDefTkn, $iTypeDefTkn, $sFieldName, $iAttribFlags, $dSignature, $iValType, $vValue)
	Local $aProps[] = [$iTypeDefTkn, $sFieldName, $iAttribFlags, $dSignature, $iValType, $vValue]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetFieldProps

Func _MetaData_GetPropertyProps($pScope, $iPropertyDefTkn)
	Local $iTypeDefTkn, $sPropertyName, $iPropertyFlags, $dSignature, $iDefValueType, $dDefValue, $iMthdTknSetter, $iMthdTknGetter, $aMthdTknsOther, $iMaxOtherMethods = 10
	IMetaDataImport_GetPropertyProps($pScope, $iPropertyDefTkn, $iTypeDefTkn, $sPropertyName, $iPropertyFlags, $dSignature, $iDefValueType, $dDefValue, $iMthdTknSetter, $iMthdTknGetter, $aMthdTknsOther, $iMaxOtherMethods)
	Local $aProps[] = [$iTypeDefTkn, $sPropertyName, $iPropertyFlags, $dSignature, $iDefValueType, $dDefValue, $iMthdTknSetter, $iMthdTknGetter, $aMthdTknsOther]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetPropertyProps

Func _MetaData_GetParamProps($pScope, $iParamDefTkn)
	Local $iMethodDefTkn, $iSequence, $sParamName, $iAttribFlags, $iValueType, $vValue
	IMetaDataImport_GetParamProps($pScope, $iParamDefTkn, $iMethodDefTkn, $iSequence, $sParamName, $iAttribFlags, $iValueType, $vValue)
	Local $aProps[] = [$iMethodDefTkn, $iSequence, $sParamName, $iAttribFlags, $iValueType, $vValue]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetParamProps

Func _MetaData_GetInterfaceImplsProps($pScope, $iTypeDefTkn)
	Local $iClassToken, $iIfaceToken
	IMetaDataImport_GetInterfaceImplProps($pScope, $iTypeDefTkn, $iClassToken, $iIfaceToken)
	Local $aProps[] = [$iClassToken, $iIfaceToken]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetInterfaceImplsProps

Func _MetaData_GetMemberRefProps($pScope, $iMemberRefTkn)
	Local $iTypeTkn, $sMemberName, $dSignature
	IMetaDataImport_GetMemberRefProps($pScope, $iMemberRefTkn, $iTypeTkn, $sMemberName, $dSignature)
	Local $aProps[] = [$iTypeTkn, $sMemberName, $dSignature]
	Return SetError(@error, @extended, $aProps)
EndFunc

Func _MetaData_GetCustomAttributeProps($pScope, $iCustomAttribTkn)
	Local $iObjectTkn, $iTypeTkn, $dValue
	IMetaDataImport_GetCustomAttributeProps($pScope, $iCustomAttribTkn, $iObjectTkn, $iTypeTkn, $dValue)
	Local $aProps[] = [$iObjectTkn, $iTypeTkn, $dValue]
	Return SetError(@error, @extended, $aProps)
EndFunc   ;==>_MetaData_GetMemberRefProps

Func _MetaData_GetTypeSpecFromToken($pScope, $iTypeSpecTkn)
	Local $dBlob = IMetaDataImport_GetTypeSpecFromToken($pScope, $iTypeSpecTkn)
	Return SetError(@error, @extended, $dBlob)
EndFunc   ;==>_MetaData_GetTypeSpecFromToken

Func _MetaData_GetParamForMethodIndex($pScope, $iMethodDefTkn, $iSequence)
	Local $iParamTkn = IMetaDataImport_GetParamForMethodIndex($pScope, $iMethodDefTkn, $iSequence)
	Return SetError(@error, @extended, $iParamTkn)
EndFunc   ;==>_MetaData_GetParamForMethodIndex

Func _MetaData_GetMethodSemantics($pScope, $iMethodDefTkn, $iEventPropTkn)
	Local $iMethodSemanticsTkn = IMetaDataImport_GetMethodSemantics($pScope, $iMethodDefTkn, $iEventPropTkn)
	Return SetError(@error, @extended, $iMethodSemanticsTkn)
EndFunc   ;==>_MetaData_GetMethodSemantics

Func _MetaData_GetCustomAttributeByName($pScope, $iToken, $sName)
	Local $dBlob = IMetaDataImport_GetCustomAttributeByName($pScope, $iToken, $sName)
	Return SetError(@error, @extended, $dBlob)
EndFunc

;~ Func _MetaData_DecodeCustAttrib($pScope, $iTypeToken, $dBlob)
;~ 	Local $vFailVal
;~ 	If (Not IsBinary($dBlob)) Or (Not BinaryLen($dBlob)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
;~ 	Local $iReadPtr = 3 ;CustAttrib begins with 01 as 16bit little-endian i.e. (0x0100)
;~ 	Local $aTypeProps, $dMethodSig
;~ 	;Find out what this is via .ctor MethodSig
;~ 	Switch BitAND(0xFF000000, $iTypeToken)
;~ 		Case $MDT_MemberRef
;~ 			$aTypeProps = _MetaData_GetMemberRefProps($pScope, $iTypeToken)
;~ 			If @error Then Return SetError(@error, @extended, $vFailVal)
;~ 			$dMethodSig = $aTypeProps[2]
;~ 		Case $MDT_MethodDef
;~ 			$aTypeProps = _MetaData_GetMethodProps($pScope, $iTypeToken)
;~ 			$dMethodSig = $aTypeProps[3]
;~ 		Case Else
;~ 			Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
;~ 	EndSwitch
;~ 	Local $aAttribType = _MetaData_DecodeMethodDefSig($pScope, $dMethodSig)
;~ 	If @error Then Return SetError(@error, @extended, $vFailVal)
;~ 	Return SetError(@error, @extended, $vFailVal)
;~ EndFunc   ;==>_MetaData_DecodeTypeSpec

Func _MetaData_GetGUIDAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.GuidAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Return __WinRT_ReadGUIDAt(Ptr(DllStructGetPtr($tBuff) + 2))
EndFunc

Func _MetaData_GetThreadingAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ThreadingAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Return Int(BinaryMid($dAttrib, 3, 4))
EndFunc

Func _MetaData_GetMarshalingBehaviorAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.MarshalingBehaviorAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Return Int(BinaryMid($dAttrib, 3, 4))
EndFunc

Func _MetaData_GetContractVersionAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ContractVersionAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iContractStrLen = Int(BinaryMid($dAttrib, 3, 1)) ;Cheating here - String is UTF8
	Local $tContractVers = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d];ulong", $iContractStrLen), DllStructGetPtr($tBuff))
	Local $aProps[2] = [DllStructGetData($tContractVers, 3), DllStructGetData($tContractVers, 4)]
	Return $aProps
EndFunc

Func _MetaData_GetActivatableAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ActivatableAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iTypeStrLen = Int(BinaryMid($dAttrib, 3, 1))
	Local $iPlatformStrLen = Int(BinaryMid($dAttrib, 8 + $iTypeStrLen, 1))
	Local $tStatic = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d];ulong;char;char[%d]", $iTypeStrLen, $iPlatformStrLen), DllStructGetPtr($tBuff))
	Local $aProps[3] = [DllStructGetData($tStatic, 3), DllStructGetData($tStatic, 4), DllStructGetData($tStatic, 6)]
	Return $aProps
EndFunc


Func _MetaData_GetStaticAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.StaticAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iTypeStrLen = Int(BinaryMid($dAttrib, 3, 1))
	Local $iContractStrLen = Int(BinaryMid($dAttrib, 8 + $iTypeStrLen, 1))
	Local $tStatic = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d];ulong;char;char[%d]", $iTypeStrLen, $iContractStrLen), DllStructGetPtr($tBuff))
	Local $aProps[3] = [DllStructGetData($tStatic, 3), DllStructGetData($tStatic, 4), DllStructGetData($tStatic, 6)]
	Return $aProps
EndFunc


Func _MetaData_GetStaticAttribNames($pScope, $iToken)
	Local $pEnum, $aAttrib, $aAttribProps, $aMemRefProps
	If @error Then Return SetError(@error, @extended, "")
	Local $aNames[0], $iCnt, $dAttrib
	Local $tBuff, $iTypeStrLen, $iContractStrLen, $tStatic
	While 1
		$aAttrib = _MetaData_EnumCustomAttributes($pScope, $pEnum, $iToken, 0)
		If @error Then ExitLoop
		$aAttribProps = _MetaData_GetCustomAttributeProps($pScope, $aAttrib[0])
		If Not @error Then $aMemRefProps = _MetaData_GetMemberRefProps($pScope, $aAttribProps[1])
		If @error Then ContinueLoop
		If _MetaData_GetTokenName($pScope, $aMemRefProps[0]) <> "Windows.Foundation.Metadata.StaticAttribute" Then ContinueLoop
		$dAttrib = $aAttribProps[2]
		$tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
		DllStructSetData($tBuff, 1, $dAttrib)
		$iTypeStrLen = Int(BinaryMid($dAttrib, 3, 1))
		$iContractStrLen = Int(BinaryMid($dAttrib, 8 + $iTypeStrLen, 1))
		$tStatic = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d];ulong;char;char[%d]", $iTypeStrLen, $iContractStrLen), DllStructGetPtr($tBuff))
		ReDim $aNames[$iCnt + 1]
		$aNames[$iCnt] = DllStructGetData($tStatic, 3)
		$iCnt += 1
	WEnd
	_MetaData_CloseEnum($pScope, $pEnum)
	Return $aNames
EndFunc


Func _MetaData_GetComposableAttibuteType($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ComposableAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iTypeStrLen = Int(BinaryMid($dAttrib, 3, 1))
	Local $tType = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d]", $iTypeStrLen), DllStructGetPtr($tBuff))
	Return DllStructGetData($tType, 3)
EndFunc


Func _MetaData_GetExcusiveToAttrib($pScope, $iToken)
	Local $dAttrib = _MetaData_GetCustomAttributeByName($pScope, $iToken, "Windows.Foundation.Metadata.ExclusiveToAttribute")
	If @error Then Return SetError(@error, @extended, "")
	Local $tBuff = DllStructCreate(StringFormat("byte[%d]", BinaryLen($dAttrib)))
	DllStructSetData($tBuff, 1, $dAttrib)
	Local $iTypeStrLen = Int(BinaryMid($dAttrib, 3, 1))
	Local $tType = DllStructCreate(StringFormat("align 1;byte[2];char;char[%d]", $iTypeStrLen), DllStructGetPtr($tBuff))
	Return DllStructGetData($tType, 3)
EndFunc

Func _MetaData_DecodeTypeSpec($pScope, $dBlob)
	Local $vFailVal = Binary("0x")
	If (Not IsBinary($dBlob)) Or (Not BinaryLen($dBlob)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	Local $iReadPtr = 1
	Local $sType = __MetaData_ReadSigDataType($pScope, $dBlob, $iReadPtr)
	Return SetError(@error, @extended, $sType)
EndFunc   ;==>_MetaData_DecodeTypeSpec

Func _MetaData_DecodeMethodDefSig($pScope, $dSig)
	Local $vFailVal[0]
	Local $iReadPtr = 1 ;, $bHasThis, $bExplicitThis
	;Local $iCallConv, $iGenParamCount
	If (Not IsBinary($dSig)) Or (Not BinaryLen($dSig)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	;Local $iByte1 = Int(BinaryMid($dSig, $iRdPtr, 1))
	$iReadPtr += 1
	;If BitAND($iByte1, 0x20) Then $bHasThis = True
	;If BitAND($iByte1, 0x40) Then $bExplicitThis = True
	;$iCallConv = BitAND($iByte1, 0x1F)
	;If $iCallConv = 0x10 Then $iGenParamCount = __MetaData_ReadCompressedInt($dSig, $iRdPtr, False)
	Local $iParamCount = __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)
	Local $aParams[$iParamCount + 1][2]
	For $i = 0 To UBound($aParams) - 1
		$aParams[$i][1] = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr)
		$aParams[$i][0] = @extended
	Next

	Return $aParams
EndFunc   ;==>_MetaData_DecodeMethodDefSig

Func _MetaData_DecodePropertySig($pScope, $dSig)
	Local $vFailVal[0]
	Local $iReadPtr = 1 ;, $bHasThis
	If (Not IsBinary($dSig)) Or (Not BinaryLen($dSig)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	;Local $iByte1 = Int(BinaryMid($dSig, $iRdPtr, 1))
	$iReadPtr += 1 ;Fist byte is always 0x08 or 0x28 (HASTHIS|PROPERTY)
	;If BitAND($iByte1, 0x20) Then $bHasThis = True
	Local $iParamCount = __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)
	Local $aParams[$iParamCount + 1][2]
	For $i = 0 To UBound($aParams) - 1
		$aParams[$i][1] = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr)
		$aParams[$i][0] = @extended
	Next
	Return $aParams
EndFunc   ;==>_MetaData_DecodePropertySig

Func _MetaData_DecodeFieldSig($pScope, $dSig)
	Local $vFailVal[0], $aParams[1][2]
	Local $iReadPtr = 1
	If (Not IsBinary($dSig)) Or (Not BinaryLen($dSig)) Then Return SetError($ERROR_INVALID_PARAMETER, 0, $vFailVal)
	$iReadPtr += 1 ;First byte is always 0x06
	$aParams[0][1] = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr)
	$aParams[0][0] = @extended

	Return $aParams
EndFunc   ;==>_MetaData_DecodeFieldSig

Func __MetaData_ReadSigDataType($pScope, ByRef $dSig, ByRef $iReadPtr)
	Local $iDataType, $sDataType
	Local $iToken, $iTokenType, $aTokenProps
	Local $iGenInstArgCount

	$iDataType = Int(BinaryMid($dSig, $iReadPtr, 1))
	$iReadPtr += 1
	Switch $iDataType
		Case $ELEMENT_TYPE_VOID
			$sDataType = "void"
		Case 0x02 To 0x0E
			$sDataType = $mCorElementTag[$iDataType]

		Case $ELEMENT_TYPE_BYREF
			$sDataType = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr) & "*"

		Case $ELEMENT_TYPE_VALUETYPE, $ELEMENT_TYPE_CLASS, $ELEMENT_TYPE_CMOD_OPT, $ELEMENT_TYPE_CMOD_REQ
			$iToken = __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)
			$iTokenType = BitAND($iToken, 0x03)
			$iToken = BitShift($iToken, 2)
			Switch $iTokenType
				Case 0
					$iToken = BitOR($MDT_TypeDef, $iToken)
					$aTokenProps = _MetaData_GetTypeDefProps($pScope, $iToken)
					$sDataType = $aTokenProps[1]
				Case 1
					$iToken = BitOR($MDT_TypeRef, $iToken)
					$aTokenProps = _MetaData_GetTypeRefProps($pScope, $iToken)
					$sDataType = $aTokenProps[1]; & " " & Hex($iToken, 8) & " " & $iReadPtr
				Case 2
					$iToken = BitOR($MDT_TypeSpec, $iToken)
					$sDataType = "TypeSpec 0x" & Hex($iToken, 8)

			EndSwitch

		Case $ELEMENT_TYPE_GENERICINST
			$sDataType = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr) & "<"
			$iGenInstArgCount = __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)

			For $i = 0 To $iGenInstArgCount - 1
				$sDataType &= __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr) & ", "
			Next
			$sDataType = StringTrimRight($sDataType, 2) & ">"

		Case $ELEMENT_TYPE_SZARRAY
			$sDataType = __MetaData_ReadSigDataType($pScope, $dSig, $iReadPtr) & "[]"
			;MsgBox(0, "", $sDataType)

		Case $ELEMENT_TYPE_I
			$sDataType = "System.IntPtr"

		Case $ELEMENT_TYPE_U
			$sDataType = "System.UIntPtr"

		Case $ELEMENT_TYPE_OBJECT
			$sDataType = "System.Object"

		Case $ELEMENT_TYPE_VAR
			$sDataType = "var" & __MetaData_ReadCompressedInt($dSig, $iReadPtr, False)

		Case Else
			;;Not Supportes
			Return SetError($ERROR_NOT_SUPPORTED, $iDataType, Binary("0x"))
;~ 			ConsoleWrite(Hex($iDataType) & " " & $dSig & " " & $iReadPtr & @CRLF)
;~ 			MsgBox(0, "", $dSig)

	EndSwitch
	Return SetExtended($iDataType, $sDataType)

EndFunc   ;==>__MetaData_ReadSigDataType

Func __MetaData_ReadCompressedInt(ByRef $dSig, ByRef $iReadPtr, $bSigned)
	Local $iByte1 = Int(BinaryMid($dSig, $iReadPtr, 1))
	Local $iCmprLen = 1
	If BitAND(0x80, $iByte1) Then $iCmprLen = (BitAND(0x40, $iByte1)) ? 4 : 2
	Local $tIntBuff = DllStructCreate("byte[4]")
	For $i = $iCmprLen To 1 Step -1
		DllStructSetData($tIntBuff, 1, BinaryMid($dSig, $iReadPtr, 1), $i)
		$iReadPtr += 1
	Next
	Local $iInt = Int(DllStructGetData($tIntBuff, 1))
	Local $iLenBits = Log($iCmprLen) / Log(2) + 1
	Local $iValMask = Int(2 ^ (8 * $iCmprLen - $iLenBits) - 1, 1)

	$iInt = BitAND($iValMask, $iInt)

	If $bSigned Then
		Local $iNeg = BitAND($iInt, 1)
		$iInt = BitShift($iInt, 1)
		$iValMask = BitShift($iValMask, 1)
		If $iNeg Then $iInt = BitOR(BitNOT($iValMask), $iInt)
	EndIf

	Return $iInt
EndFunc   ;==>__MetaData_ReadCompressedInt

Func _MetaData_IsTypeDefTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_TypeDef)
EndFunc   ;==>_MetaData_IsTypeDefTkn

Func _MetaData_IsTypeRefTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_TypeRef)
EndFunc   ;==>_MetaData_IsTypeRefTkn

Func _MetaData_IsTypeSpecTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_TypeSpec)
EndFunc   ;==>_MetaData_IsTypeSpecTkn

Func _MetaData_IsModuleTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_Module)
EndFunc   ;==>_MetaData_IsModuleTkn

Func _MetaData_IsAssemblyTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_Assembly)
EndFunc   ;==>_MetaData_IsAssemblyTkn

Func _MetaData_IsPropertyTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_Property)
EndFunc   ;==>_MetaData_IsPropertyTkn

Func _MetaData_IsMethodDefTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_MethodDef)
EndFunc   ;==>_MetaData_IsMethodDefTkn

Func _MetaData_IsFieldDefTkn($iToken)
	Return (BitAND($iToken, 0xFF000000) = $MDT_FieldDef)
EndFunc   ;==>_MetaData_IsFieldDefTkn

Func _MetaData_GetTokenName($pScope, $iToken)
	Local $aProps, $vFailVal = ""
	Switch BitAND($iToken, 0xFF000000)
		Case $MDT_TypeDef
			$aProps = _MetaData_GetTypeDefProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[0])
		Case $MDT_TypeRef
			$aProps = _MetaData_GetTypeRefProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_Property
			$aProps = _MetaData_GetPropertyProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_MethodDef
			$aProps = _MetaData_GetMethodProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_FieldDef
			$aProps = _MetaData_GetFieldProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])
		Case $MDT_ParamDef
			$aProps = _MetaData_GetParamProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[2])
		Case $MDT_MemberRef
			$aProps = _MetaData_GetMemberRefProps($pScope, $iToken)
			Return SetError(@error, @extended, (@error) ? $vFailVal : $aProps[1])

	EndSwitch
EndFunc   ;==>_MetaData_GetTokenName

