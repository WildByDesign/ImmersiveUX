#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=app.ico
#AutoIt3Wrapper_Outfile_x64=ImmersiveEngine.exe
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Immersive UX Engine
#AutoIt3Wrapper_Res_Fileversion=1.9.0
#AutoIt3Wrapper_Res_ProductName=Immersive UX Engine
#AutoIt3Wrapper_Res_ProductVersion=1.9.0
#AutoIt3Wrapper_Res_LegalCopyright=@ 2025 WildByDesign
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_HiDpi=N
#AutoIt3Wrapper_Run_Au3Stripper=y
#AutoIt3Wrapper_res_Compatibility=Win10
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <AutoItExitCodes.au3>
#include <Array.au3>
#include <Misc.au3>
#include <File.au3>

#include <WindowsConstants.au3>
#include <WinAPIvkeysConstants.au3>

#include "include\MediaPlayerUDF.au3"
#include "include\UIAEH_AutomationEventHandler.au3"

; HotKey only used temporarily when needing to look for window classes to include/exclude
;#include <Process.au3>
;HotKeySet("{SPACE}", "WinListtest")

; use RequireAdmin to color all apps, otherwise only user-mode apps will be colored
;#RequireAdmin

; Per-monitor V2 DPI awareness
DllCall("User32.dll", "bool", "SetProcessDpiAwarenessContext" , "HWND", "DPI_AWARENESS_CONTEXT" -4)

Global $iPID, $sINFO, $oService, $fSpeed = 4
Global $IniFile = @ScriptDir & "\ImmersiveUX.ini"
Global $bDarkModeEnabled, $bClearChangesOnExit, $bRequireWindows11, $iBorderColorOptions
Global $dGlobalBlurTintColorInactive, $iGlobalColorIntensityInactive
Global $aExcludeProcessNames, $aExcludeFromAllClass, $aExclusionsCombined
Global $bClassicExplorer, $bExplorerExtendClient
Global $bGlobalDarkTitleBar, $dGlobalBorderColor, $dGlobalTitleBarColor, $dGlobalTitleBarTextColor, $iGlobalTitleBarBackdrop, $iGlobalCornerPreference, $iGlobalExtendFrameIntoClient, $iGlobalEnableBlurBehind
Global $iGlobalBlurTintColor, $dGlobalBlurTintColor, $iGlobalBlurOpacity
Global $dTerminalBorderColor, $dTerminalBackdrop, $bWindowsTerminalHandling, $dVSStudioBorderColor, $bWindowsTerminalBlur
Global $dVSCodiumBackdrop, $dVSCodeBackdrop
Global $bLiveEnabled, $bLoopEnabled
Global $iDuration, $iDurationMs, $oWinStart, $iDurationPause
Global $bMediaOpened = False
;Global $hActiveWnd
Global Static $hLEDWndLast
Global $bEnable = False
Global $bBoot = True
Global $bIsAnyBlurEnabled = False
Global $aCustomRules[0][16]
Global $bElevated = False
Global $sProdName = "ImmersiveUX"
Global $sEngName = "ImmersiveEngine"
Global $DWMWA_COLOR_NONE = "0xFFFFFFFE"
Global $DWMWA_COLOR_DEFAULT = "0xFFFFFFFF"
Global $WCA_ACCENT_POLICY = 19
Global $ACCENT_DISABLED = 0
Global $ACCENT_ENABLE_GRADIENT = 1
Global $ACCENT_ENABLE_TRANSPARENTGRADIENT = 2
Global $ACCENT_ENABLE_BLURBEHIND = 3
Global $ACCENT_ENABLE_ACRYLICBLURBEHIND = 4
Global $ACCENT_ENABLE_HOSTBACKDROP = 5
Global $ACCENT_INVALID_STATE = 6

Global $hDwmapi = DllOpen('dwmapi.dll')
Global $hUser32 = DllOpen('user32.dll')
Global $hKernel32 = DllOpen('kernel32.dll')
Global $hPsapi = DllOpen('psapi.dll')
Global $hGdi = DllOpen('gdi32.dll')
Global $hUxtheme = DllOpen('uxtheme.dll')

Opt("WinTitleMatchMode", 3)

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

If StringInStr($CmdLineRaw, "bordereffects") Then
	_BorderEffectsProcess()
	Exit
EndIf

Global $aExcludeClassNames[17] = ["Progman", "Xaml_WindowedPopupClass", "Windows.UI.Core.CoreComponentInputSource", _
	"Windows.UI.Core.CoreWindow", "Windows.UI.Composition.DesktopWindowContentBridge", "Chrome_RenderWidgetHostHWND", _
	"ControlCenterWindow", "TopLevelWindowForOverflowXamlIsland", "SysDragImage", "IME", "OleMainThreadWndClass", "MSCTFIME UI", _
	"CicMarshalWndClass", "XCPTimerClass", "msctls_statusbar32", "Microsoft.UI.Content.PopupWindowSiteBridge", "XamlExplorerHostIslandWindow"]

ReadIniFile()

If StringInStr($CmdLineRaw, "live") Then
	_ImmersiveLiveProcess()
	Exit
EndIf

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

Global $aSectionTS[4][2] = [[3, ""], ["StartedByTask", $g_iIsTaskSchedRun], ["PID", @AutoItPID], ["Elevated", $bElevated]]
IniWriteSection($IniFile, "StartupInfoOnly", $aSectionTS)

Opt("SetExitCode", 1)

OnAutoItExitRegister(DoCleanUp)

Local $hWnd = _GetHwndFromPID(@AutoItPID)
_WinAPI_SetWindowText_mod($hWnd, "Immersive UX Engine")

Global $hHookFunc = DllCallbackRegister('_WinEventProc', 'none', 'ptr;uint;hwnd;int;int;uint;uint')
Global $hWinHook = _WinAPI_SetWinEventHook_mod($EVENT_SYSTEM_FOREGROUND, $EVENT_OBJECT_NAMECHANGE, DllCallbackGetPtr($hHookFunc))

Func _ToBoolean($sString)
    Return (StringStripWS(StringUpper($sString), 8) = "TRUE" ? True : False)
EndFunc   ;==>_ToBoolean

; don't apply to all during boot as there is no need
$Uptime = _WinAPI_StrFromTimeInterval(_WinAPI_GetTickCount64_mod())
If StringInStr($Uptime, "min") Then
	$bBoot = False
	; apply settings to all currently running apps
	SetBorderColor_apply2all()
EndIf

; set process priority
ProcessSetPriority(@AutoItPID, 4)

; start GUI/tray process
idGUI()

; start ImmersiveLED border effects if configured
If $iBorderColorOptions = "2" Then
	If @Compiled Then
		ShellExecute(@ScriptDir & "\ImmersiveEngine.exe", "bordereffects", @ScriptDir, $SHEX_OPEN)
	ElseIf Not @Compiled Then
		ShellExecute(@ScriptDir & "\ImmersiveEngine.au3", "bordereffects")
	EndIf
EndIf

; start Immersive UX Live if configured
If $bLiveEnabled Then
	If @Compiled Then
		ShellExecute(@ScriptDir & "\ImmersiveEngine.exe", "live", @ScriptDir, $SHEX_OPEN)
	ElseIf Not @Compiled Then
		ShellExecute(@ScriptDir & "\ImmersiveEngine.au3", "live")
	EndIf
