#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=app.ico
#AutoIt3Wrapper_Outfile_x64=ImmersiveEngine.exe
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Immersive UX Engine
#AutoIt3Wrapper_Res_Fileversion=1.3.1
#AutoIt3Wrapper_Res_ProductName=Immersive UX Engine
#AutoIt3Wrapper_Res_ProductVersion=1.3.1
#AutoIt3Wrapper_Res_LegalCopyright=@ 2025 WildByDesign
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_HiDpi=Y
#AutoIt3Wrapper_Run_Au3Stripper=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <AutoItExitCodes.au3>
#include <WinAPIProc.au3>
#include <WinAPIMisc.au3>
#include <WinAPISys.au3>
;#include <WinAPIGdi.au3>
#include <Array.au3>
#include <Misc.au3>
#include <File.au3>

; HotKey only used temporarily when needing to look for window classes to include/exclude
;#include <Process.au3>
;HotKeySet("{SPACE}", "WinListtest")

; use RequireAdmin to color all apps, otherwise only user-mode apps will be colored
;#RequireAdmin

If @Compiled = 0 Then
	; System aware DPI awareness
	;DllCall("User32.dll", "bool", "SetProcessDPIAware")
	; Per-monitor V2 DPI awareness
	DllCall("User32.dll", "bool", "SetProcessDpiAwarenessContext" , "HWND", "DPI_AWARENESS_CONTEXT" -4)
EndIf

Global $iPID, $sINFO, $oService
Global $IniFile = @ScriptDir & "\ImmersiveUX.ini"
Global $bDarkModeEnabled, $bClearChangesOnExit, $bRequireWindows11, $iBorderColorOptions
Global $aExcludeProcessNames, $aExcludeFromAllClass, $aExclusionsCombined
Global $bClassicExplorer, $bExplorerExtendClient
Global $bGlobalDarkTitleBar, $dGlobalBorderColor, $dGlobalTitleBarColor, $dGlobalTitleBarTextColor, $iGlobalTitleBarBackdrop, $iGlobalCornerPreference, $iGlobalExtendFrameIntoClient, $iGlobalEnableBlurBehind
Global $iGlobalBlurTintColor
Global $dTerminalBorderColor, $dTerminalBackdrop, $bWindowsTerminalHandling, $dVSStudioBorderColor, $bWindowsTerminalBlur
Global $dVSCodiumBackdrop, $dVSCodeBackdrop
Global $bEnable = False
Global $bBoot = True
Global $aCustomRules[0][14]
Global Static $hActiveWndLast
Global $bElevated = False
Global $sProdName = "ImmersiveUX"
Global $sEngName = "ImmersiveEngine"
Global $DWMWA_COLOR_NONE = "0xFFFFFFFE"
Global $DWMWA_COLOR_DEFAULT = "0xFFFFFFFF"

Global $hDwmapi = DllOpen('dwmapi.dll')
Global $hUser32 = DllOpen('user32.dll')
Global $hKernel32 = DllOpen('kernel32.dll')
Global $hPsapi = DllOpen('psapi.dll')

;Global $aExcludeWinTitles[17] = ["", "Program Manager", "PopupHost", "CoreInput", "Search", "Start", "DesktopWindowXamlSource", _
;	"Chrome Legacy Window", "Quick settings", "System tray overflow window.", "Drag", "Default IME", "OLEChannelWnd", _
;	"OleMainThreadWndName", "MSCTFIME UI", "CicMarshalWnd", "XCP"]

Global $aExcludeClassNames[15] = ["Progman", "Xaml_WindowedPopupClass", "Windows.UI.Core.CoreComponentInputSource", _
	"Windows.UI.Core.CoreWindow", "Windows.UI.Composition.DesktopWindowContentBridge", "Chrome_RenderWidgetHostHWND", _
	"ControlCenterWindow", "TopLevelWindowForOverflowXamlIsland", "SysDragImage", "IME", "OleMainThreadWndClass", "MSCTFIME UI", _
	"CicMarshalWndClass", "XCPTimerClass", "msctls_statusbar32"]

ReadIniFile()

; requires Windows 11 build 22621+
$OSBuild = @OSBuild
If $bRequireWindows11 = True Then
	If $OSBuild < 22621 Then
		MsgBox($MB_ICONERROR + $MB_SYSTEMMODAL, "Error", "This program only runs on Windows 11 build 22621 or higher." & @CRLF)
		Exit
	EndIf
Else
EndIf

; ensure that desktop composition is enabled
If Not _WinAPI_DwmIsCompositionEnabled_mod() Then
        MsgBox($MB_ICONERROR + $MB_SYSTEMMODAL, 'Error', 'This program requires Desktop Composition to be enabled.')
        Exit
EndIf

#cs
If StringInStr($CmdLineRaw, "addtask") Then
	_TaskSched_Add()
	Exit
EndIf

If StringInStr($CmdLineRaw, "removetask") Then
	_TaskSched_Remove()
	Exit
EndIf

If StringInStr($CmdLineRaw, "stoptask") Then
	SetBorderColor_removeall()
	_TaskSched_End()
	Exit
EndIf

If StringInStr($CmdLineRaw, "starttask") Then
	_TaskSched_Run()
	Exit
EndIf
#ce

If StringInStr($CmdLineRaw, "removeall") Then
	SetBorderColor_removeall()
	Exit
EndIf

Global $g_iIsTaskSchedInstalled = _TaskSched_AlreadyInstalled()
Global $g_iIsTaskSchedRun = False
If StringInStr($CmdLineRaw, 'runtask') Then $g_iIsTaskSchedRun = True

; if scheduled task is installed but not running, run the task instead
If $g_iIsTaskSchedInstalled And Not $g_iIsTaskSchedRun Then
	_TaskSched_Run()
	Exit
EndIf

; ensure that only one instance is running
If _Singleton($sEngName, 1) = 0 Then
        $sMsg = $sProdName & " is already running." & @CRLF
		MsgBox($MB_ICONERROR + $MB_SYSTEMMODAL, "Error", $sMsg & @CRLF)
        Exit
EndIf

If IsAdmin() Then $bElevated = True

;Global $aSectionTS[3][2] = [[2, ""], ["StartedByTask", $g_iIsTaskSchedRun], ["PID", @AutoItPID]]
Global $aSectionTS[4][2] = [[3, ""], ["StartedByTask", $g_iIsTaskSchedRun], ["PID", @AutoItPID], ["Elevated", $bElevated]]
IniWriteSection($IniFile, "StartupInfoOnly", $aSectionTS)

Opt("SetExitCode", 1)

OnAutoItExitRegister(DoCleanUp)

Global $hHookFunc = DllCallbackRegister('_WinEventProc', 'none', 'ptr;uint;hwnd;int;int;uint;uint')
Global $hWinHook = _WinAPI_SetWinEventHook_mod($EVENT_SYSTEM_FOREGROUND, $EVENT_OBJECT_NAMECHANGE, DllCallbackGetPtr($hHookFunc))

Func _ToBoolean($sString)
    Return (StringStripWS(StringUpper($sString), 8) = "TRUE" ? True : False)
EndFunc   ;==>_ToBoolean

; don't apply to all during boot as there is no need
$Uptime = _WinAPI_StrFromTimeInterval(_WinAPI_GetTickCount64())
If StringInStr($Uptime, "min") Then
	$bBoot = False
	; apply settings to all currently running apps
	SetBorderColor_apply2all()
EndIf

; set process priority
If @Compiled Then ProcessSetPriority($sEngName & ".exe", 4)

; start GUI/tray process
idGUI()

While 1
    Sleep(10000)
WEnd

Func DoCleanUp()
    SetBorderColor_removeall()
    _Free()
	IniDelete($IniFile, "StartupInfoOnly")
	; show crash details if possible
	If @exitCode <> 0 Then
        $sMsg = "The Immersive UX engine process has crashed." & @CRLF & @CRLF
        $sMsg &= "Error Code: " & "(0x" & Hex(@exitCode) & ')' & @CRLF & @CRLF
        $sMsg &= '"' & _FormatAutoItExitCode() & '"'
        MsgBox(0, "Immersive UX", $sMsg)
    EndIf
	DllClose($hDwmapi)
	DllClose($hUser32)
	DllClose($hKernel32)
	DllClose($hPsapi)
