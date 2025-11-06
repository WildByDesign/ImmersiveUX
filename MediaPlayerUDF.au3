#Tidy_Parameters=/sf

#include <MediaPlayerUDF_Core.au3>

Global $__g_pWindowsXamlManager, $__g_apXamlSources[1], $__g_apMPElements[1], $__g_apPlayers[1], $__g_aiDelegateTkns[1][10], $__g_asCallbacks[1][10]
Global $__g_pHdlr_MediaOpened, $__g_pHdlr_MediaFailed, $__g_pHdlr_MediaEnded, $__g_pHdlr_StateChanged
Global Enum $iMediaOpenedDgt, $iMediaFailedDgt, $iMediaEndedDgt, $iStateChangedDgt

Func __MediaPlayer_GetTransport($iMPIdx)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apMPElements[$iMPIdx], $sIID_IMediaPlayerElement)
	If Not @error Then $pTransport = IMediaPlayerElement_GetTransportControls($__g_apMPElements[$iMPIdx])
	Return SetError(@error, @extended, $pTransport)
EndFunc   ;==>__MediaPlayer_GetTransport

Func __MediaPlayer_MediaEnded($pThis, $pSender, $pArgs)
	_WinRT_SwitchInterface($pSender, $sIID_IMediaPlayer)

	For $i = 1 To UBound($__g_apPlayers) - 1
		_WinRT_SwitchInterface($__g_apPlayers[$i], $sIID_IMediaPlayer)
		If @error Then ContinueLoop
		If $pSender = $__g_apPlayers[$i] Then ExitLoop
	Next
	If $i = UBound($__g_apPlayers) Then Return
	If Not $__g_asCallbacks[$i][$iMediaEndedDgt] Then Return

	Execute(StringFormat("%s(%d)", $__g_asCallbacks[$i][$iMediaEndedDgt], $i))
EndFunc   ;==>__MediaPlayer_MediaEnded

Func __MediaPlayer_MediaFailed($pThis, $pSender, $pArgs)
	_WinRT_SwitchInterface($pSender, $sIID_IMediaPlayer)

	For $i = 1 To UBound($__g_apPlayers) - 1
		_WinRT_SwitchInterface($__g_apPlayers[$i], $sIID_IMediaPlayer)
		If @error Then ContinueLoop
		If $pSender = $__g_apPlayers[$i] Then ExitLoop
	Next
	If $i = UBound($__g_apPlayers) Then Return
	If Not $__g_asCallbacks[$i][$iMediaFailedDgt] Then Return

	Execute(StringFormat("%s(%d, %d)", $__g_asCallbacks[$i][$iMediaFailedDgt], $i, IMediaPlayerFailedEventArgs_GetError($pArgs)))
EndFunc   ;==>__MediaPlayer_MediaFailed

Func __MediaPlayer_MediaOpened($pThis, $pSender, $pArgs)
	_WinRT_SwitchInterface($pSender, $sIID_IMediaPlayer)

	For $i = 1 To UBound($__g_apPlayers) - 1
		_WinRT_SwitchInterface($__g_apPlayers[$i], $sIID_IMediaPlayer)
		If @error Then ContinueLoop
		If $pSender = $__g_apPlayers[$i] Then ExitLoop
	Next
	If $i = UBound($__g_apPlayers) Then Return
	If Not $__g_asCallbacks[$i][$iMediaOpenedDgt] Then Return

	Execute(StringFormat("%s(%d)", $__g_asCallbacks[$i][$iMediaOpenedDgt], $i))
EndFunc   ;==>__MediaPlayer_MediaOpened

Func __MediaPlayer_StateChanged($pThis, $pSender, $pArgs)
	_WinRT_SwitchInterface($pSender, $sIID_IMediaPlayer)

	For $i = 1 To UBound($__g_apPlayers) - 1
		_WinRT_SwitchInterface($__g_apPlayers[$i], $sIID_IMediaPlayer)
		If @error Then ContinueLoop
		If $pSender = $__g_apPlayers[$i] Then ExitLoop
	Next
	If $i = UBound($__g_apPlayers) Then Return
	If Not $__g_asCallbacks[$i][$iStateChangedDgt] Then Return

	Execute(StringFormat("%s(%d)", $__g_asCallbacks[$i][$iStateChangedDgt], $i))
