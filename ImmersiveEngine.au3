#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=app.ico
#AutoIt3Wrapper_Outfile_x64=ImmersiveEngine.exe
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Immersive UX Engine
#AutoIt3Wrapper_Res_Fileversion=1.1.2
#AutoIt3Wrapper_Res_ProductName=Immersive UX Engine
#AutoIt3Wrapper_Res_ProductVersion=1.1.2
#AutoIt3Wrapper_Res_LegalCopyright=@ 2025 WildByDesign
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_HiDpi=Y
#AutoIt3Wrapper_Res_Icon_Add=app.ico
#Au3Stripper_Parameters=/MO
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <WinAPIProc.au3>
#include <WinAPISys.au3>
#include <WinAPIGdi.au3>
#include <Array.au3>
#include <Misc.au3>

$iVersion = '1.1.2'

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
;Global $IniFile = StringTrimRight(@ScriptFullPath, 4) & ".ini"
Global $IniFile = @ScriptDir & "\ImmersiveUX.ini"
Global $bDarkModeEnabled, $bClearChangesOnExit, $bRequireWindows11, $iBorderColorOptions
Global $aGlobalExclusions, $aExcludeFromAllClass
Global $bClassicExplorer, $bExplorerExtendClient
Global $bGlobalDarkTitleBar, $dGlobalBorderColor, $dGlobalTitleBarColor, $dGlobalTitleBarTextColor, $iGlobalTitleBarBackdrop, $iGlobalCornerPreference, $iGlobalExtendFrameIntoClient, $iGlobalEnableBlurBehind
Global $iGlobalBlurTintColor
Global $dTerminalBorderColor, $dTerminalBackdrop, $bWindowsTerminalHandling, $dVSStudioBorderColor
Global $bEnable = False
Global $aCustomRules[0][13]
Global $mMap[]
Global Static $hActiveWndLast
Global $TRAY_EVENT_PRIMARYDOWN = -7
Global $bElevated = False
Global $sProdName = "ImmersiveUX"
Global $sEngName = "ImmersiveEngine"

ReadIniFile()
Func ReadIniFile()
	Global $aCustomRules[0][13]

	; Global rules
	$bGlobalDarkTitleBar = _ToBoolean(IniRead($IniFile, "GlobalRules", "GlobalDarkTitleBar", "True"))
	$dGlobalBorderColor = IniRead($IniFile, "GlobalRules", "GlobalBorderColor", "")
	$dGlobalTitleBarColor = IniRead($IniFile, "GlobalRules", "GlobalTitleBarColor", "")
	$dGlobalTitleBarTextColor = IniRead($IniFile, "GlobalRules", "GlobalTitleBarTextColor", "")
	$iGlobalTitleBarBackdrop = Int(IniRead($IniFile, "GlobalRules", "GlobalTitleBarBackdrop", "0"))
	$iGlobalCornerPreference = Int(IniRead($IniFile, "GlobalRules", "GlobalCornerPreference", "0"))
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
        If $a <> "Configuration" And $a <> "ProcessExclusion" And $a <> "ClassExclusion" And $a <> "Settings" And $a <> "GlobalRules" And $a <> "StartupInfoOnly" Then
			Local $aArray = IniReadSection($IniFile, $aSectionNames[$i])
			;ConsoleWrite("number of lines: " & $aArray[0][0] & @CRLF)
			If $aArray[0][0] <> '13' Then
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
        $aCustomRules[$i][6] = Int($aCustomRules[$i][6])
        $aCustomRules[$i][7] = Int($aCustomRules[$i][7])
    Next

	; need to loop through custom rules to store details for Terminal, Explorer, VSCode, VS Studio
	$bExplorerExtendClient = False
	$bWindowsTerminalHandling = False

	For $i = 0 To UBound($aCustomRules) - 1
        If StringInStr($aCustomRules[$i][1], "explorer.exe", $STR_NOCASESENSEBASIC) Then
			; fix for Explorer blur behind titlebar
			If $aCustomRules[$i][9] = "True" Then $aCustomRules[$i][8] = "True"
			If $aCustomRules[$i][8] = "True" Then $bExplorerExtendClient = True
			If $aCustomRules[$i][12] = "False" Then $bExplorerExtendClient = False
		EndIf
		If StringInStr($aCustomRules[$i][1], "CabinetWClass", $STR_NOCASESENSEBASIC) Then
			; fix for Explorer blur behind titlebar
			If $aCustomRules[$i][9] = "True" Then $aCustomRules[$i][8] = "True"
			If $aCustomRules[$i][8] = "True" Then $bExplorerExtendClient = True
			If $aCustomRules[$i][12] = "False" Then $bExplorerExtendClient = False
		EndIf
		If StringInStr($aCustomRules[$i][1], "Terminal.exe", $STR_NOCASESENSEBASIC) Then
			If $aCustomRules[$i][8] = "True" Then $bWindowsTerminalHandling = True
			If $aCustomRules[$i][9] = "True" Then $bWindowsTerminalHandling = True
			If $aCustomRules[$i][12] = "False" Then $bWindowsTerminalHandling = False
			If $aCustomRules[$i][12] <> "False" Then $dTerminalBorderColor = $aCustomRules[$i][3]
			If $aCustomRules[$i][6] <> "" And $aCustomRules[$i][12] <> "False" Then
				$dTerminalBackdrop = $aCustomRules[$i][6]
			Else
				$dTerminalBackdrop = $iGlobalTitleBarBackdrop
			EndIf
		EndIf
		If StringInStr($aCustomRules[$i][1], "CASCADIA_HOSTING_WINDOW_CLASS", $STR_NOCASESENSEBASIC) Then
			If $aCustomRules[$i][8] = "True" Then $bWindowsTerminalHandling = True
			If $aCustomRules[$i][9] = "True" Then $bWindowsTerminalHandling = True
			If $aCustomRules[$i][12] = "False" Then $bWindowsTerminalHandling = False
			If $aCustomRules[$i][12] <> "False" Then $dTerminalBorderColor = $aCustomRules[$i][3]
			If $aCustomRules[$i][6] <> "" And $aCustomRules[$i][12] <> "False" Then
				$dTerminalBackdrop = $aCustomRules[$i][6]
			Else
				$dTerminalBackdrop = $iGlobalTitleBarBackdrop
			EndIf
		EndIf
		If StringInStr($aCustomRules[$i][1], "devenv.exe", $STR_NOCASESENSEBASIC) Then
			If $aCustomRules[$i][3] <> "" Then
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

	$aGlobalExclusions = StringSplit($sExcludeFromAllProc, ",")
	$aExcludeFromAllClass = StringSplit($sExcludeFromAllClass, ",")

	; create process exclusion array for all functions
	For $i = 1 To $aGlobalExclusions[0]
		$aGlobalExclusions[$i] = StringStripWS($aGlobalExclusions[$i], $STR_STRIPLEADING + $STR_STRIPTRAILING)
		$aGlobalExclusions[$i] = StringReplace($aGlobalExclusions[$i], "*", "")
	Next

	; create class exclusion array for all functions
	For $i = 1 To $aExcludeFromAllClass[0]
		$aExcludeFromAllClass[$i] = StringStripWS($aExcludeFromAllClass[$i], $STR_STRIPLEADING + $STR_STRIPTRAILING)
		$aExcludeFromAllClass[$i] = StringReplace($aExcludeFromAllClass[$i], "*", "")
	Next

	; combine process and class exlusions into one global exclusion list
	_ArrayDelete($aGlobalExclusions, 0)
	_ArrayDelete($aExcludeFromAllClass, 0)
	_ArrayConcatenate($aGlobalExclusions, $aExcludeFromAllClass)
	;_ArrayDisplay($aGlobalExclusions, "1D Target and Source concatenated")

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
	Local $iTintColorSwitch = Hex(_WinAPI_SwitchColor($iTintColor), 6)
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
If Not _WinAPI_DwmIsCompositionEnabled() Then
        MsgBox($MB_ICONERROR + $MB_SYSTEMMODAL, 'Error', 'This program requires Desktop Composition to be enabled.')
        Exit
