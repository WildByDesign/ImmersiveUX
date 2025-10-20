#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=app.ico
#AutoIt3Wrapper_Outfile_x64=ImmersiveUX.exe
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Immersive UX GUI
#AutoIt3Wrapper_Res_Fileversion=1.6.0
#AutoIt3Wrapper_Res_ProductName=Immersive UX GUI
#AutoIt3Wrapper_Res_ProductVersion=1.6.0
#AutoIt3Wrapper_Res_LegalCopyright=@ 2025 WildByDesign
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_HiDpi=n
#AutoIt3Wrapper_Res_Icon_Add=app.ico
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Ignore_Funcs=_traynotifyicon
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Global $iVersion = '1.6.0'

#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
;#include <WinAPIGdi.au3>
#include <Misc.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <GuiSlider.au3>
#include <GuiToolTip.au3>
#include <WinAPITheme.au3>
#include <WinAPIProc.au3>
#include <File.au3>
#include <GuiMenu.au3>

#include <WinAPIDiag.au3>

#include "include\StringSize.au3"
#include "include\RoundGUI.au3"
#include "include\GuiFlatButton.au3"
;#include "include\ModernMenuRaw.au3"

#include "include\GUIComboBoxColor.au3"
;#include "include\GUIComboBoxFont.au3"
#include "include\_WinAPI_DPI.au3"
#include "include\TaskScheduler.au3"
#include "include\ExtMsgBox.au3"
#include "include\JSON.au3"

Global $aCustomRules[0][17]

Global $sIniPath = @ScriptDir & "\ImmersiveUX.ini"
Global $sProdName = "ImmersiveUX"
Global $sEngName = "ImmersiveEngine"

Global Const $sSegUIVar = @WindowsDir & "\fonts\SegUIVar.ttf"
Global $SegUIVarExists = FileExists($sSegUIVar)

If $SegUIVarExists Then
    _ExtMsgBoxSet(1, 4, 0x000000, 0xffffff, -1, "Segoe UI Variable Display", 800)
Else
    _ExtMsgBoxSet(1, 4, 0x000000, 0xffffff, -1, "Segoe UI", 800)
EndIf

Opt("GUIOnEventMode", 1)
Opt("WinTitleMatchMode", 3)

Opt("TrayMenuMode", 3)
Opt("TrayAutoPause", 0)
Opt("TrayOnEventMode", 1)

Global $hGUI, $FontHeight, $iHitTestHeight
Global $GUI_BackColor, $GUI_FontColor, $GUI_InputBackColor, $GUI_StatusBackColor, $GUI_StatusLineColor
Global $GUI_MenubarBackColor, $GUI_MenubarLineColor, $GUI_AdvancedLineColor
Global $dGlobalBlurTintColorInactive, $iGlobalColorIntensityInactive
Global $bGlobalDarkTitleBar, $dGlobalBorderColor, $dGlobalTitleBarColor, $dGlobalTitleBarTextColor, $iGlobalTitleBarBackdrop
Global $iGlobalCornerPreference, $iGlobalExtendFrameIntoClient, $iGlobalEnableBlurBehind, $dGlobalBlurTintColor, $iGlobalTintColorIntensity
Global $BorderColorInput, $colorlabelfill, $TitlebarColorInput, $TitlebarColorLabel, $iBorderColorOptions
Global $TitlebarTextColorInput, $TitlebarTextColorLabel, $BlurTintColorInput, $BlurTintColorPickLabel
Global $BlurTintColorInputInact, $BlurTintColorPickLabelInact, $BlurColorIntensitySliderInact
Global $idInput, $RuleListCombo, $idInputRuleType, $RuleTypeCombo, $idInputDarkTitle, $idPart3
Global $DarkTitleCombo, $idInputTitleBarBackdrop, $TitleBarBackdropCombo
Global $idInputCornerPreference, $CornerPreferenceCombo, $idInputExtendFrame, $ExtendFrameCombo
Global $idInputBlurBehind, $BlurBehindCombo, $idInputRuleEnabled, $RuleEnabledCombo
Global $TargetInput, $hBtnRuleType, $hBtnRuleEnabled, $DeleteButton, $SaveButton
Global $BlurColorIntensitySlider, $idPart2, $idPart1, $idPart4
Global $TaskIntegrity, $TaskInstalled, $TaskRunning
Global $aProcessRunning, $IsRunFromTS, $bProcessRunning
Global $idBorderOpt0, $idBorderOpt1, $idBorderOpt2, $idBorderOpt3
Global $idTaskOpt0, $idTaskOpt1, $idTaskOpt2, $idTaskOpt3
Global $sTargetLast = ""
Global $bHideGUI = False
Global $TRAY_EVENT_PRIMARYDOWN = -7
Global $DWMWA_COLOR_NONE = 0xFFFFFFFE
Global $DWMWA_COLOR_DEFAULT = 0xFFFFFFFF
Global $iW = 658, $iH = 420

Global $iDPI = _WinAPI_SetDPIAwareness(), $iDPI_def = 96
If $iDPI = 0 Then Exit MsgBox($MB_ICONERROR, "ERROR", "Unable to set DPI awareness!!!", 10)
Global $iDPI1 = $iDPI / $iDPI_def
Global $iDPI2 = $iDPI_def / $iDPI

If StringInStr($CmdLineRaw, "hidegui") Then $bHideGUI = True