EndFunc   ;==>__MediaPlayer_StateChanged

Func _MediaPlayer_AutoHideTransport($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls3_SetShowAndHideAutomatically($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_AutoHideTransport

Func _MediaPlayer_ClosePlayer($iMPIdx)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False

	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then
		IMediaPlayer_RemoveHdlrMediaOpened($__g_apPlayers[$iMPIdx], $__g_aiDelegateTkns[$iMPIdx][$iMediaOpenedDgt])
		IMediaPlayer_RemoveHdlrMediaFailed($__g_apPlayers[$iMPIdx], $__g_aiDelegateTkns[$iMPIdx][$iMediaFailedDgt])
		IMediaPlayer_RemoveHdlrMediaEnded($__g_apPlayers[$iMPIdx], $__g_aiDelegateTkns[$iMPIdx][$iMediaEndedDgt])
		IMediaPlayer_RemoveHdlrCurrentStateChanged($__g_apPlayers[$iMPIdx], $__g_aiDelegateTkns[$iMPIdx][$iStateChangedDgt])
	EndIf

	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IClosable)
	If Not @error Then IClosable_Close($__g_apPlayers[$iMPIdx])
	If Not @error Then $__g_apPlayers[$iMPIdx] = 0

	_WinRT_SwitchInterface($__g_apMPElements[$iMPIdx], $sIID_IClosable)
	If Not @error Then IClosable_Close($__g_apMPElements[$iMPIdx])
	If Not @error Then $__g_apMPElements[$iMPIdx] = 0

	_WinRT_SwitchInterface($__g_apXamlSources[$iMPIdx], $sIID_IClosable)
	If Not @error Then IClosable_Close($__g_apXamlSources[$iMPIdx])
	If Not @error Then $__g_apXamlSources[$iMPIdx] = 0
EndFunc   ;==>_MediaPlayer_ClosePlayer

Func _MediaPlayer_Create($hGUI, $ix, $iy, $iw, $ih)
	If Not $__g_pWindowsXamlManager Then Return -1

	Local $iErr, $iExt
	Local $iMPIdx = UBound($__g_apXamlSources)
	ReDim $__g_apXamlSources[$iMPIdx + 1]
	ReDim $__g_apMPElements[$iMPIdx + 1]
	ReDim $__g_apPlayers[$iMPIdx + 1]
	ReDim $__g_aiDelegateTkns[$iMPIdx + 1][10]
	ReDim $__g_asCallbacks[$iMPIdx + 1][10]

	Local $pXamlSrc_Fact = _WinRT_GetActivationFactory("Windows.UI.Xaml.Hosting.DesktopWindowXamlSource", $sIID_IDesktopWindowXamlSourceFactory)
	If @error Then Return SetError(@error, @extended, -1)
	Local $pInner
	$__g_apXamlSources[$iMPIdx] = IDesktopWindowXamlSourceFactory_CreateInstance($pXamlSrc_Fact, 0, $pInner)
	$iErr = @error
	$iExt = @extended
	IUnknown_Release($pXamlSrc_Fact)
	If $iErr Then Return SetError($iErr, $iExt, -1)

	Local $pMPElement_Fact = _WinRT_GetActivationFactory("Windows.UI.Xaml.Controls.MediaPlayerElement", $sIID_IMediaPlayerElementFactory)
	$__g_apMPElements[$iMPIdx] = IMediaPlayerElementFactory_CreateInstance($pMPElement_Fact, 0, $pInner)
	$iErr = @error
	$iExt = @extended
	IUnknown_Release($pMPElement_Fact)
	If $iErr Then
		_MediaPlayer_ClosePlayer($iMPIdx)
		Return SetError($iErr, $iExt, -1)
	EndIf

	$__g_apPlayers[$iMPIdx] = _WinRT_ActivateInstance("Windows.Media.Playback.MediaPlayer")
	$iErr = @error
	$iExt = @extended
	If $iErr Then
		_MediaPlayer_ClosePlayer($iMPIdx)
		Return SetError($iErr, $iExt, -1)
	EndIf

	IDesktopWindowXamlSource_SetContent($__g_apXamlSources[$iMPIdx], $__g_apMPElements[$iMPIdx]) ;Attach control to the container.
	If Not @error Then IMediaPlayerElement_SetMediaPlayer($__g_apMPElements[$iMPIdx], $__g_apPlayers[$iMPIdx])
	If @error Then
		_MediaPlayer_ClosePlayer($iMPIdx)
		Return SetError($iErr, $iExt, -1)
	EndIf

	_WinRT_SwitchInterface($__g_apXamlSources[$iMPIdx], $sIID_IDesktopWindowXamlSourceNative)
	If Not @error Then IDesktopWindowXamlSourceNative_AttachToWindow($__g_apXamlSources[$iMPIdx], $hGUI)
	If @error Then
		_MediaPlayer_ClosePlayer($iMPIdx)
		Return SetError($iErr, $iExt, -1)
	EndIf

	Local $hIsland = _MediaPlayer_GetIslandHwnd($iMPIdx)
	_WinAPI_SetWindowPos($hIsland, $HWND_TOP, $ix, $iy, $iw, $ih, $SWP_SHOWWINDOW)

	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then
		$__g_aiDelegateTkns[$iMPIdx][$iMediaOpenedDgt] = IMediaPlayer_AddHdlrMediaOpened($__g_apPlayers[$iMPIdx], $__g_pHdlr_MediaOpened)
		$__g_aiDelegateTkns[$iMPIdx][$iMediaFailedDgt] = IMediaPlayer_AddHdlrMediaFailed($__g_apPlayers[$iMPIdx], $__g_pHdlr_MediaFailed)
		$__g_aiDelegateTkns[$iMPIdx][$iMediaEndedDgt] = IMediaPlayer_AddHdlrMediaEnded($__g_apPlayers[$iMPIdx], $__g_pHdlr_MediaEnded)
		$__g_aiDelegateTkns[$iMPIdx][$iStateChangedDgt] = IMediaPlayer_AddHdlrCurrentStateChanged($__g_apPlayers[$iMPIdx], $__g_pHdlr_StateChanged)
	EndIf

	Return $iMPIdx
EndFunc   ;==>_MediaPlayer_Create

Func _MediaPlayer_EnableTransport($iMPIdx, $bState = True)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apMPElements[$iMPIdx], $sIID_IMediaPlayerElement)
	If Not @error Then IMediaPlayerElement_SetAreTransportControlsEnabled($__g_apMPElements[$iMPIdx], $bState)
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_EnableTransport