EndIf

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

If StringInStr($CmdLineRaw, "removeall") Then
	SetBorderColor_removeall()
	Exit
EndIf

Global $g_iIsTaskSchedInstalled = _TaskSched_AlreadyInstalled()
Global $g_iIsTaskSchedRun = False
If StringInStr($CmdLineRaw, 'runtask') Then $g_iIsTaskSchedRun = True

;If Not IsAdmin() Then
	If $g_iIsTaskSchedInstalled And Not $g_iIsTaskSchedRun Then
		_TaskSched_Run()
		Exit
	Else
		ConsoleWrite('No TaskSched conditions.' & @CRLF)
	EndIf
;EndIf

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

; register cleanup function every 1 hour to clear handle cache map
AdlibRegister ("ClearHandleMap", 3600000)

Opt("TrayMenuMode", 3)
Opt("TrayAutoPause", 0)
Opt("TrayOnEventMode", 1)

TraySetOnEvent($TRAY_EVENT_PRIMARYDOWN, 'idGUI')
TraySetClick(16)

$idGUI = TrayCreateItem("Immersive UX")
TrayItemSetOnEvent($idGUI, "idGUI")
TrayCreateItem("")
$idAbout = TrayCreateItem('About')
TrayItemSetOnEvent($idAbout, "_About")
$idExit = TrayCreateItem('Exit')
TrayItemSetOnEvent($idExit, "_Exit")

OnAutoItExitRegister(DoCleanUp)

Global $hHookFunc = DllCallbackRegister('_WinEventProc', 'none', 'ptr;uint;hwnd;int;int;uint;uint')
Global $hWinHook = _WinAPI_SetWinEventHook($EVENT_SYSTEM_FOREGROUND, $EVENT_OBJECT_NAMECHANGE, DllCallbackGetPtr($hHookFunc))

Func _ToBoolean($sString)
    Return (StringStripWS(StringUpper($sString), 8) = "TRUE" ? True : False)
EndFunc   ;==>_ToBoolean

; set tray icon and tooltip
If @Compiled = 0 Then
	TraySetIcon(@ScriptDir & '\app.ico')
Else
	TraySetIcon(@ScriptFullPath, 201)
EndIf
TraySetToolTip("Immersive UX")

; don't apply to all during boot as there is no need
$Uptime = _WinAPI_StrFromTimeInterval(_WinAPI_GetTickCount64())
If StringInStr($Uptime, "min") Then
	; apply settings to all currently running apps
	SetBorderColor_apply2all()
EndIf

; set process priority
ProcessSetPriority($sEngName & ".exe", 4)

While 1
    Sleep(10000)
WEnd

Func _Exit()
	;SetBorderColor_removeall()
    ;_Free()
	;IniDelete($IniFile, "StartupInfoOnly")
    Exit
EndFunc   ;==>_Exit

Func DoCleanUp()
    SetBorderColor_removeall()
    _Free()
	IniDelete($IniFile, "StartupInfoOnly")
EndFunc

Func _Free()
    If $hWinHook Then _WinAPI_UnhookWinEvent($hWinHook)
    If $hHookFunc Then DllCallbackFree($hHookFunc)
EndFunc   ;==>_Free

Func RefreshChanges()
	; remove all based on current settings
	SetBorderColor_removeall()
	; read ini file for new changes
	ReadIniFile()
	; reapply all based on updated settings
	SetBorderColor_apply2all()
	; clear and declare map
	Global $mMap[]
EndFunc