EndFunc

Func _Free()
    If $hWinHook Then _WinAPI_UnhookWinEvent_mod($hWinHook)
    If $hHookFunc Then DllCallbackFree($hHookFunc)
EndFunc   ;==>_Free

Func RefreshChanges()
	; remove all based on current settings
	SetBorderColor_removeall()
	; read ini file for new changes
	ReadIniFile()
	; reapply all based on updated settings
	SetBorderColor_apply2all()
EndFunc

Func SetBorderColor_removeall()
	Local $hWnd, $sClassName, $sName
	If $bClearChangesOnExit = True Then
		$aArray = WinList()
		For $n = 1 To $aArray[0][0]

			; exclude windows with blank title
			If $aArray[$n][0] = "" Then ContinueLoop

			$sClassName = _WinAPI_GetClassName_mod($aArray[$n][1])
			; exclude classnames from global exclusions
			For $i = 0 To UBound($aExcludeClassNames) - 1
				If $sClassName = $aExcludeClassNames[$i] Then ContinueLoop 2
			Next

			; exclude process names from global exclusions
			$sName = _WinAPI_GetWindowFileName_mod($aArray[$n][1])
			If $sName = "" Then ContinueLoop

			For $i = 0 To UBound($aExcludeProcessNames) -1
				If $sName = $aExcludeProcessNames[$i] Then ContinueLoop 2
			Next

			MainColoringRemoval($aArray[$n][1], $sClassName, $sName)
		Next
	EndIf

	If $bClearChangesOnExit = True Then
		; fix Windows Terminal from going fully transparent on exit
		If WinExists("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]") Then
			$hWnd = WinGetHandle("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]")
			_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
			_WinAPI_DwmSetWindowAttribute__($hWnd, 38, 2)
		EndIf

		; fix Task Manager from losing window control buttons on exit
		If WinExists("[CLASS:TaskManagerWindow]") Then
			$hWnd = WinGetHandle("[CLASS:TaskManagerWindow]")
			_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
			_WinAPI_DwmSetWindowAttribute__($hWnd, 38, 2)
		EndIf
	EndIf
EndFunc   ;==>SetBorderColor_removeall

Func MainColoringRemoval($hWnd, $sClassName, $sName)
	Local $i
	Local $bMatchesFound = False

	; determine if process rule or class rule matches for custom rules
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If $sName = $aCustomRules[$i][1] Or $sClassName = $aCustomRules[$i][1] Then
			; skip custom rules that are not Enabled
			If Not $aCustomRules[$i][12] Then
				;If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
				If $iBorderColorOptions <> 0 Then
					If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, 0xFFFFFFFF)
				EndIf
				If $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, 0xFFFFFFFF)
				If $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, 0xFFFFFFFF)
				If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, 0)
				If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, 0)
				If $iGlobalEnableBlurBehind Then
					_WinAPI_DwmEnableBlurBehindWindow10($hWnd, False)
					_WinAPI_DwmEnableBlurBehindWindow_mod($hWnd, 0, 0)
					; fix for file explorer losing window control buttons occasionally
					If $sClassName <> "CabinetWClass" Then
						_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
					EndIf
				EndIf
				If Not $iGlobalEnableBlurBehind Then
					; only enable ExtendFrameIntoClientArea if blur behind is not enabled
					If $iGlobalExtendFrameIntoClient Then
						; fix for file explorer losing window control buttons occasionally
						If $sClassName <> "CabinetWClass" Then
							_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
						EndIf
					EndIf
				EndIf
				Return
			EndIf
			; dark mode titlebar, fallback to global if not set
			If $aCustomRules[$i][2] = "True" Then
				;_WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
			EndIf
			If $aCustomRules[$i][2] = "" Then
				;If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
			EndIf
			; border color reset to default
			If $aCustomRules[$i][3] Or $dGlobalBorderColor Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, 0xFFFFFFFF)
			EndIf
			; titlebar color reset to default
			If $aCustomRules[$i][4] Or $dGlobalTitleBarColor Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 35, 0xFFFFFFFF)
			EndIf
			; titlebar text color reset to default
			If $aCustomRules[$i][5] Or $dGlobalTitleBarTextColor Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 36, 0xFFFFFFFF)
			EndIf
			; titlebar backdrop reset to default
			If $aCustomRules[$i][6] <> "" Or $iGlobalTitleBarBackdrop <> "" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 38, 0)
			EndIf
			; corner preference reset to default
			If $aCustomRules[$i][7] <> "" Or $iGlobalCornerPreference <> "" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 33, 0)
			EndIf
			; blur behind removal
			If $aCustomRules[$i][9] = "True" Or $iGlobalEnableBlurBehind Then
				_WinAPI_DwmEnableBlurBehindWindow10($hWnd, False)
				_WinAPI_DwmEnableBlurBehindWindow_mod($hWnd, 0, 0)
				; fix for file explorer losing window control buttons occasionally
				If $sClassName <> "CabinetWClass" Then
					_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
				EndIf
			EndIf
			; ExtendFrameIntoClientArea removal
			If $aCustomRules[$i][8] = "True" Or $iGlobalExtendFrameIntoClient Then
				; only enable ExtendFrameIntoClientArea if blur behind is not enabled
				If $aCustomRules[$i][9] <> "True" Or Not $iGlobalEnableBlurBehind Then
					; fix for file explorer losing window control buttons occasionally
					If $sClassName <> "CabinetWClass" Then
						_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
					EndIf
				EndIf
			EndIf
			$bMatchesFound = True
		EndIf
    Next

	; fallback to global when no custom rules match
	If Not $bMatchesFound Then
		;If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
		If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, 0xFFFFFFFF)
		If $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, 0xFFFFFFFF)
		If $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, 0xFFFFFFFF)
		If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, 0)
		If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, 0)
		If $iGlobalEnableBlurBehind Then
			_WinAPI_DwmEnableBlurBehindWindow10($hWnd, False)
			_WinAPI_DwmEnableBlurBehindWindow_mod($hWnd, 0, 0)
			; fix for file explorer losing window control buttons occasionally
			If $sClassName <> "CabinetWClass" Then
				_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
			EndIf
		EndIf
		If $iGlobalExtendFrameIntoClient Then
			If Not $iGlobalEnableBlurBehind Then
				; fix for file explorer losing window control buttons occasionally
				If $sClassName <> "CabinetWClass" Then
					_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
				EndIf
			EndIf
		EndIf
	EndIf
EndFunc

Func SetBorderColor_apply2all()
	Local $sClassName
	$aArray = WinList()
	For $n = 1 To $aArray[0][0]
		; exclude windows with blank title
		If $aArray[$n][0] = "" Then ContinueLoop

		$sClassName = _WinAPI_GetClassName_mod($aArray[$n][1])
		; exclude classnames from global exclusions
		For $i = 0 To UBound($aExcludeClassNames) - 1
			If $sClassName = $aExcludeClassNames[$i] Then ContinueLoop 2
		Next

		MainColoringFunction($aArray[$n][1], $sClassName)
	Next

	; get active window and apply border only to active window
	If $iBorderColorOptions = 0 Then
		$hActiveWndLast = WinGetHandle("[ACTIVE]", "")
		$sClassNameActive = _WinAPI_GetClassName_mod($hActiveWndLast)
		$sNameActive = _WinAPI_GetWindowFileName_mod($hActiveWndLast)
		_ColorBorderOnly($hActiveWndLast, $sClassNameActive, $sNameActive)
	EndIf
EndFunc   ;==>SetBorderColor_apply2all

Func MainColoringFunction($hWnd, $sClassName)
	Local $sName = _WinAPI_GetWindowFileName_mod($hWnd)
	If Not @Compiled Then
		Local $sWindow = _WinAPI_GetWindowTextMod($hWnd)
		If $sWindow = "Immersive UX" Then $sName = "ImmersiveUX.exe"
	EndIf
	; exclude process names from global exclusions
	If $sName = "" Then Return

	For $i = 0 To UBound($aExcludeProcessNames) -1
		If $sName = $aExcludeProcessNames[$i] Then Return
	Next

	MainColoringContinue($hWnd, $sClassName, $sName)