Func _MediaPlayer_GetAutoPlay($iMPIdx)
	Local $bState
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apMPElements[$iMPIdx], $sIID_IMediaPlayerElement)
	If Not @error Then $bState = IMediaPlayerElement_GetAutoPlay($__g_apMPElements[$iMPIdx])
	Return SetError(@error, @extended, $bState)
EndFunc   ;==>_MediaPlayer_GetAutoPlay

Func _MediaPlayer_GetCurrentState($iMPIdx, $bAsString = False)
	Local $iState, $sMsg
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $iState = IMediaPlayer_GetCurrentState($__g_apPlayers[$iMPIdx])
	If @error Then Return SetError(@error, @extended, -1)
	If $bAsString Then
		$sMsg = _WinRT_GetEnum($mMediaPlayerState, $iState)
		Return SetExtended($iState, $sMsg)
	EndIf
	Return $iState
EndFunc   ;==>_MediaPlayer_GetCurrentState

Func _MediaPlayer_GetDuration($iMPIdx)
	Local $iDuration
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $iDuration = IMediaPlayer_GetNaturalDuration($__g_apPlayers[$iMPIdx])
	Return SetError(@error, @extended, $iDuration)
EndFunc   ;==>_MediaPlayer_GetDuration

Func _MediaPlayer_GetIsCompact($iMPIdx)
	Local $bState, $iErr, $iExt
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	$bState = IMediaTransportControls_GetIsCompact($pTransport)
	$iErr = @error
	$iExt = @extended
	IUnknown_Release($pTransport)
	Return SetError($iErr, $iExt, $bState)