If Not StringInStr($CmdLineRaw, "elevate") Then
    If _Singleton($sProdName, 1) = 0 Then
        ; handle situation when engine process is elevated and GUI process is not
        Local $bElevated = _ToBoolean(IniRead($sIniPath, "StartupInfoOnly", "Elevated", "False"))
        If $bElevated And Not IsAdmin() Then
            $sMsg = "Immersive UX is already running in the system tray." & @CRLF & @CRLF
            $sMsg &= "To avoid mismatching of integrity levels between engine process" & @CRLF
            $sMsg &= "and GUI process, please start Immersive UX GUI from the system" & @CRLF
            $sMsg &= "tray menu." & @CRLF
            _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
            Exit
        ElseIf Not $bElevated And IsAdmin() Then
            ; allow upgrading non-admin task to admin task
            ; need to close all
            If WinExists("Immersive UX Engine") Then WinClose("Immersive UX Engine")
            If WinExists("Immersive UX LED") Then WinClose("Immersive UX LED")
            ;If WinExists("Immersive UX") Then WinClose("Immersive UX")
            If WinExists("Immersive UX GUI") Then WinClose("Immersive UX GUI")

            ShellExecute(@ScriptDir & "\" & $sProdName & ".exe", "elevate", @ScriptDir, $SHEX_OPEN)
            Exit
        Else
            ; show and activate the GUI window
            $hWnd = WinGetHandle("Immersive UX")
            _WinAPI_ShowWindow($hWnd, @SW_SHOW)
            _WinAPI_SetForegroundWindow($hWnd)
            Exit
        EndIf
    EndIf
EndIf

TraySetOnEvent($TRAY_EVENT_PRIMARYDOWN, 'idGUI')
TraySetClick(16)

#include "include\ModernMenuRaw.au3"

_GetIniDetails()

Global $hSolidBrush = _WinAPI_CreateBrushIndirect($BS_SOLID, $GUI_MenubarLineColor)

_SetMenuBkColor($GUI_MenubarBackColor)
_SetMenuIconBkColor($GUI_MenubarBackColor)
_SetMenuIconBkGrdColor(0x000000)
_SetMenuSelectBkColor(0x202020)
_SetMenuSelectRectColor(0x202020)
_SetMenuSelectTextColor($GUI_FontColor)
_SetMenuTextColor($GUI_FontColor)

_StartGUI()
Func _StartGUI()
    Local $hGuiWnd = _GetHwndFromPID(@AutoItPID)
    _WinAPI_SetWindowText_mod($hGuiWnd, "Immersive UX GUI")

    $aProcessRunning = ProcessList($sEngName & ".exe")
    If $aProcessRunning[0][0] <> 0 Then
        Local $iPID = $aProcessRunning[1][1]
        $bProcessRunning = True
        $IsRunFromTS = _ToBoolean(IniRead($sIniPath, "StartupInfoOnly", "StartedByTask", "False"))
    ElseIf $aProcessRunning[0][0] = 0 Then
        $bProcessRunning = False
    EndIf
    ;_ArrayDisplay($aProcessRunning, "running")
    ;ConsoleWrite()
    $TaskIntegrity = "No"
    $TaskInstalled = _IsTaskInstalled()
    ;Global $TaskRunning = "No"
    $TaskRunning = _IsTaskRunning()
    If Not $TaskRunning Then $TaskRunning = "No"
    ; only try to get task integrity level if it exists
    If $TaskInstalled = "Yes" Then
        $TaskIntegrity = _GetTaskIntegrityLevel()
    EndIf
    If Not $TaskIntegrity Then $TaskIntegrity = "No"

    ; run engine if running from au3 sources only
    If Not @Compiled Then
        Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
        If $iPID = "" Then ShellExecute(@ScriptDir & "\" & $sEngName & ".au3")
    EndIf

    ; start Immersive UX engine if not running and no task installed
    ; if task installed but not running, start task
    If Not $bProcessRunning And @Compiled Then
        If $TaskInstalled = "No" Then
            ; run process
            ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
            ; run script if not compiled?
        ElseIf $TaskInstalled = "Yes" Then
            ; run task
            ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
        EndIf
    EndIf

    ; check engine/task status after 2 seconds only
    AdlibRegister("_TaskStatusUpdate_adlib", 2000)
    ; check engine/task status every 20 seconds for changes
    AdlibRegister("_TaskStatusUpdate_adlib20", 20000)

    $TaskRunning = _IsTaskRunning()
    If Not $TaskRunning Then $TaskRunning = "No"

    If $iDPI1 = 1 Then
        $iH = 450 + 30
        $iW = 660 + 25
    EndIf
    If $iDPI1 = 1.25 Then
        $iH = 410 + 30
        $iW = 624 + 20
    EndIf
    If $iDPI1 = 1.5 Then
        $iH = 370 + 30
        $iW = 620
    EndIf
    If $iDPI1 <> 1 And $iDPI1 <> 1.25 And $iDPI1 <> 1.5 Then
        $iH = 370
        $iW = 620
    EndIf

    $hGUI = GUICreate("Immersive UX", $iW * $iDPI1, $iH * $iDPI1, -1, -1, -1, $WS_EX_COMPOSITED)

    Local $idFileMenu = _GUICtrlCreateODTopMenu(" &File", $hGUI)
    Local $idSettingsMenu = _GUICtrlCreateODTopMenu(" &Options", $hGUI)
    Local $idTaskMenu = _GUICtrlCreateODTopMenu(" &Startup Task", $hGUI)
    Local $idSpecMenu = _GUICtrlCreateODTopMenu(" &Special Handling", $hGUI)

    Local $idAboutItem = GUICtrlCreateMenuItem("&About", $idFileMenu, 0)
    GUICtrlSetOnEvent(-1, "_About")
    GUICtrlCreateMenuItem("", $idFileMenu, 1)
    Local $idExitItem = GUICtrlCreateMenuItem("&Exit", $idFileMenu, 2)
    GUICtrlSetOnEvent(-1, "_Exit")

    Local $idBorderMenu = GUICtrlCreateMenu("&Borders", $idSettingsMenu)

    Local $idBorderOpt0 = GUICtrlCreateMenuItem("Active Window Only", $idBorderMenu, 0, 1)
    GUICtrlSetOnEvent(-1, "_BorderOpt0")
    Local $idBorderOpt1 = GUICtrlCreateMenuItem("Active && Inactive Windows", $idBorderMenu, 1, 1)
    GUICtrlSetOnEvent(-1, "_BorderOpt1")
    Local $idBorderOpt2 = GUICtrlCreateMenuItem("LED Strobe Effects", $idBorderMenu, 2, 1)
    GUICtrlSetOnEvent(-1, "_BorderOpt2")
    Local $idBorderOpt3 = GUICtrlCreateMenuItem("Disabled (System)", $idBorderMenu, 3, 1)
    GUICtrlSetOnEvent(-1, "_BorderOpt3")

    If $iBorderColorOptions = "0" Then GUICtrlSetState($idBorderOpt0, $GUI_CHECKED)
    If $iBorderColorOptions = "1" Then GUICtrlSetState($idBorderOpt1, $GUI_CHECKED)
    If $iBorderColorOptions = "2" Then GUICtrlSetState($idBorderOpt2, $GUI_CHECKED)
    If $iBorderColorOptions = "" Then GUICtrlSetState($idBorderOpt3, $GUI_CHECKED)

    $idTaskOpt0 = GUICtrlCreateMenuItem("Install Task (Admin)", $idTaskMenu)
    GUICtrlSetOnEvent(-1, "_TaskInstallAdmin")
    $idTaskOpt1 = GUICtrlCreateMenuItem("Install Task", $idTaskMenu)
    GUICtrlSetOnEvent(-1, "_TaskInstall")
    $idTaskOpt2 = GUICtrlCreateMenuItem("Uninstall Task", $idTaskMenu)
    GUICtrlSetOnEvent(-1, "_TaskUninstall")
    $idTaskOpt3 = GUICtrlCreateMenuItem("Restart Task", $idTaskMenu)
    GUICtrlSetOnEvent(-1, "_TaskRestart")

    _UpdateTaskMenu()

    Local $idVSCodeMenu = GUICtrlCreateMenu("&VSCode", $idSpecMenu)
    GUICtrlCreateMenuItem("Patch VSCode", $idVSCodeMenu)
    GUICtrlSetOnEvent(-1, "_VSCodePatch")
    GUICtrlCreateMenuItem("", $idVSCodeMenu)
    GUICtrlCreateMenuItem("Unpatch VSCode", $idVSCodeMenu)
    GUICtrlSetOnEvent(-1, "_VSCodeUnpatch")

    Local $idTerminalMenu = GUICtrlCreateMenu("&Terminal", $idSpecMenu)
    GUICtrlCreateMenuItem("Patch Terminal", $idTerminalMenu)
    GUICtrlSetOnEvent(-1, "_TerminalPatch")
    GUICtrlCreateMenuItem("", $idTerminalMenu)
    GUICtrlCreateMenuItem("Unpatch Terminal", $idTerminalMenu)
    GUICtrlSetOnEvent(-1, "_TerminalUnpatch")

    ; get menubar height
    $aMenubar = _GUICtrlMenu_GetMenuBarInfo($hGUI)
    $iMenubarHeight = $aMenubar[3] - $aMenubar[1]

    ; get titlebar height
    Local $iCaptionHeight = _WinAPI_GetSystemMetrics($SM_CYCAPTION)

    ; get border height top
    Local $iBorderHeight = _WinAPI_GetSystemMetrics($SM_CYSIZEFRAME)
    If $iBorderHeight = 0 Then $iBorderHeight = _WinAPI_GetSystemMetrics($SM_CYFIXEDFRAME)
    $iBorderHeight = $iBorderHeight / 2

    ; get client size
    Local $aClientSize = WinGetClientSize($hGUI)

    Local $aGUIPos = WinGetPos($hGUI)
    Local $iGUIBottom = $aGUIPos[1] + $aGUIPos[3]

    $iHitTestHeight = Round($iMenubarHeight + $iCaptionHeight + $iBorderHeight)

    If $SegUIVarExists Then
        Global $MainFont = "Segoe UI Variable Display"
        Global $FontSize = 9
        GUISetFont($FontSize, $FW_NORMAL, -1, $MainFont)
            $aStringSize = _StringSize("This is just a TEST.", $FontSize, 400, 0, $MainFont)
            $FontHeight = $aStringSize[1] + 3
            ;ConsoleWrite("$FontHeight " & $FontHeight & @CRLF)
    Else
        Global $MainFont = "Segoe UI"
        Global $FontSize = 9
        GUISetFont($FontSize, $FW_NORMAL, -1, $MainFont)
            $aStringSize = _StringSize("This is just a TEST.", $FontSize, 400, 0, $MainFont)
            $FontHeight = $aStringSize[1] + 3
            ;ConsoleWrite("$FontHeight " & $FontHeight & @CRLF)
    EndIf
    GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
    GUISetBkColor($GUI_BackColor)
    GUICtrlSetDefColor($GUI_FontColor)

    Local $hToolTip2 = _GUIToolTip_Create(0)
    _GUIToolTip_SetMaxTipWidth($hToolTip2, 400)

    _WinAPI_SetWindowTheme($hToolTip2, "", "")
    _GUIToolTip_SetTipBkColor($hToolTip2, 0x202020)
    _GUIToolTip_SetTipTextColor($hToolTip2, 0xe0e0e0)
    _GUIToolTip_SetMargin($hToolTip2, 4, 2, 4, 2)

    Local $iStatusTextAlign
    If $iDPI1 = 1 Then $iStatusTextAlign = - 2
    If $iDPI1 = 1.25 Then $iStatusTextAlign = - 1
    If $iDPI1 = 1.5 Then $iStatusTextAlign = - 1
    If $iDPI1 <> 1 And $iDPI1 <> 1.25 And $iDPI1 <> 1.5 Then $iStatusTextAlign = 3

    $idStatusBarDiv = Round($aClientSize[0] / 4)

    GUICtrlSetState(-1, $GUI_HIDE)

    $idPart1 = GUICtrlCreateLabel("Engine Running:", 20, $aClientSize[1] - $iMenubarHeight + $iStatusTextAlign, 164 * $iDPI1, $iMenubarHeight, $SS_CENTERIMAGE)
    GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)


    $idPart2 = GUICtrlCreateLabel("Task Installed: " & $TaskInstalled, $idStatusBarDiv + 20, $aClientSize[1] - $iMenubarHeight + $iStatusTextAlign, 164 * $iDPI1, $iMenubarHeight, $SS_CENTERIMAGE)
    GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)


    $idPart3 = GUICtrlCreateLabel("Elevated:", ($idStatusBarDiv * 2) + 20, $aClientSize[1] - $iMenubarHeight + $iStatusTextAlign, 164 * $iDPI1, $iMenubarHeight, $SS_CENTERIMAGE)
    GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

    $idPart4 = GUICtrlCreateLabel(" Other Settings  ▼ ", 508 * $iDPI1, $aClientSize[1] - $iMenubarHeight + $iStatusTextAlign, 164 * $iDPI1, $iMenubarHeight, $SS_CENTER + $SS_CENTERIMAGE)
    GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

    GUICtrlSetState(-1, $GUI_HIDE)

    ;EndIf

    $idStatusBarDiv1 = GUICtrlCreateLabel(" ", $idStatusBarDiv, $aClientSize[1] - $iMenubarHeight - 1, 1, $iMenubarHeight + 2)
    GUICtrlSetBkColor(-1, $GUI_StatusLineColor)
    GUICtrlSetState(-1, $GUI_DISABLE)

    $idStatusBarDiv2 = GUICtrlCreateLabel(" ", $idStatusBarDiv * 2, $aClientSize[1] - $iMenubarHeight - 1, 1, $iMenubarHeight + 2)
    GUICtrlSetBkColor(-1, $GUI_StatusLineColor)
    GUICtrlSetState(-1, $GUI_DISABLE)

    $idStatusBarDiv3 = GUICtrlCreateLabel(" ", $idStatusBarDiv * 3, $aClientSize[1] - $iMenubarHeight - 1, 1, $iMenubarHeight + 2)
    GUICtrlSetBkColor(-1, $GUI_StatusLineColor)
    GUICtrlSetState(-1, $GUI_DISABLE)

    $idStatusBarLine = GUICtrlCreateLabel(" ", 0, $aClientSize[1] - $iMenubarHeight - 1, $iW * $iDPI1, 1)
    GUICtrlSetBkColor(-1, $GUI_StatusLineColor)
    GUICtrlSetState(-1, $GUI_DISABLE)
    $idStatusBar = GUICtrlCreateLabel(" ", 0, $aClientSize[1] - $iMenubarHeight, $iW * $iDPI1, $iMenubarHeight)
    GUICtrlSetBkColor(-1, $GUI_StatusBackColor)
    GUICtrlSetState(-1, $GUI_DISABLE)

    _IsEngineProcRunning()

    $aStringSizeBig = _StringSize("CASCADIA_HOSTING_WINDOW_CLASS", $FontSize, 400, 0, $MainFont)
    ;100 * $iDPI1Big = $aStringSizeBig[2] + 50

    $RuleListLabel = GUICtrlCreateLabel("Rules List:", 20, 20, -1, -1)
    

    $aPos = ControlGetPos($hGUI, "", $RuleListLabel)


    $RuleListLabelPosV = $aPos[1] + $aPos[3]


    $RuleListCombo = GUICtrlCreateCombo("|", 20, $RuleListLabelPosV, 260 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
    GUICtrlSetOnEvent(-1, "idComboRuleList")
    GUICtrlSetState(-1, $GUI_HIDE)

    _GUICtrlComboBoxEx_SetColor($RuleListCombo, 0x202020, $GUI_FontColor)
    ;GUICtrlSetOnEvent(-1, "_RuleList")
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;$hRuleListCombo = GUICtrlGetHandle($RuleListCombo)

    ;Global $idInput = GUICtrlCreateInput("Select a rule", 20, 40, 100 * $iDPI1Big, $FontHeight, $ES_READONLY, 0)
    $idInput = _RGUI_RoundInput("Select a rule", $GUI_FontColor, 20, $RuleListLabelPosV, 260 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1, $ES_READONLY)
    ;GUICtrlSetBkColor(-1, 0x202020)
    GUICtrlSetCursor(-1, $MCID_ARROW)

    $aRegistry = ""
    ;$aRegistry &= "|" & "Global Rules"

    For $i = 0 To Ubound($aCustomRules)-1
            $aRegistry &= "|" & $aCustomRules[$i][16]
    Next
    GUICtrlSetData($RuleListCombo, $aRegistry)

    _GUICtrlComboBox_InsertString($RuleListCombo, "Global Rules", 0)
    $aPos = ControlGetPos($hGUI, "", $RuleListCombo)


    $RuleListComboPosV = $aPos[1] + $aPos[3]
    $RuleListComboPosH = $aPos[0] + $aPos[2]

    $aDropDownSize = _StringSize(ChrW(0xE70D), 10, 600, 0, "Segoe MDL2 Assets")
    $iDropDownSize = $aDropDownSize[1] + 4

    ; make sure button colors are visible with different background colors
    Local $iButtonColor2, $iButtonColor3
    Local $iButtonColor = Int($GUI_BackColor)
    If Not $iButtonColor Then
        $iButtonColor2 = 0x202020
        $iButtonColor3 = 0x606060
    Else
        If $iButtonColor Then
            $iButtonColor2 = $iButtonColor * 2
            $iButtonColor3 = $iButtonColor * 3
        EndIf
    EndIf

    ;GuiFlatButton_SetDefaultColors(0x000000, 0xFFFFFF, 0x000000)
    ;set default colors of future buttons
    Local $aColorsEx = _
        [$GUI_BackColor, $GUI_FontColor, $GUI_BackColor, _	; normal 	: Background, Text, Border
        $GUI_BackColor, $GUI_FontColor, $GUI_BackColor, _	; focus 	: Background, Text, Border
        $GUI_BackColor, $GUI_FontColor, -1, _	; hover 	: Background, Text, Border
        -1, $GUI_FontColor, -1]		; selected 	: Background, Text, Border
    ;GuiFlatButton_SetDefaultColorsEx($aColorsEx)

    $hBtn = GuiFlatButton_Create(ChrW(0xE70D), $RuleListComboPosH + 4, $RuleListLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    GUICtrlSetOnEvent(-1, "hBtn")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")
    

    $aPos = ControlGetPos($hGUI, "", $hBtn)


    $hBtnPosV = $aPos[1] + $aPos[3]
    $hBtnPosH = $aPos[0] + $aPos[2]

    $AddRuleButton = GuiFlatButton_Create(ChrW(0xE710), $hBtnPosH + 10, $RuleListLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    GUICtrlSetOnEvent(-1, "hBtnAddRule")
    GUICtrlSetFont(-1, 9, 200, -1, "Segoe MDL2 Assets")
    

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Add Custom Rule", GUICtrlGetHandle($AddRuleButton))

    $aPos = ControlGetPos($hGUI, "", $AddRuleButton)


    $AddRuleButtonPosV = $aPos[1] + $aPos[3]
    $AddRuleButtonPosH = $aPos[0] + $aPos[2]

    ;$AddRuleButton = GUICtrlCreateLabel(ChrW(0xE710), $hBtnPosH + 10, 42 + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    $SaveButton = GuiFlatButton_Create(ChrW(0xE105), $AddRuleButtonPosH + 10, $RuleListLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    GUICtrlSetOnEvent(-1, "_WriteIniSection")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe Fluent Icons")
    
    GUICtrlSetState($SaveButton, $GUI_DISABLE)

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Save Changes", GUICtrlGetHandle($SaveButton))

    $aPos = ControlGetPos($hGUI, "", $SaveButton)

    $SaveButtonPosV = $aPos[1] + $aPos[3]
    $SaveButtonPosH = $aPos[0] + $aPos[2]

    $DeleteButton = GuiFlatButton_Create(ChrW(0xE107), $SaveButtonPosH + 10, $RuleListLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    GUICtrlSetOnEvent(-1, "hBtnDeleteRule")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe Fluent Icons")
    
    GuiFlatButton_SetState($DeleteButton, $GUI_DISABLE)

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Delete Custom Rule", GUICtrlGetHandle($DeleteButton))

    $aPos = ControlGetPos($hGUI, "", $DeleteButton)

    $DeleteButtonPosV = $aPos[1] + $aPos[3]
    $DeleteButtonPosH = $aPos[0] + $aPos[2]

    $ReloadButton = GuiFlatButton_Create(ChrW(0xE149), $DeleteButtonPosH + 10, $RuleListLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    GUICtrlSetOnEvent(-1, "hBtnReloadRules")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe Fluent Icons")
    

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Reload & Refresh Rules", GUICtrlGetHandle($ReloadButton))

    $TargetLabel = GUICtrlCreateLabel("Target:", 20, $RuleListComboPosV + 20, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $TargetLabel)


    $TargetLabelPosV = $aPos[1] + $aPos[3]


    ;$TargetInput = GUICtrlCreateInput("", 20, $TargetLabelPosV, 100 * $iDPI1Big, $FontHeight, -1, 0)
    $TargetInput = _RGUI_RoundInput("", $GUI_FontColor, 20, $TargetLabelPosV, 260 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $TargetInput)


    $TargetInputPosV = $aPos[1] + $aPos[3]
    $TargetInputPosH = $aPos[0] + $aPos[2]

    ;#cs
    $RuleTypeLabel = GUICtrlCreateLabel("Rule Type:", $TargetInputPosH + 30, $RuleListComboPosV + 20, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $RuleTypeLabel)


    $RuleTypeLabelPosV = $aPos[1] + $aPos[3]

    $aStringSize = _StringSize("0x0078D4", $FontSize, 400, 0, $MainFont)
    ;100 * $iDPI1 = $aStringSize[2] + 50

    $RuleTypeCombo = GUICtrlCreateCombo("", $TargetInputPosH + 30, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, $CBS_DROPDOWNLIST)
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, $GUI_FontColor)
    GUICtrlSetData($RuleTypeCombo, "Class|Process")
    GUICtrlSetOnEvent(-1, "idComboRuleType")
    GUICtrlSetState(-1, $GUI_HIDE)

    ;$idInputRuleType = GUICtrlCreateInput("", $TargetInputPosH + 20, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputRuleType = _RGUI_RoundInput("", $GUI_FontColor, $TargetInputPosH + 30, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1, $ES_READONLY)
    ;GUICtrlSetBkColor(-1, 0x202020)
    GUICtrlSetCursor(-1, $MCID_ARROW)

    $aPos = ControlGetPos($hGUI, "", $RuleTypeCombo)


    $RuleTypeComboPosV = $aPos[1] + $aPos[3]
    $RuleTypeComboPosH = $aPos[0] + $aPos[2]
    ;#ce

    ;$hBtnRuleType = GUICtrlCreateLabel(ChrW(0xE70D), $RuleTypeComboPosH + 4, $RuleTypeLabelPosV + 4, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    $hBtnRuleType = GuiFlatButton_Create(ChrW(0xE70D), $RuleTypeComboPosH + 4, $RuleTypeLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    
    GUICtrlSetOnEvent(-1, "hBtnRuleType")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")

    $aPos = ControlGetPos($hGUI, "", $hBtnRuleType)


    $hBtnRuleTypePosV = $aPos[1] + $aPos[3]
    $hBtnRuleTypePosH = $aPos[0] + $aPos[2]

    ;
    $RuleEnabledLabel = GUICtrlCreateLabel("Enabled:", $hBtnRuleTypePosH + 20, $RuleListComboPosV + 20, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $RuleEnabledLabel)


    $RuleEnabledLabelPosV = $aPos[1] + $aPos[3]

    $aStringSize = _StringSize("0x0078D4", $FontSize, 400, 0, $MainFont)
    ;100 * $iDPI1 = $aStringSize[2] + 50

    $RuleEnabledCombo = GUICtrlCreateCombo("", $hBtnRuleTypePosH + 20, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, $CBS_DROPDOWNLIST)
    _GUICtrlComboBoxEx_SetColor($RuleEnabledCombo, 0x202020, $GUI_FontColor)
    GUICtrlSetData($RuleEnabledCombo, "True|False")
    GUICtrlSetOnEvent(-1, "idComboRuleEnabled")
    GUICtrlSetState(-1, $GUI_HIDE)

    ;$idInputRuleType = GUICtrlCreateInput("", $TargetInputPosH + 20, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputRuleEnabled = _RGUI_RoundInput("", $GUI_FontColor, $hBtnRuleTypePosH + 20, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1, $ES_READONLY)
    ;GUICtrlSetBkColor(-1, 0x202020)
    GUICtrlSetCursor(-1, $MCID_ARROW)

    $aPos = ControlGetPos($hGUI, "", $RuleEnabledCombo)


    $RuleEnabledComboPosV = $aPos[1] + $aPos[3]
    $RuleEnabledComboPosH = $aPos[0] + $aPos[2]
    ;#ce

    ;$hBtnRuleType = GUICtrlCreateLabel(ChrW(0xE70D), $RuleTypeComboPosH + 4, $RuleTypeLabelPosV + 4, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    $hBtnRuleEnabled = GuiFlatButton_Create(ChrW(0xE70D), $RuleEnabledComboPosH + 4, $RuleTypeLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    
    GUICtrlSetOnEvent(-1, "hBtnRuleEnabled")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")
    ;

    $DarkTitleLabel = GUICtrlCreateLabel("Dark Titlebar:", 20, $TargetInputPosV + 20 + 20 + 16, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $DarkTitleLabel)


    $DarkTitleLabelPosV = $aPos[1] + $aPos[3]
    $DarkTitleLabelPosH = $aPos[0]

    $DarkTitleCombo = GUICtrlCreateCombo("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, $GUI_FontColor)
    ;GUICtrlSetData($DarkTitleCombo, "True|False|Global")
    GUICtrlSetOnEvent(-1, "idComboDarkTitle")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $DarkTitleCombo)


    $DarkTitleComboPosV = $aPos[1] + $aPos[3]
    $DarkTitleComboPosH = $aPos[0] + $aPos[2]

    ;$hBtnDarkTitle = GUICtrlCreateLabel(ChrW(0xE70D), $DarkTitleComboPosH + 4, $DarkTitleLabelPosV + 4, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    $hBtnDarkTitle = GuiFlatButton_Create(ChrW(0xE70D), $DarkTitleComboPosH + 4, $DarkTitleLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    GUICtrlSetOnEvent(-1, "hBtnDarkTitle")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")
    

    ;$idInputDarkTitle = GUICtrlCreateInput("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputDarkTitle = _RGUI_RoundInput("", $GUI_FontColor, 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1, $ES_READONLY)
    ;GUICtrlSetBkColor(-1, 0x202020)
    GUICtrlSetCursor(-1, $MCID_ARROW)

    $aPos = ControlGetPos($hGUI, "", $idInputDarkTitle)

    $idInputDarkTitlePosV = $aPos[1] + $aPos[3]
    $idInputDarkTitlePosH = $aPos[0] + $aPos[2]

    $TitleBarBackdropLabel = GUICtrlCreateLabel("Backdrop Material:", 20, $idInputDarkTitlePosV + 20, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $TitleBarBackdropLabel)

    $TitleBarBackdropLabelPosV = $aPos[1] + $aPos[3]

    $TitleBarBackdropCombo = GUICtrlCreateCombo("", 20, $TitleBarBackdropLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, $GUI_FontColor)
    ;GUICtrlSetData($TitleBarBackdropCombo, "Auto|None|Mica|Acrylic|Mica Alt|Global")
    GUICtrlSetOnEvent(-1, "idComboTitleBarBackdrop")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $TitleBarBackdropCombo)

    $TitleBarBackdropComboPosV = $aPos[1] + $aPos[3]
    $TitleBarBackdropComboPosH = $aPos[0] + $aPos[2]

    ;$idInputTitleBarBackdrop = GUICtrlCreateInput("", 20, $TitleBarBackdropLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputTitleBarBackdrop = _RGUI_RoundInput("", $GUI_FontColor, 20, $TitleBarBackdropLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1, $ES_READONLY)
    ;GUICtrlSetBkColor(-1, 0x202020)
    GUICtrlSetCursor(-1, $MCID_ARROW)

    $aPos = ControlGetPos($hGUI, "", $idInputTitleBarBackdrop)

    $idInputTitleBarBackdropPosV = $aPos[1] + $aPos[3]
    $idInputTitleBarBackdropPosH = $aPos[0] + $aPos[2]
    $idInputTitleBarBackdropPosV2 = $aPos[1]

    $hBtnTitleBarBackdrop = GuiFlatButton_Create(ChrW(0xE70D), $TitleBarBackdropComboPosH + 4, $idInputTitleBarBackdropPosV2 + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    
    GUICtrlSetOnEvent(-1, "hBtnTitleBarBackdrop")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")

    $CornerPreferenceLabel = GUICtrlCreateLabel("Corner Preference:", 20, $idInputTitleBarBackdropPosV + 20, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $CornerPreferenceLabel)

    $CornerPreferenceLabelPosV = $aPos[1] + $aPos[3]

    $CornerPreferenceCombo = GUICtrlCreateCombo("", 20, $CornerPreferenceLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, $GUI_FontColor)
    ;GUICtrlSetData($CornerPreferenceCombo, "Default|Square|Round|Round Small|Global")
    GUICtrlSetOnEvent(-1, "idComboCornerPreference")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $CornerPreferenceCombo)

    $CornerPreferenceComboPosV = $aPos[1] + $aPos[3]
    $CornerPreferenceComboPosH = $aPos[0] + $aPos[2]

    $hBtnCornerPreference = GuiFlatButton_Create(ChrW(0xE70D), $CornerPreferenceComboPosH + 4, $CornerPreferenceLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    
    GUICtrlSetOnEvent(-1, "hBtnCornerPreference")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")

    ;$idInputCornerPreference = GUICtrlCreateInput("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputCornerPreference = _RGUI_RoundInput("", $GUI_FontColor, 20, $CornerPreferenceLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1, $ES_READONLY)
    ;GUICtrlSetBkColor(-1, 0x202020)
    GUICtrlSetCursor(-1, $MCID_ARROW)

    $aPos = ControlGetPos($hGUI, "", $idInputCornerPreference)

    $idInputCornerPreferencePosV = $aPos[1] + $aPos[3]
    $idInputCornerPreferencePosH = $aPos[0] + $aPos[2]

    $BorderColorLabel = GUICtrlCreateLabel("Border Color:", $idInputDarkTitlePosH + $FontHeight + 40, $TargetInputPosV + 20 + 20 + 16, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $BorderColorLabel)

    $BorderColorLabelPosV = $aPos[1] + $aPos[3]
    $BorderColorLabelPosV2 = $aPos[1]

    ;$BorderColorInput = GUICtrlCreateInput("", 20, $BorderColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $BorderColorInput = _RGUI_RoundInput("", $GUI_FontColor, $idInputDarkTitlePosH + $FontHeight + 40, $BorderColorLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $BorderColorInput)

    $BorderColorInputPosV = $aPos[1] + $aPos[3]
    $BorderColorInputPosH = $aPos[0] + $aPos[2]
    $BorderColorInputPosV2 = $aPos[1]

    ;$colorlabelfill = GUICtrlCreateLabel(" ", $BorderColorInputPosH + 14, $BorderColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    $colorlabelfill = GuiFlatButton_Create(" ", $BorderColorInputPosH + 14, $BorderColorInputPosV2, $FontHeight - 1, $FontHeight - 1)
    GuiFlatButton_SetBkColor(-1, $GUI_BackColor)

    GUICtrlSetOnEvent(-1, "ColorPicker")
    ;GUICtrlSetBkColor($colorlabelfill, 0xFF0000)

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Change Color", GUICtrlGetHandle($colorlabelfill))

    $aPos = ControlGetPos($hGUI, "", $colorlabelfill)

    $colorlabelfillPosV = $aPos[1] + $aPos[3]
    $colorlabelfillPosH = $aPos[0] + $aPos[2]

    $hBtnNoBorder = GuiFlatButton_Create(ChrW(0xED62), $BorderColorInputPosH + 14, $BorderColorLabelPosV2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    
    GUICtrlSetOnEvent(-1, "hBtnNoBorder")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe Fluent Icons")

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "No Border", GUICtrlGetHandle($hBtnNoBorder))

    $TitlebarColorLabel = GUICtrlCreateLabel("Titlebar Color:", $idInputDarkTitlePosH + $FontHeight + 40, $BorderColorInputPosV + 20, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $TitlebarColorLabel)

    $TitlebarColorLabelPosV = $aPos[1] + $aPos[3]
    $TitlebarColorLabelPosV2 = $aPos[1]

    ;$TitlebarColorInput = GUICtrlCreateInput("", 20, $TitlebarColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $TitlebarColorInput = _RGUI_RoundInput("", $GUI_FontColor, $idInputDarkTitlePosH + $FontHeight + 40, $TitlebarColorLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $TitlebarColorInput)

    $TitlebarColorInputPosV = $aPos[1] + $aPos[3]
    $TitlebarColorInputPosH = $aPos[0] + $aPos[2]
    $TitlebarColorInputPosH2 = $aPos[2]
    $TitlebarColorInputPosV2 = $aPos[1]

    ;$TitlebarColorLabel = GUICtrlCreateLabel(" ", $TitlebarColorInputPosH + 14, $TitlebarColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    $TitlebarColorLabel = GuiFlatButton_Create(" ", $TitlebarColorInputPosH + 14, $TitlebarColorInputPosV2, $FontHeight - 1, $FontHeight - 1)
    GuiFlatButton_SetBkColor(-1, $GUI_BackColor)

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Change Color", GUICtrlGetHandle($TitlebarColorLabel))
    GUICtrlSetOnEvent(-1, "ColorPickerTitlebar")

    $TitlebarTextColorLabel = GUICtrlCreateLabel("Titlebar Text Color:", $idInputDarkTitlePosH + $FontHeight + 40, $TitlebarColorInputPosV + 20, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $TitlebarTextColorLabel)

    $TitlebarTextColorLabelPosV = $aPos[1] + $aPos[3]
    $TitlebarTextColorLabelPosV2 = $aPos[1]

    ;$TitlebarTextColorInput = GUICtrlCreateInput("", 20, $TitlebarTextColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $TitlebarTextColorInput = _RGUI_RoundInput("", $GUI_FontColor, $idInputDarkTitlePosH + $FontHeight + 40, $TitlebarTextColorLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $TitlebarTextColorInput)

    $TitlebarTextColorInputPosV = $aPos[1] + $aPos[3]
    $TitlebarTextColorInputPosH = $aPos[0] + $aPos[2]
    $TitlebarTextColorInputPosV2 = $aPos[1]

    ;$TitlebarTextColorLabel = GUICtrlCreateLabel(" ", $TitlebarColorInputPosH + 14, $TitlebarTextColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    $TitlebarTextColorLabel = GuiFlatButton_Create(" ", $TitlebarColorInputPosH + 14, $TitlebarTextColorInputPosV2, $FontHeight - 1, $FontHeight - 1)
    GuiFlatButton_SetBkColor(-1, $GUI_BackColor)

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Change Color", GUICtrlGetHandle($TitlebarTextColorLabel))
    GUICtrlSetOnEvent(-1, "ColorPickerTitlebarText")

    $measureadvwidth = $DarkTitleLabelPosH + $colorlabelfillPosH
    $measureadvheight = $TitlebarTextColorInputPosV - $BorderColorLabelPosV2

    $ExtendFrameLabel = GUICtrlCreateLabel("Extend Frame To Client:", $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $BorderColorLabelPosV2, -1, -1)
    $aPos = ControlGetPos($hGUI, "", $ExtendFrameLabel)
    

    $ExtendFrameLabelPosV = $aPos[1] + $aPos[3]
    $ExtendFrameLabelPosH2 = $aPos[0]

    $aStringSize = _StringSize("Advanced", $FontSize, 400, 0, $MainFont)
    $AdvancedWidth = $aStringSize[2]

    GUISetFont(10, $FW_NORMAL, -1, "Segoe MDL2 Assets")
    If $iDPI1 = 1 Then
        $InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2 + 3 - 30, -1, -1, $SS_CENTER)
    ElseIf $iDPI1 = 1.25 Then
        $InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2 + 1 - 30, -1, -1, $SS_CENTER)
    ElseIf $iDPI1 = 1.5 Then
        $InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2 - 30, -1, -1, $SS_CENTER)
    Else
        $InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2 - 30, -1, -1, $SS_CENTER)
    EndIf

    ;GUICtrlSetBkColor($InfoButton, 0x000000)

    ;$InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2 + 2, -1, -1, $SS_CENTER)
    ;GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")
    Local $ToolMsg
    $ToolMsg = "Special Considerations:" & @CRLF & @CRLF
    $ToolMsg &= "These options require an app to have a black background. This ensures" & @CRLF
    $ToolMsg &= "that the background has an alpha value of 0 for best results." & @CRLF & @CRLF
    $ToolMsg &= "You can use the Rectify11 Black Mica theme to force a black background" & @CRLF
    $ToolMsg &= "on most Win32 apps."
    _GUIToolTip_AddTool($hToolTip2, $hGUI, $ToolMsg, GUICtrlGetHandle($InfoButton))
    
    GUISetFont($FontSize, $FW_NORMAL, -1, $MainFont)

    $idGroupPosV = $aPos[1] + $aPos[3]
    $idGroupPosH = $aPos[0] + $aPos[2]
    $idGroupPosH2 = $aPos[0]
    $idGroupPosEnd = $idGroupPosH2 + $idGroupPosH
    ;ConsoleWrite("$idGroupPosH " & $idGroupPosH & @CRLF)

    $ExtendFrameCombo = GUICtrlCreateCombo("", $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $ExtendFrameLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, $GUI_FontColor)
    ;GUICtrlSetData($ExtendFrameCombo, "True|False|Global")
    GUICtrlSetOnEvent(-1, "idComboExtendFrame")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $ExtendFrameCombo)

    $ExtendFrameComboPosV = $aPos[1] + $aPos[3]
    $ExtendFrameComboPosH = $aPos[0] + $aPos[2]

    ;$idInputDarkTitle = GUICtrlCreateInput("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputExtendFrame = _RGUI_RoundInput("", $GUI_FontColor, $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $ExtendFrameLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1, $ES_READONLY)
    ;GUICtrlSetBkColor(-1, 0x202020)
    GUICtrlSetCursor(-1, $MCID_ARROW)

    $aPos = ControlGetPos($hGUI, "", $idInputExtendFrame)

    $idInputExtendFramePosV = $aPos[1] + $aPos[3]
    $idInputExtendFramePosH = $aPos[0] + $aPos[2]

    $hBtnExtendFrame = GuiFlatButton_Create(ChrW(0xE70D), $ExtendFrameComboPosH + 4, $ExtendFrameLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    
    GUICtrlSetOnEvent(-1, "hBtnExtendFrame")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")

    $BlurBehindLabel = GUICtrlCreateLabel("Enable Blur Behind:", $idInputExtendFramePosH + $FontHeight + 40, $BorderColorLabelPosV2, -1, -1)
    $aPos = ControlGetPos($hGUI, "", $BlurBehindLabel)
    

    $BlurBehindLabelPosV = $aPos[1] + $aPos[3]

    $BlurBehindCombo = GUICtrlCreateCombo("", $idInputExtendFramePosH + $FontHeight + 40, $BlurBehindLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, $GUI_FontColor)
    ;GUICtrlSetData($BlurBehindCombo, "True|False|Global")
    GUICtrlSetOnEvent(-1, "idComboBlurBehind")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $BlurBehindCombo)

    $BlurBehindComboPosV = $aPos[1] + $aPos[3]
    $BlurBehindComboPosH = $aPos[0] + $aPos[2]

    $hBtnBlurBehind = GuiFlatButton_Create(ChrW(0xE70D), $BlurBehindComboPosH + 4, $BlurBehindLabelPosV + 2, $FontHeight - 1, $FontHeight - 1, $SS_CENTER)
    GuiFlatButton_SetColorsEx(-1, $aColorsEx)
    
    GUICtrlSetOnEvent(-1, "hBtnBlurBehind")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")

    ;$idInputDarkTitle = GUICtrlCreateInput("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputBlurBehind = _RGUI_RoundInput("", $GUI_FontColor, $idInputExtendFramePosH + $FontHeight + 40, $BlurBehindLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1, $ES_READONLY)
    ;GUICtrlSetBkColor(-1, 0x202020)
    GUICtrlSetCursor(-1, $MCID_ARROW)

    $aPos = ControlGetPos($hGUI, "", $idInputBlurBehind)

    $idInputBlurBehindPosV = $aPos[1] + $aPos[3]
    $idInputBlurBehindPosH = $aPos[0] + $aPos[2]

    $BlurTintColorLabel = GUICtrlCreateLabel("Blur Tint Color (Active):", $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $TitlebarColorLabelPosV2, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $BlurTintColorLabel)

    $BlurTintColorLabelPosV = $aPos[1] + $aPos[3]

    ;$TitlebarTextColorInput = GUICtrlCreateInput("", 20, $TitlebarTextColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $BlurTintColorInput = _RGUI_RoundInput("", $GUI_FontColor, $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $BlurTintColorLabelPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $BlurTintColorInput)

    $BlurTintColorInputPosV = $aPos[1] + $aPos[3]
    $BlurTintColorInputPosH = $aPos[0] + $aPos[2]
    $BlurTintColorInputPosV2 = $aPos[1]

    ;$BlurTintColorPickLabel = GUICtrlCreateLabel(" ", $BlurTintColorInputPosH + 14, $BlurTintColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    $BlurTintColorPickLabel = GuiFlatButton_Create(" ", $BlurTintColorInputPosH + 14, $BlurTintColorInputPosV2, $FontHeight - 1, $FontHeight - 1)
    GuiFlatButton_SetBkColor(-1, $GUI_BackColor)

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Change Color", GUICtrlGetHandle($BlurTintColorPickLabel))
    GUICtrlSetOnEvent(-1, "ColorPickerBlurTintColor")

    ;

    $BlurTintColorLabelInact = GUICtrlCreateLabel("Blur Tint Color (Inactive):", $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $TitlebarTextColorLabelPosV2, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $BlurTintColorLabelInact)

    $BlurTintColorLabelInactPosV = $aPos[1] + $aPos[3]

    ;$TitlebarTextColorInput = GUICtrlCreateInput("", 20, $TitlebarTextColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $BlurTintColorInputInact = _RGUI_RoundInput("", $GUI_FontColor, $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $BlurTintColorLabelInactPosV, 100 * $iDPI1, $FontHeight, $GUI_InputBackColor, $GUI_InputBackColor, 0, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $BlurTintColorInputInact)

    $BlurTintColorInputInactPosV = $aPos[1] + $aPos[3]
    $BlurTintColorInputInactPosH = $aPos[0] + $aPos[2]
    $BlurTintColorInputInactPosV2 = $aPos[1]

    ;$BlurTintColorPickLabel = GUICtrlCreateLabel(" ", $BlurTintColorInputPosH + 14, $BlurTintColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    $BlurTintColorPickLabelInact = GuiFlatButton_Create(" ", $BlurTintColorInputInactPosH + 14, $BlurTintColorInputInactPosV2, $FontHeight - 1, $FontHeight - 1)
    GuiFlatButton_SetBkColor(-1, $GUI_BackColor)

    _GUIToolTip_AddTool($hToolTip2, $hGUI, "Change Color", GUICtrlGetHandle($BlurTintColorPickLabelInact))
    GUICtrlSetOnEvent(-1, "ColorPickerBlurTintColorInact")

    $BlurColorIntensityLabel = GUICtrlCreateLabel("Color Opacity (Active):", $idInputExtendFramePosH + $FontHeight + 40, $TitlebarColorLabelPosV2, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $BlurColorIntensityLabel)

    $BlurColorIntensityLabelPosV = $aPos[1] + $aPos[3]

    $BlurColorIntensitySlider = GUICtrlCreateSlider($idInputExtendFramePosH + $FontHeight + 40 - 4, $BlurColorIntensityLabelPosV, 100 * $iDPI1 + 40, $FontHeight, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
    ;GUICtrlSetOnEvent(-1, "SliderFunction")
    $hWndTT = _GUICtrlSlider_GetToolTips($BlurColorIntensitySlider)
    _GUICtrlSlider_SetToolTips($BlurColorIntensitySlider, $hWndTT)
    GUICtrlSetBkColor($BlurColorIntensitySlider, $GUI_BackColor)
    GUICtrlSetLimit(-1, 100, 0)
    GUICtrlSetData($BlurColorIntensitySlider, 50)

    $aPos = ControlGetPos($hGUI, "", $BlurColorIntensitySlider)

    $BlurColorIntensitySliderPosV = $aPos[1] + $aPos[3]
    $BlurColorIntensitySliderPosH = $aPos[0] + $aPos[2]
    $BlurColorIntensitySliderV2 = $aPos[1]

    $BlurColorIntensityLabelInact = GUICtrlCreateLabel("Color Opacity (Inactive):", $idInputExtendFramePosH + $FontHeight + 40, $TitlebarTextColorLabelPosV2, -1, -1)
    
    $aPos = ControlGetPos($hGUI, "", $BlurColorIntensityLabelInact)

    $BlurColorIntensityLabelInactPosV = $aPos[1] + $aPos[3]

    $BlurColorIntensitySliderInact = GUICtrlCreateSlider($idInputExtendFramePosH + $FontHeight + 40 - 4, $BlurColorIntensityLabelInactPosV, 100 * $iDPI1 + 40, $FontHeight, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
    ;GUICtrlSetOnEvent(-1, "SliderFunction")
    $hWndTT = _GUICtrlSlider_GetToolTips($BlurColorIntensitySliderInact)
    _GUICtrlSlider_SetToolTips($BlurColorIntensitySliderInact, $hWndTT)
    GUICtrlSetBkColor($BlurColorIntensitySliderInact, $GUI_BackColor)
    GUICtrlSetLimit(-1, 100, 0)
    GUICtrlSetData($BlurColorIntensitySliderInact, 50)

    If $iDPI1 = 1 Then
        $AdvancedButton = GUICtrlCreateLabel("Advanced", $ExtendFrameLabelPosH2 - 8, $BorderColorLabelPosV2 - 30, -1, -1, $SS_CENTER)
    ElseIf $iDPI1 = 1.25 Then
        $AdvancedButton = GUICtrlCreateLabel("Advanced", $ExtendFrameLabelPosH2 - 8, $BorderColorLabelPosV2 - 30 - 2, -1, -1, $SS_CENTER)
    ElseIf $iDPI1 = 1.5 Then
        $AdvancedButton = GUICtrlCreateLabel("Advanced", $ExtendFrameLabelPosH2 - 8, $BorderColorLabelPosV2 - 30 - 3, -1, -1, $SS_CENTER)
    Else
        $AdvancedButton = GUICtrlCreateLabel("Advanced", $ExtendFrameLabelPosH2 - 8, $BorderColorLabelPosV2 - 30 - 2, -1, -1, $SS_CENTER)
    EndIf

    Local $idAdvancedLabel2 = GUICtrlCreateLabel(" ", $ExtendFrameLabelPosH2 - 20 + 1, $BorderColorLabelPosV2 + 8 - 30 + 1, $measureadvwidth - 2, $measureadvheight + 50 - 2)
    GUICtrlSetBkColor(-1, $GUI_BackColor)
    GUICtrlSetState(-1, $GUI_DISABLE)

    Local $idAdvancedLabel = GUICtrlCreateLabel(" ", $ExtendFrameLabelPosH2 - 20, $BorderColorLabelPosV2 + 8 - 30, $measureadvwidth, $measureadvheight + 50)
    GUICtrlSetBkColor(-1, $GUI_AdvancedLineColor)
    GUICtrlSetState(-1, $GUI_DISABLE)

    _WinAPI_DwmSetWindowAttribute__($hGUI, 20, 1)
    _WinAPI_DwmSetWindowAttribute__($hGUI, 38, 4)
    _WinAPI_DwmExtendFrameIntoClientArea($hGUI, _WinAPI_CreateMargins(-1, -1, -1, -1))

    GUICtrlSendMsg( $DarkTitleCombo, $WM_CHANGEUISTATE, 65537, 0 )

    GUIRegisterMsg($WM_COMMAND, "ED_WM_COMMAND")

    ControlFocus($hGUI, "", $RuleListCombo)

    If @Compiled Then
        GUISetIcon(@ScriptFullPath, 201)
    ElseIf Not @Compiled Then
        GUISetIcon(@ScriptDir & "\app.ico")
    EndIf

    GUIRegisterMsg($WM_NCHITTEST, "_MY_NCHITTEST")
    DarkMode($hGUI, True)
    GUIRegisterMsg($WM_NCPAINT, "WM_NCPAINT")
    GUIRegisterMsg($WM_ACTIVATE, "WM_ACTIVATE_Handler")

    ;If $bHideGUI Then GUISetState(@SW_HIDE, $hGUI)
    If $bHideGUI Then WinSetTrans($hGUI, "", 0)
    If $bHideGUI Then GUISetState(@SW_SHOW, $hGUI)
    If $bHideGUI Then WinSetState($hGUI, "", @SW_HIDE)
    If $bHideGUI Then WinSetTrans($hGUI, "", 255)
    ;If $bHideGUI Then WinSetState($hGUI, "", @SW_HIDE)
    If Not $bHideGUI Then GUISetState(@SW_SHOW, $hGUI)
    ;If Not $bHideGUI Then WinSetState($hGUI, "", @SW_SHOW)

    $idGUI = TrayCreateItem("Immersive UX")
    TrayItemSetOnEvent($idGUI, "idGUI")
    TrayCreateItem("")
    $idAbout = TrayCreateItem('About')
    TrayItemSetOnEvent($idAbout, "_About")
    $idExit = TrayCreateItem('Exit')
    TrayItemSetOnEvent($idExit, "_Exit")

    ; set tray icon and tooltip
    If @Compiled = 0 Then
        TraySetIcon(@ScriptDir & '\app.ico')
    Else
        TraySetIcon(@ScriptFullPath, 201)
    EndIf
    TraySetToolTip("Immersive UX")

    ; Just idle around
    While 1
        Sleep(100)
    WEnd

EndFunc

Func SpecialEvents()
    Select
        Case @GUI_CtrlId = $GUI_EVENT_CLOSE
            WinSetState($hGUI, "", @SW_HIDE)
    EndSelect
EndFunc

Func ColorPicker()
    Local $colorprev = GUICtrlRead($BorderColorInput)
    Local $colorsel
    If $colorprev <> "" Then
        $colorsel = $colorprev
    Else
        $colorsel = 0x7F7F7F
    EndIf
	Local $color = _ChooseColor(2, $colorsel, 2)
    If @error Then
        GUICtrlSetData($BorderColorInput, $colorprev)
    Else
        GUICtrlSetData($BorderColorInput, $color)
        ;GUICtrlSetBkColor($colorlabelfill, $color)
        GuiFlatButton_SetBkColor($colorlabelfill, $color)
    EndIf
EndFunc

Func ColorPickerTitlebar()
    Local $colorprev = GUICtrlRead($TitlebarColorInput)
	Local $colorsel
    If $colorprev <> "" Then
        $colorsel = $colorprev
    Else
        $colorsel = 0x7F7F7F
    EndIf
	Local $color = _ChooseColor(2, $colorsel, 2)
    If @error Then
        GUICtrlSetData($TitlebarColorInput, $colorprev)
    Else
        GUICtrlSetData($TitlebarColorInput, $color)
        ;GUICtrlSetBkColor($TitlebarColorLabel, $color)
        GuiFlatButton_SetBkColor($TitlebarColorLabel, $color)
    EndIf
EndFunc

Func ColorPickerTitlebarText()
    Local $colorprev = GUICtrlRead($TitlebarTextColorInput)
	Local $colorsel
    If $colorprev <> "" Then
        $colorsel = $colorprev
    Else
        $colorsel = 0x7F7F7F
    EndIf
	Local $color = _ChooseColor(2, $colorsel, 2)
    If @error Then
        GUICtrlSetData($TitlebarTextColorInput, $colorprev)
    Else
        GUICtrlSetData($TitlebarTextColorInput, $color)
        ;GUICtrlSetBkColor($TitlebarTextColorLabel, $color)
        GuiFlatButton_SetBkColor($TitlebarTextColorLabel, $color)
    EndIf
EndFunc

Func ColorPickerBlurTintColor()
    Local $colorprev = GUICtrlRead($BlurTintColorInput)
    Local $colorsel
    If $colorprev <> "" Then
        $colorsel = $colorprev
    Else
        $colorsel = 0x7F7F7F
    EndIf
	Local $color = _ChooseColor(2, $colorsel, 2)
    If @error Then
        GUICtrlSetData($BlurTintColorInput, $colorprev)
    Else
        GUICtrlSetData($BlurTintColorInput, $color)
        ;GUICtrlSetBkColor($BlurTintColorPickLabel, $color)
        GuiFlatButton_SetBkColor($BlurTintColorPickLabel, $color)
    EndIf
EndFunc

Func ColorPickerBlurTintColorInact()
    Local $colorprev = GUICtrlRead($BlurTintColorInputInact)
    Local $colorsel
    If $colorprev <> "" Then
        $colorsel = $colorprev
    Else
        $colorsel = 0x7F7F7F
    EndIf
	Local $color = _ChooseColor(2, $colorsel, 2)
    If @error Then
        GUICtrlSetData($BlurTintColorInputInact, $colorprev)
    Else
        GUICtrlSetData($BlurTintColorInputInact, $color)
        ;GUICtrlSetBkColor($BlurTintColorPickLabel, $color)
        GuiFlatButton_SetBkColor($BlurTintColorPickLabelInact, $color)
    EndIf
EndFunc

Func _UpdateColorBoxes()
    Local $color1 = GUICtrlRead($BorderColorInput)
    ;If $color1 <> $DWMWA_COLOR_NONE Then GUICtrlSetBkColor($colorlabelfill, $color1)
    If $color1 <> "0xFFFFFFFE" Then GuiFlatButton_SetBkColor($colorlabelfill, $color1)
    ;If $color1 = $DWMWA_COLOR_NONE Then GUICtrlSetBkColor($colorlabelfill, 0x000000)
    If $color1 = "0xFFFFFFFE" Then GuiFlatButton_SetBkColor($colorlabelfill, $GUI_BackColor)
	Local $color2 = GUICtrlRead($TitlebarColorInput)
	;GUICtrlSetBkColor($TitlebarColorLabel, $color2)
    GuiFlatButton_SetBkColor($TitlebarColorLabel, $color2)
	Local $color3 = GUICtrlRead($TitlebarTextColorInput)
	;GUICtrlSetBkColor($TitlebarTextColorLabel, $color3)
    GuiFlatButton_SetBkColor($TitlebarTextColorLabel, $color3)
    Local $color4 = GUICtrlRead($BlurTintColorInput)
	;GUICtrlSetBkColor($BlurTintColorPickLabel, $color4)
    GuiFlatButton_SetBkColor($BlurTintColorPickLabel, $color4)
    Local $color5 = GUICtrlRead($BlurTintColorInputInact)
	;GUICtrlSetBkColor($BlurTintColorPickLabelInact, $color5)
    GuiFlatButton_SetBkColor($BlurTintColorPickLabelInact, $color5)
EndFunc

Func ED_WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
    #forceref $hWnd, $iMsg
    Local $iCode = BitShift($wParam, 16)
    Switch $lParam
        Case GUICtrlGetHandle($idInput)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($RuleListCombo, True)
                    ControlFocus($hGUI, "", $RuleListCombo)
            EndSwitch
        Case GUICtrlGetHandle($idInputRuleType)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($RuleTypeCombo, True)
                    ControlFocus($hGUI, "", $RuleTypeCombo)
            EndSwitch
        Case GUICtrlGetHandle($idInputDarkTitle)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($DarkTitleCombo, True)
                    ControlFocus($hGUI, "", $DarkTitleCombo)
            EndSwitch
        Case GUICtrlGetHandle($idInputTitleBarBackdrop)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($TitleBarBackdropCombo, True)
                    ControlFocus($hGUI, "", $TitleBarBackdropCombo)
            EndSwitch
        Case GUICtrlGetHandle($idInputCornerPreference)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($CornerPreferenceCombo, True)
                    ControlFocus($hGUI, "", $CornerPreferenceCombo)
            EndSwitch
        Case GUICtrlGetHandle($idInputExtendFrame)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($ExtendFrameCombo, True)
                    ControlFocus($hGUI, "", $ExtendFrameCombo)
            EndSwitch
         Case GUICtrlGetHandle($idInputBlurBehind)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($BlurBehindCombo, True)
                    ControlFocus($hGUI, "", $BlurBehindCombo)
            EndSwitch
        Case GUICtrlGetHandle($idInputRuleEnabled)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($RuleEnabledCombo, True)
                    ControlFocus($hGUI, "", $RuleEnabledCombo)
            EndSwitch
    EndSwitch

    Return $GUI_RUNDEFMSG
EndFunc  ;==>ED_WM_COMMAND


Func hBtn()
    _GUICtrlComboBox_ShowDropDown($RuleListCombo, True)
    ControlFocus($hGUI, "", $RuleListCombo)
EndFunc

Func hBtnRuleType()
    _GUICtrlComboBox_ShowDropDown($RuleTypeCombo, True)
    ControlFocus($hGUI, "", $RuleTypeCombo)
EndFunc

Func hBtnDarkTitle()
    _GUICtrlComboBox_ShowDropDown($DarkTitleCombo, True)
    ControlFocus($hGUI, "", $DarkTitleCombo)
EndFunc

Func hBtnTitleBarBackdrop()
    _GUICtrlComboBox_ShowDropDown($TitleBarBackdropCombo, True)
    ControlFocus($hGUI, "", $TitleBarBackdropCombo)
EndFunc

Func hBtnNoBorder()
    GUICtrlSetData($BorderColorInput, "0xFFFFFFFE")
    _UpdateColorBoxes()
EndFunc

Func hBtnCornerPreference()
    _GUICtrlComboBox_ShowDropDown($CornerPreferenceCombo, True)
    ControlFocus($hGUI, "", $CornerPreferenceCombo)
EndFunc

Func hBtnExtendFrame()
    _GUICtrlComboBox_ShowDropDown($ExtendFrameCombo, True)
    ControlFocus($hGUI, "", $ExtendFrameCombo)
EndFunc

Func hBtnBlurBehind()
    _GUICtrlComboBox_ShowDropDown($BlurBehindCombo, True)
    ControlFocus($hGUI, "", $BlurBehindCombo)
EndFunc

Func hBtnRuleEnabled()
    _GUICtrlComboBox_ShowDropDown($RuleEnabledCombo, True)
    ControlFocus($hGUI, "", $RuleEnabledCombo)
EndFunc

Func idComboRuleList()
    GUICtrlSetData($idInput, GUICtrlRead($RuleListCombo))
    _RuleList()
EndFunc

Func idComboRuleType()
    GUICtrlSetData($idInputRuleType, GUICtrlRead($RuleTypeCombo))
EndFunc

Func idComboDarkTitle()
    Local $DarkTitleComboRead = GUICtrlRead($DarkTitleCombo)
    If $DarkTitleComboRead = "Not Set" Then
        GUICtrlSetData($idInputDarkTitle, "")
        _GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
    Else
        GUICtrlSetData($idInputDarkTitle, GUICtrlRead($DarkTitleCombo))
    EndIf
    ;GUICtrlSetData($idInputDarkTitle, GUICtrlRead($DarkTitleCombo))
EndFunc

Func idComboTitleBarBackdrop()
    Local $TitleBarBackdropComboRead = GUICtrlRead($TitleBarBackdropCombo)
    If $TitleBarBackdropComboRead = "Not Set" Then
        GUICtrlSetData($idInputTitleBarBackdrop, "")
        _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
    Else
        GUICtrlSetData($idInputTitleBarBackdrop, GUICtrlRead($TitleBarBackdropCombo))
    EndIf
    ;GUICtrlSetData($idInputTitleBarBackdrop, GUICtrlRead($TitleBarBackdropCombo))
EndFunc

Func idComboCornerPreference()
    Local $CornerPreferenceComboRead = GUICtrlRead($CornerPreferenceCombo)
    If $CornerPreferenceComboRead = "Not Set" Then
        GUICtrlSetData($idInputCornerPreference, "")
        _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
    Else
        GUICtrlSetData($idInputCornerPreference, GUICtrlRead($CornerPreferenceCombo))
    EndIf
    ;GUICtrlSetData($idInputCornerPreference, GUICtrlRead($CornerPreferenceCombo))
EndFunc

Func idComboExtendFrame()
    Local $ExtendFrameComboRead = GUICtrlRead($ExtendFrameCombo)
    If $ExtendFrameComboRead = "Not Set" Then
        GUICtrlSetData($idInputExtendFrame, "")
        _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)
    Else
        GUICtrlSetData($idInputExtendFrame, GUICtrlRead($ExtendFrameCombo))
    EndIf
    ;GUICtrlSetData($idInputExtendFrame, GUICtrlRead($ExtendFrameCombo))
EndFunc

Func idComboBlurBehind()
    Local $BlurBehindComboRead = GUICtrlRead($BlurBehindCombo)
    If $BlurBehindComboRead = "Not Set" Then
        GUICtrlSetData($idInputBlurBehind, "")
        _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)
    Else
        GUICtrlSetData($idInputBlurBehind, GUICtrlRead($BlurBehindCombo))
    EndIf
    ;GUICtrlSetData($idInputBlurBehind, GUICtrlRead($BlurBehindCombo))
EndFunc

Func idComboRuleEnabled()
    GUICtrlSetData($idInputRuleEnabled, GUICtrlRead($RuleEnabledCombo))
EndFunc

Func hBtnAddRule()
    GUICtrlSetState($TargetInput, $GUI_ENABLE)
    GUICtrlSetState($idInputRuleType, $GUI_ENABLE)
    GUICtrlSetState($RuleTypeCombo, $GUI_ENABLE)
    GUICtrlSetState($hBtnRuleType, $GUI_ENABLE)
    GUICtrlSetState($RuleEnabledCombo, $GUI_ENABLE)
    GUICtrlSetState($idInputRuleEnabled, $GUI_ENABLE)
    GUICtrlSetState($hBtnRuleEnabled, $GUI_ENABLE)
    GuiFlatButton_SetState($DeleteButton, $GUI_ENABLE)
    GUICtrlSetState($SaveButton, $GUI_ENABLE)
    ; reset combos
    _ResetCombos()
    ; clear everything
    _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)
    GUICtrlSetData($idInputBlurBehind, "")
    GUICtrlSetData($idInputExtendFrame, "")
	_GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)
    GUICtrlSetData($BlurTintColorInput, "")
    ;GUICtrlSetBkColor($BlurTintColorPickLabel, 0x000000)
    GuiFlatButton_SetBkColor($BlurTintColorPickLabel, $GUI_BackColor)
    GUICtrlSetData($BlurTintColorInputInact, "")
    ;GUICtrlSetBkColor($BlurTintColorPickLabelInact, 0x000000)
    GuiFlatButton_SetBkColor($BlurTintColorPickLabelInact, $GUI_BackColor)
    GUICtrlSetData($idInputCornerPreference, "")
    _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
    GUICtrlSetData($idInputTitleBarBackdrop, "")
    _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
    GUICtrlSetData($BorderColorInput, "")
    ;GUICtrlSetBkColor($colorlabelfill, 0x000000)
    GuiFlatButton_SetBkColor($colorlabelfill, $GUI_BackColor)
    GUICtrlSetData($TitlebarColorInput, "")
    ;GUICtrlSetBkColor($TitlebarColorLabel, 0x000000)
    GuiFlatButton_SetBkColor($TitlebarColorLabel, $GUI_BackColor)
    GUICtrlSetData($TitlebarTextColorInput, "")
    ;GUICtrlSetBkColor($TitlebarTextColorLabel, 0x000000)
    GuiFlatButton_SetBkColor($TitlebarTextColorLabel, $GUI_BackColor)
    GUICtrlSetData($idInputDarkTitle, "")
	_GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
    GUICtrlSetData($TargetInput, "")
    GUICtrlSetData($idInputRuleType, "")
    _GUICtrlComboBox_SetCurSel($RuleTypeCombo, -1)
    GUICtrlSetData($idInput, "")
    _GUICtrlComboBox_SetCurSel($RuleListCombo, -1)
    GUICtrlSetData($BlurColorIntensitySlider, 50)
    GUICtrlSetData($BlurColorIntensitySliderInact, 50)
    _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, -1)
    GUICtrlSetData($idInputRuleEnabled, "")
    ; set focus to Target input
    GUICtrlSetState($TargetInput, $GUI_FOCUS)
    $sTargetLast = ""
EndFunc

Func hBtnAddRule_nofocus()
    GUICtrlSetState($TargetInput, $GUI_ENABLE)
    GUICtrlSetState($idInputRuleType, $GUI_ENABLE)
    GUICtrlSetState($RuleTypeCombo, $GUI_ENABLE)
    GUICtrlSetState($hBtnRuleType, $GUI_ENABLE)
    GUICtrlSetState($RuleEnabledCombo, $GUI_ENABLE)
    GUICtrlSetState($idInputRuleEnabled, $GUI_ENABLE)
    GUICtrlSetState($hBtnRuleEnabled, $GUI_ENABLE)
    ;GuiFlatButton_SetState($DeleteButton, $GUI_ENABLE)
    GUICtrlSetState($SaveButton, $GUI_ENABLE)
    ; reset combos
    _ResetCombos()
    ; clear everything
    _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)
    GUICtrlSetData($idInputBlurBehind, "")
    GUICtrlSetData($idInputExtendFrame, "")
	_GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)
    GUICtrlSetData($BlurTintColorInput, "")
    ;GUICtrlSetBkColor($BlurTintColorPickLabel, 0x000000)
    GuiFlatButton_SetBkColor($BlurTintColorPickLabel, $GUI_BackColor)
    GUICtrlSetData($BlurTintColorInputInact, "")
    ;GUICtrlSetBkColor($BlurTintColorPickLabelInact, 0x000000)
    GuiFlatButton_SetBkColor($BlurTintColorPickLabelInact, $GUI_BackColor)
    GUICtrlSetData($idInputCornerPreference, "")
    _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
    GUICtrlSetData($idInputTitleBarBackdrop, "")
    _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
    GUICtrlSetData($BorderColorInput, "")
    ;GUICtrlSetBkColor($colorlabelfill, 0x000000)
    GuiFlatButton_SetBkColor($colorlabelfill, $GUI_BackColor)
    GUICtrlSetData($TitlebarColorInput, "")
    ;GUICtrlSetBkColor($TitlebarColorLabel, 0x000000)
    GuiFlatButton_SetBkColor($TitlebarColorLabel, $GUI_BackColor)
    GUICtrlSetData($TitlebarTextColorInput, "")
    ;GUICtrlSetBkColor($TitlebarTextColorLabel, 0x000000)
    GuiFlatButton_SetBkColor($TitlebarTextColorLabel, $GUI_BackColor)
    GUICtrlSetData($idInputDarkTitle, "")
	_GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
    GUICtrlSetData($TargetInput, "")
    GUICtrlSetData($idInputRuleType, "")
    _GUICtrlComboBox_SetCurSel($RuleTypeCombo, -1)
    GUICtrlSetData($idInput, "")
    _GUICtrlComboBox_SetCurSel($RuleListCombo, -1)
    GUICtrlSetData($BlurColorIntensitySlider, 50)
    GUICtrlSetData($BlurColorIntensitySliderInact, 50)
    _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, -1)
    GUICtrlSetData($idInputRuleEnabled, "")
    $sTargetLast = ""
EndFunc

Func hBtnAddRule_nofocusGlobal()
    ; clear everything
    _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)
    GUICtrlSetData($idInputBlurBehind, "")
    GUICtrlSetData($idInputExtendFrame, "")
	_GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)
    GUICtrlSetData($BlurTintColorInput, "")
    ;GUICtrlSetBkColor($BlurTintColorPickLabel, 0x000000)
    GuiFlatButton_SetBkColor($BlurTintColorPickLabel, $GUI_BackColor)
    GUICtrlSetData($BlurTintColorInputInact, "")
    ;GUICtrlSetBkColor($BlurTintColorPickLabelInact, 0x000000)
    GuiFlatButton_SetBkColor($BlurTintColorPickLabelInact, $GUI_BackColor)
    GUICtrlSetData($idInputCornerPreference, "")
    _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
    GUICtrlSetData($idInputTitleBarBackdrop, "")
    _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
    GUICtrlSetData($BorderColorInput, "")
    ;GUICtrlSetBkColor($colorlabelfill, 0x000000)
    GuiFlatButton_SetBkColor($colorlabelfill, $GUI_BackColor)
    GUICtrlSetData($TitlebarColorInput, "")
    ;GUICtrlSetBkColor($TitlebarColorLabel, 0x000000)
    GuiFlatButton_SetBkColor($TitlebarColorLabel, $GUI_BackColor)
    GUICtrlSetData($TitlebarTextColorInput, "")
    ;GUICtrlSetBkColor($TitlebarTextColorLabel, 0x000000)
    GuiFlatButton_SetBkColor($TitlebarTextColorLabel, $GUI_BackColor)
    GUICtrlSetData($idInputDarkTitle, "")
	_GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
    GUICtrlSetData($TargetInput, "")
    GUICtrlSetData($idInputRuleType, "")
    _GUICtrlComboBox_SetCurSel($RuleTypeCombo, -1)
    ;GUICtrlSetData($idInput, "")
    ;_GUICtrlComboBox_SetCurSel($RuleListCombo, -1)
    GUICtrlSetData($BlurColorIntensitySlider, 50)
    GUICtrlSetData($BlurColorIntensitySliderInact, 50)
    _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, -1)
    GUICtrlSetData($idInputRuleEnabled, "")
    $sTargetLast = ""
EndFunc

Func hBtnDeleteRule()
    Local $SectionName = GUICtrlRead($RuleListCombo)

    $sMsg = " This will delete the following rule: " & $SectionName & @CRLF
	$sMsg &= " " & @CRLF
	$sMsg &= " Do you want to continue? " & @CRLF
	$iRetValue = _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 4, $sProdName, $sMsg)

	If $iRetValue = 1 Then
        For $i = 0 To Ubound($aCustomRules)-1
            If $aCustomRules[$i][16] = $SectionName Then
                IniDelete($sIniPath, $aCustomRules[$i][15])
            EndIf
        Next
	ElseIf $iRetValue = 2 Then
		Return
	EndIf

    ;GUICtrlSetData($RuleListCombo, "")
    ;_GUICtrlComboBox_SetCurSel($RuleListCombo, -1)
    ;_GUICtrlComboBox_ResetContent($RuleListCombo)

    ; need to reload array and combo
    _ReloadRulesCombo()
    hBtnAddRule_nofocus()
    GUICtrlSetData($idInput, "Select a rule")
    ControlFocus($hGUI, "", $RuleListCombo)

    _GUICtrlComboBox_InsertString($RuleListCombo, "Global Rules", 0)
    $sTargetLast = ""

    ;GuiFlatButton_SetState($DeleteButton, $GUI_SHOW)
EndFunc

Func hBtnReloadRules()
    ; first check if engine is running, start it if not
    Local $sEngineRunning = _IsEngineRunning()
    If Not $sEngineRunning Then
        ; run engine if running from au3 sources only
        If Not @Compiled Then ShellExecute(@ScriptDir & "\" & $sEngName & ".au3")
        If @Compiled Then ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
    Else
        ; restart engine
        _RestartTask()
    EndIf

    ; clear GUI and reload rules list
    hBtnAddRule_nofocus()
    _ReloadRulesCombo()
    GUICtrlSetData($idInput, "Select a rule")
    ControlFocus($hGUI, "", $RuleListCombo)
    _GUICtrlComboBox_InsertString($RuleListCombo, "Global Rules", 0)
    $sTargetLast = ""
EndFunc

Func _IsEngineRunning()
    Local $iPID
    Local $bElevated = _ToBoolean(IniRead($sIniPath, "StartupInfoOnly", "Elevated", "False"))
    Local $sEngineRunning = False

    If @Compiled Then
        $aProcessRunning = ProcessList($sEngName & ".exe")
        If $aProcessRunning[0][0] <> 0 Then
            ; engine is running
            $sEngineRunning = True
            Return $sEngineRunning
        ElseIf $aProcessRunning[0][0] = 0 Then
            ; engine not running
            $sEngineRunning = False
            Return $sEngineRunning
        EndIf
    EndIf

    If Not @Compiled Then
        $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
        If $iPID <> "" Then
            ; engine is running
            $sEngineRunning = True
            Return $sEngineRunning
        ElseIf $iPID = "" Then
            ; engine not running
            $sEngineRunning = False
            Return $sEngineRunning
        EndIf
    EndIf
EndFunc

Func _WriteIniSection()
    ; read all input controls to store variables
    ; if = global rules, handle differently
    Local $SectionName = GUICtrlRead($RuleListCombo)
    If $SectionName = "Global Rules" Then
        Local $DarkTitleBar = GUICtrlRead($idInputDarkTitle)
        IniWrite($sIniPath, "GlobalRules", "GlobalDarkTitleBar", $DarkTitleBar)
        Local $BorderColor = GUICtrlRead($BorderColorInput)
        IniWrite($sIniPath, "GlobalRules", "GlobalBorderColor", $BorderColor)
        Local $TitleBarColor = GUICtrlRead($TitlebarColorInput)
        IniWrite($sIniPath, "GlobalRules", "GlobalTitleBarColor", $TitleBarColor)
        Local $TitleBarTextColor = GUICtrlRead($TitlebarTextColorInput)
        IniWrite($sIniPath, "GlobalRules", "GlobalTitleBarTextColor", $TitleBarTextColor)
        Local $TitleBarBackdrop = GUICtrlRead($idInputTitleBarBackdrop)
        If $TitleBarBackdrop = "Mica Alt" Then $TitleBarBackdrop = "4"
        If $TitleBarBackdrop = "Acrylic" Then $TitleBarBackdrop = "3"
        If $TitleBarBackdrop = "Mica" Then $TitleBarBackdrop = "2"
        If $TitleBarBackdrop = "None" Then $TitleBarBackdrop = "1"
        If $TitleBarBackdrop = "Auto" Then $TitleBarBackdrop = "0"
        IniWrite($sIniPath, "GlobalRules", "GlobalTitleBarBackdrop", $TitleBarBackdrop)
        Local $CornerPreference = GUICtrlRead($idInputCornerPreference)
        If $CornerPreference = "Round Small" Then $CornerPreference = "3"
        If $CornerPreference = "Round" Then $CornerPreference = "2"
        If $CornerPreference = "Square" Then $CornerPreference = "1"
        If $CornerPreference = "Default" Then $CornerPreference = "0"
        IniWrite($sIniPath, "GlobalRules", "GlobalCornerPreference", $CornerPreference)
        Local $ExtendFrameIntoClient = GUICtrlRead($idInputExtendFrame)
        IniWrite($sIniPath, "GlobalRules", "GlobalExtendFrameIntoClient", $ExtendFrameIntoClient)
        Local $EnableBlurBehind = GUICtrlRead($idInputBlurBehind)
        IniWrite($sIniPath, "GlobalRules", "GlobalEnableBlurBehind", $EnableBlurBehind)
        Local $BlurTintColor = GUICtrlRead($BlurTintColorInput)
        IniWrite($sIniPath, "GlobalRules", "GlobalBlurTintColor", $BlurTintColor)
        Local $BlurTintColorInact = GUICtrlRead($BlurTintColorInputInact)
        IniWrite($sIniPath, "GlobalRules", "GlobalBlurTintColorInactive", $BlurTintColorInact)
        Local $TintColorIntensity = GUICtrlRead($BlurColorIntensitySlider)
        If $TintColorIntensity = "0" Then $TintColorIntensity = ""
        IniWrite($sIniPath, "GlobalRules", "GlobalTintColorIntensity", $TintColorIntensity)
        Local $TintColorIntensityInact = GUICtrlRead($BlurColorIntensitySliderInact)
        If $TintColorIntensityInact = "0" Then $TintColorIntensityInact = ""
        IniWrite($sIniPath, "GlobalRules", "GlobalColorIntensityInactive", $TintColorIntensityInact)

        _GetIniDetails()
        _UpdateColorBoxes()

        _SaveReloadRules()

        Return
    EndIf

    Local $RuleType = GUICtrlRead($idInputRuleType)

    Local $Target = GUICtrlRead($TargetInput)

    If $Target = "" Then
        _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, " Target cannot be blank. " & @CRLF)
        Return
    EndIf
    Local $DarkTitleBar = GUICtrlRead($idInputDarkTitle)
    If $DarkTitleBar = "Global" Then $DarkTitleBar = ""
    Local $BorderColor = GUICtrlRead($BorderColorInput)
    Local $TitleBarColor = GUICtrlRead($TitlebarColorInput)
    Local $TitleBarTextColor = GUICtrlRead($TitlebarTextColorInput)
    Local $TitleBarBackdrop = GUICtrlRead($idInputTitleBarBackdrop)
    If $TitleBarBackdrop = "Mica Alt" Then $TitleBarBackdrop = "4"
    If $TitleBarBackdrop = "Acrylic" Then $TitleBarBackdrop = "3"
    If $TitleBarBackdrop = "Mica" Then $TitleBarBackdrop = "2"
    If $TitleBarBackdrop = "None" Then $TitleBarBackdrop = "1"
    If $TitleBarBackdrop = "Auto" Then $TitleBarBackdrop = "0"
    If $TitleBarBackdrop = "Global" Then $TitleBarBackdrop = ""
    Local $CornerPreference = GUICtrlRead($idInputCornerPreference)
    If $CornerPreference = "Round Small" Then $CornerPreference = "3"
    If $CornerPreference = "Round" Then $CornerPreference = "2"
    If $CornerPreference = "Square" Then $CornerPreference = "1"
    If $CornerPreference = "Default" Then $CornerPreference = "0"
    If $CornerPreference = "Global" Then $CornerPreference = ""
    Local $ExtendFrameIntoClient = GUICtrlRead($idInputExtendFrame)
    If $ExtendFrameIntoClient = "Global" Then $ExtendFrameIntoClient = ""
    Local $EnableBlurBehind = GUICtrlRead($idInputBlurBehind)
    If $EnableBlurBehind = "Global" Then $EnableBlurBehind = ""
    Local $BlurTintColor = GUICtrlRead($BlurTintColorInput)
    Local $TintColorIntensity = GUICtrlRead($BlurColorIntensitySlider)
    If $TintColorIntensity = "0" Then $TintColorIntensity = ""
    Local $BlurTintColorInact = GUICtrlRead($BlurTintColorInputInact)
    Local $TintColorIntensityInact = GUICtrlRead($BlurColorIntensitySliderInact)
    If $TintColorIntensityInact = "0" Then $TintColorIntensityInact = ""
    Local $RuleEnabled = GUICtrlRead($idInputRuleEnabled)

    Local $SectionName = GUICtrlRead($TargetInput)
    Local $DisplayName = GUICtrlRead($idInput)
    If $SectionName = "Select a rule" Then Return
    If $DisplayName = "" Or $DisplayName = "Select a rule" Then $DisplayName = $SectionName
    ; need to determine if ini section needs to be renamed
    If $SectionName <> $sTargetLast Then
        If $sTargetLast <> "" Then
            ; Rename the section labelled $sTargetLast to $SectionName
            IniRenameSection($sIniPath, $sTargetLast, $SectionName)
        EndIf
    EndIf

    $sTargetLast = $SectionName

    Local $aSection[17][2] = [[16, ""], ["RuleType", $RuleType], ["Target", $Target], ["DarkTitleBar", $DarkTitleBar], ["BorderColor", $BorderColor], ["TitleBarColor", $TitleBarColor], ["TitleBarTextColor", $TitleBarTextColor], ["TitleBarBackdrop", $TitleBarBackdrop], ["CornerPreference", $CornerPreference], ["ExtendFrameIntoClient", $ExtendFrameIntoClient], ["EnableBlurBehind", $EnableBlurBehind], ["BlurTintColor", $BlurTintColor], ["TintColorIntensity", $TintColorIntensity], ["BlurTintColorInactive", $BlurTintColorInact],["ColorIntensityInactive", $TintColorIntensityInact], ["Enabled", $RuleEnabled], ["DisplayName", $DisplayName]]

    $IniWriteStatus = IniWriteSection($sIniPath, $SectionName, $aSection)
    If $IniWriteStatus = 0 Then _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, " Failed to write changes to file. " & @CRLF)

    _SaveReloadRules()

    _ReloadRulesCombo()
    _UpdateColorBoxes()

    GuiFlatButton_SetState($DeleteButton, $GUI_ENABLE)

    GUICtrlSetData($idInput, $DisplayName)
    GUICtrlSetData($RuleListCombo, $DisplayName)

    _GUICtrlComboBox_InsertString($RuleListCombo, "Global Rules", 0)
EndFunc

Func _SaveReloadRules()
    ;_IsEngineProcRunning()
    _RestartTask()
EndFunc

Func _ReloadRulesCombo()
    _GUICtrlComboBox_ResetContent($RuleListCombo)

    ; need to reload array and combo
    Global $aCustomRules[0][17]
    _GetIniDetails()


    $aRegistry = ""
    ;$aRegistry &= "|" & "Global Rules"

    For $i = 0 To Ubound($aCustomRules)-1
            $aRegistry &= "|" & $aCustomRules[$i][16]
    Next
    GUICtrlSetData($RuleListCombo, $aRegistry)
EndFunc

Func _GetIniDetails()
    Local $count = 0
    Local $sIniPath = @ScriptDir & "\ImmersiveUX.ini"
    ; Create a constant variable in Local scope of the filepath that will be read/written to.
    ;Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

    ; Global rules
    $bGlobalDarkTitleBar = IniRead($sIniPath, "GlobalRules", "GlobalDarkTitleBar", "True")
    $dGlobalBorderColor = IniRead($sIniPath, "GlobalRules", "GlobalBorderColor", "")
    $dGlobalTitleBarColor = IniRead($sIniPath, "GlobalRules", "GlobalTitleBarColor", "")
    $dGlobalTitleBarTextColor = IniRead($sIniPath, "GlobalRules", "GlobalTitleBarTextColor", "")
    $iGlobalTitleBarBackdrop = IniRead($sIniPath, "GlobalRules", "GlobalTitleBarBackdrop", "0")
    $iGlobalCornerPreference = IniRead($sIniPath, "GlobalRules", "GlobalCornerPreference", "0")
    $iGlobalExtendFrameIntoClient = IniRead($sIniPath, "GlobalRules", "GlobalExtendFrameIntoClient", "False")
    $iGlobalEnableBlurBehind = IniRead($sIniPath, "GlobalRules", "GlobalEnableBlurBehind", "False")
    $dGlobalBlurTintColor = IniRead($sIniPath, "GlobalRules", "GlobalBlurTintColor", "")
    $iGlobalTintColorIntensity = IniRead($sIniPath, "GlobalRules", "GlobalTintColorIntensity", "")
    $dGlobalBlurTintColorInactive = IniRead($sIniPath, "GlobalRules", "GlobalBlurTintColorInactive", "missing")
    $iGlobalColorIntensityInactive = IniRead($sIniPath, "GlobalRules", "GlobalColorIntensityInactive", "missing")

    ; Custom GUI Colors
    $GUI_BackColor = IniRead($sIniPath, "Settings", "GUI_BackColor", "missing")
    If $GUI_BackColor = "missing" Then
        IniWrite($sIniPath, "Settings", "GUI_BackColor", "0x000000")
        $GUI_BackColor = "0x000000"
    EndIf
    If Not $GUI_BackColor Then $GUI_BackColor = "0x000000"

    $GUI_FontColor = IniRead($sIniPath, "Settings", "GUI_FontColor", "missing")
    If $GUI_FontColor = "missing" Then
        IniWrite($sIniPath, "Settings", "GUI_FontColor", "0xE0E0E0")
        $GUI_FontColor = "0xE0E0E0"
    EndIf
    If Not $GUI_FontColor Then $GUI_FontColor = "0xE0E0E0"

    $GUI_InputBackColor = IniRead($sIniPath, "Settings", "GUI_InputBackColor", "missing")
    If $GUI_InputBackColor = "missing" Then
        IniWrite($sIniPath, "Settings", "GUI_InputBackColor", "0x202020")
        $GUI_InputBackColor = "0x202020"
    EndIf
    If Not $GUI_InputBackColor Then $GUI_InputBackColor = "0x202020"

    $GUI_StatusBackColor = IniRead($sIniPath, "Settings", "GUI_StatusBackColor", "missing")
    If $GUI_StatusBackColor = "missing" Then
        IniWrite($sIniPath, "Settings", "GUI_StatusBackColor", "0x080808")
        $GUI_StatusBackColor = "0x080808"
    EndIf
    If Not $GUI_StatusBackColor Then $GUI_StatusBackColor = "0x080808"

    $GUI_StatusLineColor = IniRead($sIniPath, "Settings", "GUI_StatusLineColor", "missing")
    If $GUI_StatusLineColor = "missing" Then
        IniWrite($sIniPath, "Settings", "GUI_StatusLineColor", "0x242424")
        $GUI_StatusLineColor = "0x242424"
    EndIf
    If Not $GUI_StatusLineColor Then $GUI_StatusLineColor = "0x242424"

    $GUI_MenubarBackColor = IniRead($sIniPath, "Settings", "GUI_MenubarBackColor", "missing")
    If $GUI_MenubarBackColor = "missing" Then
        IniWrite($sIniPath, "Settings", "GUI_MenubarBackColor", "0x080808")
        $GUI_MenubarBackColor = "0x080808"
    EndIf
    If Not $GUI_MenubarBackColor Then $GUI_MenubarBackColor = "0x080808"

    $GUI_MenubarLineColor = IniRead($sIniPath, "Settings", "GUI_MenubarLineColor", "missing")
    If $GUI_MenubarLineColor = "missing" Then
        IniWrite($sIniPath, "Settings", "GUI_MenubarLineColor", "0x242424")
        $GUI_MenubarLineColor = "0x242424"
    EndIf
    If Not $GUI_MenubarLineColor Then $GUI_MenubarLineColor = "0x242424"

    $GUI_AdvancedLineColor = IniRead($sIniPath, "Settings", "GUI_AdvancedLineColor", "missing")
    If $GUI_AdvancedLineColor = "missing" Then
        IniWrite($sIniPath, "Settings", "GUI_AdvancedLineColor", "0x242424")
        $GUI_AdvancedLineColor = "0x242424"
    EndIf
    If Not $GUI_AdvancedLineColor Then $GUI_AdvancedLineColor = "0x242424"


    If $dGlobalBlurTintColorInactive = "missing" Then
        ; create backup of pre-1.5.0 config file
        Local $bCopyStatus = FileCopy($sIniPath, @ScriptDir & "\ImmersiveUX-pre-1.5-backup.ini")
        If $bCopyStatus = 0 Then FileCopy($sIniPath, @DesktopDir & "\ImmersiveUX-pre-1.5-backup.ini")
        ; add to config
        IniWrite($sIniPath, "GlobalRules", "GlobalBlurTintColorInactive", "")
        $dGlobalBlurTintColorInactive = ""
    EndIf
    If $iGlobalColorIntensityInactive = "missing" Then
        ; add to config
        IniWrite($sIniPath, "GlobalRules", "GlobalColorIntensityInactive", "")
        $iGlobalColorIntensityInactive = ""
    EndIf

    ; settings
    $iBorderColorOptions = IniRead($sIniPath, "Configuration", "BorderColorOptions", "0")

    ; temporary fix for mistakenly allowing Global on dropdown, remove later
    If $bGlobalDarkTitleBar = "Global" Then
        $bGlobalDarkTitleBar = "True"
        IniWrite($sIniPath, "GlobalRules", "GlobalDarkTitleBar", "True")
    EndIf
    ; temporary fix for mistakenly allowing Global on dropdown, remove later
    If $iGlobalTitleBarBackdrop = "Global" Then
        $iGlobalTitleBarBackdrop = "0"
        IniWrite($sIniPath, "GlobalRules", "GlobalTitleBarBackdrop", "0")
    EndIf
    ; temporary fix for mistakenly allowing Global on dropdown, remove later
    If $iGlobalCornerPreference = "Global" Then
        $iGlobalCornerPreference = "0"
        IniWrite($sIniPath, "GlobalRules", "GlobalCornerPreference", "0")
    EndIf
    ; temporary fix for mistakenly allowing Global on dropdown, remove later
    If $iGlobalExtendFrameIntoClient = "Global" Then
        $iGlobalExtendFrameIntoClient = "True"
        IniWrite($sIniPath, "GlobalRules", "GlobalExtendFrameIntoClient", "True")
    EndIf
    ; temporary fix for mistakenly allowing Global on dropdown, remove later
    If $iGlobalEnableBlurBehind = "Global" Then
        $iGlobalEnableBlurBehind = "True"
        IniWrite($sIniPath, "GlobalRules", "GlobalEnableBlurBehind", "True")
    EndIf

    ; Read the INI section labelled 'General'. This will return a 2 dimensional array.
    Local $aSectionNames = IniReadSectionNames($sIniPath)

    For $i = 1 To $aSectionNames[0]
    ;For $i = 1 To 2
        ;If StringInStr($aSectionNames[$i], "CustomRules") Then
        Local $a = $aSectionNames[$i]
        If $a <> "Configuration" And $a <> "ProcessExclusion" And $a <> "ClassExclusion" And $a <> "Settings" And $a <> "GlobalRules" And $a <> "StartupInfoOnly" And $a <> "VSCodeInstallPath" Then
            $count += 1
            ;ConsoleWrite($aSectionNames[$i] & @CRLF)
            Local $aArray = IniReadSection($sIniPath, $aSectionNames[$i])
            ;ConsoleWrite("test: " & $aArray[$i][$i] & @CRLF)
            ;For $z = 0 To UBound($aArray) -1
                ;ConsoleWrite("test: " & '[' & $z & ']' & $aArray[$z][0] & @CRLF)
                ;ConsoleWrite("test: " & $aArray[0][0] & @CRLF)
            ;Next
            If $aArray[0][0] = "14" Then
                _ArrayInsert($aArray, 13, "BlurTintColorInactive", 0)
                _ArrayInsert($aArray, 14, "ColorIntensityInactive", 0)
                IniWriteSection($sIniPath, $aSectionNames[$i], $aArray)
            EndIf

            _ArrayColDelete($aArray, 0)
            _ArrayDelete($aArray, 0)
            ; adds section name to last column of array
            _ArrayAdd($aArray, $aSectionNames[$i])
            _ArrayTranspose($aArray)
            _ArrayAdd($aCustomRules, $aArray)
            ;$aArray[$i][11] = $aSectionNames[$i]
            ;If $i = 1 Then _ArrayAdd($aCustomRules, $aArray)
            ;ConsoleWrite("$aSectionNames[$i] " & $aSectionNames[$i] & @CRLF)
            ;$aCustomRules[$i][11] = $aSectionNames[$i]
        EndIf
    Next

    ;ConsoleWrite("count: " & $count & @CRLF)
    ;_ArrayDisplay($aCustomRules, "test", "", 2, Default, "RuleType|Process/Class|DarkMode|BorderColor|TitleBarColor|TitleBarTextColor|CornerPreference|TitleBarBackdrop|ExtendFrameIntoClient|EnableBlurBehind|BlurTintColor|TintColorIntensity|Enabled|SectionName")

    ; $aCustomRules[$i][0] = "RuleType"
    ; $aCustomRules[$i][1] = "Target"
    ; $aCustomRules[$i][2] = "DarkTitleBar"
    ; $aCustomRules[$i][3] = "BorderColor"
    ; $aCustomRules[$i][4] = "TitleBarColor"
    ; $aCustomRules[$i][5] = "TitleBarTextColor"
    ; $aCustomRules[$i][6] = "TitleBarBackdrop"
    ; $aCustomRules[$i][7] = "CornerPreference"
    ; $aCustomRules[$i][8] = "ExtendFrameIntoClient"
    ; $aCustomRules[$i][9] = "EnableBlurBehind"
    ; $aCustomRules[$i][10] = "BlurTintColor"
    ; $aCustomRules[$i][11] = "TintColorIntensity"
    ; $aCustomRules[$i][12] = "BlurTintColorInactive"
    ; $aCustomRules[$i][13] = "TintColorIntensityInactive"

    ; $aCustomRules[$i][14] = rule enabled/disabled
    ; $aCustomRules[$i][15] = contains sectionname
    ; $aCustomRules[$i][16] = contains FriendlyName

    ; sort array
    ;_ArraySort($aCustomRules, 0, 0, 0, 1)
    _ArraySwap($aCustomRules, 15, 16, True)
    _ArraySort($aCustomRules, 0, 0, 0, 16)

EndFunc   ;==>_GetIniDetails

Func _ResetCombos()
    ; clear combos
    GUICtrlSetData($DarkTitleCombo, "")
    GUICtrlSetData($TitleBarBackdropCombo, "")
    GUICtrlSetData($CornerPreferenceCombo, "")
    GUICtrlSetData($ExtendFrameCombo, "")
    GUICtrlSetData($BlurBehindCombo, "")
    ; fill combos
    GUICtrlSetData($DarkTitleCombo, "True|False|Not Set")
    GUICtrlSetData($TitleBarBackdropCombo, "Auto|None|Mica|Acrylic|Mica Alt|Not Set")
    GUICtrlSetData($CornerPreferenceCombo, "Default|Square|Round|Round Small|Not Set")
    GUICtrlSetData($ExtendFrameCombo, "True|False|Not Set")
    GUICtrlSetData($BlurBehindCombo, "True|False|Not Set")
EndFunc

Func _ResetCombosGlobal()
    ; clear combos
    GUICtrlSetData($DarkTitleCombo, "")
    GUICtrlSetData($TitleBarBackdropCombo, "")
    GUICtrlSetData($CornerPreferenceCombo, "")
    GUICtrlSetData($ExtendFrameCombo, "")
    GUICtrlSetData($BlurBehindCombo, "")
    ; fill combos
    GUICtrlSetData($DarkTitleCombo, "True|False|Not Set")
    GUICtrlSetData($TitleBarBackdropCombo, "Auto|None|Mica|Acrylic|Mica Alt|Not Set")
    GUICtrlSetData($CornerPreferenceCombo, "Default|Square|Round|Round Small|Not Set")
    GUICtrlSetData($ExtendFrameCombo, "True|False|Not Set")
    GUICtrlSetData($BlurBehindCombo, "True|False|Not Set")
EndFunc

Func _RuleList()
	$IFEOname = GUICtrlRead($RuleListCombo)

    If $IFEOname = "Global Rules" Then
        hBtnAddRule_nofocusGlobal()
        ; need to disable some things
        GUICtrlSetState($TargetInput, $GUI_DISABLE)
        GUICtrlSetState($idInputRuleType, $GUI_DISABLE)
        GUICtrlSetState($RuleTypeCombo, $GUI_DISABLE)
        GUICtrlSetState($hBtnRuleType, $GUI_DISABLE)
        GUICtrlSetState($RuleEnabledCombo, $GUI_DISABLE)
        GUICtrlSetState($idInputRuleEnabled, $GUI_DISABLE)
        GUICtrlSetState($hBtnRuleEnabled, $GUI_DISABLE)
        GuiFlatButton_SetState($DeleteButton, $GUI_DISABLE)
        GUICtrlSetState($SaveButton, $GUI_ENABLE)
        _ResetCombosGlobal()
    Else
        GUICtrlSetState($TargetInput, $GUI_ENABLE)
        GUICtrlSetState($idInputRuleType, $GUI_ENABLE)
        GUICtrlSetState($RuleTypeCombo, $GUI_ENABLE)
        GUICtrlSetState($hBtnRuleType, $GUI_ENABLE)
        GUICtrlSetState($RuleEnabledCombo, $GUI_ENABLE)
        GUICtrlSetState($idInputRuleEnabled, $GUI_ENABLE)
        GUICtrlSetState($hBtnRuleEnabled, $GUI_ENABLE)
        GuiFlatButton_SetState($DeleteButton, $GUI_ENABLE)
        GUICtrlSetState($SaveButton, $GUI_ENABLE)
        _ResetCombos()
    EndIf

    If $IFEOname = "Global Rules" Then
        GUICtrlSetData($idInputDarkTitle, $bGlobalDarkTitleBar)
		If $bGlobalDarkTitleBar = "True" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 0)
		If $bGlobalDarkTitleBar = "False" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 1)
		If $bGlobalDarkTitleBar = "" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
        GUICtrlSetData($BorderColorInput, $dGlobalBorderColor)
        ;GUICtrlSetBkColor($colorlabelfill, $dGlobalBorderColor)
        ;GuiFlatButton_SetBkColor($colorlabelfill, $dGlobalBorderColor)
        If $dGlobalBorderColor <> "0xFFFFFFFE" Then GuiFlatButton_SetBkColor($colorlabelfill, $dGlobalBorderColor)
        If $dGlobalBorderColor = "0xFFFFFFFE" Then GuiFlatButton_SetBkColor($colorlabelfill, $GUI_BackColor)
        GUICtrlSetData($TitlebarColorInput, $dGlobalTitleBarColor)
        ;GUICtrlSetBkColor($TitlebarColorLabel, $dGlobalTitleBarColor)
        GuiFlatButton_SetBkColor($TitlebarColorLabel, $dGlobalTitleBarColor)
        GUICtrlSetData($TitlebarTextColorInput, $dGlobalTitleBarTextColor)
        ;GUICtrlSetBkColor($TitlebarTextColorLabel, $dGlobalTitleBarTextColor)
        GuiFlatButton_SetBkColor($TitlebarTextColorLabel, $dGlobalTitleBarTextColor)
        If $iGlobalTitleBarBackdrop = "" Then
            GUICtrlSetData($idInputTitleBarBackdrop, "")
            _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
        EndIf
        If $iGlobalTitleBarBackdrop = "4" Then
            GUICtrlSetData($idInputTitleBarBackdrop, "Mica Alt")
            _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 4)
        EndIf
        If $iGlobalTitleBarBackdrop = "3" Then
            GUICtrlSetData($idInputTitleBarBackdrop, "Acrylic")
            _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 3)
        EndIf
        If $iGlobalTitleBarBackdrop = "2" Then
            GUICtrlSetData($idInputTitleBarBackdrop, "Mica")
            _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 2)
        EndIf
        If $iGlobalTitleBarBackdrop = "1" Then
            GUICtrlSetData($idInputTitleBarBackdrop, "None")
            _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 1)
        EndIf
        If $iGlobalTitleBarBackdrop = "0" Then
            GUICtrlSetData($idInputTitleBarBackdrop, "Auto")
            _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 0)
        EndIf
        If $iGlobalCornerPreference = "" Then
            GUICtrlSetData($idInputCornerPreference, "")
            _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
        EndIf
        If $iGlobalCornerPreference = "3" Then
            GUICtrlSetData($idInputCornerPreference, "Round Small")
            _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 3)
        EndIf
        If $iGlobalCornerPreference = "2" Then
            GUICtrlSetData($idInputCornerPreference, "Round")
            _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 2)
        EndIf
        If $iGlobalCornerPreference = "1" Then
            GUICtrlSetData($idInputCornerPreference, "Square")
            _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 1)
        EndIf
        If $iGlobalCornerPreference = "0" Then
            GUICtrlSetData($idInputCornerPreference, "Default")
            _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 0)
        EndIf
        GUICtrlSetData($idInputExtendFrame, $iGlobalExtendFrameIntoClient)
		If $iGlobalExtendFrameIntoClient = "True" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, 0)
		If $iGlobalExtendFrameIntoClient = "False" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, 1)
		If $iGlobalExtendFrameIntoClient = "" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)

        GUICtrlSetData($idInputBlurBehind, $iGlobalEnableBlurBehind)
		If $iGlobalEnableBlurBehind = "True" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 0)
		If $iGlobalEnableBlurBehind = "False" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 1)
		If $iGlobalEnableBlurBehind = "" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)

        GUICtrlSetData($BlurTintColorInput, $dGlobalBlurTintColor)
        ;GUICtrlSetBkColor($BlurTintColorPickLabel, $dGlobalBlurTintColor)
        GuiFlatButton_SetBkColor($BlurTintColorPickLabel, $dGlobalBlurTintColor)

        GUICtrlSetData($BlurTintColorInputInact, $dGlobalBlurTintColorInactive)
        ;GUICtrlSetBkColor($BlurTintColorPickLabelInact, $dGlobalBlurTintColorInactive)
        GuiFlatButton_SetBkColor($BlurTintColorPickLabelInact, $dGlobalBlurTintColorInactive)

        GUICtrlSetData($BlurColorIntensitySlider, $iGlobalTintColorIntensity)
        GUICtrlSetData($BlurColorIntensitySliderInact, $iGlobalColorIntensityInactive)
        Return
    EndIf

	; determine if process rule or class rule matches for custom rules
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		;If StringInStr($sName, $aCustomRules[$i][1], 2) Or StringInStr($sClassName, $aCustomRules[$i][1], 2) Then
		If $IFEOname = $aCustomRules[$i][16] Then
			GUICtrlSetData($idInputRuleType, $aCustomRules[$i][0])
            If $aCustomRules[$i][0] = "Class" Then _GUICtrlComboBox_SetCurSel($RuleTypeCombo, 0)
			If $aCustomRules[$i][0] = "Process" Then _GUICtrlComboBox_SetCurSel($RuleTypeCombo, 1)
            If $aCustomRules[$i][0] = "" Then _GUICtrlComboBox_SetCurSel($RuleTypeCombo, -1)
			GUICtrlSetData($TargetInput, $aCustomRules[$i][1])
            $sTargetLast = $aCustomRules[$i][1]
            ;If $IFEOname = "Global Rules" Then GUICtrlSetData($TargetInput, "")
			GUICtrlSetData($idInputDarkTitle, $aCustomRules[$i][2])
			If $aCustomRules[$i][2] = "True" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 0)
			If $aCustomRules[$i][2] = "False" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 1)
            If $aCustomRules[$i][2] = "" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
			GUICtrlSetData($BorderColorInput, $aCustomRules[$i][3])
            ;GUICtrlSetBkColor($colorlabelfill, $aCustomRules[$i][3])
            If $aCustomRules[$i][3] <> "0xFFFFFFFE" Then GuiFlatButton_SetBkColor($colorlabelfill, $aCustomRules[$i][3])
            If $aCustomRules[$i][3] = "0xFFFFFFFE" Then GuiFlatButton_SetBkColor($colorlabelfill, $GUI_BackColor)
            ;GuiFlatButton_SetBkColor($colorlabelfill, $aCustomRules[$i][3])
            GUICtrlSetData($TitlebarColorInput, $aCustomRules[$i][4])
            ;GUICtrlSetBkColor($TitlebarColorLabel, $aCustomRules[$i][4])
            GuiFlatButton_SetBkColor($TitlebarColorLabel, $aCustomRules[$i][4])
            GUICtrlSetData($TitlebarTextColorInput, $aCustomRules[$i][5])
            ;GUICtrlSetBkColor($TitlebarTextColorLabel, $aCustomRules[$i][5])
            GuiFlatButton_SetBkColor($TitlebarTextColorLabel, $aCustomRules[$i][5])
            ;GUICtrlSetData($idInputTitleBarBackdrop, $aCustomRules[$i][6])
            If $aCustomRules[$i][6] = "" Then
                GUICtrlSetData($idInputTitleBarBackdrop, "")
                _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
            EndIf
            If $aCustomRules[$i][6] = "4" Then
                GUICtrlSetData($idInputTitleBarBackdrop, "Mica Alt")
                _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 4)
            EndIf
            If $aCustomRules[$i][6] = "3" Then
                GUICtrlSetData($idInputTitleBarBackdrop, "Acrylic")
                _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 3)
            EndIf
            If $aCustomRules[$i][6] = "2" Then
                GUICtrlSetData($idInputTitleBarBackdrop, "Mica")
                _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 2)
            EndIf
            If $aCustomRules[$i][6] = "1" Then
                GUICtrlSetData($idInputTitleBarBackdrop, "None")
                _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 1)
            EndIf
            If $aCustomRules[$i][6] = "0" Then
                GUICtrlSetData($idInputTitleBarBackdrop, "Auto")
                _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, 0)
            EndIf
            If $aCustomRules[$i][7] = "" Then
                GUICtrlSetData($idInputCornerPreference, "")
                _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
            EndIf
            If $aCustomRules[$i][7] = "3" Then
                GUICtrlSetData($idInputCornerPreference, "Round Small")
                _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 3)
            EndIf
            If $aCustomRules[$i][7] = "2" Then
                GUICtrlSetData($idInputCornerPreference, "Round")
                _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 2)
            EndIf
            If $aCustomRules[$i][7] = "1" Then
                GUICtrlSetData($idInputCornerPreference, "Square")
                _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 1)
            EndIf
            If $aCustomRules[$i][7] = "0" Then
                GUICtrlSetData($idInputCornerPreference, "Default")
                _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 0)
            EndIf

            GUICtrlSetData($idInputExtendFrame, $aCustomRules[$i][8])
			If $aCustomRules[$i][8] = "True" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, 0)
			If $aCustomRules[$i][8] = "False" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, 1)
            If $aCustomRules[$i][8] = "" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)

            GUICtrlSetData($idInputBlurBehind, $aCustomRules[$i][9])
			If $aCustomRules[$i][9] = "True" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 0)
			If $aCustomRules[$i][9] = "False" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 1)
            If $aCustomRules[$i][9] = "" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)

            GUICtrlSetData($BlurTintColorInput, $aCustomRules[$i][10])
            ;GUICtrlSetBkColor($BlurTintColorPickLabel, $aCustomRules[$i][10])
            GuiFlatButton_SetBkColor($BlurTintColorPickLabel, $aCustomRules[$i][10])

            GUICtrlSetData($BlurTintColorInputInact, $aCustomRules[$i][12])
            ;GUICtrlSetBkColor($BlurTintColorPickLabelInact, $aCustomRules[$i][12])
            GuiFlatButton_SetBkColor($BlurTintColorPickLabelInact, $aCustomRules[$i][12])

            GUICtrlSetData($BlurColorIntensitySlider, $aCustomRules[$i][11])
            GUICtrlSetData($BlurColorIntensitySliderInact, $aCustomRules[$i][13])

            GUICtrlSetData($idInputRuleEnabled, $aCustomRules[$i][14])
            If $aCustomRules[$i][14] = "True" Then _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, 0)
			If $aCustomRules[$i][14] = "False" Then _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, 1)
            If $aCustomRules[$i][14] = "" Then
            _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, 1)
            GUICtrlSetData($idInputRuleEnabled, "False")
            EndIf
		EndIf
    Next