Func SetBorderColor_removeall()
	If $bClearChangesOnExit = True Then
		$aArray = WinList()
		For $n = 1 To $aArray[0][0]
			; exclude certain windows by window title
			If $aArray[$n][0] = "" Then ContinueLoop
			If $aArray[$n][0] = "Default IME" Then ContinueLoop
			If $aArray[$n][0] = "OLEChannelWnd" Then ContinueLoop
			If $aArray[$n][0] = "OleMainThreadWndName" Then ContinueLoop
			If $aArray[$n][0] = "MSCTFIME UI" Then ContinueLoop
			If $aArray[$n][0] = "CicMarshalWnd" Then ContinueLoop
			If $aArray[$n][0] = "XCP" Then ContinueLoop

			; recently added
			If $aArray[$n][0] = "Program Manager" Then ContinueLoop
			If $aArray[$n][0] = "PopupHost" Then ContinueLoop ; Xaml_WindowedPopupClass
			;If $aArray[$n][0] = "CoreInput" Then ContinueLoop ; Windows.UI.Core.CoreComponentInputSource
			;If $aArray[$n][0] = "Search" Then ContinueLoop ; Windows.UI.Core.CoreWindow
			;If $aArray[$n][0] = "Start" Then ContinueLoop ; Windows.UI.Core.CoreWindow
			;If $aArray[$n][0] = "DesktopWindowXamlSource" Then ContinueLoop ; Windows.UI.Composition.DesktopWindowContentBridge
			If $aArray[$n][0] = "Chrome Legacy Window" Then ContinueLoop ; Chrome_RenderWidgetHostHWND
			If $aArray[$n][0] = "Quick settings" Then ContinueLoop ; ControlCenterWindow
			If $aArray[$n][0] = "System tray overflow window." Then ContinueLoop ; TopLevelWindowForOverflowXamlIsland
			If $aArray[$n][0] = "Drag" Then ContinueLoop ; SysDragImage

			; filter some by class name
			$sClassName = _WinAPI_GetClassName($aArray[$n][1])
			;If $sClassName = "Windows.UI.Core.CoreWindow" Then ContinueLoop ; this covers Start, Search + much more
			If StringInStr($sClassName, "Windows.UI.") Then ContinueLoop
			;If StringInStr($sClassName, "Windows.UI.Core") Then ContinueLoop
			If $sClassName = "XamlExplorerHostIslandWindow" Then ContinueLoop
			;ConsoleWrite("$EVENT_OBJECT_SHOW: " & $sClassName & " " & "Title: " & $sActiveWindowCreate & @CRLF)

			; don't bother if class/process is on global exclusion list
			$sName = _WinAPI_GetWindowFileName($aArray[$n][1])
			For $i = 0 To UBound($aGlobalExclusions) -1
				;If StringInStr($sName, $aGlobalExclusions[$i], $STR_NOCASESENSEBASIC) Then ContinueLoop
				If StringInStr($sName, $aGlobalExclusions[$i], 2) Or StringInStr($sClassName, $aGlobalExclusions[$i], 2) Then ContinueLoop
			Next

			; reset any modified attributes back to default values on exit
			_WinAPI_DwmSetWindowAttribute__($aArray[$n][1], 34, 0xFFFFFFFF)
			_WinAPI_DwmSetWindowAttribute__($aArray[$n][1], 35, 0xFFFFFFFF)
			_WinAPI_DwmSetWindowAttribute__($aArray[$n][1], 36, 0xFFFFFFFF)
			_WinAPI_DwmSetWindowAttribute__($aArray[$n][1], 33, 0)
			_WinAPI_DwmSetWindowAttribute__($aArray[$n][1], 38, 0)
			_WinAPI_DwmExtendFrameIntoClientArea($aArray[$n][1], _WinAPI_CreateMargins(0, 0, 0, 0))
			_WinAPI_DwmEnableBlurBehindWindow10($aArray[$n][1], False)
			_WinAPI_DwmEnableBlurBehindWindow($aArray[$n][1], 0, 0)
		Next

		If WinExists("[CLASS:CabinetWClass]") Then
			If $bClassicExplorer Then
				Local $hWnd = WinGetHandle("[CLASS:CabinetWClass]")
				ConsoleWrite("classic explorer running, handle: " & $hWnd & @CRLF)
				;_WinAPI_RedrawWindow($hWnd, 0, 0, $RDW_ERASE + $RDW_FRAME + $RDW_INTERNALPAINT + $RDW_INVALIDATE + $RDW_UPDATENOW)
				Local $aPos = WinGetPos($hWnd)
				WinMove($hWnd, "", $aPos[0], $aPos[1], $aPos[2], $aPos[3] + 1)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>SetBorderColor_removeall

Func SetBorderColor_apply2all()
	Local $hActiveWnd2all
	$aArray = WinList()
	For $n = 1 To $aArray[0][0]        
        ; exclude coloring windows with a blank window title
		If $aArray[$n][0] = "" Then ContinueLoop
		If $aArray[$n][0] = "Program Manager" Then ContinueLoop ; needs to stay
		If $aArray[$n][0] = "Default IME" Then ContinueLoop ; needs to stay
		If $aArray[$n][0] = "MSCTFIME UI" Then ContinueLoop ; needs to stay
		If $aArray[$n][0] = "PopupHost" Then ContinueLoop ; Xaml_WindowedPopupClass
		;If $aArray[$n][0] = "CoreInput" Then ContinueLoop ; Windows.UI.Core.CoreComponentInputSource
		;If $aArray[$n][0] = "Search" Then ContinueLoop ; Windows.UI.Core.CoreWindow
		;If $aArray[$n][0] = "Start" Then ContinueLoop ; Windows.UI.Core.CoreWindow
		;If $aArray[$n][0] = "DesktopWindowXamlSource" Then ContinueLoop ; Windows.UI.Composition.DesktopWindowContentBridge
		If $aArray[$n][0] = "Chrome Legacy Window" Then ContinueLoop ; Chrome_RenderWidgetHostHWND
		If $aArray[$n][0] = "Quick Settings" Then ContinueLoop ; ControlCenterWindow
		If $aArray[$n][0] = "System tray overflow window." Then ContinueLoop ; TopLevelWindowForOverflowXamlIsland

		; filter some by class name
		$sClassName = _WinAPI_GetClassName($aArray[$n][1])
		;If $sClassName = "Windows.UI.Core.CoreWindow" Then ContinueCase ; this covers Start, Search + much more
		If StringInStr($sClassName, "Windows.UI.") Then ContinueLoop
		If $sClassName = "XamlExplorerHostIslandWindow" Then ContinueLoop

		;$sClassName = _WinAPI_GetClassName($aArray[$n][1])
		;ConsoleWrite("$EVENT_OBJECT_SHOW: " & $sClassName & " " & "Title: " & $aArray[$n][0] & @CRLF)

		MainColoringFunction($aArray[$n][1])
	Next

	; get active window and apply border only to active window
	If $iBorderColorOptions = 0 Then
		$hActiveWndLast = WinGetHandle("[ACTIVE]", "")
		$sClassNameActive = _WinAPI_GetClassName($hActiveWndLast)
		$sNameActive = _WinAPI_GetWindowFileName($hActiveWndLast)
		_ColorBorderOnly($hActiveWndLast, $sClassNameActive, $sNameActive)
		;$hActiveWndLast = $hActiveWnd2all
	EndIf