EndFunc

Func MainColoringContinue($hWnd, $sClassName, $sName)
	Local $i
	Local $iIntensity, $iTintColor, $iTintColorSwitch, $iTintColorBlur
	Local $bMatchesFound = False

	; determine if process rule or class rule matches for custom rules
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If $sName = $aCustomRules[$i][1] Or $sClassName = $aCustomRules[$i][1] Then
			; skip custom rules that are not Enabled
			If Not $aCustomRules[$i][12] Then
				If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
				;If $iBorderColorOptions <> 0 Then
				;	If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
				;EndIf
				If $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor_mod($dGlobalTitleBarColor))
				If $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor_mod($dGlobalTitleBarTextColor))
				If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($iGlobalTitleBarBackdrop))
				If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, Int($iGlobalCornerPreference))
				If $iGlobalEnableBlurBehind Then _EnableBlurBehind($hWnd, $sName, $sClassName, $iGlobalBlurTintColor)
				If Not $iGlobalEnableBlurBehind Then
					; only enable ExtendFrameIntoClientArea if blur behind is not enabled
					If $iGlobalExtendFrameIntoClient Then _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
				EndIf

				Return
			EndIf
			; dark mode titlebar, fallback to global if not set
			If $aCustomRules[$i][2] = "True" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
			EndIf
			If $aCustomRules[$i][2] = "" Then
				If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
			EndIf
			#cs ; don't need border coloring here anymore since dealt with in foreground event
			; border color, fallback to global if not set
			If $iBorderColorOptions <> 0 Then
				If $aCustomRules[$i][3] Then
					_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($aCustomRules[$i][3]))
				Else
					If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
				EndIf
			EndIf
			#ce
			; titlebar color, fallback to global if not set
			If $aCustomRules[$i][4] Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor_mod($aCustomRules[$i][4]))
			Else
				If $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor_mod($dGlobalTitleBarColor))
			EndIf
			; titlebar text color, fallback to global if not set
			If $aCustomRules[$i][5] Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor_mod($aCustomRules[$i][5]))
			Else
				If $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor_mod($dGlobalTitleBarTextColor))
			EndIf
			; titlebar backdrop, fallback to global if not set
			If $aCustomRules[$i][6] <> "" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($aCustomRules[$i][6]))
			Else
				If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($iGlobalTitleBarBackdrop))
			EndIf
			; corner preference, fallback to global if not set
			If $aCustomRules[$i][7] <> "" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 33, Int($aCustomRules[$i][7]))
			Else
				If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, Int($iGlobalCornerPreference))
			EndIf
			; obtain blur tint color and intensity details
			If $aCustomRules[$i][11] <> "" Then
				If $aCustomRules[$i][10] Then
					$iTintColor = $aCustomRules[$i][10]
					$iIntensity = _percentageOfHex($aCustomRules[$i][11])
					$iTintColorSwitch = Hex(_WinAPI_SwitchColor_mod($iTintColor), 6)
					$iTintColorBlur = '0x' & $iIntensity & $iTintColorSwitch
				EndIf
			EndIf
			; blur behind, fallback to global if not set
			If $aCustomRules[$i][9] = "True" Then _EnableBlurBehind($hWnd, $sName, $sClassName, $iTintColorBlur)
			If $aCustomRules[$i][9] = "" Then
				; only enable blur if not custom set
				If $iGlobalEnableBlurBehind Then _EnableBlurBehind($hWnd, $sName, $sClassName, $iGlobalBlurTintColor)
			EndIf
			; ExtendFrameIntoClientArea, fallback to global if not set
			If $aCustomRules[$i][8] = "True" Then
				; only enable ExtendFrameIntoClientArea if blur behind is not enabled
				If $aCustomRules[$i][9] <> "True" Then _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
			EndIf
			If $aCustomRules[$i][8] = "" Then
				; only enable ExtendFrameIntoClientArea if blur behind is not enabled
				If $iGlobalExtendFrameIntoClient And Not $iGlobalEnableBlurBehind Then
					_DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
				EndIf
			EndIf
			$bMatchesFound = True
		EndIf
    Next

	; fallback to global when no custom rules match
	If Not $bMatchesFound Then
		If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
		If $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor_mod($dGlobalTitleBarColor))
		If $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor_mod($dGlobalTitleBarTextColor))
		If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($iGlobalTitleBarBackdrop))
		If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, Int($iGlobalCornerPreference))
		If $iGlobalEnableBlurBehind Then _EnableBlurBehind($hWnd, $sName, $sClassName, $iGlobalBlurTintColor)
		If $iGlobalExtendFrameIntoClient And Not $iGlobalEnableBlurBehind Then _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
	EndIf
EndFunc

Func _ColorBorderOnly($hWnd, $sClassName, $sName)
	Local $bMatchesFound = False
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If $sName = $aCustomRules[$i][1] Or $sClassName = $aCustomRules[$i][1] Then
			$bMatchesFound = True
			; skip custom rules that are not Enabled
			If Not $aCustomRules[$i][12] Then
				If $iBorderColorOptions <> 0 Then
					If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
				EndIf
			EndIf
			If $aCustomRules[$i][3] Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($aCustomRules[$i][3]))
			ElseIf Not $aCustomRules[$i][3] Then
				If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
			EndIf
		EndIf
    Next

	If Not $bMatchesFound Then
		If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
	EndIf
EndFunc

Func _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)

	_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))

	; some slower programs need a 20ms delay to work consistently
	; programs that have issues with double-overlapping window control buttons need margins of: 5000, 5000, 0, 0

	If $sClassName = "CabinetWClass" Then
		Sleep(20)
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	EndIf
	; Visual Studio Handling
	If $sName = 'devenv.exe' Then
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
		;_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dVSStudioBorderColor))
	ElseIf $sName = 'VSCodium.exe' Then
		Sleep(20)
		;_WinAPI_DwmEnableBlurBehindWindow10($hWnd, False) ; only needed for old vibrancy method
		_WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($dVSCodiumBackdrop))
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	ElseIf $sName = 'Code.exe' Then
		Sleep(20)
		;_WinAPI_DwmEnableBlurBehindWindow10($hWnd, False) ; only needed for old vibrancy method
		_WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($dVSCodeBackdrop))
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	ElseIf $sClassName = "CASCADIA_HOSTING_WINDOW_CLASS" Then
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
		If $aCustomRules[$i][3] Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($aCustomRules[$i][3]))
	Else
		;_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	EndIf
EndFunc

Func _EnableBlurBehind($hWnd, $sName, $sClassName, $iTintColorBlur = "")
	_WinAPI_DwmEnableBlurBehindWindow_mod($hWnd, 1, 0)
	_WinAPI_DwmEnableBlurBehindWindow10($hWnd, True, $iTintColorBlur)

	If $sClassName = 'CabinetWClass' Then
		Sleep(20)
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	ElseIf $sName = 'devenv.exe' Then
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
	ElseIf $sClassName = 'TaskManagerWindow' Then
		Sleep(20)
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	ElseIf $sClassName = 'CASCADIA_HOSTING_WINDOW_CLASS' Then
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
	Else
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	EndIf
EndFunc