EndFunc   ;==>_MediaPlayer_GetIsCompact

Func _MediaPlayer_GetIslandHwnd($iMPIdx)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return -1

	_WinRT_SwitchInterface($__g_apXamlSources[$iMPIdx], $sIID_IDesktopWindowXamlSourceNative)
	If @error Then Return SetError(@error, @extended, -1)

	Local $hIsland = IDesktopWindowXamlSourceNative_GetWindowHandle($__g_apXamlSources[$iMPIdx])
	Return SetError(@error, @extended, (@error) ? -1 : $hIsland)
EndFunc   ;==>_MediaPlayer_GetIslandHwnd

Func _MediaPlayer_GetIsLooping($iMPIdx)
	Local $bState
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $bState = IMediaPlayer_GetIsLoopingEnabled($__g_apPlayers[$iMPIdx])
	Return SetError(@error, @extended, $bState)
EndFunc   ;==>_MediaPlayer_GetIsLooping

Func _MediaPlayer_GetIsMuted($iMPIdx)
	Local $bState
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $bState = IMediaPlayer_GetIsMuted($__g_apPlayers[$iMPIdx])
	Return SetError(@error, @extended, $bState)
EndFunc   ;==>_MediaPlayer_GetIsMuted

Func _MediaPlayer_GetPlaybackRate($iMPIdx)
	Local $fRate
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $fRate = IMediaPlayer_GetPlaybackRate($__g_apPlayers[$iMPIdx])
	Return SetError(@error, @extended, $fRate)
EndFunc   ;==>_MediaPlayer_GetPlaybackRate

Func _MediaPlayer_GetPosition($iMPIdx)
	Local $iPos
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $iPos = IMediaPlayer_GetPosition($__g_apPlayers[$iMPIdx])
	If @error Then Return SetError(@error, @extended, -1)
	Return $iPos
EndFunc   ;==>_MediaPlayer_GetPosition

Func _MediaPlayer_GetVolume($iMPIdx)
	Local $fVol
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $fVol = IMediaPlayer_GetVolume($__g_apPlayers[$iMPIdx])
	Return SetError(@error, @extended, $fVol)
EndFunc   ;==>_MediaPlayer_GetVolume

Func _MediaPlayer_HideTransport($iMPIdx)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls3_Hide($pTransport)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_HideTransport

Func _MediaPlayer_Init()
	Local $iErr, $iExt

	_WinRT_Startup()
	If @error Then Return SetError(@error, @extended, False)
	OnAutoItExitRegister("_WinRT_Shutdown")

	Local $pXamlMgr_Fact = _WinRT_GetActivationFactory("Windows.UI.Xaml.Hosting.WindowsXamlManager", $sIID_IWindowsXamlManagerStatics)
	If @error Then Return SetError(@error, @extended, $pXamlMgr_Fact)
	$__g_pWindowsXamlManager = IWindowsXamlManagerStatics_InitializeForCurrentThread($pXamlMgr_Fact)
	$iErr = @error
	$iExt = @extended
	IUnknown_Release($pXamlMgr_Fact)
	If $iErr Then Return SetError($iErr, $iExt, False)

	Local $pDesktopWinXamlSrc_Fact = _WinRT_GetActivationFactory("Windows.UI.Xaml.Hosting.DesktopWindowXamlSource", $sIID_IDesktopWindowXamlSourceFactory)
	Local $pInner
	$__g_pDesktopWinXamlSrc = IDesktopWindowXamlSourceFactory_CreateInstance($pDesktopWinXamlSrc_Fact, 0, $pInner)
	$iErr = @error
	$iExt = @extended
	IUnknown_Release($pDesktopWinXamlSrc_Fact)
	If $iErr Then Return SetError($iErr, $iExt, False)

	; commented out due to issues with Au3Stripper
	;$__g_pHdlr_MediaOpened = _WinRT_CreateDelegate("__MediaPlayer_MediaOpened", "Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.MediaPlayer, Object>")
	;$__g_pHdlr_MediaFailed = _WinRT_CreateDelegate("__MediaPlayer_MediaFailed", "Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.MediaPlayer, Windows.Media.Playback.MediaPlayerFailedEventArgs>")
	;$__g_pHdlr_MediaEnded = _WinRT_CreateDelegate("__MediaPlayer_MediaEnded", "Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.MediaPlayer, Object>")
	;$__g_pHdlr_StateChanged = _WinRT_CreateDelegate("__MediaPlayer_StateChanged", "Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.MediaPlayer, Object>")

	OnAutoItExitRegister("_MediaPlayer_XamlShutdown")