EndFunc   ;==>SetBorderColor_apply2all

Func MainColoringFunction($hWnd)
	Local $i
	Local $iIntensity, $iTintColor, $iTintColorSwitch, $iTintColorBlur
	Local $bMatchesFound = False

	; don't bother if class/process is on global exclusion list
	Local $sClassName = _WinAPI_GetClassName($hWnd)
	Local $sName = _WinAPI_GetWindowFileName($hWnd)
	Local $sWindow = _WinAPI_GetWindowTextMod($hWnd)
	If Not @Compiled Then
		If $sWindow = "Immersive UX" Then $sName = "ImmersiveUX"
	EndIf
	For $i = 0 To UBound($aGlobalExclusions) -1
		;If StringInStr($sName, $aGlobalExclusions[$i], $STR_NOCASESENSEBASIC) Then ContinueLoop
		If StringInStr($sName, $aGlobalExclusions[$i], 2) Or StringInStr($sClassName, $aGlobalExclusions[$i], 2) Then ContinueLoop
	Next

	; determine if process rule or class rule matches for custom rules
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If StringInStr($sName, $aCustomRules[$i][1], 2) Or StringInStr($sClassName, $aCustomRules[$i][1], 2) Then
			; skip custom rules that are not Enabled
			If $aCustomRules[$i][12] = "False" Then
				If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
				If $iBorderColorOptions <> 0 Then
					If $dGlobalBorderColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dGlobalBorderColor))
				EndIf
				If $dGlobalTitleBarColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor($dGlobalTitleBarColor))
				If $dGlobalTitleBarTextColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor($dGlobalTitleBarTextColor))
				If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, $iGlobalTitleBarBackdrop)
				If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, $iGlobalCornerPreference)
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
			; border color, fallback to global if not set
			If $iBorderColorOptions <> 0 Then
				If $aCustomRules[$i][3] <> "" Then
					_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($aCustomRules[$i][3]))
				Else
					If $dGlobalBorderColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dGlobalBorderColor))
				EndIf
			EndIf
			; titlebar color, fallback to global if not set
			If $aCustomRules[$i][4] <> "" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor($aCustomRules[$i][4]))
			Else
				If $dGlobalTitleBarColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor($dGlobalTitleBarColor))
			EndIf
			; titlebar text color, fallback to global if not set
			If $aCustomRules[$i][5] <> "" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor($aCustomRules[$i][5]))
			Else
				If $dGlobalTitleBarTextColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor($dGlobalTitleBarTextColor))
			EndIf
			; titlebar backdrop, fallback to global if not set
			If $aCustomRules[$i][6] <> "" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 38, $aCustomRules[$i][6])
			Else
				If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, $iGlobalTitleBarBackdrop)
			EndIf
			; corner preference, fallback to global if not set
			If $aCustomRules[$i][7] <> "" Then
				_WinAPI_DwmSetWindowAttribute__($hWnd, 33, $aCustomRules[$i][7])
			Else
				If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, $iGlobalCornerPreference)
			EndIf
			; obtain blur tint color and intensity details
			If $aCustomRules[$i][11] <> "" Then
				If $aCustomRules[$i][10] <> "" Then
					Local $iTintColor = $aCustomRules[$i][10]
					Local $iIntensity = _percentageOfHex($aCustomRules[$i][11])
					Local $iTintColorSwitch = Hex(_WinAPI_SwitchColor($iTintColor), 6)
					Local $iTintColorBlur = '0x' & $iIntensity & $iTintColorSwitch
				EndIf
			EndIf
			; blur behind, fallback to global if not set
			If $aCustomRules[$i][9] = "True" Then
				;_EnableBlurBehind($hWnd, $sName, $sClassName, $iTintColorBlur)
				; this fixes the rare time when explorer blur doesn't show right away
				If $sClassName = "CabinetWClass" Then
					Send("{SPACE}")
					_EnableBlurBehind($hWnd, $sName, $sClassName, $iTintColorBlur)
					;_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
				EndIf
				If $sClassName <> "CabinetWClass" Then _EnableBlurBehind($hWnd, $sName, $sClassName, $iTintColorBlur)
			EndIf
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
				If Not $iGlobalEnableBlurBehind Then
					; only enable ExtendFrameIntoClientArea if blur behind is not enabled
					If $iGlobalExtendFrameIntoClient Then _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
				EndIf
			EndIf
			$bMatchesFound = True
		EndIf
    Next

	; fallback to global when no custom rules match
	If Not $bMatchesFound Then
		If $bGlobalDarkTitleBar Then _WinAPI_DwmSetWindowAttribute__($hWnd, 20, 1)
		If $dGlobalBorderColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dGlobalBorderColor))
		If $dGlobalTitleBarColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 35, _WinAPI_SwitchColor($dGlobalTitleBarColor))
		If $dGlobalTitleBarTextColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 36, _WinAPI_SwitchColor($dGlobalTitleBarTextColor))
		If $iGlobalTitleBarBackdrop <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 38, $iGlobalTitleBarBackdrop)
		If $iGlobalCornerPreference <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 33, $iGlobalCornerPreference)
		; also need to determine if custom rules has this set, if so, then skip this
		If $iGlobalEnableBlurBehind Then
			;_EnableBlurBehind($hWnd, $sName, $sClassName, $iGlobalBlurTintColor)
			; this fixes the rare time when explorer blur doesn't show right away
			If $sClassName = "CabinetWClass" Then
				Send("{SPACE}")
				_EnableBlurBehind($hWnd, $sName, $sClassName, $iTintColorBlur)
				;_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
			EndIf
			If $sClassName <> "CabinetWClass" Then _EnableBlurBehind($hWnd, $sName, $sClassName, $iTintColorBlur)
		EndIf
		If $iGlobalExtendFrameIntoClient Then
			If Not $iGlobalEnableBlurBehind Then _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
		EndIf
	EndIf