Func _WinEventProc($hHook, $iEvent, $hWnd, $iObjectID, $iChildID, $iEventThread, $imsEventTime)
	Local Static $hWndLastShow, $hWndLastReorder, $hWndLastForeground, $hWndLastNameChange
	Local $sActiveWindow, $sName, $sClassName
	Local $hTerminal
	Local $bMatchesFound = False
    Switch $iEvent
		Case $EVENT_OBJECT_SHOW
			; avoid applying coloring to duplicate hWnd in rapid succession
			If $hWnd<>$hWndLastShow Then
				$hWndLastShow = $hWnd
			ElseIf $hWnd=$hWndLastShow Then
				Return
			EndIf

			$sClassName = _WinAPI_GetClassName_mod($hWnd)

			; exclude classnames from global exclusions
			For $i = 0 To UBound($aExcludeClassNames) - 1
				If $sClassName = $aExcludeClassNames[$i] Then Return
			Next

			; fix for Windows Terminal losing backdrop material when opening new tab tab
			If $bWindowsTerminalHandling Then
				If $sClassName = "PseudoConsoleWindow" Then
					$hTerminal = WinGetHandle("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]")
					If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hTerminal, 38, Int($dTerminalBackdrop))
					_WinAPI_DwmSetWindowAttribute__($hTerminal, 34, _WinAPI_SwitchColor_mod($dTerminalBorderColor))
					Sleep(20)
					If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hTerminal, 38, Int($dTerminalBackdrop))
					_WinAPI_DwmSetWindowAttribute__($hTerminal, 34, _WinAPI_SwitchColor_mod($dTerminalBorderColor))
					Return
				EndIf
			EndIf

			; exclude windows with blank title
			$sActiveWindow = _WinAPI_GetWindowTextMod($hWnd)
			If $sActiveWindow = "" Then Return

			MainColoringFunction($hWnd, $sClassName)

		Case $EVENT_SYSTEM_FOREGROUND
			; this Case is mostly for handling border coloring and some special handling

			; avoid applying coloring to duplicate hWnd in rapid succession
			If $hWnd<>$hWndLastForeground Then
				$hWndLastForeground = $hWnd
			ElseIf $hWnd=$hWndLastForeground Then
				Return
			EndIf

			$sActiveWindow = _WinAPI_GetWindowTextMod($hWnd)

			; Visual Studio Handling
			If $sActiveWindow = 'Microsoft Visual Studio' Then
				Sleep(20)
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dVSStudioBorderColor))
			EndIf

			; special handling for Windows Terminal backdrop
			If $bWindowsTerminalHandling Then
				If WinExists("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]") Then
					$hTerminal = WinGetHandle("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]")
					If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hTerminal, 38, Int($dTerminalBackdrop))
					Sleep(20)
					If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hTerminal, 38, Int($dTerminalBackdrop))
				EndIf
			EndIf

			; fix modern File Explorer losing client area backdrop material when losing focus
			; fix modern File Explorer titlebar losing blur after gaining focus
			If $bExplorerExtendClient And Not $bClassicExplorer Then 
				If WinExists("[CLASS:CabinetWClass]") Then
					$hExplorerHandle = WinGetHandle("[CLASS:CabinetWClass]")
					_WinAPI_DwmExtendFrameIntoClientArea_mod($hExplorerHandle, _WinAPI_CreateMargins(-1, -1, -1, -1))
				EndIf
			EndIf

			If $iBorderColorOptions = 0 Then
				; border color, only color active window
				$hActiveWnd = WinGetHandle("[ACTIVE]", "")
				If $hActiveWnd<>$hActiveWndLast Then
					; exclude class names and process names from global exclusions
					$sClassName = _WinAPI_GetClassName_mod($hActiveWndLast)
					$sName = _WinAPI_GetWindowFileName_mod($hActiveWndLast)
					For $i = 0 To UBound($aExclusionsCombined) -1
						If $sName = $aExclusionsCombined[$i] Or $sClassName = $aExclusionsCombined[$i] Then $bMatchesFound = True
					Next
					If Not $bMatchesFound Then _WinAPI_DwmSetWindowAttribute__($hActiveWndLast, 34, $DWMWA_COLOR_NONE)
					$hActiveWndLast = $hActiveWnd
				EndIf
			EndIf

			; exclude class names and process names from global exclusions
			$sClassName = _WinAPI_GetClassName_mod($hWnd)
			$sName = _WinAPI_GetWindowFileName_mod($hWnd)
			If $sName = "" Then Return

			For $i = 0 To UBound($aExclusionsCombined) -1
				If $sName = $aExclusionsCombined[$i] Or $sClassName = $aExclusionsCombined[$i] Then Return
			Next

			; exclude windows with blank title
			If $sActiveWindow = "" Then Return

			If Not @Compiled And $sActiveWindow = "Immersive UX" Then $sName = "ImmersiveUX.exe"

			_ColorBorderOnly($hWnd, $sClassName, $sName)

		Case $EVENT_OBJECT_REORDER
			; this Case is specifically for classic File Explorer when it loses Client Area coloring/backdrop when resizing
			If Not $bExplorerExtendClient And Not $bClassicExplorer Then Return

			; avoid applying coloring to duplicate hWnd in rapid succession
			If $hWnd<>$hWndLastReorder Then
				$sClassName = _WinAPI_GetClassName_mod($hWnd)
				If $sClassName <> "CabinetWClass" Then $hWndLastReorder = $hWnd
			ElseIf $hWnd=$hWndLastReorder Then
				Return
			EndIf

			If $sClassName = "CabinetWClass" Then _WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))

		Case $EVENT_OBJECT_NAMECHANGE
			; special handling for Windows Terminal backdrop (fixes Terminal losing backdrop when changing tabs)
			If Not $bWindowsTerminalHandling Then Return

			; avoid applying coloring to duplicate hWnd in rapid succession
			If $hWnd<>$hWndLastNameChange Then
				$sClassName = _WinAPI_GetClassName_mod($hWnd)
				If $sClassName <> "CASCADIA_HOSTING_WINDOW_CLASS" Then $hWndLastNameChange = $hWnd
			ElseIf $hWnd=$hWndLastNameChange Then
				Return
			EndIf

			If $sClassName <> 'CASCADIA_HOSTING_WINDOW_CLASS' Then Return
			If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($dTerminalBackdrop))
			_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dTerminalBorderColor))
			Sleep(20)
			If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($dTerminalBackdrop))
			_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dTerminalBorderColor))

		Case $EVENT_SYSTEM_MINIMIZEEND
			; special handling for Windows Terminal backdrop (fixes Terminal losing backdrop after minimize)
			If Not $bWindowsTerminalHandling Then Return

			$sClassName = _WinAPI_GetClassName_mod($hWnd)

			If $sClassName <> 'CASCADIA_HOSTING_WINDOW_CLASS' Then Return
			If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($dTerminalBackdrop))
			_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dTerminalBorderColor))
			Sleep(20)
			If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($dTerminalBackdrop))
			_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dTerminalBorderColor))

    EndSwitch
EndFunc

#cs
#Region TaskSched

Func _TaskSched_Add()
	_TaskSched_Install()
EndFunc

Func _TaskSched_Remove()
	If _TaskSched_AlreadyInstalled() Then
		If _TaskSched_Uninstall() Then
			Return 0
		Else
			Return 5
		EndIf
	Else
		Return 6
	EndIf
EndFunc   ;==>_TaskSched_Remove

Func _TaskSched_AlreadyInstalled()
	If RunWait('schtasks.exe /Query /TN ' & $sProdName, '', @SW_HIDE) <> 0 Then Return 0
	Return 1
EndFunc   ;==>_TaskSched_AlreadyInstalled