EndFunc   ;==>_MediaPlayer_Init

Func _MediaPlayer_LoadFromStorage($iMPIdx, $sFile)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False

	Local $pFileFact, $pAsync, $pFile
	$pFileFact = _WinRT_GetActivationFactory("Windows.Storage.StorageFile", $sIID_IStorageFileStatics)
	If Not @error Then $pAsync = IStorageFileStatics_GetFileFromPathAsync($pFileFact, $sFile)
	If Not @error Then $pFile = _WinRT_WaitForAsync($pAsync, "ptr*", 3000)
	IUnknown_Release($pFileFact)
	If Not $pFile Then Return False

	Local $pMediaSrcFact, $pMediaSrc
	If Not @error Then $pMediaSrcFact = _WinRT_GetActivationFactory("Windows.Media.Core.MediaSource", $sIID_IMediaSourceStatics)
	If Not @error Then $pMediaSrc = IMediaSourceStatics_CreateFromStorageFile($pMediaSrcFact, $pFile)
	IUnknown_Release($pMediaSrcFact)
	IUnknown_Release($pFile)
	If Not $pMediaSrc Then Return False

	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayerSource)
	If Not @error Then IMediaPlayerSource_SetMediaSource($__g_apPlayers[$iMPIdx], $pMediaSrc)
	IUnknown_Release($pMediaSrc)

	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_LoadFromStorage

Func _MediaPlayer_Pause($iMPIdx)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then IMediaPlayer_Pause($__g_apPlayers[$iMPIdx])
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_Pause

Func _MediaPlayer_Play($iMPIdx)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then IMediaPlayer_Play($__g_apPlayers[$iMPIdx])
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_Play

Func _MediaPlayer_RegMediaEndedProc($iMPIdx, $sProc = "")
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	$__g_asCallbacks[$iMPIdx][$iMediaEndedDgt] = $sProc
	Return True
EndFunc   ;==>_MediaPlayer_RegMediaEndedProc

Func _MediaPlayer_RegMediaFailedProc($iMPIdx, $sProc = "")
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	$__g_asCallbacks[$iMPIdx][$iMediaFailedDgt] = $sProc
	Return True
EndFunc   ;==>_MediaPlayer_RegMediaFailedProc

Func _MediaPlayer_RegMediaOpenedProc($iMPIdx, $sProc = "")
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	$__g_asCallbacks[$iMPIdx][$iMediaOpenedDgt] = $sProc
	Return True
EndFunc   ;==>_MediaPlayer_RegMediaOpenedProc

Func _MediaPlayer_RegStateChangedProc($iMPIdx, $sProc = "")
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	$__g_asCallbacks[$iMPIdx][$iStateChangedDgt] = $sProc
	Return True
EndFunc   ;==>_MediaPlayer_RegStateChangedProc

Func _MediaPlayer_SetAutoPlay($iMPIdx, $bState)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apMPElements[$iMPIdx], $sIID_IMediaPlayerElement)
	If Not @error Then IMediaPlayerElement_SetAutoPlay($__g_apMPElements[$iMPIdx], $bState)
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_SetAutoPlay