EndFunc

Func _ColorBorderOnly($hWnd, $sClassName, $sName)
	; don't bother if class/process is on global exclusion list
	For $i = 0 To UBound($aGlobalExclusions) -1
		;If StringInStr($sName, $aGlobalExclusions[$i], $STR_NOCASESENSEBASIC) Then ContinueLoop
		If StringInStr($sName, $aGlobalExclusions[$i], 2) Or StringInStr($sClassName, $aGlobalExclusions[$i], 2) Then ContinueLoop
	Next

	Local $bMatchesFound = False
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		If StringInStr($sName, $aCustomRules[$i][1], 2) Or StringInStr($sClassName, $aCustomRules[$i][1], 2) Then
			$bMatchesFound = True
			If $aCustomRules[$i][3] <> "" Then
				;_WinAPI_DwmSetWindowAttribute__($hWnd, 34, 0xFFFFFFFF)
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($aCustomRules[$i][3]))
			Else
				If $dGlobalBorderColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dGlobalBorderColor))
			EndIf
		EndIf
    Next

	If Not $bMatchesFound Then
		If $dGlobalBorderColor <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dGlobalBorderColor))
	EndIf
EndFunc

Func _DwmExtendFrameIntoClientArea($hWnd, $sName, $sClassName, $i)
	; Visual Studio Handling
	If StringInStr($sName, 'devenv.exe', $STR_NOCASESENSEBASIC) Then
		_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
		;_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dVSStudioBorderColor))
	ElseIf StringInStr($sName, 'VSCodium.exe', $STR_NOCASESENSEBASIC) Then
		EnableBlurBehind($hWnd, True, $sName, $sClassName)
		_WinAPI_DwmEnableBlurBehindWindow10($hWnd, False)
		_WinAPI_DwmEnableBlurBehindWindow($hWnd, 0, 0)
		_WinAPI_DwmSetWindowAttribute__($hWnd, 38, $dTerminalBackdrop)
		_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	ElseIf StringInStr($sName, 'Code.exe', $STR_NOCASESENSEBASIC) Then
		EnableBlurBehind($hWnd, True, $sName, $sClassName)
		_WinAPI_DwmEnableBlurBehindWindow10($hWnd, False)
		_WinAPI_DwmEnableBlurBehindWindow($hWnd, 0, 0)
		_WinAPI_DwmSetWindowAttribute__($hWnd, 38, $dTerminalBackdrop)
		_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	ElseIf $sClassName = "CASCADIA_HOSTING_WINDOW_CLASS" Then
		_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
		If $aCustomRules[$i][3] <> "" Then _WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($aCustomRules[$i][3]))
	Else
		_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	EndIf
	If $sClassName = "CabinetWClass" Then
		Sleep(50)
		_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	EndIf
EndFunc

Func _EnableBlurBehind($hWnd, $sName, $sClassName, $iTintColorBlur = "")
	Local $bSpecialHelper = False

	Local $hRgn = _WinAPI_CreateEllipticRgn(_WinAPI_CreateRectEx(0, 0, 0, 0))
	_WinAPI_DwmEnableBlurBehindWindow($hWnd, 1, 0, $hRgn)
	If $hRgn Then
		_WinAPI_DeleteObject($hRgn)
	EndIf

	If $sClassName = "CabinetWClass" Then $bSpecialHelper = True
	If $sClassName = 'CASCADIA_HOSTING_WINDOW_CLASS' Then $bSpecialHelper = True

	_WinAPI_DwmEnableBlurBehindWindow10($hWnd, True, $iTintColorBlur)

	; Visual Studio Handling
	If StringInStr($sName, 'devenv.exe', $STR_NOCASESENSEBASIC) Then
		_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
	Else
		If Not $bSpecialHelper Then _WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
	EndIf

	; this fixes issue with blur behind windows losing titlebar blur when regaining focus		
	If $sClassName = 'TaskManagerWindow' Then
		If WinActive("[CLASS:TaskManagerWindow]") Then
			Sleep(20)
			_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
		EndIf
	EndIf

	; this fixes issue with blur behind windows losing titlebar blur when regaining focus
	; and some special handling for Windows Terminal		
	If $sClassName = 'CASCADIA_HOSTING_WINDOW_CLASS' Then
		If WinActive("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]") Then
			_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(5000, 5000, 0, 0))
		EndIf
	EndIf
EndFunc