Func _TaskSched_Install() ; UTF-16 LE BOM
	Local $sAuthor = StringUpper(@LogonDomain) & '\' & @UserName
	Local $sXML = ""
	$sXML &= '<?xml version="1.0" encoding="UTF-16"?>' & @CRLF
	$sXML &= '<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">' & @CRLF ; 1.4 = Win10
	$sXML &= '  <RegistrationInfo>' & @CRLF
	$sXML &= '    <Date>2099-' & @MON & '-' & @MDAY & 'T' & @HOUR & ':' & @MIN & ':' & @SEC & '</Date>' & @CRLF ; ..made this by creating manually and exported to .xml
	$sXML &= '    <Author>' & $sAuthor & '</Author>' & @CRLF
	$sXML &= '    <Description>Apply border color, title bar color, corner preference, title bar backdrop material and more.</Description>' & @CRLF
	$sXML &= '    <URI>' & $sProdName & '</URI>' & @CRLF
	$sXML &= '  </RegistrationInfo>' & @CRLF
	$sXML &= '  <Triggers>' & @CRLF
	$sXML &= '    <LogonTrigger>' & @CRLF
	$sXML &= '      <Enabled>true</Enabled>' & @CRLF
	$sXML &= '      <UserId>' & $sAuthor & '</UserId>' & @CRLF
	$sXML &= '    </LogonTrigger>' & @CRLF
	$sXML &= '  </Triggers>' & @CRLF
	$sXML &= '  <Principals>' & @CRLF
	$sXML &= '    <Principal id="Author">' & @CRLF
	$sXML &= '      <UserId>' & $sAuthor & '</UserId>' & @CRLF
	$sXML &= '      <LogonType>InteractiveToken</LogonType>' & @CRLF
	$sXML &= '      <RunLevel>' & (IsAdmin() ? 'HighestAvailable' : 'LeastPrivilege') & '</RunLevel>' & @CRLF
	$sXML &= '    </Principal>' & @CRLF
	$sXML &= '  </Principals>' & @CRLF
	$sXML &= '  <Settings>' & @CRLF
	$sXML &= '    <MultipleInstancesPolicy>Parallel</MultipleInstancesPolicy>' & @CRLF ; IgnoreNew ; Parallel ;
	$sXML &= '    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>' & @CRLF
	$sXML &= '    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>' & @CRLF
	$sXML &= '    <AllowHardTerminate>false</AllowHardTerminate>' & @CRLF
	$sXML &= '    <StartWhenAvailable>false</StartWhenAvailable>' & @CRLF
	$sXML &= '    <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>' & @CRLF
	$sXML &= '    <IdleSettings>' & @CRLF
	$sXML &= '      <StopOnIdleEnd>false</StopOnIdleEnd>' & @CRLF
	$sXML &= '      <RestartOnIdle>false</RestartOnIdle>' & @CRLF
	$sXML &= '    </IdleSettings>' & @CRLF
	$sXML &= '    <AllowStartOnDemand>true</AllowStartOnDemand>' & @CRLF
	$sXML &= '    <Enabled>true</Enabled>' & @CRLF
	$sXML &= '    <Hidden>false</Hidden>' & @CRLF
	$sXML &= '    <RunOnlyIfIdle>false</RunOnlyIfIdle>' & @CRLF
;~     $sXML &= '    <DisallowStartOnRemoteAppSession>false</DisallowStartOnRemoteAppSession>' & @CRLF
	$sXML &= '    <UseUnifiedSchedulingEngine>true</UseUnifiedSchedulingEngine>' & @CRLF
	$sXML &= '    <WakeToRun>false</WakeToRun>' & @CRLF
	$sXML &= '    <ExecutionTimeLimit>PT0S</ExecutionTimeLimit>' & @CRLF
	$sXML &= '    <Priority>7</Priority>' & @CRLF
	$sXML &= '  </Settings>' & @CRLF
	$sXML &= '  <Actions Context="Author">' & @CRLF
	$sXML &= '    <Exec>' & @CRLF
	$sXML &= '      <Command>"' & @ScriptDir & "\" & $sEngName & ".exe" & '"</Command>' & @CRLF
	$sXML &= '      <Arguments>runtask</Arguments>' & @CRLF
;~ 	$sXML &= '      <WorkingDirectory>"' & @ScriptDir & '"</WorkingDirectory>' & @CRLF
	$sXML &= '    </Exec>' & @CRLF
	$sXML &= '  </Actions>' & @CRLF
	$sXML &= '</Task>'

	Local $sFileXML = @TempDir & '\$~schtsk_' & @MIN & @SEC & @MSEC & '.xml'
	Local $hFile = FileOpen($sFileXML, 34) ; $FO_UTF16_LE(32) + $FO_OVERWRITE(2) = 34
	FileWrite($hFile, $sXML)
	FileClose($hFile)
	If FileRead($sFileXML) <> $sXML Then Return SetError(2, 0, 2)
	Local $iReturn = RunWait('schtasks.exe /Create /XML "' & $sFileXML & '" /TN ' & $sProdName, '', @SW_HIDE)
	FileDelete($sFileXML)
	Return SetError(($iReturn ? 1 : 0), $iReturn, ($iReturn ? 1 : 0))
EndFunc   ;==>_TaskSched_Install

Func _TaskSched_Uninstall()
	If RunWait('schtasks.exe /Delete /F /TN ' & $sProdName, '', @SW_HIDE) <> 0 Then Return SetError(1, 0, 0)
	Return SetError(0, 0, 1)
EndFunc   ;==>_TaskSched_Uninstall

Func _TaskSched_Run()
	Local $sRun = 'schtasks.exe /Run /HRESULT /TN ' & $sProdName
	RunWait($sRun, '', @SW_HIDE)
EndFunc   ;==>_TaskSched_Run

Func _TaskSched_End()
	Local $sRun = 'schtasks.exe /End /HRESULT /TN ' & $sProdName
	RunWait($sRun, '', @SW_HIDE)
EndFunc   ;==>_TaskSched_End

#EndRegion TaskSched
#ce

Func _TaskSched_AlreadyInstalled()
	If RunWait('schtasks.exe /Query /TN ' & $sProdName, '', @SW_HIDE) <> 0 Then Return 0
	Return 1
EndFunc   ;==>_TaskSched_AlreadyInstalled

Func _TaskSched_Run()
	Local $sRun = 'schtasks.exe /Run /HRESULT /TN ' & $sProdName
	RunWait($sRun, '', @SW_HIDE)
EndFunc   ;==>_TaskSched_Run

; #FUNCTION# ====================================================================================================================
; Name ..........: _WinAPI_DwmEnableBlurBehindWindow10
; Description ...: Enables Aero-like blurred background in Windows 10.
; Syntax ........: _WinAPI_DwmEnableBlurBehindWindow10($hWnd[, $iMode = $ACCENT_ENABLE_BLURBEHIND])
; Parameters ....: $hWnd                - Window handle.
;                  $bEnable             - [optional] Enable or disable the blur effect.
;                  $iBlurColor          - [optional] Sets blur tint color and intensity (alpha)
; Return values .: 1 on success, 0 otherwise. Call _WinAPI_GetLastError on failure for more information.
; Author ........: scintilla4evr
; Modified ......: WildByDesign - added $iBlurColor for blur tint color and color intensity (alpha)
; Remarks .......:
; Related .......:
; Link ..........: http://vhanla.codigobit.info/2015/07/enable-windows-10-aero-glass-aka-blur.html and http://undoc.airesoft.co.uk/user32.dll/SetWindowCompositionAttribute.php
; Example .......: Yes
;    ACCENT_DISABLED = 0
;    ACCENT_ENABLE_GRADIENT = 1
;    ACCENT_ENABLE_TRANSPARENTGRADIENT = 2
;    ACCENT_ENABLE_BLURBEHIND = 3
;    ACCENT_ENABLE_ACRYLICBLURBEHIND = 4
;    ACCENT_ENABLE_HOSTBACKDROP = 5
;    ACCENT_INVALID_STATE = 6
; ===============================================================================================================================
Func _WinAPI_DwmEnableBlurBehindWindow10($hWnd, $bEnable = True, $iBlurColor = "")
	Local $tAccentPolicy = DllStructCreate("int AccentState; int AccentFlags; int GradientColor; int AnimationId")
	Local $tAttrData = DllStructCreate("dword Attribute; ptr DataBuffer; ulong Size")
	$tAccentPolicy.AccentState = $bEnable ? 4 : 0
	$tAccentPolicy.AccentFlags = 0
	;If $iBlurColor <> "" Then $tAccentPolicy.AccentFlags = 2
    If $iBlurColor <> "" Then $tAccentPolicy.GradientColor = $iBlurColor
	$tAccentPolicy.AnimationId = 0
	$tAttrData.Attribute = 19 ; WCA_ACCENT_POLICY
	$tAttrData.DataBuffer = DllStructGetPtr($tAccentPolicy)
	$tAttrData.Size = DllStructGetSize($tAccentPolicy)

	Local $aResult = DllCall("user32.dll", "bool", "SetWindowCompositionAttribute", "hwnd", $hWnd, "ptr", DllStructGetPtr($tAttrData))
	If @error Then Return SetError(@error, @extended, 0)

	Return $aResult[0]
EndFunc

Func _WinAPI_GetWindowTextMod($hWnd)
	Local $aCall = DllCall($hUser32, "int", "GetWindowTextW", "hwnd", $hWnd, "wstr", "", "int", 4096)
	If @error Or Not $aCall[0] Then Return ""
	Return $aCall[2]