EndIf

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
			If Not $aCustomRules[$i][14] Then
				;If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
				;If $iBorderColorOptions <> "0" Then
				If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, 0xFFFFFFFF)
				;EndIf
				If $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, 0xFFFFFFFF)
				If $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, 0xFFFFFFFF)
				If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, 0)
				If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, 0)
				If $iGlobalEnableBlurBehind Then _WinAPI_DwmEnableBlurBehindWindow11($hWnd, $ACCENT_DISABLED)
				If $iGlobalExtendFrameIntoClient And Not $iGlobalEnableBlurBehind Then
					; fix for file explorer losing window control buttons occasionally
					If $sClassName <> "CabinetWClass" Then _WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
				EndIf
				Return
			EndIf
			; border color reset to default
			If $aCustomRules[$i][3] Or $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, 0xFFFFFFFF)
			; titlebar color reset to default
			If $aCustomRules[$i][4] Or $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, 0xFFFFFFFF)
			; titlebar text color reset to default
			If $aCustomRules[$i][5] Or $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, 0xFFFFFFFF)
			; titlebar backdrop reset to default
			If $aCustomRules[$i][6] <> "" Or $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, 0)
			; corner preference reset to default
			If $aCustomRules[$i][7] <> "" Or $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, 0)
			; blur behind removal
			If $aCustomRules[$i][9] = "True" Or $iGlobalEnableBlurBehind Then _WinAPI_DwmEnableBlurBehindWindow11($hWnd, $ACCENT_DISABLED)
			; ExtendFrameIntoClientArea removal
			If $aCustomRules[$i][8] = "True" Or $iGlobalExtendFrameIntoClient Then
				; only enable ExtendFrameIntoClientArea if blur behind is not enabled
				If $aCustomRules[$i][9] <> "True" Or Not $iGlobalEnableBlurBehind Then
					; fix for file explorer losing window control buttons occasionally
					If $sClassName <> "CabinetWClass" Then _WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
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
		If $iGlobalEnableBlurBehind Then _WinAPI_DwmEnableBlurBehindWindow11($hWnd, $ACCENT_DISABLED)
		If $iGlobalExtendFrameIntoClient And Not $iGlobalEnableBlurBehind Then
			; fix for file explorer losing window control buttons occasionally
			If $sClassName <> "CabinetWClass" Then _WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
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
	If $iBorderColorOptions = "0" Then
		$hActiveWndLast = _WinAPI_GetForegroundWindow_mod()
		$sClassNameActive = _WinAPI_GetClassName_mod($hActiveWndLast)
		$sNameActive = _WinAPI_GetWindowFileName_mod($hActiveWndLast)
		If $bIsAnyBlurEnabled Then _BlurOnlyActive($hActiveWndLast, $sClassNameActive, $sNameActive)
		_ColorBorderOnly($hActiveWndLast, $sClassNameActive, $sNameActive)
	EndIf
EndFunc   ;==>SetBorderColor_apply2all

Func MainColoringFunction($hWnd, $sClassName)
	Local $sName = _WinAPI_GetWindowFileName_mod($hWnd)
	If Not @Compiled Then
		Local $sWindow = _WinAPI_GetWindowText_mod($hWnd)
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
	Local $bMatchesFound = False
	Local $bIsDarkTitle = _WinAPI_ShouldAppsUseDarkMode()

	; determine if process rule or class rule matches for custom rules
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If $sName = $aCustomRules[$i][1] Or $sClassName = $aCustomRules[$i][1] Then
			; skip custom rules that are not Enabled
			If Not $aCustomRules[$i][14] Then
				If $bGlobalDarkTitleBar And $bIsDarkTitle Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
				If $iBorderColorOptions = "1" Then
					If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
				EndIf
				If $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor_mod($dGlobalTitleBarColor))
				If $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor_mod($dGlobalTitleBarTextColor))
				If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($iGlobalTitleBarBackdrop))
				If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, Int($iGlobalCornerPreference))
				If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColorInactive, $iGlobalColorIntensityInactive)
				If Not $iGlobalEnableBlurBehind Then
					; only enable ExtendFrameIntoClientArea if blur behind is not enabled
					If $iGlobalExtendFrameIntoClient Then _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
				EndIf

				Return
			EndIf
			; dark mode titlebar, fallback to global if not set
			If $aCustomRules[$i][2] = "True" And $bIsDarkTitle Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
			EndIf
			If $aCustomRules[$i][2] = "" Then
				If $bGlobalDarkTitleBar And $bIsDarkTitle Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
			EndIf
			; border color, fallback to global if not set
			If $iBorderColorOptions = "1" Then
				If $aCustomRules[$i][3] Then
					_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($aCustomRules[$i][3]))
				Else
					If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
				EndIf
			EndIf
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
			; blur behind, fallback to global if not set
			If $aCustomRules[$i][9] = "True" Then _EnableBlur11($hWnd, $sName, $sClassName, $aCustomRules[$i][12], $aCustomRules[$i][13])
			If $aCustomRules[$i][9] = "" Then
				; only enable blur if not custom set
				If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColorInactive, $iGlobalColorIntensityInactive)
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
		If $bGlobalDarkTitleBar And $bIsDarkTitle Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
		If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
		If $dGlobalTitleBarColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor_mod($dGlobalTitleBarColor))
		If $dGlobalTitleBarTextColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor_mod($dGlobalTitleBarTextColor))
		If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($iGlobalTitleBarBackdrop))
		If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, Int($iGlobalCornerPreference))
		If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColorInactive, $iGlobalColorIntensityInactive)
		If $iGlobalExtendFrameIntoClient And Not $iGlobalEnableBlurBehind Then _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
	EndIf
EndFunc

Func _BlurOnlyActive($hWnd, $sClassName, $sName)
	Local $i
	Local $bMatchesFound = False
	Local $dBlurColor, $iBlurOpacity

	; determine if process rule or class rule matches for custom rules
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If $sName = $aCustomRules[$i][1] Or $sClassName = $aCustomRules[$i][1] Then

			; determine if custom rule holds values else fallback to global value
			If $aCustomRules[$i][10] Then $dBlurColor = $aCustomRules[$i][10]
			If $aCustomRules[$i][11] Then $iBlurOpacity = $aCustomRules[$i][11]
			If Not $aCustomRules[$i][10] Then $dBlurColor = $dGlobalBlurTintColor
			If Not $aCustomRules[$i][11] Then $iBlurOpacity = $iGlobalBlurOpacity

			; skip custom rules that are not Enabled
			If Not $aCustomRules[$i][14] Then
				If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColor, $iGlobalBlurOpacity)
				Return
			EndIf
			; blur behind, fallback to global if not set
			If $aCustomRules[$i][9] = "True" Then _EnableBlur11($hWnd, $sName, $sClassName, $dBlurColor, $iBlurOpacity)

			If $aCustomRules[$i][9] = "" Then
				; only enable blur if not custom set
				If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColor, $iGlobalBlurOpacity)
			EndIf
			$bMatchesFound = True
		EndIf
    Next

	; fallback to global when no custom rules match
	If Not $bMatchesFound Then
		If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColor, $iGlobalBlurOpacity)
	EndIf
EndFunc

Func _BlurOnlyInactive($hWnd, $sClassName, $sName)
	Local $i
	Local $bMatchesFound = False
	Local $dBlurColor, $iBlurOpacity

	; determine if process rule or class rule matches for custom rules
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If $sName = $aCustomRules[$i][1] Or $sClassName = $aCustomRules[$i][1] Then

			; determine if custom rule holds values else fallback to global value
			If $aCustomRules[$i][12] Then $dBlurColor = $aCustomRules[$i][12]
			If $aCustomRules[$i][13] Then $iBlurOpacity = $aCustomRules[$i][13]
			If Not $aCustomRules[$i][12] Then $dBlurColor = $dGlobalBlurTintColorInactive
			If Not $aCustomRules[$i][13] Then $iBlurOpacity = $iGlobalColorIntensityInactive

			; skip custom rules that are not Enabled
			If Not $aCustomRules[$i][14] Then
				If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColorInactive, $iGlobalColorIntensityInactive)
				Return
			EndIf
			; blur behind, fallback to global if not set
			If $aCustomRules[$i][9] = "True" Then _EnableBlur11($hWnd, $sName, $sClassName, $dBlurColor, $iBlurOpacity)

			If $aCustomRules[$i][9] = "" Then
				; only enable blur if not custom set
				If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColorInactive, $iGlobalColorIntensityInactive)
			EndIf
			$bMatchesFound = True
		EndIf
    Next

	; fallback to global when no custom rules match
	If Not $bMatchesFound Then
		If $iGlobalEnableBlurBehind Then _EnableBlur11($hWnd, $sName, $sClassName, $dGlobalBlurTintColorInactive, $iGlobalColorIntensityInactive)
	EndIf
EndFunc