Func EnableBlurBehind($hWnd, $bEnable, $sName, $sClassName)
	Local $hRgn = _WinAPI_CreateEllipticRgn(_WinAPI_CreateRectEx(0, 0, 0, 0))
	_WinAPI_DwmEnableBlurBehindWindow($hWnd, 1, 0, $hRgn)
	If $hRgn Then
		_WinAPI_DeleteObject($hRgn)
	EndIf

	_WinAPI_DwmEnableBlurBehindWindow10($hWnd, $bEnable)

	_WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))
EndFunc

Func _WinAPI_DwmSetWindowAttribute__($hwnd, $attribute = 34, $value = 0x00FF00, $valLen = 4)
	Local $aCall = DllCall('dwmapi.dll', 'long', 'DwmSetWindowAttribute', 'hwnd', $hWnd, 'dword', $attribute, 'dword*', $value, 'dword', $valLen)
	If @error Then Return SetError(@error, @extended, 0)
	If $aCall[0] Then Return SetError(10, $aCall[0], 0)
	Return 1
EndFunc   ;==>_WinAPI_DwmSetWindowAttribute__

Func _WinEventProc($hHook, $iEvent, $hWnd, $iObjectID, $iChildID, $iEventThread, $imsEventTime)
	Local Static $hWndLast
	Local Static $hWndLastForeground
	Local Static $hWndLast3
	Local Static $hWndLastReorder
	;Local Static $hActiveWndLast
	Local Static $hWndLastCreate
	Local Static $hWndLastShow
	Local $sActiveWindowShow, $sActiveWindowForeground, $sActiveWindow3, $sActiveWindowVS, $sActiveWindowCreate, $sNameForeground
	Local $sClassNameShow, $sClassName3, $sClassNameReorder, $sClassNameNameChange, $sClassName6, $sClassNameCreate, $sClassNameShow
	Local $sClassNameForeground
	Local $hTerminal
    Switch $iEvent
		Case $EVENT_OBJECT_CREATE
			; EVENT_OBJECT_CREATE catches process init sooner and works with most apps
			; avoid applying coloring to duplicate hWnd in rapid succession
			If $hWnd<>$hWndLastCreate Then
				$hWndLastCreate = $hWnd
			ElseIf $hWnd=$hWndLastCreate Then
				ContinueCase
			EndIf
			$sActiveWindowCreate = _WinAPI_GetWindowTextMod($hWnd)
			;$sClassName = _WinAPI_GetClassName($hWnd)
			;ConsoleWrite("$EVENT_OBJECT_SHOW: " & $sClassName & " " & "Title: " & $sActiveWindowCreate & @CRLF)
			If $sActiveWindowCreate = "" Then ContinueCase
			If $sActiveWindowCreate = "Program Manager" Then ContinueCase
			If $sActiveWindowCreate = "PopupHost" Then ContinueCase ; Xaml_WindowedPopupClass
			;If $sActiveWindowCreate = "CoreInput" Then ContinueCase ; Windows.UI.Core.CoreComponentInputSource
			;If $sActiveWindowCreate = "Search" Then ContinueCase ; Windows.UI.Core.CoreWindow
			;If $sActiveWindowCreate = "Start" Then ContinueCase ; Windows.UI.Core.CoreWindow
			;If $sActiveWindowCreate = "DesktopWindowXamlSource" Then ContinueCase ; Windows.UI.Composition.DesktopWindowContentBridge
			If $sActiveWindowCreate = "Chrome Legacy Window" Then ContinueCase ; Chrome_RenderWidgetHostHWND
			If $sActiveWindowCreate = "Quick settings" Then ContinueCase ; ControlCenterWindow
			If $sActiveWindowCreate = "System tray overflow window." Then ContinueCase ; TopLevelWindowForOverflowXamlIsland
			If $sActiveWindowCreate = "Drag" Then ContinueCase ; SysDragImage

			; filter some by class name
			$sClassNameCreate = _WinAPI_GetClassName($hWnd)
			;If $sClassNameCreate = "Windows.UI.Core.CoreWindow" Then ContinueCase ; this covers Start, Search + much more
			If StringInStr($sClassNameCreate, "Windows.UI.") Then ContinueCase
			;If StringInStr($sClassNameCreate, "Windows.UI.Core") Then ContinueCase
			If $sClassNameCreate = "XamlExplorerHostIslandWindow" Then ContinueCase
			;ConsoleWrite("$EVENT_OBJECT_SHOW: " & $sClassNameCreate & " " & "Title: " & $sActiveWindowCreate & @CRLF)

			MainColoringFunction($hWnd)

		Case $EVENT_OBJECT_SHOW
			$sActiveWindowShow = _WinAPI_GetWindowTextMod($hWnd)
			If $sActiveWindowShow = "" Then ContinueCase
			If $sActiveWindowShow = "Program Manager" Then ContinueCase
			If $sActiveWindowShow = "PopupHost" Then ContinueCase ; Xaml_WindowedPopupClass
			;If $sActiveWindowShow = "CoreInput" Then ContinueCase ; Windows.UI.Core.CoreComponentInputSource
			;If $sActiveWindowShow = "Search" Then ContinueCase ; Windows.UI.Core.CoreWindow
			;If $sActiveWindowShow = "Start" Then ContinueCase ; Windows.UI.Core.CoreWindow
			;If $sActiveWindowShow = "DesktopWindowXamlSource" Then ContinueCase ; Windows.UI.Composition.DesktopWindowContentBridge
			If $sActiveWindowShow = "Chrome Legacy Window" Then ContinueCase ; Chrome_RenderWidgetHostHWND
			If $sActiveWindowShow = "Quick settings" Then ContinueCase ; ControlCenterWindow
			If $sActiveWindowShow = "System tray overflow window." Then ContinueCase ; TopLevelWindowForOverflowXamlIsland
			If $sActiveWindowShow = "Drag" Then ContinueCase ; SysDragImage

			; filter some by class name
			$sClassNameShow = _WinAPI_GetClassName($hWnd)
			;If $sClassNameShow = "Windows.UI.Core.CoreWindow" Then ContinueCase ; this covers Start, Search + much more
			If StringInStr($sClassNameShow, "Windows.UI.") Then ContinueCase ; Start menu, Search, etc.
			;If StringInStr($sClassNameShow, "Windows.UI.Core") Then ContinueCase
			If $sClassNameShow = "XamlExplorerHostIslandWindow" Then ContinueCase
			;ConsoleWrite("$EVENT_OBJECT_SHOW: " & $sClassNameShow & " " & "Title: " & $sActiveWindowShow & @CRLF)

			; explorer, no cache
			If $sClassNameShow = "CabinetWClass" Then
				MainColoringFunction($hWnd)
				ContinueCase
			EndIf

			; terminal, no cache
			If $sClassNameShow = "CASCADIA_HOSTING_WINDOW_CLASS" Then
				MainColoringFunction($hWnd)
				ContinueCase
			EndIf

			;#cs
			$aMapKeys = MapKeys($mMap)
			For $vKey In $aMapKeys
				If $hWnd = $mMap[$vKey] Then
				ConsoleWrite("Already exists on map: " & $hWnd & " (skipping)" & @CRLF)	
				ContinueCase
				EndIf
			Next
			;#ce

			MainColoringFunction($hWnd)

			; add hWnd to Map
			$mMap[$hWnd] = $hWnd

		Case $EVENT_SYSTEM_FOREGROUND
			; this Case is mostly for handling border coloring and some special handling

			; avoid applying coloring to duplicate hWnd in rapid succession
			If $hWnd<>$hWndLastForeground Then
				$hWndLastForeground = $hWnd
			ElseIf $hWnd=$hWndLastForeground Then
				ContinueCase
			EndIf

			If $iBorderColorOptions = 0 Then
				; border color, only color active window
				$hActiveWnd = WinGetHandle("[ACTIVE]", "")
				If $hActiveWnd<>$hActiveWndLast Then
					$sClassNameForeground = _WinAPI_GetClassName($hWnd)
					$sNameForeground = _WinAPI_GetWindowFileName($hWnd)
					; active window changed
					; remove border color from last window
					_WinAPI_DwmSetWindowAttribute__($hActiveWndLast, 34, 0xFFFFFFFF)
					; add border color for new window
					;_ColorBorderOnly($hWnd, $sClassName, $sName)
					$hActiveWndLast = $hActiveWnd
				ElseIf $hActiveWnd=$hActiveWndLast Then
					; active window did not change (do nothing)
					$sClassNameForeground = _WinAPI_GetClassName($hWnd)
					$sNameForeground = _WinAPI_GetWindowFileName($hWnd)
				EndIf
			EndIf

			If $iBorderColorOptions <> 0 Then
				$sClassNameForeground = _WinAPI_GetClassName($hWnd)
				$sNameForeground = _WinAPI_GetWindowFileName($hWnd)
			EndIf

			; Visual Studio Handling
			$sActiveWindowVS = _WinAPI_GetWindowTextMod($hWnd)
			If $sActiveWindowVS = 'Microsoft Visual Studio' Then
				Sleep(20)
				_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dVSStudioBorderColor))
			EndIf

			; special handling for Windows Terminal backdrop
			If $bWindowsTerminalHandling Then
				If WinExists("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]") Then
					$hTerminal = WinGetHandle("[CLASS:CASCADIA_HOSTING_WINDOW_CLASS]")
					_WinAPI_DwmSetWindowAttribute__($hTerminal, 38, $dTerminalBackdrop)
					;_WinAPI_DwmSetWindowAttribute__($hTerminal, 34, _WinAPI_SwitchColor($dTerminalBorderColor))
					If $iBorderColorOptions = 1 Then
						_WinAPI_DwmSetWindowAttribute__($hTerminal, 34, _WinAPI_SwitchColor($dTerminalBorderColor))
					EndIf
				EndIf
			EndIf

			; fix modern File Explorer losing client area coloring when when losing focus
			; also fixes issue where modern File Explorer loses titlebar blur when losing focus
			If $bExplorerExtendClient Then 
				If Not $bClassicExplorer Then
					If WinExists("[CLASS:CabinetWClass]") Then
						$hExplorerHandle = WinGetHandle("[CLASS:CabinetWClass]")
						_WinAPI_DwmExtendFrameIntoClientArea($hExplorerHandle, _WinAPI_CreateMargins(-1, -1, -1, -1))
					EndIf
				EndIf
			EndIf

			; this catches some slower apps that fail to color

			$sActiveWindowForeground = _WinAPI_GetWindowTextMod($hWnd)
			;$sClassName = _WinAPI_GetClassName($hWnd)
			;ConsoleWrite("$EVENT_OBJECT_SHOW: " & $sClassName & " " & "Title: " & $sActiveWindow & @CRLF)
			If $sActiveWindowForeground = "" Then ContinueCase
			If $sActiveWindowForeground = "Program Manager" Then ContinueCase
			If $sActiveWindowForeground = "PopupHost" Then ContinueCase ; Xaml_WindowedPopupClass
			;If $sActiveWindowForeground = "CoreInput" Then ContinueCase ; Windows.UI.Core.CoreComponentInputSource
			;If $sActiveWindowForeground = "Search" Then ContinueCase ; Windows.UI.Core.CoreWindow
			;If $sActiveWindowForeground = "Start" Then ContinueCase ; Windows.UI.Core.CoreWindow
			;If $sActiveWindowForeground = "DesktopWindowXamlSource" Then ContinueCase ; Windows.UI.Composition.DesktopWindowContentBridge
			If $sActiveWindowForeground = "Chrome Legacy Window" Then ContinueCase ; Chrome_RenderWidgetHostHWND
			If $sActiveWindowForeground = "Quick settings" Then ContinueCase ; ControlCenterWindow
			If $sActiveWindowForeground = "System tray overflow window." Then ContinueCase ; TopLevelWindowForOverflowXamlIsland
			If $sActiveWindowForeground = "Drag" Then ContinueCase ; SysDragImage

			; filter some by class name
			;$sClassNameForeground = _WinAPI_GetClassName($hWnd)
			;If $sClassNameForeground = "Windows.UI.Core.CoreWindow" Then ContinueCase ; this covers Start, Search + much more
			If StringInStr($sClassNameForeground, "Windows.UI.") Then ContinueCase
			;If StringInStr($sClassNameForeground, "Windows.UI.Core") Then ContinueCase
			If $sClassNameForeground = "XamlExplorerHostIslandWindow" Then ContinueCase
			;If $sClassNameForeground = 'TaskManagerWindow' Then ContinueCase

			; get process name
			;$sNameForeground = _WinAPI_GetWindowFileName($hWnd)

			;MainColoringFunction($hWnd)
			; only deal with border coloring here
			_ColorBorderOnly($hWnd, $sClassNameForeground, $sNameForeground)

		Case $EVENT_OBJECT_REORDER
			; this Case is specifically for File Explorer when it loses Client Area coloring/backdrop

			; avoid applying coloring to duplicate hWnd in rapid succession
			If $hWnd<>$hWndLastReorder Then
				$hWndLastReorder = $hWnd
			ElseIf $hWnd=$hWndLastReorder Then
				ContinueCase
			EndIf

			If Not $bExplorerExtendClient Then ContinueCase

			; deal with file explorer (modern and classic)
			$sClassNameReorder = _WinAPI_GetClassName($hWnd)

			If $sClassNameReorder <> "CabinetWClass" Then ContinueCase

			; apply only to classic file explorer
			If $bClassicExplorer Then _WinAPI_DwmExtendFrameIntoClientArea($hWnd, _WinAPI_CreateMargins(-1, -1, -1, -1))

		Case $EVENT_OBJECT_NAMECHANGE
			; special handling for Windows Terminal backdrop
			If Not $bWindowsTerminalHandling Then ContinueCase

			$sClassNameNameChange = _WinAPI_GetClassName($hWnd)

			If $sClassNameNameChange <> 'CASCADIA_HOSTING_WINDOW_CLASS' Then ContinueCase
			_WinAPI_DwmSetWindowAttribute__($hWnd, 38, $dTerminalBackdrop)
			Sleep(20)
			_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dTerminalBorderColor))

		Case $EVENT_SYSTEM_MINIMIZEEND
			; special handling for Windows Terminal backdrop
			If Not $bWindowsTerminalHandling Then ContinueCase

			$sClassNameNameChange = _WinAPI_GetClassName($hWnd)

			If $sClassNameNameChange <> 'CASCADIA_HOSTING_WINDOW_CLASS' Then ContinueCase
			_WinAPI_DwmSetWindowAttribute__($hWnd, 38, $dTerminalBackdrop)
			Sleep(20)
			_WinAPI_DwmSetWindowAttribute__($hWnd, 34, _WinAPI_SwitchColor($dTerminalBorderColor))

    EndSwitch