EndFunc

; Function by argumentum
Func _percentageOfHex($iVal)
    $iVal = Int($iVal > 99 ? 100 : ($iVal < 1 ? 0 : $iVal)) ; no more than 100% or less than 0%
    Return Hex(Ceiling(($iVal * 100) * (2.55 * 100) / (100 * 100)), 2) ; calculate in integers, as floating point numbers suck in a CPU
EndFunc

Func idGUI()
	Local $hActiveWin = WinGetHandle("[ACTIVE]")
	; only start GUI if not already running
	If @Compiled Then
		If $bBoot Then
			ShellExecute(@ScriptDir & "\" & $sProdName & ".exe", "hidegui", @ScriptDir, $SHEX_OPEN)
			Return
		EndIf

		Local $iPID = ProcessExists("ImmersiveUX.exe")
		If ProcessExists("ImmersiveUX.exe") Then
			If IsAdmin() Then
				Local $iElev = _WinAPI_IsElevated_PID($iPID)
				If Not $iElev Then
					ProcessClose($iPID)
					ProcessWaitClose($iPID)
					ShellExecute(@ScriptDir & "\" & $sProdName & ".exe", "", @ScriptDir, $SHEX_OPEN)
				EndIf
				Return
			EndIf
		Else
			; start gui hidden
			ShellExecute(@ScriptDir & "\" & $sProdName & ".exe", "hidegui", @ScriptDir, $SHEX_OPEN)
			; since gui was hidden, bring original active window to foreground
			$hProcess = WinWait("Immersive UX", "", 10)
			$iPID = _WinAPI_GetProcessID($hProcess)
			$iParentPID = _WinAPI_GetParentProcess($iPID)
			$hParentProc = _GetHwndFromPID($iParentPID)
			$sParentProcName = _WinAPI_GetProcessName($iParentPID)
			If $sParentProcName = "explorer.exe" Then
				WinActivate("[CLASS:CabinetWClass]")
			Else
				WinActivate($hParentProc)
			EndIf
		EndIf
	EndIf

	Local $bAu3Running = False
	If Not @Compiled Then
		Local $aWinList = WinList()
		For $i = 1 To $aWinList[0][0]
			If StringInStr($aWinList[$i][0], "Immersive UX") Then
				$bAu3Running = True
				WinActivate($aWinList[$i][1])
				Return
			EndIf
		Next
		If Not $bAu3Running Then ShellExecute(@ScriptDir & "\" & $sProdName & ".au3", "hidegui")
		; since gui was hidden, bring original active window to foreground
		$hProcess = WinWait("Immersive UX", "", 10)
		$iPID = _WinAPI_GetProcessID($hProcess)
		$iParentPID = _WinAPI_GetParentProcess($iPID)
		$hParentProc = _GetHwndFromPID($iParentPID)
		$sParentProcName = _WinAPI_GetProcessName($iParentPID)
		If $sParentProcName = "explorer.exe" Then
			WinActivate("[CLASS:CabinetWClass]")
		Else
			WinActivate($hParentProc)
		EndIf
	EndIf
EndFunc

;Function for getting HWND from PID
Func _GetHwndFromPID($PID)
	$hWnd = 0
	$winlist = WinList()
	;Do
		For $i = 1 To $winlist[0][0]
			If $winlist[$i][0] <> "" Then
				$iPID2 = WinGetProcess($winlist[$i][1])
				If $iPID2 = $PID Then
					$hWnd = $winlist[$i][1]
					ExitLoop
				EndIf
			EndIf
		Next
	;Until $hWnd <> 0
	Return $hWnd
EndFunc;==>_GetHwndFromPID

Func ReadIniFile()
	Global $aCustomRules[0][14]

	; Global rules
	$bGlobalDarkTitleBar = _ToBoolean(IniRead($IniFile, "GlobalRules", "GlobalDarkTitleBar", "True"))
	$dGlobalBorderColor = IniRead($IniFile, "GlobalRules", "GlobalBorderColor", "")
	$dGlobalTitleBarColor = IniRead($IniFile, "GlobalRules", "GlobalTitleBarColor", "")
	$dGlobalTitleBarTextColor = IniRead($IniFile, "GlobalRules", "GlobalTitleBarTextColor", "")
	$iGlobalTitleBarBackdrop = IniRead($IniFile, "GlobalRules", "GlobalTitleBarBackdrop", "0")
	$iGlobalCornerPreference = IniRead($IniFile, "GlobalRules", "GlobalCornerPreference", "0")
	$iGlobalExtendFrameIntoClient = _ToBoolean(IniRead($IniFile, "GlobalRules", "GlobalExtendFrameIntoClient", "False"))
	$iGlobalEnableBlurBehind = _ToBoolean(IniRead($IniFile, "GlobalRules", "GlobalEnableBlurBehind", "False"))
	$dGlobalBlurTintColor = IniRead($IniFile, "GlobalRules", "GlobalBlurTintColor", "")
	$iGlobalTintColorIntensity = Int(IniRead($IniFile, "GlobalRules", "GlobalTintColorIntensity", ""))

	$bClearChangesOnExit = _ToBoolean(IniRead($IniFile, "Settings", "ClearChangesOnExit", "True"))
	$bRequireWindows11 = _ToBoolean(IniRead($IniFile, "Settings", "RequireWindows11", "True"))
	$iBorderColorOptions = Int(IniRead($IniFile, "Configuration", "BorderColorOptions", "0"))
	$sExcludeFromAllProc = IniRead($IniFile, "ProcessExclusion", "ExcludeFromAllProc", "SearchHost.exe, StartMenuExperienceHost.exe")
	$sExcludeFromAllClass = IniRead($IniFile, "ClassExclusion", "ExcludeFromAllClass", "Progman, Xaml_WindowedPopupClass")

	; put together array for custom per-app and per-class rules
	Local $aSectionNames = IniReadSectionNames($IniFile)

    For $i = 1 To $aSectionNames[0]
        ;If StringInStr($aSectionNames[$i], "CustomRules", $STR_NOCASESENSEBASIC) Then
		Local $a = $aSectionNames[$i]
        If $a <> "Configuration" And $a <> "ProcessExclusion" And $a <> "ClassExclusion" And $a <> "Settings" And $a <> "GlobalRules" And $a <> "StartupInfoOnly" And $a <> "VSCodeInstallPath" Then
			Local $aArray = IniReadSection($IniFile, $aSectionNames[$i])
			;ConsoleWrite("number of lines: " & $aArray[0][0] & @CRLF)
			If $aArray[0][0] <> '14' Then
				; problem detected in CustomRules section
				$msg = 'A problem has been detected in CustomRules section: ' & $aSectionNames[$i] & @CRLF & @CRLF
				$msg &= $sProdName & ' will exit now to prevent issue.'
				MsgBox($MB_SYSTEMMODAL, "Error", $msg)
				Exit
			EndIf
			_ArrayColDelete($aArray, 0)
			_ArrayDelete($aArray, 0)
			_ArrayTranspose($aArray)
			_ArrayAdd($aCustomRules, $aArray)
        EndIf
    Next

	; need to loop through custom rules to sanitize
	For $i = 0 To UBound($aCustomRules) - 1
        ;$aCustomRules[$i][6] = Int($aCustomRules[$i][6])
        ;$aCustomRules[$i][7] = Int($aCustomRules[$i][7])
		$aCustomRules[$i][12] = _ToBoolean($aCustomRules[$i][12])
    Next

	; need to loop through custom rules to store details for Terminal, Explorer, VSCode, VS Studio
	$bExplorerExtendClient = False
	$bWindowsTerminalHandling = False
	$bWindowsTerminalBlur = False

	For $i = 0 To UBound($aCustomRules) - 1
        If StringInStr($aCustomRules[$i][1], "explorer.exe", $STR_NOCASESENSEBASIC) Then
			; fix for Explorer blur behind titlebar
			If $aCustomRules[$i][9] = "True" Then $aCustomRules[$i][8] = "True"
			If $aCustomRules[$i][8] = "True" Then $bExplorerExtendClient = True
			If Not $aCustomRules[$i][12] Then $bExplorerExtendClient = False
		EndIf
		If StringInStr($aCustomRules[$i][1], "CabinetWClass", $STR_NOCASESENSEBASIC) Then
			; fix for Explorer blur behind titlebar
			If $aCustomRules[$i][9] = "True" Then $aCustomRules[$i][8] = "True"
			If $aCustomRules[$i][8] = "True" Then $bExplorerExtendClient = True
			If Not $aCustomRules[$i][12] Then $bExplorerExtendClient = False
		EndIf
		If StringInStr($aCustomRules[$i][1], "Terminal.exe", 2) Or StringInStr($aCustomRules[$i][1], "CASCADIA_HOSTING_WINDOW_CLASS", 2) Then
			If $aCustomRules[$i][8] = "True" Then $bWindowsTerminalHandling = True
			If $aCustomRules[$i][9] = "True" Then $bWindowsTerminalHandling = True
			If $aCustomRules[$i][9] = "True" Then $bWindowsTerminalBlur = True
			If Not $aCustomRules[$i][12] Then $bWindowsTerminalHandling = False
			If $aCustomRules[$i][12] Then
				If $aCustomRules[$i][3] Then
					$dTerminalBorderColor = $aCustomRules[$i][3]
				Else
					$dTerminalBorderColor = $dGlobalBorderColor
				EndIf
			EndIf
			If $aCustomRules[$i][6] <> "" And $aCustomRules[$i][12] Then
				$dTerminalBackdrop = $aCustomRules[$i][6]
			Else
				$dTerminalBackdrop = $iGlobalTitleBarBackdrop
			EndIf
		EndIf
		If StringInStr($aCustomRules[$i][1], "VSCodium.exe", $STR_NOCASESENSEBASIC) Then
			If $aCustomRules[$i][6] <> "" And $aCustomRules[$i][12] Then
				$dVSCodiumBackdrop = $aCustomRules[$i][6]
			Else
				$dVSCodiumBackdrop = $iGlobalTitleBarBackdrop
			EndIf
		EndIf
		If StringInStr($aCustomRules[$i][1], "Code.exe", $STR_NOCASESENSEBASIC) Then
			If $aCustomRules[$i][6] <> "" And $aCustomRules[$i][12] Then
				$dVSCodeBackdrop = $aCustomRules[$i][6]
			Else
				$dVSCodeBackdrop = $iGlobalTitleBarBackdrop
			EndIf
		EndIf
		If StringInStr($aCustomRules[$i][1], "devenv.exe", $STR_NOCASESENSEBASIC) Then
			If $aCustomRules[$i][3] Then
				$dVSStudioBorderColor = $aCustomRules[$i][3]
			Else
				$dVSStudioBorderColor = $dGlobalTitleBarColor
			EndIf
		EndIf
    Next

	; special handling related to global values if set
	If $iGlobalExtendFrameIntoClient Then
		$bExplorerExtendClient = True
		$bWindowsTerminalHandling = True
	EndIf

	If $iGlobalEnableBlurBehind Then
		$bExplorerExtendClient = True
		$bWindowsTerminalHandling = True
	EndIf

	; determine if dark mode or light mode for titlebar option
	$bAppsUseDarkTheme = RegRead('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize', 'AppsUseLightTheme') == 0 ? True : False
	$bSystemUsesDarkTheme = RegRead('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize', 'SystemUsesLightTheme') == 0 ? True : False

	If $bAppsUseDarkTheme Or $bSystemUsesDarkTheme Then
		$bDarkModeEnabled = True
	Else
		$bDarkModeEnabled = False
	EndIf

	$aExcludeProcessNames = StringSplit($sExcludeFromAllProc, ",")
	$aExcludeFromAllClass = StringSplit($sExcludeFromAllClass, ",")
	$aExclusionsCombined = StringSplit($sExcludeFromAllProc, ",")

	; create process exclusion array for all functions
	For $i = 1 To $aExcludeProcessNames[0]
		$aExcludeProcessNames[$i] = StringStripWS($aExcludeProcessNames[$i], $STR_STRIPLEADING + $STR_STRIPTRAILING)
		;$aExcludeProcessNames[$i] = StringReplace($aExcludeProcessNames[$i], "*", "")
	Next

	; create class exclusion array for all functions
	For $i = 1 To $aExcludeFromAllClass[0]
		$aExcludeFromAllClass[$i] = StringStripWS($aExcludeFromAllClass[$i], $STR_STRIPLEADING + $STR_STRIPTRAILING)
		;$aExcludeFromAllClass[$i] = StringReplace($aExcludeFromAllClass[$i], "*", "")
	Next

	; create combined exclusion array for all functions
	For $i = 1 To $aExclusionsCombined[0]
		$aExclusionsCombined[$i] = StringStripWS($aExclusionsCombined[$i], $STR_STRIPLEADING + $STR_STRIPTRAILING)
		;$aExcludeFromAllClass[$i] = StringReplace($aExcludeFromAllClass[$i], "*", "")
	Next

	; combine process and class exlusions into one global exclusion list
	_ArrayDelete($aExcludeProcessNames, 0)
	;_ArrayDelete($aExcludeFromAllClass, 0)
	;_ArrayConcatenate($aExcludeProcessNames, $aExcludeFromAllClass)
	;_ArrayDisplay($aExcludeProcessNames, "1D Target and Source concatenated")

	; combine internal and external class exclusions into one array
	_ArrayDelete($aExcludeFromAllClass, 0)
	_ArrayConcatenate($aExcludeClassNames, $aExcludeFromAllClass)
	_ArrayConcatenate($aExclusionsCombined, $aExcludeClassNames)
	_ArrayDelete($aExclusionsCombined, 0)

	; obtain system accent color for borders and/or title bars
	Local $sReadColor = RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM", "AccentColor")
	Local $sAccentColor = Hex($sReadColor)
	$sAccentColor = StringRight($sAccentColor, 6)

	$sPart1 = StringMid($sAccentColor, 5, 2)
	$sPart2 = StringMid($sAccentColor, 3, 2)
	$sPart3 = StringMid($sAccentColor, 1, 2)

	$sAccentColor = '0x' & $sPart1 & $sPart2 & $sPart3

	; blur behind color tinting and intensity
	Local $iTintColor = $dGlobalBlurTintColor
	Local $iIntensity = _percentageOfHex($iGlobalTintColorIntensity)
	Local $iTintColorSwitch = Hex(_WinAPI_SwitchColor_mod($iTintColor), 6)
	$iGlobalBlurTintColor = '0x' & $iIntensity & $iTintColorSwitch

	; check registry settings as well, will get checked on settings refresh also
	ReadFromRegistry()
EndFunc

Func ReadFromRegistry()
	$bClassicExplorer = False
	Local $sExplorerReg1 = RegRead("HKCU\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32", "ThreadingModel")
	Local $sExplorerReg2 = RegRead("HKCU\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32", "ThreadingModel")
	If $sExplorerReg1 = "Apartment" Then $bClassicExplorer = True
	If $sExplorerReg2 = "Apartment" Then $bClassicExplorer = True
EndFunc

Func _WinAPI_IsElevated_pid($iPID = 0) ; https://www.autoitscript.com/forum/topic/203065-check-if-any-process-run-as-administrator/?do=findComment&comment=1539373
	Local Static $dwDesiredAccess = ((_WinAPI_GetVersion() < 6.0) ? 0x00000400 : 0x00001000) ; https://learn.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-openprocess
	Local $hProcess, $hToken2, $aAdjust, $hToken1, $iElev, $aRet, $iError = 0
	; Enable "SeDebugPrivilege" privilege for obtain full access rights to another processes
	$hToken1 = _WinAPI_OpenProcessToken(BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
	_WinAPI_AdjustTokenPrivileges($hToken1, $SE_DEBUG_NAME, $SE_PRIVILEGE_ENABLED, $aAdjust)
	_WinAPI_CloseHandle($hToken1)
	If $iPID <> 0 Then
		$hProcess = DllCall('kernel32.dll', 'handle', 'OpenProcess', 'dword', $dwDesiredAccess, 'bool', 0, 'dword', $iPID)
		If @error Or Not $hProcess[0] Then Return SetError(@error + 10, @extended, 0)
		$hToken2 = _WinAPI_OpenProcessToken(0x0008, $hProcess[0])
	Else
		$hToken2 = _WinAPI_OpenProcessToken(0x0008)
	EndIf
	If Not $hToken2 Then
		_WinAPI_CloseHandle($hToken1)
		Return SetError(@error + 20, @extended, False)
	EndIf

	Do
		$aRet = DllCall('advapi32.dll', 'bool', 'GetTokenInformation', 'handle', $hToken2, 'uint', 20, 'uint*', 0, 'dword', 4, _
				'dword*', 0) ; TOKEN_ELEVATION
		If @error Or Not $aRet[0] Then
			$iError = @error + 30
			ExitLoop
		EndIf
		$iElev = $aRet[3]
		$aRet = DllCall('advapi32.dll', 'bool', 'GetTokenInformation', 'handle', $hToken2, 'uint', 18, 'uint*', 0, 'dword', 4, _
				'dword*', 0) ; TOKEN_ELEVATION_TYPE
		If @error Or Not $aRet[0] Then
			$iError = @error + 40
			ExitLoop
		EndIf
	Until 1
	_WinAPI_CloseHandle($hToken1)
	_WinAPI_CloseHandle($hToken2)
	If $iError Then Return SetError($iError, 0, False)
	Return SetExtended($aRet[0] - 1, $iElev)
EndFunc   ;==>_WinAPI_IsElevated_pid

Func _WinAPI_SwitchColor_mod($iColor)
	If $iColor = $DWMWA_COLOR_NONE Then Return 0xFFFFFFFE
	If $iColor = $DWMWA_COLOR_DEFAULT Then Return 0xFFFFFFFF
	Return BitOR(BitAND($iColor, 0x00FF00), BitShift(BitAND($iColor, 0x0000FF), -16), BitShift(BitAND($iColor, 0xFF0000), 16))
EndFunc

Func _WinAPI_DwmSetWindowAttribute__($hwnd, $attribute = 34, $value = 0x00FF00, $valLen = 4)
	Local $aCall = DllCall($hDwmapi, 'long', 'DwmSetWindowAttribute', 'hwnd', $hWnd, 'dword', $attribute, 'dword*', $value, 'dword', $valLen)
	If @error Then Return SetError(@error, @extended, 0)
	If $aCall[0] Then Return SetError(10, $aCall[0], 0)
	Return 1
EndFunc   ;==>_WinAPI_DwmSetWindowAttribute__

Func _WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, $tMARGINS = 0)
	If Not IsDllStruct($tMARGINS) Then
		$tMARGINS = _WinAPI_CreateMargins(-1, -1, -1, -1)
	EndIf

	Local $aCall = DllCall($hDwmapi, 'long', 'DwmExtendFrameIntoClientArea', 'hwnd', $hWnd, 'struct*', $tMARGINS)
	If @error Then Return SetError(@error, @extended, 0)
	If $aCall[0] Then Return SetError(10, $aCall[0], 0)

	Return 1
EndFunc   ;==>_WinAPI_DwmExtendFrameIntoClientArea_mod

Func _WinAPI_GetClassName_mod($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	Local $aCall = DllCall($hUser32, "int", "GetClassNameW", "hwnd", $hWnd, "wstr", "", "int", 4096)
	If @error Or Not $aCall[0] Then Return SetError(@error, @extended, '')

	Return SetExtended($aCall[0], $aCall[2])
EndFunc   ;==>_WinAPI_GetClassName_mod

Func _WinAPI_DwmEnableBlurBehindWindow_mod($hWnd, $bEnable = True, $bTransition = False, $hRgn = 0)
	Local $tBLURBEHIND = DllStructCreate('dword;bool;handle;bool')
	Local $iFlags = 0

	If $hRgn Then
		$iFlags += 2
		DllStructSetData($tBLURBEHIND, 3, $hRgn)
	EndIf

	DllStructSetData($tBLURBEHIND, 1, BitOR($iFlags, 0x05))
	DllStructSetData($tBLURBEHIND, 2, $bEnable)
	DllStructSetData($tBLURBEHIND, 4, $bTransition)

	Local $aCall = DllCall($hDwmapi, 'long', 'DwmEnableBlurBehindWindow', 'hwnd', $hWnd, 'struct*', $tBLURBEHIND)
	If @error Then Return SetError(@error, @extended, 0)
	If $aCall[0] Then Return SetError(10, $aCall[0], 0)

	Return 1
EndFunc   ;==>_WinAPI_DwmEnableBlurBehindWindow_mod

Func _WinAPI_DwmIsCompositionEnabled_mod()
	Local $aCall = DllCall($hDwmapi, 'long', 'DwmIsCompositionEnabled', 'bool*', 0)
	If @error Then Return SetError(@error, @extended, 0)
	If $aCall[0] Then Return SetError(10, $aCall[0], 0)

	Return $aCall[1]
EndFunc   ;==>_WinAPI_DwmIsCompositionEnabled_mod

Func _WinAPI_SetWinEventHook_mod($iEventMin, $iEventMax, $pEventProc, $iPID = 0, $iThreadId = 0, $iFlags = 0)
	Local $aCall = DllCall($hUser32, 'handle', 'SetWinEventHook', 'uint', $iEventMin, 'uint', $iEventMax, 'ptr', 0, _
			'ptr', $pEventProc, 'dword', $iPID, 'dword', $iThreadId, 'uint', $iFlags)
	If @error Then Return SetError(@error, @extended, 0)
	; If Not $aCall[0] Then Return SetError(1000, 0, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_SetWinEventHook_mod

Func _WinAPI_UnhookWinEvent_mod($hEventHook)
	Local $aCall = DllCall($hUser32, 'bool', 'UnhookWinEvent', 'handle', $hEventHook)
	If @error Then Return SetError(@error, @extended, False)
	; If Not $aCall[0] Then Return SetError(1000, 0, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_UnhookWinEvent_mod

Func _WinAPI_GetWindowFileName_mod($hWnd)
    Local $aCall = DllCall($hKernel32, 'HANDLE', 'OpenProcess', 'DWORD', 0x410, 'BOOL', 0, 'DWORD', WinGetProcess($hWnd)), _
          $hProc = $aCall[0]
    $aCall = DllCall($hpsapi, 'DWORD', 'GetModuleBaseNameW', 'HANDLE', $hProc, 'HANDLE', 0, 'WSTR', '', 'INT', 65536)
    DllCall($hKernel32, "BOOL", "CloseHandle", "HANDLE", $hProc)
    Return $aCall[3]
EndFunc   ;==>_WinAPI_GetWindowFileName_mod

Func _WinAPI_IsWindowVisible_mod($hWnd)
	Local $aCall = DllCall($hUser32, "bool", "IsWindowVisible", "hwnd", $hWnd)
	If @error Then Return SetError(@error, @extended, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_IsWindowVisible_mod

#cs
Func WinListtest()
        ; Temporary function used with temporary Hotkey Winkey+Esc to show list in console of window titles, hWnd, class and process
		; this is to help find certain things to include or exclude if necessary
        Local $aWinList = WinList()
        ;_ArrayDisplay($aWinList)
        ConsoleWrite("Window Title" & @TAB & @TAB & "hWnd" & @TAB & @TAB & "Class Name" & @TAB & "Process Name" & @CRLF)

        For $i = 1 To $aWinList[0][0]
		;If $sClassName = $aWinList[$i] Then Return
                Local $hWnd = $aWinList[$i][1]
                Local $sClassName = _WinAPI_GetClassName_mod($hWnd)
                $iPID = WinGetProcess ($aWinList[$i][1])
		$sName = _ProcessGetName($iPID)
                If $aWinList[$i][0] = "" Then $aWinList[$i][0] = "<blank title>"
                ;If $aWinList[$i][0] = "" Then ContinueLoop
                ConsoleWrite($aWinList[$i][0] & @TAB & @TAB & $aWinList[$i][1] & @TAB & $sClassName & @TAB & $sName & @CRLF)
	Next
EndFunc   ;==>WinListtest
#ce