Func _MediaPlayer_SetIsCompact($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsCompact($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsCompact

Func _MediaPlayer_SetIsFastForwardEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsFastForwardEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsFastForwardEnabled

Func _MediaPlayer_SetIsFastForwardVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsFastForwardButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsFastForwardVisible

Func _MediaPlayer_SetIsLooping($iMPIdx, $bState)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then IMediaPlayer_SetIsLoopingEnabled($__g_apPlayers[$iMPIdx], $bState)
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsLooping

Func _MediaPlayer_SetIsMuted($iMPIdx, $bState)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then IMediaPlayer_SetIsMuted($__g_apPlayers[$iMPIdx], $bState)
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsMuted

Func _MediaPlayer_SetIsNextTrackVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls2_SetIsNextTrackButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsNextTrackVisible

Func _MediaPlayer_SetIsPlaybackRateEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsPlaybackRateEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsPlaybackRateEnabled

Func _MediaPlayer_SetIsPlaybackRateVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsPlaybackRateButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsPlaybackRateVisible

Func _MediaPlayer_SetIsPreviousTrackVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls2_SetIsPreviousTrackButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsPreviousTrackVisible

Func _MediaPlayer_SetIsRepeatEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls3_SetIsRepeatEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsRepeatEnabled

Func _MediaPlayer_SetIsRepeatVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls3_SetIsRepeatButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsRepeatVisible

Func _MediaPlayer_SetIsRewindEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsFastRewindEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsRewindEnabled

Func _MediaPlayer_SetIsRewindVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsFastRewindButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsRewindVisible

Func _MediaPlayer_SetIsSeekEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsSeekEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsSeekEnabled

Func _MediaPlayer_SetIsSeekVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsSeekBarVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsSeekVisible

Func _MediaPlayer_SetIsSkipBackwardEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls2_SetIsSkipBackwardEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsSkipBackwardEnabled

Func _MediaPlayer_SetIsSkipBackwardVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls2_SetIsSkipBackwardButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsSkipBackwardVisible

Func _MediaPlayer_SetIsSkipForwardEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls2_SetIsSkipForwardEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsSkipForwardEnabled

Func _MediaPlayer_SetIsSkipForwardVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls2_SetIsSkipForwardButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsSkipForwardVisible

Func _MediaPlayer_SetIsStopEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsStopEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsStopEnabled

Func _MediaPlayer_SetIsStopVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsStopButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsStopVisible

Func _MediaPlayer_SetIsVolumeEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsVolumeEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsVolumeEnabled

Func _MediaPlayer_SetIsVolumeVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsVolumeButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsVolumeVisible

Func _MediaPlayer_SetIsZoomEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsZoomEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsZoomEnabled

Func _MediaPlayer_SetIsZoomVisible($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsZoomButtonVisible($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_SetIsZoomVisible

Func _MediaPlayer_SetPlaybackRate($iMPIdx, $fRate)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then IMediaPlayer_SetPlaybackRate($__g_apPlayers[$iMPIdx], $fRate)
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_SetPlaybackRate

Func _MediaPlayer_SetPosition($iMPIdx, $iPos)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then IMediaPlayer_SetPosition($__g_apPlayers[$iMPIdx], $iPos)
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_SetPosition

Func _MediaPlayer_SetVolume($iMPIdx, $fVol)
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then IMediaPlayer_SetVolume($__g_apPlayers[$iMPIdx], $fVol)
	Return @error = $S_OK
EndFunc   ;==>_MediaPlayer_SetVolume

Func _MediaPlayer_ShowTransport($iMPIdx)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls3_Show($pTransport)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc   ;==>_MediaPlayer_ShowTransport

Func _MediaPlayer_XamlShutdown()
	For $i = 1 To UBound($__g_apXamlSources) - 1
		_MediaPlayer_ClosePlayer($i)
	Next
	_WinRT_DestroyDelegate($__g_pHdlr_MediaOpened)
	_WinRT_DestroyDelegate($__g_pHdlr_MediaFailed)
	_WinRT_DestroyDelegate($__g_pHdlr_MediaFailed)
	_WinRT_DestroyDelegate($__g_pHdlr_StateChanged)
	_WinRT_SwitchInterface($__g_pWindowsXamlManager, $sIID_IClosable)
	If Not @error Then IClosable_Close($__g_pWindowsXamlManager)
	If Not @error Then $__g_pWindowsXamlManager = 0
EndFunc   ;==>_MediaPlayer_XamlShutdown

;~ Func _MediaPlayer_GetIsZoomVisible($iMPIdx)
;~ 	Local $bState, $iErr, $iExt
;~ 	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
;~ 	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
;~ 	If @error Then Return SetError(@error, @extended, False)
;~ 	$bState = IMediaTransportControls_GetIsZoomButtonVisible($pTransport)
;~ 	$iErr = @error
;~ 	$iExt = @extended
;~ 	IUnknown_Release($pTransport)
;~ 	Return SetError($iErr, $iExt, $bState)
;~ EndFunc

;~ Func _MediaPlayer_GetIsZoomEnabled($iMPIdx)
;~ 	Local $bState, $iErr, $iExt
;~ 	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
;~ 	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
;~ 	If @error Then Return SetError(@error, @extended, False)
;~ 	$bState = IMediaTransportControls_GetIsZoomEnabled($pTransport)
;~ 	$iErr = @error
;~ 	$iExt = @extended
;~ 	IUnknown_Release($pTransport)
;~ 	Return SetError($iErr, $iExt, $bState)
;~ EndFunc

;~ Func _MediaPlayer_SetIsRepeatEnabled($iMPIdx, $bState)
;~ 	Local $iErr
;~ 	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
;~ 	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
;~ 	If Not @error Then _WinRT_SwitchInterface($pTransport, $sIID_IMediaTransportControls3)
;~ 	If @error Then Return SetError(@error, @extended, False)
;~ 	IMediaTransportControls_Se _SetIsRepeatEnabled($pTransport, $bState)
;~ 	$iErr = @error
;~ 	IUnknown_Release($pTransport)
;~ 	Return $iErr = $S_OK
;~ EndFunc

;~ Func _MediaPlayer_SetIsFullScreenVisible($iMPIdx, $bState)
;~ 	Local $iErr
;~ 	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
;~ 	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
;~ 	If @error Then Return SetError(@error, @extended, False)
;~ 	IMediaTransportControls_SetIsFullWindowButtonVisible($pTransport, $bState)
;~ 	$iErr = @error
;~ 	IUnknown_Release($pTransport)
;~ 	Return $iErr = $S_OK
;~ EndFunc

Func _MediaPlayer_SetIsFullScreenEnabled($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaTransportControls_SetIsFullWindowEnabled($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc

Func _MediaPlayer_SetIMediaPlayerElement_SetIsFullWindow($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaPlayerElement_SetIsFullWindow($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc

Func _MediaPlayer_SetIMediaElement2_SetIsFullWindow($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaElement2_SetIsFullWindow($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc

Func _MediaPlayer_SetIMediaPlayerPresenter_SetStretch($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaPlayerPresenter_SetStretch($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc

Func _MediaPlayer_SetIMediaElement2_SetStretch($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaElement2_SetStretch($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc

Func _MediaPlayer_SetIMediaPlayerElement_SetStretch($iMPIdx, $bState)
	Local $iErr
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	Local $pTransport = __MediaPlayer_GetTransport($iMPIdx)
	If @error Then Return SetError(@error, @extended, False)
	IMediaPlayerElement_SetStretch($pTransport, $bState)
	$iErr = @error
	IUnknown_Release($pTransport)
	Return $iErr = $S_OK
EndFunc

Func _MediaPlayer_GetIMediaElement2_GetIsFullWindow($iMPIdx)
	Local $fRate
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $fRate = IMediaElement2_GetIsFullWindow($__g_apPlayers[$iMPIdx])
	Return SetError(@error, @extended, $fRate)
EndFunc   ;==>_MediaPlayer_GetPlaybackRate

Func _MediaPlayer_GetIMediaTransportControls_GetIsFullWindowEnabled($iMPIdx)
	Local $fRate
	If $iMPIdx < 1 Or $iMPIdx >= UBound($__g_apPlayers) Then Return False
	_WinRT_SwitchInterface($__g_apPlayers[$iMPIdx], $sIID_IMediaPlayer)
	If Not @error Then $fRate = IMediaTransportControls_GetIsFullWindowEnabled($__g_apPlayers[$iMPIdx])
	Return SetError(@error, @extended, $fRate)
EndFunc   ;==>_MediaPlayer_GetPlaybackRate