EndFunc

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
	If $iBlurColor <> "" Then $tAccentPolicy.AccentFlags = 2
    If $iBlurColor <> "" Then $tAccentPolicy.GradientColor = $iBlurColor
	$tAccentPolicy.AnimationId = 0
	$tAttrData.Attribute = 19 ; WCA_ACCENT_POLICY
	$tAttrData.DataBuffer = DllStructGetPtr($tAccentPolicy)
	$tAttrData.Size = DllStructGetSize($tAccentPolicy)

	Local $aResult = DllCall("user32.dll", "bool", "SetWindowCompositionAttribute", "hwnd", $hWnd, "ptr", DllStructGetPtr($tAttrData))
	If @error Then Return SetError(@error, @extended, 0)

	Return $aResult[0]
EndFunc

Func _About()
	MsgBox($MB_SYSTEMMODAL, "Immersive UX", "Version: " & $iVersion & @CRLF & "Created by: " & "WildByDesign")
EndFunc

Func ClearHandleMap()
	; clear handle map every 1 hour
	Global $mMap[]
EndFunc

Func _WinAPI_GetWindowTextMod($hWnd)
	Local $aCall = DllCall("user32.dll", "int", "GetWindowTextW", "hwnd", $hWnd, "wstr", "", "int", 4096)
	If @error Or Not $aCall[0] Then Return ""
	Return $aCall[2]