Func _ColorBorderOnly($hWnd, $sClassName, $sName)
	Local $bMatchesFound = False
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If $sName = $aCustomRules[$i][1] Or $sClassName = $aCustomRules[$i][1] Then
			$bMatchesFound = True
			; skip custom rules that are not Enabled
			If Not $aCustomRules[$i][14] Then
				If $iBorderColorOptions = "1" Then
					If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
				EndIf
			EndIf
			If $aCustomRules[$i][3] And $iBorderColorOptions = "0" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($aCustomRules[$i][3]))
			EndIf
			If Not $aCustomRules[$i][3] And $dGlobalBorderColor And $iBorderColorOptions = "0" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
			EndIf
			If Not $aCustomRules[$i][3] And Not $dGlobalBorderColor Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, $DWMWA_COLOR_DEFAULT)
			EndIf
		EndIf
    Next

	If Not $bMatchesFound Then
		If $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dGlobalBorderColor))
		If Not $dGlobalBorderColor Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, $DWMWA_COLOR_DEFAULT)
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
		;_WinAPI_DwmEnableBlurBehindWindow11($hWnd, 0) ; only needed for old vibrancy method
		_WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($dVSCodiumBackdrop))
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	ElseIf $sName = 'Code.exe' Then
		Sleep(20)
		;_WinAPI_DwmEnableBlurBehindWindow11($hWnd, 0) ; only needed for old vibrancy method
		_WinAPI_DwmSetWindowAttribute__($hWnd, 38, Int($dVSCodeBackdrop))
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	ElseIf $sClassName = "CASCADIA_HOSTING_WINDOW_CLASS" Then
		_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
		If $aCustomRules[$i][3] Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($aCustomRules[$i][3]))
	Else
		;_WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	EndIf
EndFunc

Func _EnableBlur11($hWnd, $sName, $sClassName, $BlendColor = "", $ColorOpacity = "")
	_WinAPI_DwmEnableBlurBehindWindow11($hWnd, $ACCENT_ENABLE_ACRYLICBLURBEHIND, True, $BlendColor, $ColorOpacity)

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
	Local Static $hWndLastReorder, $hWndLastNameChange, $hActiveWndLast
	Local $sActiveWindow, $sName, $sClassName
	Local $hTerminal, $hExplorer
	Local $bMatchesFound = False
    Switch $iEvent
		Case $EVENT_OBJECT_SHOW
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
			$sActiveWindow = _WinAPI_GetWindowText_mod($hWnd)
			If $sActiveWindow = "" Then Return

			MainColoringFunction($hWnd, $sClassName)

		Case $EVENT_SYSTEM_FOREGROUND
			; this Case is mostly for handling border coloring and some special handling

			; fix modern File Explorer losing client area backdrop material when losing focus
			; fix modern File Explorer titlebar losing blur after gaining focus
			If $bExplorerExtendClient And Not $bClassicExplorer Then 
				$hExplorer = WinGetHandle("[CLASS:CabinetWClass]")
				If $hExplorer Then _WinAPI_DwmExtendFrameIntoClientArea_mod($hExplorer, _WinAPI_CreateMargins(-1, -1, -1, -1))
			EndIf

			$sActiveWindow = _WinAPI_GetWindowText_mod($hWnd)

			; Visual Studio Handling
			If $sActiveWindow = 'Microsoft Visual Studio' Then
				Sleep(20)
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor_mod($dVSStudioBorderColor))
			EndIf

			; special handling for Windows Terminal backdrop
			If $bWindowsTerminalHandling Then
				$hTerminal = WinGetHandle("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]")
				If $hTerminal Then
					If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hTerminal, 38, Int($dTerminalBackdrop))
					Sleep(20)
					If Not $bWindowsTerminalBlur Then _WinAPI_DwmSetWindowAttribute__($hTerminal, 38, Int($dTerminalBackdrop))
				EndIf
			EndIf

			If $bIsAnyBlurEnabled Or $iBorderColorOptions = "0" Then
				; border color, only color active window
				$hActiveWnd = _WinAPI_GetForegroundWindow_mod()
				If $hActiveWnd <> $hActiveWndLast Then
					; exclude class names and process names from global exclusions
					$sClassName = _WinAPI_GetClassName_mod($hActiveWndLast)
					$sName = _WinAPI_GetWindowFileName_mod($hActiveWndLast)
					For $i = 0 To UBound($aExclusionsCombined) -1
						If $sName = $aExclusionsCombined[$i] Or $sClassName = $aExclusionsCombined[$i] Then $bMatchesFound = True
					Next
					; remove blend color
					If Not $bMatchesFound Then
						; need to switch to inactive blur func
						;WinSetTrans($hActiveWndLast, "", 160)
						;WinSetTrans($hActiveWndLast, "", 255)
						If $bIsAnyBlurEnabled Then _BlurOnlyInactive($hActiveWndLast, $sClassName, $sName)
						; remove border on inactive window
						If $iBorderColorOptions = "0" Then _WinAPI_DwmSetWindowAttribute__($hActiveWndLast, 34, $DWMWA_COLOR_NONE)
					EndIf
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

			If $bIsAnyBlurEnabled Then _BlurOnlyActive($hWnd, $sClassName, $sName)
			;WinSetTrans($hWnd, "", 255)
			If $iBorderColorOptions = "0" Then
				; add slight delay to prevent coloring border too early
				Sleep(20)
				_ColorBorderOnly($hWnd, $sClassName, $sName)
			EndIf

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

Func _TaskSched_AlreadyInstalled()
	If RunWait('schtasks.exe /Query /TN ' & $sProdName, '', @SW_HIDE) <> 0 Then Return 0
	Return 1
EndFunc   ;==>_TaskSched_AlreadyInstalled

Func _TaskSched_Run()
	Local $sRun = 'schtasks.exe /Run /HRESULT /TN ' & $sProdName
	RunWait($sRun, '', @SW_HIDE)
EndFunc   ;==>_TaskSched_Run