EndFunc

Func _GetTaskIntegrityLevel()
    Local $sTaskname = "\" & $sProdName

    Local $oService = _TS_Open()
    If @error <> 0 Then Exit MsgBox($MB_ICONERROR, "Task Scheduler UDF", "Error connecting to the Task Scheduler Service. @error = " & @error & ", @extended = " & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

    $vTaskProperties = _TS_TaskPropertiesGet($oService, $sTaskname, 2, True)
    If Not @error Then
        ;_ArrayDisplay($vTaskProperties, "_TS_TaskPropertiesGet - format used by _TS_TaskProperiesSet")
        For $i = 0 To UBound($vTaskProperties) - 1
            ;ConsoleWrite("$vTaskProperties[$i] " & $vTaskProperties[$i] & @CRLF)
            If $vTaskProperties[$i] = "PRINCIPAL|RunLevel|1" Then
                $TaskIntegrity = "Yes"
                Return $TaskIntegrity
            ElseIf $vTaskProperties[$i] = "PRINCIPAL|RunLevel|0" Then
                $TaskIntegrity = "No"
                Return $TaskIntegrity
            EndIf
        Next
    Else
        MsgBox($MB_ICONERROR, "_TS_TaskPropertiesGet", "Returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
    EndIf

    _TS_Close($oService)
EndFunc

Func _IsTaskInstalled()
    ; *****************************************************************************
    ; Connect to the Task Scheduler Service
    ; *****************************************************************************
    Local $oService = _TS_Open()
    If @error <> 0 Then Exit MsgBox($MB_ICONERROR, "Task Scheduler UDF", "Error connecting to the Task Scheduler Service. @error = " & @error & ", @extended = " & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

    ; *****************************************************************************
    ; Check if a tasks exists
    ; *****************************************************************************
    Local $sTask = $sProdName
    Local $iFound = _TS_TaskExists($oService, $sTask)
    If Not @error Then
        If $iFound = 1 Then
            ;MsgBox($MB_ICONINFORMATION, "_TS_TaskExists", "Task '" & $sTask & "' found!")
            ;$g_iIsTaskSchedInstalled = True
            $TaskInstalled = "Yes"
            Return $TaskInstalled
        Else
            ;MsgBox($MB_ICONWARNING, "_TS_TaskExists", "Task '" & $sTask & "' not found!")
            ;$g_iIsTaskSchedInstalled = False
            $TaskInstalled = "No"
            Return $TaskInstalled
        EndIf
    Else
        MsgBox($MB_ICONERROR, "_TS_TaskExists", "Returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
    EndIf
    _TS_Close($oService)
EndFunc

Func _IsTaskRunning()
    ; *****************************************************************************
    ; Connect to the Task Scheduler Service
    ; *****************************************************************************
    Local $oService = _TS_Open()
    If @error <> 0 Then Exit MsgBox($MB_ICONERROR, "Task Scheduler UDF", "Error connecting to the Task Scheduler Service. @error = " & @error & ", @extended = " & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

    ; *****************************************************************************
    ; List all running tasks. Show hidden tasks.
    ; *****************************************************************************
    Local $aTasks = _TS_RunningTaskList($oService, 1)
    If Not @error Then
        ;_ArrayDisplay($aTasks, "_TS_RunningTaskList", "", 0, Default, "Current Action|EnginePID|IntanceGUID|Name|Path|State")
        For $i = 0 To UBound($aTasks) - 1
            ;ConsoleWrite("$vTaskProperties[$i] " & $vTaskProperties[$i] & @CRLF)
            If $aTasks[$i][3] = $sProdName Then
                $TaskRunning = "Yes"
                Return $TaskRunning
            EndIf
        Next
    Else
        MsgBox($MB_ICONERROR, "_TS_RunningTaskList", "Returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
    EndIf

    _TS_Close($oService)
EndFunc

Func _RestartTask()
    If @Compiled Then
        If WinExists("Immersive UX Engine") Then WinClose("Immersive UX Engine")
        If WinExists("Immersive UX LED") Then WinClose("Immersive UX LED")
        Sleep(200)
        ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
    ElseIf Not @Compiled Then
        If WinExists("Immersive UX Engine") Then WinClose("Immersive UX Engine")
        If WinExists("Immersive UX LED") Then WinClose("Immersive UX LED")
        Sleep(200)
        ShellExecute(@ScriptDir & "\" & $sEngName & ".au3")
    EndIf
EndFunc

Func _UninstallTask()
    _TaskSched_Uninstall()
EndFunc

Func _InstallTask()
    _TaskSched_Install()
EndFunc

Func _TaskSched_End()
	; *****************************************************************************
	; Connect to the Task Scheduler Service
	; *****************************************************************************
	Local $oService = _TS_Open()
	If @error <> 0 Then Exit MsgBox($MB_ICONERROR, "Task Scheduler UDF", "Error connecting to the Task Scheduler Service. @error = " & @error & ", @extended = " & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
	
	Local $sFolder = "\"    ; Folder where to create the task
	Local $sName = $sProdName  ; Name of the task to create

	; Stop the task immediately
	;Sleep(2000)
	_TS_TaskStop($oService, $sFolder & "\" & $sName)
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskStop", "_TS_TaskStop returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
	;MsgBox($MB_ICONINFORMATION, "_TS_TaskStop", "_TS_TaskStop stopped!")

	_TS_Close($oService)
EndFunc

Func _TaskSched_Run()
	; *****************************************************************************
	; Connect to the Task Scheduler Service
	; *****************************************************************************
	Local $oService = _TS_Open()
	If @error <> 0 Then Exit MsgBox($MB_ICONERROR, "Task Scheduler UDF", "Error connecting to the Task Scheduler Service. @error = " & @error & ", @extended = " & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
	
	Local $sFolder = "\"    ; Folder where to create the task
	Local $sName = $sProdName  ; Name of the task to create

	; Run the task immediately
	;MsgBox($MB_ICONINFORMATION, "_TS_TaskRun", "Task Start time has been set to 20 minutes but we want to start the task now - will stop it after 2 seconds again!")
	_TS_TaskRun($oService, $sFolder & "\" & $sName)
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskRun", "_TS_TaskRun returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

	_TS_Close($oService)
EndFunc

Func _TaskSched_Uninstall()
	; *****************************************************************************
	; Connect to the Task Scheduler Service
	; *****************************************************************************
	Local $oService = _TS_Open()
	If @error <> 0 Then Exit MsgBox($MB_ICONERROR, "Task Scheduler UDF", "Error connecting to the Task Scheduler Service. @error = " & @error & ", @extended = " & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

	; *****************************************************************************
	; Delete task "Test-Task" from folder "\Test"
	; *****************************************************************************
	Local $sTaskPath = "\" & $sProdName    ; Folder and name of the task to be deleted
	_TS_TaskDelete($oService, $sTaskPath)
	If Not @error Then
		;MsgBox($MB_ICONINFORMATION, "_TS_TaskDelete", "Task '" & $sTaskPath & "' successfully deleted!")
	Else
		MsgBox($MB_ICONERROR, "_TS_TaskDelete", "Returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
	EndIf
	_TS_Close($oService)
EndFunc

Func _TaskSched_Install()
	Local $sFolder = "\"    ; Folder where to create the task
	Local $sName = $sProdName  ; Name of the task to create
	; *****************************************************************************
	; Prepare start and end date of the trigger. Format must be YYYY-MM-DDTHH:MM:SS
	; *****************************************************************************
	Local $sStartDateTime = _DateAdd("n", 2, _NowCalc())
	$sStartDateTime = StringReplace($sStartDateTime, "/", "-")
	$sStartDateTime = StringReplace($sStartDateTime, " ", "T")
	Local $sEndDateTime = _DateAdd("M", 4, _NowCalc())
	$sEndDateTime = StringReplace($sEndDateTime, "/", "-")
	$sEndDateTime = StringReplace($sEndDateTime, " ", "T")

	; *****************************************************************************
	; Connect to the Task Scheduler Service
	; *****************************************************************************
	Local $oService = _TS_Open()
	If @error <> 0 Then Exit MsgBox($MB_ICONERROR, "Task Scheduler UDF", "Error connecting to the Task Scheduler Service. @error = " & @error & ", @extended = " & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

	; *****************************************************************************
	; Delete a task in the same folder with the same name
	; *****************************************************************************
	Local $sTaskPath = "\" & $sProdName    ; Folder and name of the task to be deleted
	_TS_TaskDelete($oService, $sTaskPath)
	;_TS_TaskDelete($oService, $sFolder & "\" & $sName)
	; If @error <> 0 And @error <> 2 Then Exit MsgBox($MB_ICONERROR, "_TS_TaskCreate", "_TS_TaskDelete returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

	; *****************************************************************************
	; Create a new task
	; *****************************************************************************
	; Create the Task Definition object
	Local $oTaskDefinition = _TS_TaskCreate($oService)
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskCreate", "_TS_TaskCreate returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

	; Set all task properties
	Local $aProperties[] = [ _
			"ACTIONS|Path|" & '"' & @ScriptDir & "\" & $sEngName & ".exe" & '"', _
			"SETTINGS|DisallowStartIfOnBatteries|False", _
			"SETTINGS|StopIfGoingOnBatteries|False", _
			"SETTINGS|Compatibility|4", _
			"SETTINGS|MultipleInstances|0", _
			"SETTINGS|ExecutionTimeLimit|PT0S", _
			"PRINCIPAL|RunLevel|" & (IsAdmin() ? $TASK_RUNLEVEL_HIGHEST : $TASK_RUNLEVEL_LUA), _
			"REGISTRATIONINFO|Author|" & @ComputerName & "\" & @UserName, _
			"REGISTRATIONINFO|Description|Apply border color, title bar color, corner preference, title bar backdrop material and more.", _
			"ACTIONS|Arguments|runtask", _
            "IDLESETTINGS|StopOnIdleEnd|False", _
			"TRIGGERS|Enabled|True", _
			"TRIGGERS|Type|" & $TASK_TRIGGER_LOGON, _
			"TRIGGERS|UserId|" & @UserName _
			]
	_TS_TaskPropertiesSet($oTaskDefinition, $aProperties)
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskCreate", "_TS_TaskPropertiesSet for the TaskDefinition returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

	; Create a Logon trigger
	Local $oTrigger = _TS_TriggerCreate($oTaskDefinition, $TASK_TRIGGER_LOGON, "Test-Trigger1")
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskCreate", "Creating the Trigger returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
	_TS_TaskPropertiesSet($oTrigger, $aProperties)
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskCreate", "_TS_TaskPropertiesSet for the Trigger returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

	; Create an Action
	Local $oAction = _TS_ActionCreate($oTaskDefinition, $TASK_ACTION_EXEC)
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskCreate", "Creating the Action returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
	_TS_TaskPropertiesSet($oAction, $aProperties)
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskCreate", "_TS_TaskPropertiesSet for the Action returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))

	; List properties of the Task Definition
	Local $aTaskProperties = _TS_TaskPropertiesGet($oService, $oTaskDefinition,1 , True)
	If Not @error Then
		;_ArrayDisplay($aTaskProperties, "Properties of the task to be created")
	Else
		MsgBox($MB_ICONERROR, "_TS_TaskPropertiesGet", "Returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
	EndIf

	; Register the task
	Local $oTask = _TS_TaskRegister($oService, $sFolder, $sName, $oTaskDefinition)
	If @error Then Exit MsgBox($MB_ICONERROR, "_TS_TaskCreate", "_TS_TaskRegister returned @error=" & @error & ", @extended=" & @extended & @CRLF & @CRLF & _TS_ErrorText(@error))
	;MsgBox($MB_ICONINFORMATION, "_TS_TaskCreate", "Task " & $sName & " has been created!")

	_TS_Close($oService)
EndFunc

Func _TaskStatusUpdate()
    $TaskIntegrity = "No"
    $TaskInstalled = _IsTaskInstalled()
    ;Global $TaskRunning = "No"
    $TaskRunning = _IsTaskRunning()
    If Not $TaskRunning Then $TaskRunning = "No"
    ; only try to get task integrity level if it exists
    If $TaskInstalled = "Yes" Then
        $TaskIntegrity = _GetTaskIntegrityLevel()
    EndIf
    If Not $TaskIntegrity Then $TaskIntegrity = "No"

    _IsEngineProcRunning()

    GUICtrlSetData($idPart2, "Task Installed: " & $TaskInstalled)
    ;GUICtrlSetData($idPart1, "Task Running: " & $TaskRunning)
    ;GUICtrlSetData($idPart4, "Task Elevated: " & $TaskIntegrity)
EndFunc

Func _TaskStatusUpdate_adlib()
    $TaskIntegrity = "No"
    $TaskInstalled = _IsTaskInstalled()
    ;Global $TaskRunning = "No"
    $TaskRunning = _IsTaskRunning()
    If Not $TaskRunning Then $TaskRunning = "No"
    ; only try to get task integrity level if it exists
    If $TaskInstalled = "Yes" Then
        $TaskIntegrity = _GetTaskIntegrityLevel()
    EndIf
    If Not $TaskIntegrity Then $TaskIntegrity = "No"

    _IsEngineProcRunning()

    GUICtrlSetData($idPart2, "Task Installed: " & $TaskInstalled)

    AdlibUnRegister("_TaskStatusUpdate_adlib")
EndFunc

Func _TaskStatusUpdate_adlib20()
    $TaskIntegrity = "No"
    $TaskInstalled = _IsTaskInstalled()
    ;Global $TaskRunning = "No"
    $TaskRunning = _IsTaskRunning()
    If Not $TaskRunning Then $TaskRunning = "No"
    ; only try to get task integrity level if it exists
    If $TaskInstalled = "Yes" Then
        $TaskIntegrity = _GetTaskIntegrityLevel()
    EndIf
    If Not $TaskIntegrity Then $TaskIntegrity = "No"

    _IsEngineProcRunning()
    _UpdateTaskMenu()

    GUICtrlSetData($idPart2, "Task Installed: " & $TaskInstalled)
EndFunc

Func _IsEngineProcRunning()
    Local $iPID
    Local $bElevated = _ToBoolean(IniRead($sIniPath, "StartupInfoOnly", "Elevated", "False"))
    Local $sEngineStatus, $sElevatedStatus

    If @Compiled Then
        $aProcessRunning = ProcessList($sEngName & ".exe")
        If $aProcessRunning[0][0] <> 0 Then
            ; engine is running
            If $bElevated Then
                ; engine is running as admin
                $sEngineStatus = "Engine Running: Yes"
                $sElevatedStatus = "Elevated: Yes"
                GUICtrlSetData($idPart1, $sEngineStatus)
                GUICtrlSetData($idPart3, $sElevatedStatus)
            ElseIf Not $bElevated Then
                ; engine is running
                $sEngineStatus = "Engine Running: Yes"
                $sElevatedStatus = "Elevated: No"
                GUICtrlSetData($idPart1, $sEngineStatus)
                GUICtrlSetData($idPart3, $sElevatedStatus)
            EndIf
        ElseIf $aProcessRunning[0][0] = 0 Then
            $sEngineStatus = "Engine Running: No"
            GUICtrlSetData($idPart1, $sEngineStatus)
        EndIf
    EndIf

    If Not @Compiled Then
        $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
        If $iPID <> "" Then
            ; engine is running
            If $bElevated Then
                ; engine is running as admin
                $sEngineStatus = "Engine Running: Yes"
                $sElevatedStatus = "Elevated: Yes"
                GUICtrlSetData($idPart1, $sEngineStatus)
                GUICtrlSetData($idPart3, $sElevatedStatus)
            ElseIf Not $bElevated Then
                ; engine is running
                $sEngineStatus = "Engine Running: Yes"
                $sElevatedStatus = "Elevated: No"
                GUICtrlSetData($idPart1, $sEngineStatus)
                GUICtrlSetData($idPart3, $sElevatedStatus)
            EndIf
        ElseIf $iPID = "" Then
            $sEngineStatus = "Engine Running: No"
            $sElevatedStatus = "Elevated: No"
            GUICtrlSetData($idPart1, $sEngineStatus)
            GUICtrlSetData($idPart3, $sElevatedStatus)
        EndIf
    EndIf
EndFunc

Func _ToBoolean($sString)
    Return (StringStripWS(StringUpper($sString), 8) = "TRUE" ? True : False)
EndFunc   ;==>_ToBoolean

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

; Original code - Prog@ndy
Func _MY_NCHITTEST($hWnd, $uMsg, $wParam, $lParam)
    Switch $hWnd
        Case $hGUI
            Local $aPos = WinGetPos($hWnd) ; Check if mouse is over top 50 pixels
            If Abs(BitAND(BitShift($lParam, 16), 0xFFFF) - $aPos[1]) > $iHitTestHeight Then Return $HTCAPTION
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc   ;==>_MY_NCHITTEST

Func _VSCode_mod()
    ; patch settings.json first
    Local $iJsonStableExists = FileExists(@AppDataDir & "\Code\User\settings.json")
    If $iJsonStableExists Then
        Local $sJsonStablePath = @AppDataDir & "\Code\User\settings.json"
        _VSCode_mod_json($sJsonStablePath)
    EndIf

	Local $aArray = IniReadSection($sIniPath, "VSCodeInstallPath")

	; Check if an error occurred.
	If Not @error Then
		; Enumerate through the array displaying the keys and their respective values.
		For $i = 1 To $aArray[0][0]
			;MsgBox($MB_SYSTEMMODAL, "", "Key: " & $aArray[$i][0] & @CRLF & "Value: " & $aArray[$i][1])
			If $aArray[$i][1] <> "" Then
                Local $sReplace = StringReplace($aArray[$i][1], "C:\Program Files", @ProgramFilesDir)
                Local $sReplace = StringReplace($aArray[$i][1], "C:\Users\username\AppData\Local", @LocalAppDataDir)
                $aArray[$i][1] = $sReplace
                ;$aArray[$i][1] = '"' & $sReplace & '"'
                Local $iFileExists = FileExists($aArray[$i][1])
				;ConsoleWrite($aArray[$i][1] & " " & $iFileExists & @CRLF)
                ; if VSC install dir exists, proceed with install/uninstall stuff
                If $iFileExists Then
					If StringInStr($aArray[$i][1], @ProgramFilesDir) And Not IsAdmin() Then
						Local $sMsg = "Error: Please restart Immersive UX as Admin to modify files in this location." & @CRLF
        				_ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
					Else
						_VSCode_mod_install($aArray[$i][1])
						_VSCode_mod_files($aArray[$i][1])
                        ; check if 'data' dir exists indicating portable mode
                        Local $iJsonPortableExists = FileExists($aArray[$i][1] & "\data\user-data\User\settings.json")
                        If $iJsonPortableExists Then
                            Local $sJsonPath = $aArray[$i][1] & "\data\user-data\User\settings.json"
                            _VSCode_mod_json($sJsonPath)
                        EndIf
					EndIf
				EndIf
			EndIf
		Next
	EndIf
EndFunc

Func _VSCode_mod_json($sJsonPath)
    ; parse JSON string
    Local $vJSON = _JSON_Parse(FileRead($sJsonPath))
    If @error Then
        $sMsg = "There was an error while parsing the JSON file in the following location:" & @CRLF & @CRLF
        $sMsg &= $sJsonPath & @CRLF & @CRLF
        $sMsg &= "Patching this installation will be skipped to prevent any possibility" & @CRLF
        $sMsg &= "of losing your original settings." & @CRLF & @CRLF
        $sMsg &= "Please validate your JSON file and try again." & @CRLF
        _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
        Return
    EndIf

    ; backup original settings.json file
    If Not FileExists($sJsonPath & ".backup") Then FileCopy($sJsonPath, $sJsonPath & ".backup")

    ; for inner nested elements you can use _JSON_addChangeDelete() instead (points must be escaped)
    _JSON_addChangeDelete($vJSON, "workbench\.colorCustomizations.editor\.background", "#00000060")
    _JSON_addChangeDelete($vJSON, "workbench\.colorCustomizations.terminal\.background", "#00000000")

    ; add (or change if they already exists) the desired values
    $vJSON["terminal.integrated.gpuAcceleration"]   = "off"
    $vJSON["window.customTitleBarVisibility"]       = "auto"
    $vJSON["window.titleBarStyle"]                  = "custom"
    $vJSON["window.controlsStyle"]                  = "custom"

    Local $hFileOpen = FileOpen($sJsonPath, $FO_OVERWRITE)
    FileWrite($hFileOpen, _JSON_Generate($vJSON) & @CRLF)
    FileClose($hFileOpen)
EndFunc

Func _VSCode_mod_files($sVSCodePath)
    Local $sMinimumForV2 = '1.104.0.0'
    Local $sVSbin
	Local $sVSCodeModDir = $sVSCodePath & "\resources\app\out\vscode-immersiveux-mod"
	Local $iFileExists = FileExists($sVSCodeModDir)
	If Not $iFileExists Then DirCreate($sVSCodeModDir)
	Local $sVSCodeModDir2 = $sVSCodePath & "\resources\app\out\vscode-immersiveux-mod\methods"
	Local $iFileExists = FileExists($sVSCodeModDir2)
	If Not $iFileExists Then DirCreate($sVSCodeModDir2)
    Local $iFileExists1 = FileExists($sVSCodePath & "\Code.exe")
    Local $iFileExists2 = FileExists($sVSCodePath & "\Code - Insiders.exe")
    Local $iFileExists3 = FileExists($sVSCodePath & "\VSCodium.exe")

    If $iFileExists1 Then $sVSbin = $sVSCodePath & "\Code.exe"
    If $iFileExists2 Then $sVSbin = $sVSCodePath & "\Code - Insiders.exe"
    If $iFileExists3 Then $sVSbin = $sVSCodePath & "\VSCodium.exe"

    $sVSCodeVer = FileGetVersion($sVSbin)
    $compareVSCode = _StringCompareVersions($sVSCodeVer, $sMinimumForV2)

    If $compareVSCode = 1 Or $compareVSCode = 0 Then
        ; install v2 if Electron is version 37.2.6 or higher (Electron fixed a bug related to titlebar randomly showing)
        FileInstall(".\vscode-immersiveux-mod\index-v2.cjs", $sVSCodeModDir & "\index.cjs", $FC_OVERWRITE)
    Else
        FileInstall(".\vscode-immersiveux-mod\index.cjs", $sVSCodeModDir & "\index.cjs", $FC_OVERWRITE)
    EndIf
	FileInstall(".\vscode-immersiveux-mod\methods\index.cjs", $sVSCodeModDir2 & "\index.cjs", $FC_OVERWRITE)
	FileInstall(".\vscode-immersiveux-mod\methods\interval.cjs", $sVSCodeModDir2 & "\interval.cjs", $FC_OVERWRITE)
	FileInstall(".\vscode-immersiveux-mod\methods\overwrite.cjs", $sVSCodeModDir2 & "\overwrite.cjs", $FC_OVERWRITE)
EndFunc

Func _VSCode_mod_install($sVSCodePath)
    ; workbench
    Local $sWorkbenchFind = @TAB & "trusted-types"
    Local $sWorkbenchReplace = @TAB & "trusted-types VscodeVibrancy"
    Local $sWorkbenchPath = $sVSCodePath & "\resources\app\out\vs\code\electron-browser\workbench\workbench.html"
    Local $sWorkbenchRead = FileRead($sWorkbenchPath)
    If Not StringInStr($sWorkbenchRead, "VscodeVibrancy") Then
        ; backup original file
        If Not FileExists($sWorkbenchPath & ".backup") Then FileCopy($sWorkbenchPath, $sWorkbenchPath & ".backup")
        _ReplaceStringInFile($sWorkbenchPath, $sWorkbenchFind, $sWorkbenchReplace)
    EndIf

    ; main.js
    Local Const $sMainjsPath = $sVSCodePath & "\resources\app\out\main.js"
    Local $sIndexPath = $sVSCodePath & "\resources\app\out\vscode-immersiveux-mod\index.cjs"
	Local $sIndexPath2 = StringReplace($sIndexPath, "\", "/")

    Local $sMainJSFind = "experimentalDarkMode"
    Local $sMainJSReplace = "frame:false,transparent:true,experimentalDarkMode"

    Local $sMainJSRead = FileRead($sMainjsPath)
    If Not StringInStr($sMainJSRead, "transparent:true") And Not StringInStr($sMainJSRead, "VSCODE-VIBRANCY-START") Then
        ; backup original file
        If Not FileExists($sMainjsPath & ".backup") Then FileCopy($sMainjsPath, $sMainjsPath & ".backup")
        _ReplaceStringInFile($sMainjsPath, $sMainJSFind, $sMainJSReplace)

        ; Open the file for writing (append to the end of a file) and store the handle to a variable.
        Local $hFileOpen = FileOpen($sMainjsPath, $FO_APPEND)
        If $hFileOpen = -1 Then
            MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")
            Return False
        EndIf

        ; Write data to the file using the handle returned by FileOpen.
        FileWrite($hFileOpen, '' & @CRLF)
        FileWrite($hFileOpen, '/* !! VSCODE-VIBRANCY-START !! */' & @CRLF)
        FileWrite($hFileOpen, '' & @CRLF)
        FileWrite($hFileOpen, ';(function(){' & @CRLF)
        FileWrite($hFileOpen, 'global.vscode_vibrancy_plugin = {"os":"win10","config":{"type":"auto","opacity":0,"theme":"Default Dark","enableAutoTheme":false,"preferedDarkTheme":"Default Dark","preferedLightTheme":"Default Light","imports":["/path/to/file"],"refreshInterval":"5","preventFlash":false,"forceFramelessWindow":false,"disableFramelessWindow":false,"disableThemeFixes":false},"theme":{"type":{"win10":"acrylic","macos":"under-window"},"background":"1e1e1e","opacity":{"win10":0.8,"macos":0.3},"colorTheme":"Default Dark+","systemColorTheme":"dark"},"themeCSS":".scroll-decoration {\r\n  box-shadow: none !important;\r\n}\r\n\r\n.minimap, .editor-scrollable>.decorationsOverviewRuler {\r\n  opacity: 0.6;\r\n}\r\n\r\n.editor-container {\r\n  background: transparent !important;\r\n}\r\n\r\n.search-view .search-widget .input-box, .search-view .search-widget .input-box .monaco-inputbox,\r\n.monaco-workbench .part.editor>.content>.one-editor-silo>.container>.title .tabs-container>.tab,\r\n.monaco-editor-background,\r\n.monaco-editor .margin,\r\n.monaco-workbench .part>.content,\r\n.monaco-workbench .editor>.content>.one-editor-silo.editor-one,\r\n.monaco-workbench .part.editor>.content>.one-editor-silo>.container>.title,\r\n.monaco-workbench .part>.title,\r\n.monaco-workbench,\r\n.monaco-workbench .part,\r\nbody {\r\n  background: transparent !important;\r\n}\r\n\r\n.editor-group-container>.tabs {\r\n  background-color: transparent !important;\r\n}\r\n\r\n.editor-group-container>.tabs .tab {\r\n  background-color: transparent !important;\r\n}\r\n\r\n.editor-group-container>.tabs .tab.active, .editor-group-container>.tabs .monaco-breadcrumbs {\r\n  background-color: rgba(37, 37, 37,0.3) !important;\r\n}\r\n\r\n.monaco-list.settings-toc-tree .monaco-list-row.focused {\r\n  outline-color: rgb(37, 37, 37,0.6) !important;\r\n}\r\n\r\n.monaco-list.settings-toc-tree .monaco-list-row.selected,\r\n.monaco-list.settings-toc-tree .monaco-list-row.focused,\r\n.monaco-list .monaco-list-row.selected,\r\n.monaco-list.settings-toc-tree:not(.drop-target) .monaco-list-row:hover:not(.selected):not(.focused) {\r\n  background-color: rgb(37, 37, 37,0.6) !important;\r\n}\r\n\r\n.monaco-list.settings-editor-tree .monaco-list-row {\r\n  background-color: transparent !important;\r\n  outline-color: transparent !important;\r\n}\r\n\r\n.monaco-inputbox {\r\n  background-color: rgba(41, 41, 41,0.2) !important;\r\n}\r\n\r\n.monaco-editor .selected-text {\r\n  background-color: rgba(58, 61, 65,0.6) !important;\r\n}\r\n\r\n.monaco-editor .focused .selected-text {\r\n  background-color: rgba(38, 79, 120,0.6) !important;\r\n}\r\n\r\n.monaco-editor .view-overlays .current-line {\r\n  border-color: rgba(41, 41, 41,0.2) !important;\r\n}\r\n\r\n.extension-editor,\r\n.monaco-workbench .part.editor>.content>.one-editor-silo>.container>.title .tabs-container>.tab.active,\r\n.preferences-editor>.preferences-header,\r\n.preferences-editor>.preferences-editors-container.side-by-side-preferences-editor .preferences-header-container,\r\n.monaco-editor, .monaco-editor .inputarea.ime-input,\r\n.monaco-list .monaco-list-rows {\r\n  background: transparent !important;\r\n}\r\n\r\n\r\n.monaco-workbench .part.sidebar {\r\n  background-color: rgba(37, 37, 38, 0.3) !important;\r\n}\r\n\r\n\r\n.editor-group-container>.tabs .tab {\r\n  border: none !important;\r\n}\r\n\r\n.terminal-outer-container,\r\n.xterm-viewport,\r\n.xterm-rows {\r\n  background-color: transparent !important;\r\n}\r\n\r\n.monaco-workbench.fullscreen {\r\n\tbackground-color: #202020 !important;\r\n}\r\n\r\n.notebookOverlay.notebook-editor,\r\n.cell-statusbar-container,\r\n.margin-view-overlays,\r\n.monaco-list-row:hover:not(.selected):not(.focused) {\r\n  background-color: transparent !important;\r\n}","imports":{"css":"","js":""}}; try{ import("file:///')
            FileWrite($hFileOpen, $sIndexPath2)
            FileWrite($hFileOpen, '"); } catch (err) {console.error(err)}' & @CRLF)
            FileWrite($hFileOpen, '})()' & @CRLF)
            FileWrite($hFileOpen, '/* !! VSCODE-VIBRANCY-END !! */')
            ;FileWrite($hFileOpen, '' & @CRLF)

        ; Close the handle returned by FileOpen.
        FileClose($hFileOpen)
    EndIf
EndFunc

Func _VSCode_mod_uninstall()
    ; unpatch settings.json first
    Local $iJsonStableExists = FileExists(@AppDataDir & "\Code\User\settings.json")
    If $iJsonStableExists Then
        Local $sJsonStablePath = @AppDataDir & "\Code\User\settings.json"
        _VSCode_mod_json_restore($sJsonStablePath)
    EndIf

	Local $aArray = IniReadSection($sIniPath, "VSCodeInstallPath")

	; Check if an error occurred.
	If Not @error Then
		; Enumerate through the array displaying the keys and their respective values.
		For $i = 1 To $aArray[0][0]
			;MsgBox($MB_SYSTEMMODAL, "", "Key: " & $aArray[$i][0] & @CRLF & "Value: " & $aArray[$i][1])
			If $aArray[$i][1] <> "" Then
                Local $sReplace = StringReplace($aArray[$i][1], "C:\Program Files", @ProgramFilesDir)
                Local $sReplace = StringReplace($aArray[$i][1], "C:\Users\username\AppData\Local", @LocalAppDataDir)
                $aArray[$i][1] = $sReplace
                ;$aArray[$i][1] = '"' & $sReplace & '"'
                Local $iFileExists = FileExists($aArray[$i][1])
				;ConsoleWrite($aArray[$i][1] & " " & $iFileExists & @CRLF)
                ; if VSC install dir exists, proceed with install/uninstall stuff
                If $iFileExists Then
					If StringInStr($aArray[$i][1], @ProgramFilesDir) And Not IsAdmin() Then
						Local $sMsg = "Error: Please restart Immersive UX as Admin to modify files in this location." & @CRLF
        				_ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
					Else
						_VSCode_mod_patch_remove($aArray[$i][1])
						_VSCode_mod_files_remove($aArray[$i][1])
                        ; check if 'data' dir exists indicating portable mode
                        Local $iJsonPortableExists = FileExists($aArray[$i][1] & "\data\user-data\User\settings.json")
                        If $iJsonPortableExists Then
                            Local $sJsonPath = $aArray[$i][1] & "\data\user-data\User\settings.json"
                            _VSCode_mod_json_restore($sJsonPath)
                        EndIf
					EndIf
				EndIf
			EndIf
		Next
	EndIf
EndFunc

Func _VSCode_mod_patch_remove($sVSCodePath)
	; workbench
    Local $sWorkbenchPath = $sVSCodePath & "\resources\app\out\vs\code\electron-browser\workbench\workbench.html"
    Local $sMainjsPath = $sVSCodePath & "\resources\app\out\main.js"
	Local $sWorkbenchBackup = $sWorkbenchPath & ".backup"
	Local $sMainjsBackup = $sMainjsPath & ".backup"

	; check if $sWorkbenchBackup and $sMainjsBackup exist on disk first before filecopy
	Local $iWorkbenchBackupExists = FileExists($sWorkbenchBackup)
	Local $iMainjsBackupExists = FileExists($sMainjsBackup)

	If $iWorkbenchBackupExists Then FileCopy($sWorkbenchBackup, $sWorkbenchPath, $FC_OVERWRITE)
	If $iMainjsBackupExists Then FileCopy($sMainjsBackup, $sMainjsPath, $FC_OVERWRITE)

	FileDelete($sWorkbenchBackup)
	FileDelete($sMainjsBackup)
EndFunc

Func _VSCode_mod_files_remove($sVSCodePath)
	Local $sVSCodeModDir = $sVSCodePath & "\resources\app\out\vscode-immersiveux-mod"
	Local $iFileExists = FileExists($sVSCodeModDir)
	If $iFileExists Then DirRemove($sVSCodeModDir, $DIR_REMOVE)
EndFunc

Func _VSCode_mod_json_restore($sJsonPath)
    ; restore backup settings.json
    FileCopy($sJsonPath & ".backup", $sJsonPath, $FC_OVERWRITE)
    FileDelete($sJsonPath & ".backup")
EndFunc

Func _Terminal_patch()
    Local $sTerminal = @LocalAppDataDir & "\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    Local $sTermPrev = @LocalAppDataDir & "\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"
    Local $sTermOther = @LocalAppDataDir & "\Microsoft\Windows Terminal\settings.json"

    Local $iTerminalExists = FileExists($sTerminal)
    If $iTerminalExists Then _Terminal_patch_Json($sTerminal)
    Local $iTermPrevExists = FileExists($sTermPrev)
    If $iTermPrevExists Then _Terminal_patch_Json($sTermPrev)
    Local $iTermOtherExists = FileExists($sTermOther)
    If $iTermOtherExists Then _Terminal_patch_Json($sTermOther)
EndFunc

Func _Terminal_patch_Json($sTerminalJson)
    Local $bThemeExists = False

    ; parse JSON string
    Local $vJSON = _JSON_Parse(FileRead($sTerminalJson))
    If @error Then
        $sMsg = "There was an error while parsing the JSON file in the following location:" & @CRLF & @CRLF
        $sMsg &= $sTerminalJson & @CRLF & @CRLF
        $sMsg &= "Patching this installation will be skipped to prevent any possibility" & @CRLF
        $sMsg &= "of losing your original settings." & @CRLF & @CRLF
        $sMsg &= "Please validate your JSON file and try again." & @CRLF
        _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
        Return
    EndIf

    ; backup original
    If Not FileExists($sTerminalJson & ".backup") Then FileCopy($sTerminalJson, $sTerminalJson & ".backup")

    ; determine the number of elements already in the array "themes"
    Local $iNewIdx = UBound($vJSON["themes"])

    For $i = 0 To $iNewIdx - 1
        $sThemeName = _JSON_Get($vJSON, "themes[" & $i & "].name")
        If $sThemeName = "ImmersiveUX" Then $bThemeExists = True
        ConsoleWrite("theme name: " & $sThemeName & @CRLF)
    Next

    ; add opacity setting as default for all profiles
    _JSON_addChangeDelete($vJSON, "profiles.defaults.opacity", 0)

    ; set ImmersiveUX theme as default
    _JSON_addChangeDelete($vJSON, "theme", "ImmersiveUX")

    ; add ImmersiveUX theme only if it does not already exist
    If Not $bThemeExists Then
        _JSON_addChangeDelete($vJSON, "themes[" & $iNewIdx & "]", _JSON_Parse('{"name":"ImmersiveUX","tab":{"background":"#00000040","unfocusedBackground":"#00000000"},"tabRow":{"background":"#00000000","unfocusedBackground":"#00000000"},"window":{"applicationTheme":"dark","useMica":true}}'))
    EndIf

    ; save to settings.json
    Local $hFileOpen = FileOpen($sTerminalJson, $FO_OVERWRITE)
    FileWrite($hFileOpen, _JSON_Generate($vJSON) & @CRLF)
    FileClose($hFileOpen)
EndFunc

Func _Terminal_patch_remove()
    Local $sTerminal = @LocalAppDataDir & "\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    Local $sTermPrev = @LocalAppDataDir & "\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"
    Local $sTermOther = @LocalAppDataDir & "\Microsoft\Windows Terminal\settings.json"

    Local $iTerminalExists = FileExists($sTerminal)
    If $iTerminalExists Then
        ; restore backup file
        If FileExists($sTerminal & ".backup") Then
            FileCopy($sTerminal & ".backup", $sTerminal, $FC_OVERWRITE)
            FileDelete($sTerminal & ".backup")
        EndIf
    EndIf
    Local $iTermPrevExists = FileExists($sTermPrev)
    If $iTermPrevExists Then
        ; restore backup file
        If FileExists($sTermPrev & ".backup") Then
            FileCopy($sTermPrev & ".backup", $sTermPrev, $FC_OVERWRITE)
            FileDelete($sTermPrev & ".backup")
        EndIf
    EndIf
    Local $iTermOtherExists = FileExists($sTermOther)
    If $iTermOtherExists Then
        ; restore backup file
        If FileExists($sTermOther & ".backup") Then
            FileCopy($sTermOther & ".backup", $sTermOther, $FC_OVERWRITE)
            FileDelete($sTermOther & ".backup")
        EndIf
    EndIf
EndFunc

;--------------------------------------------------------------------------------------------------------------------------------
; https://www.autoitscript.com/forum/topic/211475-darkmode-udf-for-autoits-win32guis/#comment-1530103
;--------------------------------------------------------------------------------------------------------------------------------
Func DarkMode($hGUI, $bDarkMode = True)                               ; DarkMode

    Local Enum $DWMWA_USE_IMMERSIVE_DARK_MODE = (@OSBuild <= 18985) ? 19 : 20
    ;ConsoleWrite("$DWMWA_USE_IMMERSIVE_DARK_MODE=" & $DWMWA_USE_IMMERSIVE_DARK_MODE & @CRLF)
    ;       DWMWA_USE_IMMERSIVE_DARK_MODE ; https://learn.microsoft.com/en-us/windows/win32/api/dwmapi/ne-dwmapi-dwmwindowattribute
    ;       Use with DwmSetWindowAttribute. Allows the window frame for this window to be drawn in dark mode colors when the dark mode system setting is enabled.
    ;       For compatibility reasons, all windows default to light mode regardless of the system setting.
    ;       The pvAttribute parameter points to a value of type BOOL. TRUE to honor dark mode for the window, FALSE to always use light mode.
    ;       This value is supported starting with Windows 11 Build 22000.

    Local $iRet = _WinAPI_DwmSetWindowAttribute_unr($hGUI, $DWMWA_USE_IMMERSIVE_DARK_MODE, $bDarkMode)
    If Not $iRet Then Return SetError(1, 0, -1)

    ;_SetCtrlColorMode($Button_OK, $bDarkMode)
    ;_SetCtrlColorMode($Button_copy, $bDarkMode)
	_SetCtrlColorMode($hGUI, $bDarkMode)
    ;_WinAPI_SetWindowTheme_unr(GUICtrlGetHandle($ChbxDrkMode), 0, 0) ; this control needs the theme

EndFunc   ;==>DarkMode
;--------------------------------------------------------------------------------------------------------------------------------
Func _SetCtrlColorMode($hWnd, $bDarkMode = True, $sName = Default)    ; 'Explorer', 'CFD', 'DarkMode_ItemsView', etc.
    If $sName = Default Then $sName = $bDarkMode ? 'DarkMode_Explorer' : 'Explorer'
    $bDarkMode = Not Not $bDarkMode ; https://www.vbforums.com/showthread.php?900444-Windows-10-Dark-Mode-amp-VB6-apps
    If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
    Local Enum $eDefault, $eAllowDark, $eForceDark, $eForceLight, $eMax ; enum PreferredAppMode
    DllCall('uxtheme.dll', 'bool', 133, 'hwnd', $hWnd, 'bool', $bDarkMode) ; fnAllowDarkModeForWindow = 133
    DllCall('uxtheme.dll', 'int', 135, 'int', ($bDarkMode ? $eForceDark : $eForceLight)) ; fnAllowDarkModeForApp = 135
    _WinAPI_SetWindowTheme_unr($hWnd, $sName) ; https://www.autoitscript.com/forum/index.php?showtopic=211475&view=findpost&p=1530103
    DllCall('uxtheme.dll', 'none', 104) ; fnRefreshImmersiveColorPolicyState = 104  ; not needed ?
    _SendMessage($hWnd, $WM_THEMECHANGED, 0, 0) ; not needed ?
EndFunc   ;==>_SetCtrlColorMode
;--------------------------------------------------------------------------------------------------------------------------------
Func _WinAPI_SetWindowTheme_unr($hWnd, $sName = Null, $sList = Null)  ; #include <WinAPITheme.au3> ; unthoughtful unrestricting mod.
    ;Causes a window to use a different set of visual style information than its class normally uses
    Local $sResult = DllCall('UxTheme.dll', 'long', 'SetWindowTheme', 'hwnd', $hWnd, 'wstr', $sName, 'wstr', $sList)
    If @error Then Return SetError(@error, @extended, 0)
    If $sResult[0] Then Return SetError(10, $sResult[0], 0)
    Return 1
EndFunc   ;==>_WinAPI_SetWindowTheme_unr
;--------------------------------------------------------------------------------------------------------------------------------
Func _WinAPI_DwmSetWindowAttribute_unr($hWnd, $iAttribute, $iData)    ; #include <WinAPIGdi.au3> ; unthoughtful unrestricting mod.
    ;Sets the value of the specified attributes for non-client rendering to apply to the window
    Local $aCall = DllCall('dwmapi.dll', 'long', 'DwmSetWindowAttribute', 'hwnd', $hWnd, 'dword', $iAttribute, _
            'dword*', $iData, 'dword', 4)
    If @error Then Return SetError(@error, @extended, 0)
    If $aCall[0] Then Return SetError(10, $aCall[0], 0)
    Return 1
EndFunc   ;==>_WinAPI_DwmSetWindowAttribute_unr
;--------------------------------------------------------------------------------------------------------------------------------

;===============================================================================
;
; FunctionName:  _StringCompareVersions()
; Description:    Compare 2 strings of the FileGetVersion format [a.b.c.d].
; Syntax:          _StringCompareVersions( $s_Version1, [$s_Version2] )
; Parameter(s):  $s_Version1          - The string being compared
;                  $s_Version2        - The string to compare against
;                                         [Optional] : Default = 0.0.0.0
; Requirement(s):   None
; Return Value(s):  0 - Strings are the same (if @error=0)
;                 -1 - First string is (<) older than second string
;                  1 - First string is (>) newer than second string
;                  0 and @error<>0 - String(s) are of incorrect format:
;                        @error 1 = 1st string; 2 = 2nd string; 3 = both strings.
; Author(s):        PeteW
; Note(s):        Comparison checks that both strings contain numeric (decimal) data.
;                  Supplied strings are contracted or expanded (with 0s)
;                    MostSignificant_Major.MostSignificant_minor.LeastSignificant_major.LeastSignificant_Minor
;
;===============================================================================

Func _StringCompareVersions($s_Version1, $s_Version2 = "0.0.0.0")
    
; Confirm strings are of correct basic format. Set @error to 1,2 or 3 if not.
    SetError((StringIsDigit(StringReplace($s_Version1, ".", ""))=0) + 2 * (StringIsDigit(StringReplace($s_Version2, ".", ""))=0))
    If @error>0 Then Return 0; Ought to Return something!

    Local $i_Index, $i_Result, $ai_Version1, $ai_Version2

; Split into arrays by the "." separator
    $ai_Version1 = StringSplit($s_Version1, ".")
    $ai_Version2 = StringSplit($s_Version2, ".")
    $i_Result = 0; Assume strings are equal
    
; Ensure strings are of the same (correct) format:
;  Short strings are padded with 0s. Extraneous components of long strings are ignored. Values are Int.
    If $ai_Version1[0] <> 4 Then ReDim $ai_Version1[5]
    For $i_Index = 1 To 4
        $ai_Version1[$i_Index] = Int($ai_Version1[$i_Index])
    Next

    If $ai_Version2[0] <> 4 Then ReDim $ai_Version2[5]
    For $i_Index = 1 To 4
        $ai_Version2[$i_Index] = Int($ai_Version2[$i_Index])
    Next

    For $i_Index = 1 To 4
        If $ai_Version1[$i_Index] < $ai_Version2[$i_Index] Then; Version1 older than Version2
            $i_Result = -1
        ElseIf $ai_Version1[$i_Index] > $ai_Version2[$i_Index] Then; Version1 newer than Version2
            $i_Result = 1
        EndIf
   ; Bail-out if they're not equal
        If $i_Result <> 0 Then ExitLoop
    Next

    Return $i_Result

EndFunc ;==>_StringCompareVersions

Func idGUI()
    ; get GUI window state and show GUI window when clicking on tray icon
    If Not BitAND(WinGetState($hGUI), $WIN_STATE_VISIBLE) Then _WinAPI_ShowWindow($hGUI, @SW_SHOW)
    _WinAPI_SetForegroundWindow($hGUI)
EndFunc

Func _About()
	;MsgBox(0, "Immersive UX", "Version: " & $iVersion & @CRLF & "Created by: " & "WildByDesign")
    Local $sMsg = "Version:         " & $iVersion & @CRLF & @CRLF & "Created by:   " & "WildByDesign" & @CRLF
    _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", " ", "Immersive UX", $sMsg, 1000)
EndFunc

Func _Exit()
    If WinExists("Immersive UX Engine") Then WinClose("Immersive UX Engine")
    If WinExists("Immersive UX LED") Then WinClose("Immersive UX LED")

    Exit
EndFunc

Func WM_NCPAINT($hWnd, $iMsg, $wParam, $lParam)
    If $hWnd <> $hGUI Then Return $GUI_RUNDEFMSG
    _WinAPI_DefWindowProc($hWnd, $iMsg, $wParam, $lParam)
    _drawUAHMenuNCBottomLine($hWnd)
    Return 0
EndFunc   ;==>WM_NCPAINT

Func _drawUAHMenuNCBottomLine($hWnd)
    ;$aMenuBarInfo = _GUICtrlMenu_GetMenuBarInfo($hWnd, 0, 1)
    ;_ArrayDisplay($aMenuBarInfo)
    $rcClient = _WinAPI_GetClientRect($hWnd)
    ;_WinAPI_DisplayStruct($rcClient, $tagRECT, "rcClinet before")

    Local $aCall = DllCall("user32.dll", "int", "MapWindowPoints", _
        "hwnd", $hWnd, _ ; hWndFrom
        "hwnd", 0, _     ; hWndTo
        "ptr", DllStructGetPtr($rcClient), _
        "uint", 2)       ;number of points - 2 for RECT structure

    If @error Then
        ;MsgBox($MB_ICONERROR, "Error", @error)
        Exit
    EndIf
    ;_WinAPI_DisplayStruct($rcClient, $tagRECT, "rcClinet after")

    $rcWindow = _WinAPI_GetWindowRect($hWnd)

    _WinAPI_OffsetRect($rcClient, -$rcWindow.left, -$rcWindow.top)

    $rcAnnoyingLine = DllStructCreate($tagRECT)
    $rcAnnoyingLine.left = $rcClient.left
    $rcAnnoyingLine.top = $rcClient.top
    $rcAnnoyingLine.right = $rcClient.right
    $rcAnnoyingLine.bottom = $rcClient.bottom
;~  _WinAPI_DisplayStruct($rcAnnoyingLine, $tagRECT)

    $rcAnnoyingLine.bottom = $rcAnnoyingLine.top
    $rcAnnoyingLine.top = $rcAnnoyingLine.top - 1
;~  _WinAPI_DisplayStruct($rcAnnoyingLine, $tagRECT,"annoying line")


;~  $rcAnnoyingLine.left = 0
;~  $rcAnnoyingLine.top = 0
;~  $rcAnnoyingLine.right = 100
;~  $rcAnnoyingLine.bottom = 200

    ;$hRgn=_WinAPI_CreateRectRgn(0,0,8000,8000)
    $hRgn=_WinAPI_CreateRectRgn(0,0,8000,8000)

;~  $hDC = _WinAPI_GetDC($hWnd)
    $hDC=_WinAPI_GetDCEx($hWnd,$hRgn, BitOR($DCX_WINDOW,$DCX_INTERSECTRGN))
    _WinAPI_FillRect($hDC, $rcAnnoyingLine, $hSolidBrush)
    _WinAPI_ReleaseDC($hWnd, $hDC)

    ;_WinAPI_DisplayStruct($rcAnnoyingLine, $tagRECT, "annoying line")
EndFunc   ;==>_drawUAHMenuNCBottomLine

; ioa747
Func WM_ACTIVATE_Handler($hWnd, $MsgID, $wParam, $lParam)
    If $hWnd <> $hGUI Then Return $GUI_RUNDEFMSG
    ;_WinAPI_DefWindowProc($hWnd, $MsgID, $wParam, $lParam)
    _drawUAHMenuNCBottomLine($hWnd)

    Return $GUI_RUNDEFMSG
EndFunc

Func _BorderOpt0()
    ; active window only
    $iBorderColorOptions = IniRead($sIniPath, "Configuration", "BorderColorOptions", "0")
    If $iBorderColorOptions = "0" Then
        Return
    ElseIf $iBorderColorOptions <> "0" Then
        ; set value
        IniWrite($sIniPath, "Configuration", "BorderColorOptions", "0")
        GUICtrlSetState($idBorderOpt0, $GUI_CHECKED)
        _RestartTask()
    EndIf
EndFunc

Func _BorderOpt1()
    ; active and inactive windows
    $iBorderColorOptions = IniRead($sIniPath, "Configuration", "BorderColorOptions", "0")
    If $iBorderColorOptions = "1" Then
        Return
    ElseIf $iBorderColorOptions <> "1" Then
        ; set value
        IniWrite($sIniPath, "Configuration", "BorderColorOptions", "1")
        GUICtrlSetState($idBorderOpt1, $GUI_CHECKED)
        _RestartTask()
    EndIf
EndFunc

Func _BorderOpt2()
    ; LED strobe border effects
    $iBorderColorOptions = IniRead($sIniPath, "Configuration", "BorderColorOptions", "0")
    If $iBorderColorOptions = "2" Then
        Return
    ElseIf $iBorderColorOptions <> "2" Then
        IniWrite($sIniPath, "Configuration", "BorderColorOptions", "2")
        GUICtrlSetState($idBorderOpt2, $GUI_CHECKED)
        _RestartTask()
    EndIf
EndFunc

Func _BorderOpt3()
    ; disable border color (system)
    $iBorderColorOptions = IniRead($sIniPath, "Configuration", "BorderColorOptions", "")
    If Not $iBorderColorOptions Then
        Return
    ElseIf $iBorderColorOptions <> "" Then
        IniWrite($sIniPath, "Configuration", "BorderColorOptions", "")
        GUICtrlSetState($idBorderOpt3, $GUI_CHECKED)
        _RestartTask()
    EndIf
EndFunc

Func _VSCodePatch()
    ; patch vscode
    $sMsg = "This will patch all VSCode and VSCodium installs on the system." & @CRLF & @CRLF
    $sMsg &= "You will likely have to do this after every VSCode and VSCodium update." & @CRLF & @CRLF
    $sMsg &= 'NOTE: VSCode and VSCodium will show a message stating that your "...installation appears to be corrupt".' & @CRLF
    $sMsg &= "This message is harmless. Click on the cogwheel and select Don't Show Again." & @CRLF
    $sMsg &= " " & @CRLF
    $sMsg &= "Do you want to continue?" & @CRLF
    $iRetValue = _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 4, $sProdName, $sMsg)

    If $iRetValue = 1 Then
        _VSCode_mod()
        $sMsg = "VSCode/VScodium patches have been applied." & @CRLF & @CRLF
        $sMsg &= "You will need to close and reopen any running instances of" & @CRLF
        $sMsg &= "VSCode/VSCodium to reflect the changes." & @CRLF
        _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
    ElseIf $iRetValue = 2 Then
        Return
    EndIf
EndFunc

Func _VSCodeUnpatch()
    ; unpatch vscode
    _VSCode_mod_uninstall()
    $sMsg = "VSCode/VScodium patches have been removed." & @CRLF & @CRLF
    $sMsg &= "You will need to close and reopen any running instances of" & @CRLF
    $sMsg &= "VSCode/VSCodium to reflect the changes." & @CRLF
    _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
EndFunc

Func _TerminalPatch()
    ; patch terminal
    $sMsg = "This will patch Windows Terminal to apply backdrop materials." & @CRLF & @CRLF
    $sMsg &= "This works by adding a Mica theme to the Terminal settings file." & @CRLF
    $sMsg &= " " & @CRLF
    $sMsg &= "Do you want to continue?" & @CRLF
    $iRetValue = _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 4, $sProdName, $sMsg)

    If $iRetValue = 1 Then
        _Terminal_patch()
        $sMsg = "The ImmersiveUX theme has been added to your Windows Terminal settings." & @CRLF & @CRLF
        $sMsg &= "Changes should be reflected immediately in any running instances" & @CRLF
        $sMsg &= "of Windows Terminal." & @CRLF
        _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
    ElseIf $iRetValue = 2 Then
        Return
    EndIf
EndFunc

Func _TerminalUnpatch()
    ; unpatch terminal
    _Terminal_patch_remove()
    $sMsg = "Your original Windows Terminal settings have been restored." & @CRLF & @CRLF
    $sMsg &= "Changes should be reflected immediately in any running instances" & @CRLF
    $sMsg &= "of Windows Terminal." & @CRLF
    _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
EndFunc

Func _TaskInstallAdmin()
    ; Install Task (Admin)
    If WinExists("Immersive UX Engine") Then WinClose("Immersive UX Engine")
    If WinExists("Immersive UX LED") Then WinClose("Immersive UX LED")
    Sleep(200)
    _InstallTask()
    Sleep(500)
    ; start task
    ShellExecute(@ScriptDir & "\" & $sEngName & ".exe", "starttask", @ScriptDir, $SHEX_OPEN, @SW_HIDE)
    Sleep(500)
    _TaskStatusUpdate()
    _IsEngineProcRunning()
    _UpdateTaskMenu()
EndFunc

Func _TaskInstall()
    ; Install Task
    If WinExists("Immersive UX Engine") Then WinClose("Immersive UX Engine")
    If WinExists("Immersive UX LED") Then WinClose("Immersive UX LED")
    Sleep(200)
    _InstallTask()
    Sleep(500)
    ; start task
    ShellExecute(@ScriptDir & "\" & $sEngName & ".exe", "starttask", @ScriptDir, $SHEX_OPEN, @SW_HIDE)
    Sleep(500)
    _TaskStatusUpdate()
    _IsEngineProcRunning()
    _UpdateTaskMenu()
EndFunc

Func _TaskUninstall()
    ; Uninstall Task
    If WinExists("Immersive UX Engine") Then WinClose("Immersive UX Engine")
    If WinExists("Immersive UX LED") Then WinClose("Immersive UX LED")
    Sleep(200)
    _UninstallTask()
    Sleep(500)
    _TaskStatusUpdate()
    _IsEngineProcRunning()
    _UpdateTaskMenu()
EndFunc

Func _TaskRestart()
    ; Restart Task
    _RestartTask()
    Sleep(500)
    _IsEngineProcRunning()
    _UpdateTaskMenu()
EndFunc

#cs
    $idTaskOpt0 = GUICtrlCreateMenuItem("Install Task (Admin)", $idTaskMenu)
    $idTaskOpt1 = GUICtrlCreateMenuItem("Install Task", $idTaskMenu)
    $idTaskOpt2 = GUICtrlCreateMenuItem("Uninstall Task", $idTaskMenu)
    $idTaskOpt3 = GUICtrlCreateMenuItem("Restart Task", $idTaskMenu)
#ce

Func _UpdateTaskMenu()
    If @Compiled Then
        If $TaskInstalled = "Yes" Then GUICtrlSetState($idTaskOpt0, $GUI_DISABLE)
        If $TaskInstalled = "Yes" Then GUICtrlSetState($idTaskOpt1, $GUI_DISABLE)
        If $TaskInstalled = "Yes" Then GUICtrlSetState($idTaskOpt2, $GUI_ENABLE)
        If $TaskInstalled = "Yes" Then GUICtrlSetState($idTaskOpt3, $GUI_ENABLE)
        If $TaskInstalled = "Yes" And IsAdmin() And $TaskIntegrity = "No" Then GUICtrlSetState($idTaskOpt0, $GUI_ENABLE)
        If $TaskInstalled <> "Yes" Then GUICtrlSetState($idTaskOpt2, $GUI_DISABLE)
        If $TaskInstalled <> "Yes" And Not IsAdmin() Then GUICtrlSetState($idTaskOpt0, $GUI_DISABLE)
        If $TaskInstalled <> "Yes" And IsAdmin() Then GUICtrlSetState($idTaskOpt0, $GUI_ENABLE)
        If $TaskInstalled <> "Yes" And Not IsAdmin() Then GUICtrlSetState($idTaskOpt1, $GUI_ENABLE)
        If $TaskInstalled <> "Yes" And IsAdmin() Then GUICtrlSetState($idTaskOpt1, $GUI_DISABLE)
        If $TaskInstalled <> "Yes" Then GUICtrlSetState($idTaskOpt3, $GUI_DISABLE)
    EndIf

    If Not @Compiled Then
        GUICtrlSetState($idTaskOpt0, $GUI_DISABLE)
        GUICtrlSetState($idTaskOpt1, $GUI_DISABLE)
        GUICtrlSetState($idTaskOpt2, $GUI_DISABLE)
        GUICtrlSetState($idTaskOpt3, $GUI_DISABLE)
    EndIf
EndFunc

Func _WinAPI_SetWindowText_mod($hWnd, $sText)
	Local $aCall = DllCall('user32.dll', "bool", "SetWindowTextW", "hwnd", $hWnd, "wstr", $sText)
	If @error Then Return SetError(@error, @extended, False)

	Return $aCall[0]
EndFunc   ;==>_WinAPI_SetWindowText_mod