EndFunc

; Function by argumentum
Func _percentageOfHex($iVal)
    $iVal = Int($iVal > 99 ? 100 : ($iVal < 1 ? 0 : $iVal)) ; no more than 100% or less than 0%
    Return Hex(Ceiling(($iVal * 100) * (2.55 * 100) / (100 * 100)), 2) ; calculate in integers, as floating point numbers suck in a CPU
EndFunc

Func idGUI()
	; only start GUI if not already running
	Local $aWinList = WinList()
	For $i = 1 To $aWinList[0][0]
		If $aWinList[$i][0] = "Immersive UX" Then
			WinActivate($aWinList[$i][1])
			Return
		EndIf
	Next

	If @Compiled Then
		ShellExecute(@ScriptDir & "\" & $sProdName & ".exe", "", @ScriptDir, $SHEX_OPEN)
	ElseIf Not @Compiled Then
		ShellExecute(@ScriptDir & "\" & $sProdName & ".au3")
	EndIf
EndFunc

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
                Local $sClassName = _WinAPI_GetClassName($hWnd)
                $iPID = WinGetProcess ($aWinList[$i][1])
		$sName = _ProcessGetName($iPID)
                If $aWinList[$i][0] = "" Then $aWinList[$i][0] = "<blank title>"
                ;If $aWinList[$i][0] = "" Then ContinueLoop
                ConsoleWrite($aWinList[$i][0] & @TAB & @TAB & $aWinList[$i][1] & @TAB & $sClassName & @TAB & $sName & @CRLF)
	Next
EndFunc   ;==>WinListtest
#ce