; #FUNCTION# ====================================================================================================================
; Name ..........: _WinAPI_DwmEnableBlurBehindWindow11
; Description ...: Enables Aero-like blurred background in Windows 11.
; Syntax ........: _WinAPI_DwmEnableBlurBehindWindow11($hWnd[, $AccentState, $BlendColor, $ColorOpacity, $AccentFlags, $AnimationId])
; Parameters ....: $hWnd                - Window handle
;                  $AccentState         - [optional] Enable or disable the blur effect
;                  $IncludeCaption      - [optional] Extend effects to the titlebar
;                  $BlendColor          - [optional] Sets GradientColor
;                  $ColorOpacity        - [optional] Sets blending color opacity value
;                  $AccentFlags         - [optional] Sets AccentFlags value
;                  $AnimationId         - [optional] Sets AnimationId value
; Return values .: 1 on success, 0 otherwise. Call _WinAPI_GetLastError on failure for more information.
; Author ........: scintilla4evr
; Modified ......: WildByDesign - added $AccentState, $BlendColor, $ColorOpacity, $AccentFlags and $AnimationId
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: Yes
;    ACCENT_DISABLED = 0
;    ACCENT_ENABLE_GRADIENT = 1
;    ACCENT_ENABLE_TRANSPARENTGRADIENT = 2
;    ACCENT_ENABLE_BLURBEHIND = 3
;    ACCENT_ENABLE_ACRYLICBLURBEHIND = 4
;    ACCENT_ENABLE_HOSTBACKDROP = 5
;    ACCENT_INVALID_STATE = 6
; ===============================================================================================================================
Func _WinAPI_DwmEnableBlurBehindWindow11($hWnd, $AccentState = $ACCENT_ENABLE_ACRYLICBLURBEHIND, $IncludeCaption = True, $BlendColor = "", $ColorOpacity = "", $AccentFlags = 0, $AnimationId = 0)
    If $AccentState And $IncludeCaption Then
		Local $hRgn = _WinAPI_CreateEllipticRgn_mod(_WinAPI_CreateRectEx(0, 0, 0, 0))
		_WinAPI_DwmEnableBlurBehindWindow_mod($hWnd, 1, 0, $hRgn)
		If $hRgn Then _WinAPI_DeleteObject($hRgn)
	EndIf
    If Not $AccentState Then _WinAPI_DwmEnableBlurBehindWindow_mod($hWnd, 0)
    Local $tAccentPolicy = DllStructCreate("int AccentState; int AccentFlags; int GradientColor; int AnimationId")
    Local $tAttrData = DllStructCreate("dword Attribute; ptr DataBuffer; ulong Size")
    $tAccentPolicy.AccentState = $AccentState
    If $AccentState = $ACCENT_ENABLE_TRANSPARENTGRADIENT And $AccentFlags = 0 Then $AccentFlags = 2
    $tAccentPolicy.AccentFlags = $AccentFlags
	If $BlendColor Then
		Local $iVal = Int($ColorOpacity > 99 ? 100 : ($ColorOpacity < 1 ? 0 : $ColorOpacity)) ; no more than 100% or less than 0%
		Local $sTransparencyHex = Hex(Ceiling(($iVal * 100) * (2.55 * 100) / (100 * 100)), 2)
		$tAccentPolicy.GradientColor = '0x' & $sTransparencyHex & Hex(_WinAPI_SwitchColor_mod($BlendColor), 6)
	EndIf
    $tAccentPolicy.AnimationId = $AnimationId
    $tAttrData.Attribute = $WCA_ACCENT_POLICY
    $tAttrData.DataBuffer = DllStructGetPtr($tAccentPolicy)
    $tAttrData.Size = DllStructGetSize($tAccentPolicy)

    Local $aResult = DllCall($hUser32, "bool", "SetWindowCompositionAttribute", "hwnd", $hWnd, "ptr", DllStructGetPtr($tAttrData))
	If @error Then Return SetError(@error, @extended, 0)

    If $AccentState And $IncludeCaption Then _WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	If Not $AccentState And $IncludeCaption Then
		Local $sClassName = _WinAPI_GetClassName_mod($hWnd)
		If $sClassName <> "CabinetWClass" Then _WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(0, 0, 0, 0))
		If $sClassName = "CabinetWClass" Then _WinAPI_DwmExtendFrameIntoClientArea_mod($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	EndIf

    Return $aResult[0]
EndFunc   ;==>_WinAPI_DwmEnableBlurBehindWindow11

Func _WinAPI_GetWindowText_mod($hWnd)
	Local $aCall = DllCall($hUser32, "int", "GetWindowTextW", "hwnd", $hWnd, "wstr", "", "int", 4096)
	If @error Or Not $aCall[0] Then Return ""
	Return $aCall[2]
EndFunc   ;==>_WinAPI_GetWindowText_mod

Func _WinAPI_SetWindowText_mod($hWnd, $sText)
	Local $aCall = DllCall($hUser32, "bool", "SetWindowTextW", "hwnd", $hWnd, "wstr", $sText)
	If @error Then Return SetError(@error, @extended, False)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_SetWindowText_mod

Func idGUI()
	Local $hActiveWin = _WinAPI_GetForegroundWindow_mod()
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
			$iPID = _WinAPI_GetProcessID_mod($hProcess)
			$iParentPID = _WinAPI_GetParentProcess_mod($iPID)
			$hParentProc = _GetHwndFromPID($iParentPID)
			$sParentProcName = _WinAPI_GetProcessName_mod($iParentPID)
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
			If $aWinList[$i][0] = "Immersive UX" Then
				$bAu3Running = True
				WinActivate($aWinList[$i][1])
				Return
			EndIf
		Next
		If Not $bAu3Running Then ShellExecute(@ScriptDir & "\" & $sProdName & ".au3", "hidegui")
		; since gui was hidden, bring original active window to foreground
		$hProcess = WinWait("Immersive UX", "", 10)
		$iPID = _WinAPI_GetProcessID_mod($hProcess)
		$iParentPID = _WinAPI_GetParentProcess_mod($iPID)
		$hParentProc = _GetHwndFromPID($iParentPID)
		$sParentProcName = _WinAPI_GetProcessName_mod($iParentPID)
		If $sParentProcName = "explorer.exe" Then
			WinActivate("[CLASS:CabinetWClass]")
		Else
			WinActivate($hParentProc)
		EndIf
	EndIf
EndFunc

; Function for getting HWND from PID
Func _GetHwndFromPID($PID)
	$hWnd = 0
	$winlist = WinList()
	For $i = 1 To $winlist[0][0]
		If $winlist[$i][0] <> "" Then
			$iPID2 = WinGetProcess($winlist[$i][1])
			If $iPID2 = $PID Then
				$hWnd = $winlist[$i][1]
				ExitLoop
			EndIf
		EndIf
	Next
	Return $hWnd
EndFunc   ;==>_GetHwndFromPID

Func ReadIniFile()
	Global $aCustomRules[0][16]

	; Immersive Live
	$bLiveEnabled = _ToBoolean(IniRead($IniFile, "ImmersiveLive", "Enabled", ""))
	$bLoopEnabled = _ToBoolean(IniRead($IniFile, "ImmersiveLive", "LoopEnabled", ""))

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
	$iGlobalBlurOpacity = Int(IniRead($IniFile, "GlobalRules", "GlobalTintColorIntensity", ""))
	$dGlobalBlurTintColorInactive = IniRead($IniFile, "GlobalRules", "GlobalBlurTintColorInactive", "")
    $iGlobalColorIntensityInactive = Int(IniRead($IniFile, "GlobalRules", "GlobalColorIntensityInactive", ""))

	If $iGlobalEnableBlurBehind Then $bIsAnyBlurEnabled = True

	$bClearChangesOnExit = _ToBoolean(IniRead($IniFile, "Settings", "ClearChangesOnExit", "True"))
	$bRequireWindows11 = _ToBoolean(IniRead($IniFile, "Settings", "RequireWindows11", "True"))
	$iBorderColorOptions = IniRead($IniFile, "Configuration", "BorderColorOptions", "0")
	$sExcludeFromAllProc = IniRead($IniFile, "ProcessExclusion", "ExcludeFromAllProc", "SearchHost.exe, StartMenuExperienceHost.exe")
	$sExcludeFromAllClass = IniRead($IniFile, "ClassExclusion", "ExcludeFromAllClass", "Progman, Xaml_WindowedPopupClass")

	; put together array for custom per-app and per-class rules
	Local $aSectionNames = IniReadSectionNames($IniFile)

    For $i = 1 To $aSectionNames[0]
        ;If StringInStr($aSectionNames[$i], "CustomRules", $STR_NOCASESENSEBASIC) Then
		Local $a = $aSectionNames[$i]
        If $a <> "Configuration" And $a <> "ProcessExclusion" And $a <> "ClassExclusion" And $a <> "Settings" And $a <> "GlobalRules" And $a <> "StartupInfoOnly" And $a <> "VSCodeInstallPath" And $a <> "ImmersiveLive" Then
			Local $aArray = IniReadSection($IniFile, $aSectionNames[$i])
			;ConsoleWrite("number of lines: " & $aArray[0][0] & @CRLF)
			#cs
			If $aArray[0][0] <> '14' Then
				; problem detected in CustomRules section
				$msg = 'A problem has been detected in CustomRules section: ' & $aSectionNames[$i] & @CRLF & @CRLF
				$msg &= $sProdName & ' will exit now to prevent issue.'
				MsgBox($MB_SYSTEMMODAL, "Error", $msg)
				Exit
			EndIf
			#ce
			If $aArray[0][0] = "14" Then
                _ArrayInsert($aArray, 13, "BlurTintColorInactive", 0)
                _ArrayInsert($aArray, 14, "ColorIntensityInactive", 0)
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
		$aCustomRules[$i][14] = _ToBoolean($aCustomRules[$i][14])

		If $aCustomRules[$i][9] = "True" Then $bIsAnyBlurEnabled = True
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
			If Not $aCustomRules[$i][14] Then $bExplorerExtendClient = False
		EndIf
		If StringInStr($aCustomRules[$i][1], "CabinetWClass", $STR_NOCASESENSEBASIC) Then
			; fix for Explorer blur behind titlebar
			If $aCustomRules[$i][9] = "True" Then $aCustomRules[$i][8] = "True"
			If $aCustomRules[$i][8] = "True" Then $bExplorerExtendClient = True
			If Not $aCustomRules[$i][14] Then $bExplorerExtendClient = False
		EndIf
		If StringInStr($aCustomRules[$i][1], "Terminal.exe", 2) Or StringInStr($aCustomRules[$i][1], "CASCADIA_HOSTING_WINDOW_CLASS", 2) Then
			If $aCustomRules[$i][8] = "True" Then $bWindowsTerminalHandling = True
			If $aCustomRules[$i][9] = "True" Then $bWindowsTerminalHandling = True
			If $aCustomRules[$i][9] = "True" Then $bWindowsTerminalBlur = True
			If Not $aCustomRules[$i][14] Then $bWindowsTerminalHandling = False
			If $aCustomRules[$i][14] Then
				If $aCustomRules[$i][3] Then
					$dTerminalBorderColor = $aCustomRules[$i][3]
				Else
					$dTerminalBorderColor = $dGlobalBorderColor
				EndIf
			EndIf
			If $aCustomRules[$i][6] <> "" And $aCustomRules[$i][14] Then
				$dTerminalBackdrop = $aCustomRules[$i][6]
			Else
				$dTerminalBackdrop = $iGlobalTitleBarBackdrop
			EndIf
		EndIf
		If StringInStr($aCustomRules[$i][1], "VSCodium.exe", $STR_NOCASESENSEBASIC) Then
			If $aCustomRules[$i][6] <> "" And $aCustomRules[$i][14] Then
				$dVSCodiumBackdrop = $aCustomRules[$i][6]
			Else
				$dVSCodiumBackdrop = $iGlobalTitleBarBackdrop
			EndIf
		EndIf
		If StringInStr($aCustomRules[$i][1], "Code.exe", $STR_NOCASESENSEBASIC) Then
			If $aCustomRules[$i][6] <> "" And $aCustomRules[$i][14] Then
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
		$hProcess = DllCall($hKernel32, 'handle', 'OpenProcess', 'dword', $dwDesiredAccess, 'bool', 0, 'dword', $iPID)
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

Func _WinAPI_CreateEllipticRgn_mod($tRECT)
	Local $aCall = DllCall($hGdi, 'handle', 'CreateEllipticRgnIndirect', 'struct*', $tRECT)
	If @error Then Return SetError(@error, @extended, False)
	; If Not $aCall[0] Then Return SetError(1000, 0, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_CreateEllipticRgn_mod

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

Func _WinAPI_GetMousePos_mod($bToClient = False, $hWnd = 0)
	Local $iMode = Opt("MouseCoordMode", 1)
	Local $aPos = MouseGetPos()
	Opt("MouseCoordMode", $iMode)

	Local $tPOINT = DllStructCreate($tagPOINT)
	DllStructSetData($tPOINT, "X", $aPos[0])
	DllStructSetData($tPOINT, "Y", $aPos[1])
	If $bToClient And Not _WinAPI_ScreenToClient_mod($hWnd, $tPOINT) Then Return SetError(@error + 20, @extended, 0)

	Return $tPOINT
EndFunc   ;==>_WinAPI_GetMousePos_mod

Func _WinAPI_ScreenToClient_mod($hWnd, ByRef $tPoint)
	Local $aCall = DllCall($hUser32, "bool", "ScreenToClient", "hwnd", $hWnd, "struct*", $tPoint)
	If @error Then Return SetError(@error, @extended, False)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_ScreenToClient_mod

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

Func _WinAPI_IsWindowEnabled_mod($hWnd)
	Local $aCall = DllCall($hUser32, 'bool', 'IsWindowEnabled', 'hwnd', $hWnd)
	If @error Then Return SetError(@error, @extended, False)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_IsWindowEnabled_mod

Func _WinAPI_GetForegroundWindow_mod()
	Local $aCall = DllCall($hUser32, "hwnd", "GetForegroundWindow")
	If @error Then Return SetError(@error, @extended, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_GetForegroundWindow_mod

Func _WinAPI_GetParentProcess_mod($iPID = 0)
	If Not $iPID Then $iPID = @AutoItPID

	Local $hSnapshot = DllCall($hKernel32, 'handle', 'CreateToolhelp32Snapshot', 'dword', $TH32CS_SNAPPROCESS, 'dword', 0)
	If @error Or Not $hSnapshot[0] Then Return SetError(@error + 10, @extended, 0)

	Local $tPROCESSENTRY32 = DllStructCreate($tagPROCESSENTRY32)
	Local $iResult = 0

	$hSnapshot = $hSnapshot[0]
	DllStructSetData($tPROCESSENTRY32, 'Size', DllStructGetSize($tPROCESSENTRY32))
	Local $aCall = DllCall($hKernel32, 'bool', 'Process32FirstW', 'handle', $hSnapshot, 'struct*', $tPROCESSENTRY32)
	Local $iError = @error
	While (Not @error) And ($aCall[0])
		If DllStructGetData($tPROCESSENTRY32, 'ProcessID') = $iPID Then
			$iResult = DllStructGetData($tPROCESSENTRY32, 'ParentProcessID')
			ExitLoop
		EndIf
		$aCall = DllCall($hKernel32, 'bool', 'Process32NextW', 'handle', $hSnapshot, 'struct*', $tPROCESSENTRY32)
		$iError = @error
	WEnd
	DllCall($hKernel32, "bool", "CloseHandle", "handle", $hSnapshot)
	If Not $iResult Then Return SetError($iError, 0, 0)

	Return $iResult
EndFunc   ;==>_WinAPI_GetParentProcess_mod

Func _WinAPI_GetProcessName_mod($iPID = 0)
	If Not $iPID Then $iPID = @AutoItPID

	Local $hSnapshot = DllCall($hKernel32, 'handle', 'CreateToolhelp32Snapshot', 'dword', $TH32CS_SNAPPROCESS, 'dword', 0)
	If @error Then Return SetError(@error + 10, @extended, '')
	If $hSnapshot[0] = Ptr(-1) Then Return SetError(20, _WinAPI_GetLastError(), '') ; $INVALID_HANDLE_VALUE

	$hSnapshot = $hSnapshot[0]
	Local $tPROCESSENTRY32 = DllStructCreate($tagPROCESSENTRY32)
	DllStructSetData($tPROCESSENTRY32, 'Size', DllStructGetSize($tPROCESSENTRY32))
	Local $aCall = DllCall($hKernel32, 'bool', 'Process32FirstW', 'handle', $hSnapshot, 'struct*', $tPROCESSENTRY32)
	Local $iError = @error
	While (Not @error) And ($aCall[0])
		If DllStructGetData($tPROCESSENTRY32, 'ProcessID') = $iPID Then
			ExitLoop
		EndIf
		$aCall = DllCall($hKernel32, 'bool', 'Process32NextW', 'handle', $hSnapshot, 'struct*', $tPROCESSENTRY32)
		$iError = @error
	WEnd
	Local $iLastError = _WinAPI_GetLastError()

	DllCall($hKernel32, "bool", "CloseHandle", "handle", $hSnapshot)
	If $iError Then Return SetError($iError + 30, $iLastError, '')
	If $iLastError = 18 Then Return SetError(1, $iLastError, '') ; $ERROR_NO_MORE_FILES = no process found

	Return DllStructGetData($tPROCESSENTRY32, 'ExeFile')
EndFunc   ;==>_WinAPI_GetProcessName_mod

Func _WinAPI_GetProcessID_mod($hProcess)
	Local $aCall = DllCall($hKernel32, 'dword', 'GetProcessId', 'handle', $hProcess)
	If @error Then Return SetError(@error, @extended, 0)
	; If Not $aCall[0] Then Return SetError(1000, 0, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_GetProcessID_mod

Func _WinAPI_ShouldAppsUseDarkMode()
	Local $fnShouldAppsUseDarkMode = 132
	Local $aResult = DllCall($hUxtheme, 'bool', $fnShouldAppsUseDarkMode)
	If @error Then Return SetError(@error, @extended, False)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_ShouldAppsUseDarkMode

Func _ImmersiveLiveProcess()
	Local $tPoint, $iTimePress, $sParent, $hWndCur, $iTimeRelease
	Local Static $bSingleLast, $bDouble
	Local Static $iTimeLast
	Local $iDurationTemp, $iDurationDiff
	Local $hLiveGUI, $hPlayer

	OnAutoItExitRegister(DoCleanUpLive)

	Local $bMultiMonitorEnabled = _ToBoolean(IniRead($IniFile, "ImmersiveLive", "MultiMonitorEnabled", "False"))
	Local $aPos, $aMonitor = _WinAPI_EnumDisplayMonitors()

	If IsArray($aMonitor) Then
		ReDim $aMonitor[$aMonitor[0][0] + 1][5]
		For $i = 1 To $aMonitor[0][0]
			$aPos = _WinAPI_GetPosFromRect($aMonitor[$i][1])
			For $j = 0 To 3
				$aMonitor[$i][$j + 1] = $aPos[$j]
			Next
		Next
	EndIf

	Local $aPlayer[$aMonitor[0][0]]
	Local $iPlayerCount = $aMonitor[0][0]
	_ArrayDelete($aMonitor, 0)

	; remove any monitors smaller than 100px (possible virtual)
	For $i = UBound($aMonitor) - 1 To 0 Step -1
		If $aMonitor[$i][3] < 100 Or $aMonitor[$i][4] < 100 Then _ArrayDelete($aMonitor, $i)
	Next

	; remove extra monitors if MultiMonitorEnabled is false
	If Not $bMultiMonitorEnabled Then
		If UBound($aMonitor) > 1 Then
			Do
				_ArrayDelete($aMonitor, UBound($aMonitor) - 1)
			Until UBound($aMonitor) = 1
		EndIf
	EndIf

	OnAutoItExitRegister(DoCleanUpLive)
	Local $hLiveWnd = _GetHwndFromPID(@AutoItPID)
    _WinAPI_SetWindowText_mod($hLiveWnd, "Immersive UX Live")
	ProcessSetPriority(@AutoItPID, 4)

	_MediaPlayer_Init()

    Local $sLiveWallpaperFile = IniRead($IniFile, "ImmersiveLive", "LiveWallpaperFile", "")
	Local $bLoopEnabled = _ToBoolean(IniRead($IniFile, "ImmersiveLive", "LoopEnabled", "False"))
	Local $bTriggerStartButton = _ToBoolean(IniRead($IniFile, "ImmersiveLive", "TriggerStartButton", "False"))
	Local $iMediaControlsClick = Int(IniRead($IniFile, "ImmersiveLive", "MediaControlsClick", "2"))
	Local $iOpacityLevel = Int(IniRead($IniFile, "ImmersiveLive", "OpacityLevel", "100"))
	$iOpacityLevel = Int(Map($iOpacityLevel, 0, 100, 0, 255))

	If Not FileExists($sLiveWallpaperFile) Then
		MsgBox($MB_ICONERROR, "Error", "Live Wallpaper File not found.")
		Exit
	EndIf

	Local $hProgman = WinGetHandle("[CLASS:Progman]")
    If Not $hProgman Then Exit MsgBox(16, "ERROR", "Couldn't find Progman", 30)
    _WinAPI_SendMessageTimeout($hProgman, 0x052C, 13, 1, 250, $SMTO_NORMAL)

    Local $hWorkerW = _WinAPI_FindWindowEx($hProgman, 0, "WorkerW", "")

	If Not $hWorkerW Then
		Local $aEnumWindows = _WinAPI_EnumWindows(False)
		For $n = 1 To UBound($aEnumWindows) - 1
			If $aEnumWindows[$n][1] <> "WorkerW" Then ContinueLoop
			If _WinAPI_GetParent($aEnumWindows[$n][0]) = $hProgman Then
				$hWorkerW = $aEnumWindows[$n][0]
				ExitLoop
			EndIf
		Next
	EndIf

    If $hWorkerW = 0 Then Exit MsgBox(16, "ERROR", "Couldn't find WorkerW under Progman", 30)

    Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
    Local $aPathSplit = _PathSplit($sLiveWallpaperFile, $sDrive, $sDir, $sFileName, $sExtension)

    If $aPathSplit[1] = "" And $aPathSplit[2] = "" Then
        $sLiveWallpaperFile = @ScriptDir & "\" & $sLiveWallpaperFile
    EndIf

	If $bTriggerStartButton Then
		; Create UI Automation object
		Local $oUIAutomation = ObjCreateInterface($sCLSID_CUIAutomation, $sIID_IUIAutomation, $dtag_IUIAutomation)
		If Not IsObj($oUIAutomation) Then Exit ConsoleWrite("$oUIAutomation ERR" & @CRLF)
		;ConsoleWrite("$oUIAutomation OK" & @CRLF)

		; Get Desktop element
		Local $pDesktop, $oDesktop
		$oUIAutomation.GetRootElement($pDesktop)
		$oDesktop = ObjCreateInterface($pDesktop, $sIID_IUIAutomationElement, $dtag_IUIAutomationElement)
		If Not IsObj($oDesktop) Then Exit ConsoleWrite("$oDesktop ERR" & @CRLF)
		;ConsoleWrite("$oDesktop OK" & @CRLF)

		UIAEH_AutomationEventHandlerCreate()
		If Not IsObj($oUIAEH_AutomationEventHandler) Then Exit ConsoleWrite("$oUIAEH_AutomationEventHandler ERR" & @CRLF)
		;ConsoleWrite("$oUIAEH_AutomationEventHandler OK" & @CRLF)

		$oUIAutomation.AddAutomationEventHandler($UIA_Window_WindowOpenedEventId, $pDesktop, $TreeScope_Subtree, 0, $oUIAEH_AutomationEventHandler)

		Local $hWndStart, $bTreated
	EndIf

	; GUI section (multi-monitor)
	;
	; width		$aMonitor[$i][3]
	; height	$aMonitor[$i][4]
	; x			$aMonitor[$i][1]
	; y			$aMonitor[$i][2]
	;
	For $i = 0 To UBound($aMonitor) -1
		$hLiveGUI = GUICreate("Live Wallpaper - " & $i, $aMonitor[$i][3], $aMonitor[$i][4], $aMonitor[$i][1], $aMonitor[$i][2], $WS_POPUP, $WS_EX_TOOLWINDOW)
		GUISetBkColor(0xff00ff) ; temp for testing screen placement

		_WinAPI_SetParent($hLiveGUI, $hWorkerW)
		_WinAPI_SetWindowPos($hLiveGUI, $HWND_BOTTOM, 0, 0, 0, 0, BitOR($SWP_NOMOVE, $SWP_NOSIZE, $SWP_NOACTIVATE))
		;_WinAPI_SetWindowPos($hLiveGUI, $HWND_BOTTOM, $aMonitor[$i][1], $aMonitor[$i][2], $aMonitor[$i][3], $aMonitor[$i][4], $SWP_NOACTIVATE)
		;_WinAPI_SetWindowPos($hLiveGUI, $HWND_BOTTOM, $aMonitor[$i][1], $aMonitor[$i][2], $aMonitor[$i][3], $aMonitor[$i][4], BitOR($SWP_NOMOVE, $SWP_NOSIZE, $SWP_NOACTIVATE))
		_WinAPI_SetWindowLong($hLiveGUI, $GWL_EXSTYLE, BitOR(_WinAPI_GetWindowLong($hLiveGUI, $GWL_EXSTYLE), $WS_EX_LAYERED, $WS_EX_TRANSPARENT))
		_WinAPI_SetLayeredWindowAttributes($hLiveGUI, 0, $iOpacityLevel, $LWA_ALPHA)

		;$hPlayer = _MediaPlayer_Create($hLiveGUI, $aMonitor[$i][1], $aMonitor[$i][2], $aMonitor[$i][3], $aMonitor[$i][4])
		$hPlayer = _MediaPlayer_Create($hLiveGUI, 0, 0, $aMonitor[$i][3], $aMonitor[$i][4])

		; build array for player index
		$aPlayer[$i] = $hPlayer
		;_ArrayDisplay($aPlayer, 'Player Index')

		_MediaPlayer_LoadFromStorage($hPlayer, $sLiveWallpaperFile)

		If $bLoopEnabled Then _MediaPlayer_SetIsLooping($hPlayer, True)
		_MediaPlayer_SetAutoPlay($hPlayer, True)

		GUISetState(@SW_SHOWNOACTIVATE, $hLiveGUI)
	Next
	;
	; GUI section (multi-monitor)

	AdlibRegister("_IsMediaOpened")

	While 1
		If $bTriggerStartButton Then
			If IsObj($oWinStart) Then
				If Not $bTreated Then
					; Start button has been pushed or Win button has activated Start menu
					$bTreated = True
					$oWinStart.GetCurrentPropertyValue($UIA_NativeWindowHandlePropertyId, $hWndStart)
					For $i = 0 To UBound($aPlayer) -1
						_MediaPlayer_SetPosition($aPlayer[$i], 0)
						_MediaPlayer_Play($aPlayer[$i])
					Next
				ElseIf Not WinExists($hWndStart) Then
					$oWinStart.Release()
					$oWinStart = 0
					$bTreated = False
					$hWndStart = 0
					;ConsoleWrite("Start window closed" & @CRLF)
				EndIf
			EndIf
		EndIf
		If $bMediaOpened Then
			$iDurationTemp = _MediaPlayer_GetPosition(1)/10000000
			$iDurationDiff = $iDuration - $iDurationTemp
			If $iDurationDiff < 0.3 Then
				ConsoleWrite("media is open, small diff" & @CRLF)
				For $i = 0 To UBound($aPlayer) -1
					If Not $bLoopEnabled Then
						_MediaPlayer_Pause($aPlayer[$i])
						_MediaPlayer_SetPosition($aPlayer[$i], $iDurationPause)
					EndIf
					If $bLoopEnabled Then _MediaPlayer_SetPosition($aPlayer[$i], 0)
				Next
			EndIf
		EndIf
		If $iMediaControlsClick Then
			If _IsPressed($VK_LBUTTON, $hUser32) Then
				$tPoint = _WinAPI_GetMousePos_mod()
				$hWndCur = _WinAPI_GetAncestor_mod(_WinAPI_WindowFromPoint_mod($tPoint), $GA_ROOT)
				$sParent = _WinAPI_GetClassName_mod($hWndCur)
				If $sParent = "Progman" Then
					$iTimePress = Round((_WinAPI_GetTickCount64_mod() / 1000), 2)
					$iTimeDiff = $iTimePress - $iTimeLast

					; wait until key is released
					While _IsPressed($VK_LBUTTON, $hUser32)
						Sleep(5)
					WEnd
					; left click has been released
					$iTimeRelease = Round((_WinAPI_GetTickCount64_mod() / 1000), 2)
					$iDiffSingle = $iTimeRelease - $iTimePress

					If $iDiffSingle < 0.4 Then ; single-click detected
						If $bSingleLast And $iTimeDiff < 0.4 Then $bDouble = True
						$bSingleLast = True
						If $bSingleLast And $bDouble Then ; double-click detected

							; double-click action here
							If $iMediaControlsClick = 2 Then
								For $i = 0 To UBound($aPlayer) -1
									Switch _MediaPlayer_GetCurrentState($aPlayer[$i], True)
										Case "Playing"
											_MediaPlayer_Pause($aPlayer[$i])
										Case "Paused"
											$iDurationTemp = _MediaPlayer_GetPosition($aPlayer[$i])/10000000
											$iDurationDiff = $iDuration - $iDurationTemp
											If $iDurationDiff < 0.4 Then
												_MediaPlayer_SetPosition($aPlayer[$i], 0)
												_MediaPlayer_Play($aPlayer[$i])
											Else
												_MediaPlayer_Play($aPlayer[$i])
											EndIf
										Case "Stopped"
											_MediaPlayer_Play($aPlayer[$i])
									EndSwitch
								Next
							EndIf

							; reset values
							$bSingleLast = False
							$bDouble = False
						Else
							If Not $bDouble Then ; single-click detected
								; single-click action here
								If $iMediaControlsClick = 1 Then
									For $i = 0 To UBound($aPlayer) -1
										Switch _MediaPlayer_GetCurrentState($aPlayer[$i], True)
											Case "Playing"
												_MediaPlayer_Pause($aPlayer[$i])
											Case "Paused"
											$iDurationTemp = _MediaPlayer_GetPosition($aPlayer[$i])/10000000
											$iDurationDiff = $iDuration - $iDurationTemp
											If $iDurationDiff < 0.4 Then
												_MediaPlayer_SetPosition($aPlayer[$i], 0)
												_MediaPlayer_Play($aPlayer[$i])
											Else
												_MediaPlayer_Play($aPlayer[$i])
											EndIf
											Case "Stopped"
												_MediaPlayer_Play($aPlayer[$i])
										EndSwitch
									Next
								EndIf
							EndIf
						EndIf
					ElseIf $iDiffSingle > 0.4 Then
						; possible drag/selection detected
						$bSingleLast = False
						$bDouble = False
					EndIf
					$iTimeLast = $iTimePress
				EndIf
			EndIf
		EndIf
		Sleep(100)
	WEnd

EndFunc   ;==>_ImmersiveLiveProcess

Func DoCleanUpLive()
	UIAEH_AutomationEventHandlerDelete()
EndFunc

Func _BorderEffectsProcess()
	Local $hWnd = _GetHwndFromPID(@AutoItPID)
	_WinAPI_SetWindowText_mod($hWnd, "Immersive UX LED")

	ProcessSetPriority(@AutoItPID, 4)

	While 1
		Sleep(40)
		$hLEDWnd = _WinAPI_GetForegroundWindow_mod()
		If $hLEDWnd <> $hLEDWndLast Then
			_WinAPI_DwmSetWindowAttribute__($hLEDWndLast, 34, $DWMWA_COLOR_NONE)
			$hLEDWndLast = $hLEDWnd
		ElseIf $hLEDWnd = $hLEDWndLast Then
			If _WinAPI_IsWindowVisible_mod($hLEDWnd) Then _BorderEffects($hLEDWnd)
		EndIf
	WEnd
EndFunc

Func _BorderEffects($hWnd)
    Local Const $fInverseSpeed = 1/$fSpeed
    Local Static $fHue

    ;the border col will be calculated based on the time elapsed from a single timer.
    Local Static $hTimer = TimerInit()
    Local Static $fLastTime
    Local $fCurTime = TimerDiff($hTimer)
    Local $fTimerSec = ($fCurTime - $fLastTime)/1000
    If $fTimerSec < 1/25 Then Return ;Slow down processing (do not needlessly refresh faster than 25hz)
    $fLastTime = $fCurTime

    ;Hue is a value between 0 and 1.
    ;Its value is based on the internal timer..
    $fHue += ($fTimerSec * $fInverseSpeed)
    If $fHue >= 1 Then $fHue -= Int($fHue)

    ;T = transition value.  So RGB values are all based on this.
    ;We want RGB values to be between 0 and 1.
    Local $fT = 6 * $fHue
    Local $fR = Abs($fT - 3) - 1
    Local $fG = 2 - Abs($fT - 2)
    Local $fB = 2 - Abs($fT - 4)

    ;Max values out at 0 and 1.
    $fR = ($fR < 0) ? 0 : ($fR > 1) ? 1 : $fR
    $fG = ($fG < 0) ? 0 : ($fG > 1) ? 1 : $fG
    $fB = ($fB < 0) ? 0 : ($fB > 1) ? 1 : $fB

    ;RGB is now a percentage of max values
    $fR *= 255
    $fG *= 255
    $fB *= 255

    ;Construct RGB Value. (reverse order due to endianness!)
    Local $iRGB = BitOr(BitShift(Int($fB), -16), BitShift(Int($fG), -8), Int($fR))

    DllCall($hDwmapi, 'long', 'DwmSetWindowAttribute', 'hwnd', $hWnd, 'dword', 34, 'dword*', $iRGB, 'dword', 4)
EndFunc   ;==>_BorderEffects

Func _WinAPI_FindWindowEx($hParent, $hAfter, $sClass, $sTitle = "")
    Local $ret = DllCall($hUser32, "hwnd", "FindWindowExW", "hwnd", $hParent, "hwnd", $hAfter, "wstr", $sClass, "wstr", $sTitle)
    If @error Or Not IsArray($ret) Then Return 0
    Return $ret[0]
EndFunc   ;==>_WinAPI_FindWindowEx

Func GetPrimaryMonitorCoords()
    Local $tPoint = DllStructCreate("int x;int y")
    $tPoint.x = 0
    $tPoint.y = 0

    Local $hMonitor = _WinAPI_MonitorFromPoint($tPoint, $MONITOR_DEFAULTTOPRIMARY)
    If Not $hMonitor Then Return SetError(1, 0, 0)

    Local $tMI = DllStructCreate("dword cbSize;long rcMonitor[4];long rcWork[4];dword dwFlags")
    DllStructSetData($tMI, "cbSize", DllStructGetSize($tMI))

    Local $aCall = DllCall($hUser32, "bool", "GetMonitorInfoW", "handle", $hMonitor, "ptr", DllStructGetPtr($tMI))
    If @error Or Not $aCall[0] Then Return SetError(2, 0, 0)

    Local $iLeft = $tMI.rcMonitor(1)
    Local $iTop = $tMI.rcMonitor(2)
    Local $iRight = $tMI.rcMonitor(3)
    Local $iBottom = $tMI.rcMonitor(4)

    Local $iWidth = $iRight - $iLeft
    Local $iHeight = $iBottom - $iTop
    Local $a[6] = [$iLeft, $iTop, $iRight, $iBottom, $iWidth, $iHeight]
    Return $a
EndFunc   ;==>GetPrimaryMonitorCoords

Func GetDesktopOrigin()
    Local $minX = 0, $minY = 0, $x, $y
    Local $i = 0, $tDevice, $aRet, $tDevMode, $aED

    While True
        $tDevice = DllStructCreate("dword cb; char DeviceName[32]; char DeviceString[128]; dword StateFlags; char DeviceID[128]; char DeviceKey[128]")
        $tDevice.cb = DllStructGetSize($tDevice)
        $aRet = DllCall($hUser32, "bool", "EnumDisplayDevicesA", "ptr", 0, "dword", $i, "ptr", DllStructGetPtr($tDevice), "dword", 0)
        If @error Or Not $aRet[0] Then ExitLoop

        If BitAND($tDevice.StateFlags, 1) Then
            $tDevMode = DllStructCreate( _
                    "byte dmDeviceName[32]; word dmSpecVersion; word dmDriverVersion; word dmSize; word dmDriverExtra; dword dmFields;" & _
                    "long dmPositionX; long dmPositionY; dword dmDisplayOrientation; dword dmDisplayFixedOutput;" & _
                    "short dmColor; short dmDuplex; short dmYResolution; short dmTTOption; short dmCollate; char dmFormName[32];" & _
                    "ushort dmLogPixels; dword dmBitsPerPel; dword dmPelsWidth; dword dmPelsHeight;" & _
                    "dword dmDisplayFlags; dword dmDisplayFrequency; dword dmICMMethod; dword dmICMIntent;" & _
                    "dword dmMediaType; dword dmDitherType; dword dmReserved1; dword dmReserved2; dword dmPanningWidth; dword dmPanningHeight")

            $tDevMode.dmSize = DllStructGetSize($tDevMode)
            $aED = DllCall($hUser32, "bool", "EnumDisplaySettingsA", "str", $tDevice.DeviceName, "dword", -1, "ptr", DllStructGetPtr($tDevMode))
            If Not @error And $aED[0] Then
                $x = $tDevMode.dmPositionX
                $y = $tDevMode.dmPositionY
                If $x < $minX Then $minX = $x
                If $y < $minY Then $minY = $y
            EndIf
        EndIf
        $i += 1
    WEnd
    Local $a[2] = [$minX, $minY]
    Return $a
EndFunc   ;==>GetDesktopOrigin

;Coded by UEZ build 2025-10-29
Func Map($val, $source_start, $source_stop, $dest_start, $dest_stop)
    Return (($val - $source_start) * ($dest_stop - $dest_start) / ($source_stop - $source_start) + $dest_start)
EndFunc

; UEZ
Func Convert2Sec($sTime) ;format HH:MM:SS, no error / validity check for input!
    Return 3600 * StringLeft($sTime, 2) + 60 * StringMid($sTime, 4, 2) + StringRight($sTime, 2)
EndFunc

Func _WinAPI_GetTickCount64_mod()
	Local $aCall = DllCall($hKernel32, 'uint64', 'GetTickCount64')
	If @error Then Return SetError(@error, @extended, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_GetTickCount64_mod

Func _WinAPI_WindowFromPoint_mod(ByRef $tPOINT)
	Local $aCall = DllCall($hUser32, "hwnd", "WindowFromPoint", "struct", $tPOINT)
	If @error Then Return SetError(@error, @extended, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_WindowFromPoint_mod

Func _WinAPI_GetAncestor_mod($hWnd, $iFlags = $GA_PARENT)
	Local $aCall = DllCall($hUser32, "hwnd", "GetAncestor", "hwnd", $hWnd, "uint", $iFlags)
	If @error Then Return SetError(@error, @extended, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_GetAncestor_mod

Func _IsMediaOpened()
	$iDuration = _MediaPlayer_GetDuration(1)/10000000
	If $iDuration <> 0 Then
		$bMediaOpened = True
		$iDurationMs = Round($iDuration * 1000)
		$iDurationPause = ($iDuration - 0.3) * 10000000
		AdlibUnRegister("_IsMediaOpened")
	EndIf
EndFunc

Func _WinAPI_RealChildWindowFromPoint($hWnd, $tPoint)
  Local $aRet = DllCall($hUser32, 'hwnd', 'RealChildWindowFromPoint', 'hwnd', $hWnd, 'struct', $tPoint)
  If @error Then Return SetError(@error, @extended, 0)
  Return $aRet[0]
EndFunc   ;==>_WinAPI_RealChildWindowFromPoint

Func GetRealChild($hWnd)
  Local $tPoint, $hRoot = _WinAPI_GetAncestor_mod($hWnd, $GA_ROOT)
  If $hWnd = $hRoot Then
    $tPoint = _WinAPI_GetMousePos_mod(True, $hWnd)
    Return _WinAPI_ChildWindowFromPointEx_mod($hWnd, $tPoint)
  EndIf
  Local $hParent = _WinAPI_GetAncestor_mod($hWnd, $GA_PARENT)
  Local $aChild = _WinAPI_EnumChildWindows_mod($hParent)
  If @error Then Return 0

  Local $hFound

  For $i = 1 To $aChild[0][0]
    $hParent = _WinAPI_GetParent_mod($aChild[$i][0])
    $tPoint = _WinAPI_GetMousePos_mod(True, $hParent)
    $hFound = _WinAPI_RealChildWindowFromPoint($hParent, $tPoint)
    If $hFound = $aChild[$i][0] Then Return $hFound
  Next
  Return 0
EndFunc   ;==>GetRealChild

Func _WinAPI_GetParent_mod($hWnd)
	Local $aCall = DllCall($hUser32, "hwnd", "GetParent", "hwnd", $hWnd)
	If @error Then Return SetError(@error, @extended, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_GetParent_mod

Func _WinAPI_ChildWindowFromPointEx_mod($hWnd, $tPOINT, $iFlags = $CWP_ALL)
	Local $aCall = DllCall($hUser32, 'hwnd', 'ChildWindowFromPointEx', 'hwnd', $hWnd, 'struct', $tPOINT, 'uint', $iFlags)
	If @error Then Return SetError(@error, @extended, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_ChildWindowFromPointEx_mod

Func _WinAPI_EnumChildWindows_mod($hWnd, $bVisible = True)
	If Not _WinAPI_GetWindow_mod($hWnd, 5) Then Return SetError(2, 0, 0) ; $GW_CHILD

	Local $hEnumProc = DllCallbackRegister('__EnumWindowsProc', 'bool', 'hwnd;lparam')

	Dim $__g_vEnum[101][2] = [[0]]
	DllCall($hUser32, 'bool', 'EnumChildWindows', 'hwnd', $hWnd, 'ptr', DllCallbackGetPtr($hEnumProc), 'lparam', $bVisible)
	If @error Or Not $__g_vEnum[0][0] Then
		$__g_vEnum = @error + 10
	EndIf
	DllCallbackFree($hEnumProc)
	If $__g_vEnum Then Return SetError($__g_vEnum, 0, 0)

	__Inc($__g_vEnum, -1)
	Return $__g_vEnum
EndFunc   ;==>_WinAPI_EnumChildWindows_mod

Func _WinAPI_GetWindow_mod($hWnd, $iCmd)
	Local $aCall = DllCall($hUser32, "hwnd", "GetWindow", "hwnd", $hWnd, "uint", $iCmd)
	If @error Then Return SetError(@error, @extended, 0)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_GetWindow_mod

Func UIAEH_AutomationEventHandler_HandleAutomationEvent($pSelf, $pSender, $iEventId)
	Local $oSender = ObjCreateInterface($pSender, $sIID_IUIAutomationElement, $dtag_IUIAutomationElement)
	$oSender.AddRef()
	Local $sTitle, $sClass
	$oSender.GetCurrentPropertyValue($UIA_NamePropertyId, $sTitle)
	$oSender.GetCurrentPropertyValue($UIA_ClassNamePropertyId, $sClass)

	If $sTitle = "Start" And $sClass = "Windows.UI.Core.CoreWindow" Then $oWinStart = $oSender
EndFunc   ;==>UIAEH_AutomationEventHandler_HandleAutomationEvent

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
