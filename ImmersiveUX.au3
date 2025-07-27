#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=app.ico
#AutoIt3Wrapper_Outfile_x64=ImmersiveUX.exe
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Immersive UX
#AutoIt3Wrapper_Res_Fileversion=1.1.2
#AutoIt3Wrapper_Res_ProductName=Immersive UX
#AutoIt3Wrapper_Res_ProductVersion=1.1.2
#AutoIt3Wrapper_Res_LegalCopyright=@ 2025 WildByDesign
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_HiDpi=n
#AutoIt3Wrapper_Res_Icon_Add=app.ico
#Au3Stripper_Parameters=/MO
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

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

#include "include\StringSize.au3"
#include "include\RoundGUI.au3"
#include "include\GuiFlatButton.au3"

#include "include\GUIComboBoxColor.au3"
#include "include\GUIComboBoxFont.au3"
#include "include\_WinAPI_DPI.au3"
#include "include\TaskScheduler.au3"
#include "include\ExtMsgBox.au3"

Global $aCustomRules[0][14]

Global $sIniPath = @ScriptDir & "\ImmersiveUX.ini"
Global $sProdName = "ImmersiveUX"
Global $sEngName = "ImmersiveEngine"

Global Const $sSegUIVar = @WindowsDir & "\fonts\SegUIVar.ttf"
Global $SegUIVarExists = FileExists($sSegUIVar)

Opt("GUIOnEventMode", 1)

Global $iDPI1, $iDPI2, $hGUI
Global $bGlobalDarkTitleBar, $dGlobalBorderColor, $dGlobalTitleBarColor, $dGlobalTitleBarTextColor, $iGlobalTitleBarBackdrop
Global $iGlobalCornerPreference, $iGlobalExtendFrameIntoClient, $iGlobalEnableBlurBehind, $dGlobalBlurTintColor, $iGlobalTintColorIntensity
Global $BorderColorInput, $colorlabelfill, $TitlebarColorInput, $TitlebarColorLabel
Global $TitlebarTextColorInput, $TitlebarTextColorLabel, $BlurTintColorInput, $BlurTintColorPickLabel
Global $idInput, $RuleListCombo, $idInputRuleType, $RuleTypeCombo, $idInputDarkTitle
Global $DarkTitleCombo, $idInputTitleBarBackdrop, $TitleBarBackdropCombo
Global $idInputCornerPreference, $CornerPreferenceCombo, $idInputExtendFrame, $ExtendFrameCombo
Global $idInputBlurBehind, $BlurBehindCombo, $idInputRuleEnabled, $RuleEnabledCombo
Global $idStatusInput, $idStatusCombo
Global $TargetInput, $hBtnRuleType, $hBtnRuleEnabled, $DeleteButton, $SaveButton
Global $BlurColorIntensitySlider, $idPart0, $idPart1, $idPart2
Global $TaskIntegrity, $TaskInstalled, $TaskRunning
Global $aProcessRunning, $IsRunFromTS, $bProcessRunning
Global $iW = 658, $iH = 440

_StartGUI()
Func _StartGUI()

    Local $iDPI = _WinAPI_SetDPIAwareness(), $iDPI_def = 96
    If $iDPI = 0 Then Exit MsgBox($MB_ICONERROR, "ERROR", "Unable to set DPI awareness!!!", 10)
    $iDPI1 = $iDPI / $iDPI_def
    $iDPI2 = $iDPI_def / $iDPI

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
            ; might need adlib here to update task running status
            AdlibRegister("_TaskStatusUpdate_adlib", 2000)
        EndIf
    EndIf

    $TaskRunning = _IsTaskRunning()
    If Not $TaskRunning Then $TaskRunning = "No"

    _GetIniDetails()

    $hGUI = GUICreate("Immersive UX", $iW * $iDPI1, $iH * $iDPI1)
    If IsAdmin() Then WinSetTitle($hGUI, "", "Immersive UX" & " [Administrator]")
    ;GUICtrlSetDefColor(0xFFFFFF)
    If $SegUIVarExists Then
        Global $MainFont = "Segoe UI Variable Display"
        Global $FontSize = 9
        GUISetFont($FontSize, $FW_NORMAL, -1, $MainFont)
            $aStringSize = _StringSize("This is just a TEST.", $FontSize, 400, 0, $MainFont)
            $FontHeight = $aStringSize[1] + 3
            ;ConsoleWrite("$FontHeight " & $FontHeight & @CRLF)
    Else
        Global $MainFont = "Segoe UI"
        Global $FontSize = (9 * $iDPI2) * $iDPI1
        GUISetFont($FontSize, $FW_NORMAL, -1, $MainFont)
            $aStringSize = _StringSize("This is just a TEST.", $FontSize, 400, 0, $MainFont)
            $FontHeight = $aStringSize[1] + 3
            ;ConsoleWrite("$FontHeight " & $FontHeight & @CRLF)
    EndIf
    GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
    GUISetBkColor(0x000000)

    _ExtMsgBoxSet(Default)
    _ExtMsgBoxSet(1, 4, 0x000000, 0xffffff -1, $MainFont, 800)

    Local $hToolTip2 = _GUIToolTip_Create(0)
    _GUIToolTip_SetMaxTipWidth($hToolTip2, 400)

    _WinAPI_SetWindowTheme($hToolTip2, "", "")
    _GUIToolTip_SetTipBkColor($hToolTip2, 0x202020)
    _GUIToolTip_SetTipTextColor($hToolTip2, 0xe0e0e0)


    $idStatusCombo = GUICtrlCreateCombo("", 508 * $iDPI1, ($iH * $iDPI1) - $FontHeight - 2, 185, 20, $CBS_DROPDOWNLIST)
    _FillCombo()
    ;GUICtrlSetData($idStatusCombo, "Install Task|Restart Task")
    _GUICtrlComboBoxEx_SetColor($idStatusCombo, 0x202020, 0xffffff)
    GUICtrlSetOnEvent(-1, "idStatusCombo")
    GUICtrlSetState(-1, $GUI_HIDE)
    ;Local $hidStatusCombo = GUICtrlGetHandle($idStatusCombo)
    ;GUICtrlSetData($idStatusCombo, "Uninstall")
    If @Compiled Then
        $idStatusInput = GUICtrlCreateInput("Startup Task  ▼", 508 * $iDPI1, ($iH * $iDPI1) - $FontHeight - 2, 340, 20, $ES_READONLY, 0)
        GUICtrlSetBkColor(-1, 0x000000)
        GUICtrlSetColor(-1, 0xffffff)
        $idPart0 = GUICtrlCreateLabel("Task Installed: " & $TaskInstalled, 20, ($iH * $iDPI1) - $FontHeight - 2, -1, -1)
        GUICtrlSetBkColor(-1, 0x000000)
        GUICtrlSetColor(-1, 0xffffff)
        $idPart1 = GUICtrlCreateLabel("Task Running: " & $TaskRunning, 180 * $iDPI1, ($iH * $iDPI1) - $FontHeight - 2, -1, -1)
        GUICtrlSetBkColor(-1, 0x000000)
        GUICtrlSetColor(-1, 0xffffff)
        $idPart2 = GUICtrlCreateLabel("Task Elevated: " & $TaskIntegrity, 344 * $iDPI1, ($iH * $iDPI1) - $FontHeight - 2, -1, -1)
        GUICtrlSetBkColor(-1, 0x000000)
        GUICtrlSetColor(-1, 0xffffff)
    EndIf


    $aStringSizeBig = _StringSize("CASCADIA_HOSTING_WINDOW_CLASS", $FontSize, 400, 0, $MainFont)
    ;100 * $iDPI1Big = $aStringSizeBig[2] + 50

    $RuleListLabel = GUICtrlCreateLabel("Rules List:", 20, 20, -1, -1)
    GUICtrlSetBkColor(-1, 0x000000)
    GUICtrlSetColor(-1, 0xffffff)

    $aPos = ControlGetPos($hGUI, "", $RuleListLabel)


    $RuleListLabelPosV = $aPos[1] + $aPos[3]


    $RuleListCombo = GUICtrlCreateCombo("|", 20, $RuleListLabelPosV, 260 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
    GUICtrlSetOnEvent(-1, "idComboRuleList")
    GUICtrlSetState(-1, $GUI_HIDE)

    _GUICtrlComboBoxEx_SetColor($RuleListCombo, 0x202020, 0xffffff)
    ;GUICtrlSetOnEvent(-1, "_RuleList")
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;$hRuleListCombo = GUICtrlGetHandle($RuleListCombo)

    ;Global $idInput = GUICtrlCreateInput("Select a rule", 20, 40, 100 * $iDPI1Big, $FontHeight, $ES_READONLY, 0)
    $idInput = _RGUI_RoundInput("Select a rule", 0xFFFFFF, 20, $RuleListLabelPosV, 260 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0x202020)

    $aRegistry = ""
    ;$aRegistry &= "|" & "Global Rules"

    For $i = 0 To Ubound($aCustomRules)-1
            $aRegistry &= "|" & $aCustomRules[$i][13]
    Next
    GUICtrlSetData($RuleListCombo, $aRegistry)

    _GUICtrlComboBox_InsertString($RuleListCombo, "Global Rules", 0)
    ;_GUICtrlComboBox_InsertString($RuleListCombo, "─────────────────────────────────────────────────────────────────", 1)

    ;_GUICtrlComboBox_SetCueBanner($RuleListCombo, "Custom Rules")

    $aPos = ControlGetPos($hGUI, "", $RuleListCombo)


    $RuleListComboPosV = $aPos[1] + $aPos[3]
    $RuleListComboPosH = $aPos[0] + $aPos[2]

    $aDropDownSize = _StringSize(ChrW(0xE70D), 10, 600, 0, "Segoe MDL2 Assets")
    $iDropDownSize = $aDropDownSize[1] + 4

    ;GuiFlatButton_SetDefaultColors(0x000000, 0xFFFFFF, 0x000000)
    ;set default colors of future buttons
    Local $aColorsEx = _
        [0x000000, 0xFFFFFF, 0x000000, _	; normal 	: Background, Text, Border
        0x000000, 0xFFFFFF, 0x000000, _	; focus 	: Background, Text, Border
        0x000000, 0xFFFFFF, 0x606060, _	; hover 	: Background, Text, Border
        0x000000, 0xFFFFFF, 0x202020]		; selected 	: Background, Text, Border
    GuiFlatButton_SetDefaultColorsEx($aColorsEx)

    $hBtn = GuiFlatButton_Create(ChrW(0xE70D), $RuleListComboPosH + 4, $RuleListLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    ;$hBtn = GUICtrlCreateLabel(ChrW(0xE70D), $RuleListComboPosH + 4, 42 + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetOnEvent(-1, "hBtn")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")
    GUICtrlSetColor(-1, 0xffffff)

    $aPos = ControlGetPos($hGUI, "", $hBtn)


    $hBtnPosV = $aPos[1] + $aPos[3]
    $hBtnPosH = $aPos[0] + $aPos[2]

    ;$AddRuleButton = GUICtrlCreateLabel(ChrW(0xE710), $hBtnPosH + 10, 42 + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $AddRuleButton = GuiFlatButton_Create(ChrW(0xE710), $hBtnPosH + 10, $RuleListLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetOnEvent(-1, "hBtnAddRule")
    GUICtrlSetFont(-1, 9, 200, -1, "Segoe MDL2 Assets")
    GUICtrlSetColor(-1, 0xffffff)

    _GUIToolTip_AddTool($hToolTip2, 0, " Add Rule ", GUICtrlGetHandle($AddRuleButton))

    $aPos = ControlGetPos($hGUI, "", $AddRuleButton)


    $AddRuleButtonPosV = $aPos[1] + $aPos[3]
    $AddRuleButtonPosH = $aPos[0] + $aPos[2]

    ;$AddRuleButton = GUICtrlCreateLabel(ChrW(0xE710), $hBtnPosH + 10, 42 + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $SaveButton = GuiFlatButton_Create(ChrW(0xE105), $AddRuleButtonPosH + 10, $RuleListLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetOnEvent(-1, "_WriteIniSection")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe Fluent Icons")
    GUICtrlSetColor(-1, 0xffffff)
    GUICtrlSetState($SaveButton, $GUI_DISABLE)

    _GUIToolTip_AddTool($hToolTip2, 0, " Save Changes ", GUICtrlGetHandle($SaveButton))

    $aPos = ControlGetPos($hGUI, "", $SaveButton)


    $SaveButtonPosV = $aPos[1] + $aPos[3]
    $SaveButtonPosH = $aPos[0] + $aPos[2]

    $DeleteButton = GuiFlatButton_Create(ChrW(0xE107), $SaveButtonPosH + 10, $RuleListLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetOnEvent(-1, "hBtnDeleteRule")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe Fluent Icons")
    GUICtrlSetColor(-1, 0xffffff)
    GUICtrlSetState($DeleteButton, $GUI_DISABLE)

    _GUIToolTip_AddTool($hToolTip2, 0, " Delete Rule ", GUICtrlGetHandle($DeleteButton))

    $TargetLabel = GUICtrlCreateLabel("Target:", 20, $RuleListComboPosV + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $TargetLabel)


    $TargetLabelPosV = $aPos[1] + $aPos[3]


    ;$TargetInput = GUICtrlCreateInput("", 20, $TargetLabelPosV, 100 * $iDPI1Big, $FontHeight, -1, 0)
    $TargetInput = _RGUI_RoundInput("", 0xFFFFFF, 20, $TargetLabelPosV, 260 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $TargetInput)


    $TargetInputPosV = $aPos[1] + $aPos[3]
    $TargetInputPosH = $aPos[0] + $aPos[2]

    ;#cs
    $RuleTypeLabel = GUICtrlCreateLabel("Rule Type:", $TargetInputPosH + 30, $RuleListComboPosV + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $RuleTypeLabel)


    $RuleTypeLabelPosV = $aPos[1] + $aPos[3]

    $aStringSize = _StringSize("0x0078D4", $FontSize, 400, 0, $MainFont)
    ;100 * $iDPI1 = $aStringSize[2] + 50

    $RuleTypeCombo = GUICtrlCreateCombo("", $TargetInputPosH + 30, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, $CBS_DROPDOWNLIST)
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, 0xffffff)
    GUICtrlSetData($RuleTypeCombo, "Class|Process")
    GUICtrlSetOnEvent(-1, "idComboRuleType")
    GUICtrlSetState(-1, $GUI_HIDE)

    ;$idInputRuleType = GUICtrlCreateInput("", $TargetInputPosH + 20, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputRuleType = _RGUI_RoundInput("", 0xFFFFFF, $TargetInputPosH + 30, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $RuleTypeCombo)


    $RuleTypeComboPosV = $aPos[1] + $aPos[3]
    $RuleTypeComboPosH = $aPos[0] + $aPos[2]
    ;#ce

    ;$hBtnRuleType = GUICtrlCreateLabel(ChrW(0xE70D), $RuleTypeComboPosH + 4, $RuleTypeLabelPosV + 4, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $hBtnRuleType = GuiFlatButton_Create(ChrW(0xE70D), $RuleTypeComboPosH + 4, $RuleTypeLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetColor(-1, 0xffffff)
    GUICtrlSetOnEvent(-1, "hBtnRuleType")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")

    $aPos = ControlGetPos($hGUI, "", $hBtnRuleType)


    $hBtnRuleTypePosV = $aPos[1] + $aPos[3]
    $hBtnRuleTypePosH = $aPos[0] + $aPos[2]

    ;
    $RuleEnabledLabel = GUICtrlCreateLabel("Enabled:", $hBtnRuleTypePosH + 20, $RuleListComboPosV + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $RuleEnabledLabel)


    $RuleEnabledLabelPosV = $aPos[1] + $aPos[3]

    $aStringSize = _StringSize("0x0078D4", $FontSize, 400, 0, $MainFont)
    ;100 * $iDPI1 = $aStringSize[2] + 50

    $RuleEnabledCombo = GUICtrlCreateCombo("", $hBtnRuleTypePosH + 20, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, $CBS_DROPDOWNLIST)
    _GUICtrlComboBoxEx_SetColor($RuleEnabledCombo, 0x202020, 0xffffff)
    GUICtrlSetData($RuleEnabledCombo, "True|False")
    GUICtrlSetOnEvent(-1, "idComboRuleEnabled")
    GUICtrlSetState(-1, $GUI_HIDE)

    ;$idInputRuleType = GUICtrlCreateInput("", $TargetInputPosH + 20, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputRuleEnabled = _RGUI_RoundInput("", 0xFFFFFF, $hBtnRuleTypePosH + 20, $RuleTypeLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $RuleEnabledCombo)


    $RuleEnabledComboPosV = $aPos[1] + $aPos[3]
    $RuleEnabledComboPosH = $aPos[0] + $aPos[2]
    ;#ce

    ;$hBtnRuleType = GUICtrlCreateLabel(ChrW(0xE70D), $RuleTypeComboPosH + 4, $RuleTypeLabelPosV + 4, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $hBtnRuleEnabled = GuiFlatButton_Create(ChrW(0xE70D), $RuleEnabledComboPosH + 4, $RuleTypeLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetColor(-1, 0xffffff)
    GUICtrlSetOnEvent(-1, "hBtnRuleEnabled")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")
    ;

    $DarkTitleLabel = GUICtrlCreateLabel("Dark Titlebar:", 20, $TargetInputPosV + 20 + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $DarkTitleLabel)


    $DarkTitleLabelPosV = $aPos[1] + $aPos[3]
    $DarkTitleLabelPosH = $aPos[0]

    $DarkTitleCombo = GUICtrlCreateCombo("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, 0xffffff)
    GUICtrlSetData($DarkTitleCombo, "True|False|Global")
    GUICtrlSetOnEvent(-1, "idComboDarkTitle")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $DarkTitleCombo)


    $DarkTitleComboPosV = $aPos[1] + $aPos[3]
    $DarkTitleComboPosH = $aPos[0] + $aPos[2]

    ;$hBtnDarkTitle = GUICtrlCreateLabel(ChrW(0xE70D), $DarkTitleComboPosH + 4, $DarkTitleLabelPosV + 4, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $hBtnDarkTitle = GuiFlatButton_Create(ChrW(0xE70D), $DarkTitleComboPosH + 4, $DarkTitleLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetOnEvent(-1, "hBtnDarkTitle")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")
    GUICtrlSetColor(-1, 0xffffff)

    ;$idInputDarkTitle = GUICtrlCreateInput("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputDarkTitle = _RGUI_RoundInput("", 0xFFFFFF, 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $idInputDarkTitle)


    $idInputDarkTitlePosV = $aPos[1] + $aPos[3]
    $idInputDarkTitlePosH = $aPos[0] + $aPos[2]


    $TitleBarBackdropLabel = GUICtrlCreateLabel("Backdrop Material:", 20, $idInputDarkTitlePosV + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $TitleBarBackdropLabel)


    $TitleBarBackdropLabelPosV = $aPos[1] + $aPos[3]

    $TitleBarBackdropCombo = GUICtrlCreateCombo("", 20, $TitleBarBackdropLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, 0xffffff)
    GUICtrlSetData($TitleBarBackdropCombo, "Auto|None|Mica|Acrylic|Mica Alt|Global")
    GUICtrlSetOnEvent(-1, "idComboTitleBarBackdrop")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $TitleBarBackdropCombo)


    $TitleBarBackdropComboPosV = $aPos[1] + $aPos[3]
    $TitleBarBackdropComboPosH = $aPos[0] + $aPos[2]

    ;$idInputTitleBarBackdrop = GUICtrlCreateInput("", 20, $TitleBarBackdropLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputTitleBarBackdrop = _RGUI_RoundInput("", 0xFFFFFF, 20, $TitleBarBackdropLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $idInputTitleBarBackdrop)


    $idInputTitleBarBackdropPosV = $aPos[1] + $aPos[3]
    $idInputTitleBarBackdropPosH = $aPos[0] + $aPos[2]
    $idInputTitleBarBackdropPosV2 = $aPos[1]

    ;$hBtnTitleBarBackdrop = GUICtrlCreateLabel(ChrW(0xE70D), $TitleBarBackdropComboPosH + 4, $idInputTitleBarBackdropPosV2 + 4, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $hBtnTitleBarBackdrop = GuiFlatButton_Create(ChrW(0xE70D), $TitleBarBackdropComboPosH + 4, $idInputTitleBarBackdropPosV2 + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetColor(-1, 0xffffff)
    GUICtrlSetOnEvent(-1, "hBtnTitleBarBackdrop")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")


    $CornerPreferenceLabel = GUICtrlCreateLabel("Corner Preference:", 20, $idInputTitleBarBackdropPosV + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $CornerPreferenceLabel)


    $CornerPreferenceLabelPosV = $aPos[1] + $aPos[3]

    $CornerPreferenceCombo = GUICtrlCreateCombo("", 20, $CornerPreferenceLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, 0xffffff)
    GUICtrlSetData($CornerPreferenceCombo, "Default|Square|Round|Round Small|Global")
    GUICtrlSetOnEvent(-1, "idComboCornerPreference")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $CornerPreferenceCombo)


    $CornerPreferenceComboPosV = $aPos[1] + $aPos[3]
    $CornerPreferenceComboPosH = $aPos[0] + $aPos[2]

    ;$hBtnCornerPreference = GUICtrlCreateLabel(ChrW(0xE70D), $CornerPreferenceComboPosH + 4, $CornerPreferenceLabelPosV + 4, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $hBtnCornerPreference = GuiFlatButton_Create(ChrW(0xE70D), $CornerPreferenceComboPosH + 4, $CornerPreferenceLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetColor(-1, 0xffffff)
    GUICtrlSetOnEvent(-1, "hBtnCornerPreference")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")

    ;$idInputCornerPreference = GUICtrlCreateInput("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputCornerPreference = _RGUI_RoundInput("", 0xFFFFFF, 20, $CornerPreferenceLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0x202020, 8, 1, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $idInputCornerPreference)


    $idInputCornerPreferencePosV = $aPos[1] + $aPos[3]
    $idInputCornerPreferencePosH = $aPos[0] + $aPos[2]


    $BorderColorLabel = GUICtrlCreateLabel("Border Color:", $idInputDarkTitlePosH + $FontHeight + 40, $TargetInputPosV + 20 + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $BorderColorLabel)


    $BorderColorLabelPosV = $aPos[1] + $aPos[3]
    $BorderColorLabelPosV2 = $aPos[1]

    ;$BorderColorInput = GUICtrlCreateInput("", 20, $BorderColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $BorderColorInput = _RGUI_RoundInput("", 0xFFFFFF, $idInputDarkTitlePosH + $FontHeight + 40, $BorderColorLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $BorderColorInput)


    $BorderColorInputPosV = $aPos[1] + $aPos[3]
    $BorderColorInputPosH = $aPos[0] + $aPos[2]
    $BorderColorInputPosV2 = $aPos[1]

    $colorlabelfill = GUICtrlCreateLabel(" ", $BorderColorInputPosH + 14, $BorderColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    GUICtrlSetOnEvent(-1, "ColorPicker")
    ;GUICtrlSetBkColor($colorlabelfill, 0xFF0000)

    _GUIToolTip_AddTool($hToolTip2, 0, " Change Color ", GUICtrlGetHandle($colorlabelfill))

    $aPos = ControlGetPos($hGUI, "", $colorlabelfill)


    $colorlabelfillPosV = $aPos[1] + $aPos[3]
    $colorlabelfillPosH = $aPos[0] + $aPos[2]

    $TitlebarColorLabel = GUICtrlCreateLabel("Titlebar Color:", $idInputDarkTitlePosH + $FontHeight + 40, $BorderColorInputPosV + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $TitlebarColorLabel)


    $TitlebarColorLabelPosV = $aPos[1] + $aPos[3]
    $TitlebarColorLabelPosV2 = $aPos[1]

    ;$TitlebarColorInput = GUICtrlCreateInput("", 20, $TitlebarColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $TitlebarColorInput = _RGUI_RoundInput("", 0xFFFFFF, $idInputDarkTitlePosH + $FontHeight + 40, $TitlebarColorLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $TitlebarColorInput)


    $TitlebarColorInputPosV = $aPos[1] + $aPos[3]
    $TitlebarColorInputPosH = $aPos[0] + $aPos[2]
    $TitlebarColorInputPosH2 = $aPos[2]
    $TitlebarColorInputPosV2 = $aPos[1]

    $TitlebarColorLabel = GUICtrlCreateLabel("   ", $TitlebarColorInputPosH + 14, $TitlebarColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    _GUIToolTip_AddTool($hToolTip2, 0, " Change Color ", GUICtrlGetHandle($TitlebarColorLabel))
    GUICtrlSetOnEvent(-1, "ColorPickerTitlebar")

    $TitlebarTextColorLabel = GUICtrlCreateLabel("Titlebar Text Color:", $idInputDarkTitlePosH + $FontHeight + 40, $TitlebarColorInputPosV + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $TitlebarTextColorLabel)


    $TitlebarTextColorLabelPosV = $aPos[1] + $aPos[3]

    ;$TitlebarTextColorInput = GUICtrlCreateInput("", 20, $TitlebarTextColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $TitlebarTextColorInput = _RGUI_RoundInput("", 0xFFFFFF, $idInputDarkTitlePosH + $FontHeight + 40, $TitlebarTextColorLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $TitlebarTextColorInput)


    $TitlebarTextColorInputPosV = $aPos[1] + $aPos[3]
    $TitlebarTextColorInputPosH = $aPos[0] + $aPos[2]
    $TitlebarTextColorInputPosV2 = $aPos[1]

    $TitlebarTextColorLabel = GUICtrlCreateLabel(" ", $TitlebarColorInputPosH + 14, $TitlebarTextColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    _GUIToolTip_AddTool($hToolTip2, 0, " Change Color ", GUICtrlGetHandle($TitlebarTextColorLabel))
    GUICtrlSetOnEvent(-1, "ColorPickerTitlebarText")


    $ExtendFrameLabel = GUICtrlCreateLabel("Extend Frame To Client:", $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $TitlebarColorLabelPosV2, -1, -1)
    $aPos = ControlGetPos($hGUI, "", $ExtendFrameLabel)
    GUICtrlSetColor(-1, 0xffffff)


    $ExtendFrameLabelPosV = $aPos[1] + $aPos[3]
    $ExtendFrameLabelPosH2 = $aPos[0]


    $aStringSize = _StringSize("Advanced", $FontSize, 400, 0, $MainFont)
    $AdvancedWidth = $aStringSize[2]

    GUISetFont(10, $FW_NORMAL, -1, "Segoe MDL2 Assets")
    If $iDPI1 = 1 Then
        $InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2 + 3, -1, -1, $SS_CENTER)
    ElseIf $iDPI1 = 1.25 Then
        $InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2 + 1, -1, -1, $SS_CENTER)
    ElseIf $iDPI1 = 1.5 Then
        $InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2, -1, -1, $SS_CENTER)
    Else
        $InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2, -1, -1, $SS_CENTER)
    EndIf

    ;$InfoButton = GUICtrlCreateLabel(ChrW(0xE946), $ExtendFrameLabelPosH2 + $AdvancedWidth, $BorderColorLabelPosV2 + 2, -1, -1, $SS_CENTER)
    ;GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")
    Local $ToolMsg
    $ToolMsg = " Special Considerations:" & @CRLF & @CRLF
    $ToolMsg &= " These options require an app to have a black background. This ensures " & @CRLF
    $ToolMsg &= " that the background has an alpha value of 0 for best results. " & @CRLF & @CRLF
    $ToolMsg &= " You can use the Rectify11 Black Mica theme to force a black background " & @CRLF
    $ToolMsg &= " on most Win32 apps. "
    _GUIToolTip_AddTool($hToolTip2, 0, $ToolMsg, GUICtrlGetHandle($InfoButton))
    GUICtrlSetColor(-1, 0xffffff)
    GUISetFont($FontSize, $FW_NORMAL, -1, $MainFont)


    $measureadvwidth = $DarkTitleLabelPosH + $colorlabelfillPosH


    $idGroup = _RGUI_RoundGroup("Advanced", 0xffffff, $ExtendFrameLabelPosH2 - 20, $BorderColorLabelPosV2 + 8, $measureadvwidth, (180 * $iDPI1) + 2, 0x404040, 0x000000, 8, 6)

    $idGroupPosV = $aPos[1] + $aPos[3]
    $idGroupPosH = $aPos[0] + $aPos[2]
    $idGroupPosH2 = $aPos[0]
    $idGroupPosEnd = $idGroupPosH2 + $idGroupPosH
    ;ConsoleWrite("$idGroupPosH " & $idGroupPosH & @CRLF)

    $ExtendFrameCombo = GUICtrlCreateCombo("", $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $ExtendFrameLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, 0xffffff)
    GUICtrlSetData($ExtendFrameCombo, "True|False|Global")
    GUICtrlSetOnEvent(-1, "idComboExtendFrame")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $ExtendFrameCombo)


    $ExtendFrameComboPosV = $aPos[1] + $aPos[3]
    $ExtendFrameComboPosH = $aPos[0] + $aPos[2]


    ;$idInputDarkTitle = GUICtrlCreateInput("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputExtendFrame = _RGUI_RoundInput("", 0xFFFFFF, $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $ExtendFrameLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $idInputExtendFrame)


    $idInputExtendFramePosV = $aPos[1] + $aPos[3]
    $idInputExtendFramePosH = $aPos[0] + $aPos[2]

    ;$hBtnExtendFrame = GUICtrlCreateLabel(ChrW(0xE70D), $ExtendFrameComboPosH + 4, $ExtendFrameLabelPosV + 4, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $hBtnExtendFrame = GuiFlatButton_Create(ChrW(0xE70D), $ExtendFrameComboPosH + 4, $ExtendFrameLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetColor(-1, 0xffffff)
    GUICtrlSetOnEvent(-1, "hBtnExtendFrame")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")


    $BlurBehindLabel = GUICtrlCreateLabel("Enable Blur Behind:", $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $idInputExtendFramePosV + 20, -1, -1)
    $aPos = ControlGetPos($hGUI, "", $BlurBehindLabel)
    GUICtrlSetColor(-1, 0xffffff)


    $BlurBehindLabelPosV = $aPos[1] + $aPos[3]

    $BlurBehindCombo = GUICtrlCreateCombo("", $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $BlurBehindLabelPosV, 100 * $iDPI1, $FontHeight, BitOR($CBS_DROPDOWNLIST, $WS_HSCROLL, $WS_VSCROLL))
    _GUICtrlComboBoxEx_SetColor(-1, 0x202020, 0xffffff)
    GUICtrlSetData($BlurBehindCombo, "True|False|Global")
    GUICtrlSetOnEvent(-1, "idComboBlurBehind")
    GUICtrlSetState(-1, $GUI_HIDE)

    $aPos = ControlGetPos($hGUI, "", $BlurBehindCombo)


    $BlurBehindComboPosV = $aPos[1] + $aPos[3]
    $BlurBehindComboPosH = $aPos[0] + $aPos[2]

    ;$hBtnBlurBehind = GUICtrlCreateLabel(ChrW(0xE70D), $BlurBehindComboPosH + 4, $BlurBehindLabelPosV + 4, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    $hBtnBlurBehind = GuiFlatButton_Create(ChrW(0xE70D), $BlurBehindComboPosH + 4, $BlurBehindLabelPosV + 2, $iDropDownSize, $iDropDownSize, $SS_CENTER)
    GUICtrlSetColor(-1, 0xffffff)
    GUICtrlSetOnEvent(-1, "hBtnBlurBehind")
    GUICtrlSetFont(-1, 10, 200, -1, "Segoe MDL2 Assets")

    ;$idInputDarkTitle = GUICtrlCreateInput("", 20, $DarkTitleLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $idInputBlurBehind = _RGUI_RoundInput("", 0xFFFFFF, $BorderColorInputPosH + $FontHeight + 40 + $FontHeight, $BlurBehindLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $idInputBlurBehind)


    $idInputBlurBehindPosV = $aPos[1] + $aPos[3]
    $idInputBlurBehindPosH = $aPos[0] + $aPos[2]


    $BlurTintColorLabel = GUICtrlCreateLabel("Blur Tint Color:", $idInputExtendFramePosH + $FontHeight + 40, $TitlebarColorLabelPosV2, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $BlurTintColorLabel)


    $BlurTintColorLabelPosV = $aPos[1] + $aPos[3]

    ;$TitlebarTextColorInput = GUICtrlCreateInput("", 20, $TitlebarTextColorLabelPosV, 100 * $iDPI1, $FontHeight, -1, 0)
    $BlurTintColorInput = _RGUI_RoundInput("", 0xFFFFFF, $idInputExtendFramePosH + $FontHeight + 40, $BlurTintColorLabelPosV, 100 * $iDPI1, $FontHeight, 0x202020, 0X202020, 8, 1)
    GUICtrlSetResizing(-1, $GUI_DOCKALL)
    GUICtrlSetBkColor(-1, 0x202020)

    $aPos = ControlGetPos($hGUI, "", $BlurTintColorInput)


    $BlurTintColorInputPosV = $aPos[1] + $aPos[3]
    $BlurTintColorInputPosH = $aPos[0] + $aPos[2]
    $BlurTintColorInputPosV2 = $aPos[1]

    $BlurTintColorPickLabel = GUICtrlCreateLabel(" ", $BlurTintColorInputPosH + 14, $BlurTintColorInputPosV2, $FontHeight, $FontHeight, $WS_BORDER)
    _GUIToolTip_AddTool($hToolTip2, 0, " Change Color ", GUICtrlGetHandle($BlurTintColorPickLabel))
    GUICtrlSetOnEvent(-1, "ColorPickerBlurTintColor")


    $BlurColorIntensityLabel = GUICtrlCreateLabel("Blur Color Intensity:", $idInputExtendFramePosH + $FontHeight + 40, $BlurTintColorInputPosV + 20, -1, -1)
    GUICtrlSetColor(-1, 0xffffff)
    $aPos = ControlGetPos($hGUI, "", $BlurColorIntensityLabel)


    $BlurColorIntensityLabelPosV = $aPos[1] + $aPos[3]

    $BlurColorIntensitySlider = GUICtrlCreateSlider($idInputExtendFramePosH + $FontHeight + 40 - 4, $BlurColorIntensityLabelPosV, 100 * $iDPI1 + 40, $FontHeight, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
    ;GUICtrlSetOnEvent(-1, "SliderFunction")
    $hWndTT = _GUICtrlSlider_GetToolTips($BlurColorIntensitySlider)
    _GUICtrlSlider_SetToolTips($BlurColorIntensitySlider, $hWndTT)
    GUICtrlSetBkColor($BlurColorIntensitySlider, 0x00000000)
    GUICtrlSetLimit(-1, 100, 0)
    GUICtrlSetData($BlurColorIntensitySlider, 50)

    ;_GUIToolTip_AddTool($hToolTip2, 0, GUICtrlRead($BlurColorIntensitySlider), GUICtrlGetHandle($BlurColorIntensitySlider))

    $aPos = ControlGetPos($hGUI, "", $BlurColorIntensitySlider)


    $BlurColorIntensitySliderPosV = $aPos[1] + $aPos[3]
    $BlurColorIntensitySliderPosH = $aPos[0] + $aPos[2]
    $BlurColorIntensitySliderV2 = $aPos[1]

    ;ConsoleWrite("$BlurColorIntensitySliderPosH " & $BlurColorIntensitySliderPosH & @CRLF)

    ;$idGroup = _RGUI_RoundGroup("Advanced", 0xffffff, $BorderColorInputPosH + $FontHeight + 40, $BorderColorInputPosV2, $TitlebarColorInputPosH2 + $TitlebarColorInputPosH2 + 40 + $FontHeight + $FontHeight + $FontHeight + $FontHeight + $FontHeight, 220, 0x404040, 0x000000, 8, 6)

    GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

    _WinAPI_DwmSetWindowAttribute__($hGUI, 20, 1)
    _WinAPI_DwmSetWindowAttribute__($hGUI, 38, 4)
    _WinAPI_DwmExtendFrameIntoClientArea($hGUI, _WinAPI_CreateMargins(-1, -1, -1, -1))

    GUICtrlSendMsg( $DarkTitleCombo, $WM_CHANGEUISTATE, 65537, 0 )
    ;GuiDarkmodeApply($hGUI)

    ;Local $idInput = _RGUI_RoundInput("", 0xFFFFFF, 20, 38, 100 * $iDPI1Big, $FontHeight, 0x202020, 0X202020, 10, 4, $ES_READONLY)

    ;_WinAPI_SetWindowTheme(GUICtrlGetHandle($DarkTitleCombo), "", "")

    GUIRegisterMsg($WM_COMMAND, "ED_WM_COMMAND")


    ControlFocus($hGUI, "", $RuleListCombo)
    ;_GUICtrlStatusBar_ShowHide($g_hStatus, @SW_HIDE)
    ;_WinAPI_SetParent(GUICtrlGetHandle($idStatusInput), $hGUI)


    ;GUICtrlSetResizing($idStatusCombo, $GUI_DOCKBOTTOM)
    ;GUICtrlSetResizing($idStatusInput, $GUI_DOCKBOTTOM)
    ;GUICtrlSetResizing($idPart0, $GUI_DOCKBOTTOM)
    ;GUICtrlSetResizing($idPart1, $GUI_DOCKBOTTOM)
    ;GUICtrlSetResizing($idPart2, $GUI_DOCKBOTTOM)

    If @Compiled Then
        GUISetIcon(@ScriptFullPath, 201)
    ElseIf Not @Compiled Then
        GUISetIcon(@ScriptDir & "\app.ico")
    EndIf

    GUISetState()


    ; Just idle around
    While 1
        Sleep(1000)
    WEnd

EndFunc

Func SpecialEvents()
    Select
        Case @GUI_CtrlId = $GUI_EVENT_CLOSE
            Exit
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
        GUICtrlSetBkColor($colorlabelfill, $color)
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
        GUICtrlSetBkColor($TitlebarColorLabel, $color)
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
        GUICtrlSetBkColor($TitlebarTextColorLabel, $color)
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
        GUICtrlSetBkColor($BlurTintColorPickLabel, $color)
    EndIf
EndFunc

Func _UpdateColorBoxes()
    Local $color1 = GUICtrlRead($BorderColorInput)
	GUICtrlSetBkColor($colorlabelfill, $color1)
	Local $color2 = GUICtrlRead($TitlebarColorInput)
	GUICtrlSetBkColor($TitlebarColorLabel, $color2)
	Local $color3 = GUICtrlRead($TitlebarTextColorInput)
	GUICtrlSetBkColor($TitlebarTextColorLabel, $color3)
    Local $color4 = GUICtrlRead($BlurTintColorInput)
	GUICtrlSetBkColor($BlurTintColorPickLabel, $color4)
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
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
            EndSwitch
        Case GUICtrlGetHandle($idInputRuleType)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($RuleTypeCombo, True)
                    ControlFocus($hGUI, "", $RuleTypeCombo)
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
            EndSwitch
        Case GUICtrlGetHandle($idInputDarkTitle)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($DarkTitleCombo, True)
                    ControlFocus($hGUI, "", $DarkTitleCombo)
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
            EndSwitch
        Case GUICtrlGetHandle($idInputTitleBarBackdrop)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($TitleBarBackdropCombo, True)
                    ControlFocus($hGUI, "", $TitleBarBackdropCombo)
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
            EndSwitch
        Case GUICtrlGetHandle($idInputCornerPreference)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($CornerPreferenceCombo, True)
                    ControlFocus($hGUI, "", $CornerPreferenceCombo)
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
            EndSwitch
        Case GUICtrlGetHandle($idInputExtendFrame)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($ExtendFrameCombo, True)
                    ControlFocus($hGUI, "", $ExtendFrameCombo)
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
            EndSwitch
         Case GUICtrlGetHandle($idInputBlurBehind)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($BlurBehindCombo, True)
                    ControlFocus($hGUI, "", $BlurBehindCombo)
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
            EndSwitch
        Case GUICtrlGetHandle($idInputRuleEnabled)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($RuleEnabledCombo, True)
                    ControlFocus($hGUI, "", $RuleEnabledCombo)
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
            EndSwitch
        Case GUICtrlGetHandle($idStatusInput)
            Switch $iCode
                Case $EN_SETFOCUS
                    _GUICtrlComboBox_ShowDropDown($idStatusCombo, True)
                    ControlFocus($hGUI, "", $idStatusCombo)
                Case $EN_KILLFOCUS
                    ;GUICtrlSetData($hLabel, "Edit does not have focus")
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
    ;_RuleList()
EndFunc

Func idComboDarkTitle()
    GUICtrlSetData($idInputDarkTitle, GUICtrlRead($DarkTitleCombo))
    ;_RuleList()
EndFunc

Func idComboTitleBarBackdrop()
    GUICtrlSetData($idInputTitleBarBackdrop, GUICtrlRead($TitleBarBackdropCombo))
    ;_RuleList()
EndFunc

Func idComboCornerPreference()
    GUICtrlSetData($idInputCornerPreference, GUICtrlRead($CornerPreferenceCombo))
    ;_RuleList()
EndFunc

Func idComboExtendFrame()
    GUICtrlSetData($idInputExtendFrame, GUICtrlRead($ExtendFrameCombo))
    ;_RuleList()
EndFunc

Func idComboBlurBehind()
    GUICtrlSetData($idInputBlurBehind, GUICtrlRead($BlurBehindCombo))
    ;_RuleList()
EndFunc

Func idComboRuleEnabled()
    GUICtrlSetData($idInputRuleEnabled, GUICtrlRead($RuleEnabledCombo))
EndFunc

Func idStatusCombo()
    Local $StatusComboRead = GUICtrlRead($idStatusCombo)
    If $StatusComboRead = "Install Task" Or $StatusComboRead =  "Install Task (Admin)" Then
        ; obtain PID for engine process
        Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
        If $iPID <> "" Then
            ; get handle from PID
            Local $hWnd = _GetHwndFromPID($iPID)
            ; close engine process in a way that allows proper process cleanup
            WinClose($hWnd)
        EndIf
        Sleep(200)
        _InstallTask()
        Sleep(500)
        ; start task
        ShellExecute(@ScriptDir & "\" & $sEngName & ".exe", "starttask", @ScriptDir, $SHEX_OPEN, @SW_HIDE)
        Sleep(200)
        _TaskStatusUpdate()
        GUICtrlSetData($idStatusCombo, "")
        _FillCombo()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
        ;GUICtrlSetData($idStatusCombo, "Uninstall Task|Restart Task")
    EndIf
    If $StatusComboRead = "Uninstall Task" Then
        ; obtain PID for engine process
        Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
        ; get handle from PID
        Local $hWnd = _GetHwndFromPID($iPID)
        ; close engine process in a way that allows proper process cleanup
        WinClose($hWnd)
        Sleep(200)
        _UninstallTask()
        Sleep(500)
        _TaskStatusUpdate()
        GUICtrlSetData($idStatusCombo, "")
        _FillCombo()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
        ;GUICtrlSetData($idStatusCombo, "Install Task|Restart Task")
    EndIf
    If $StatusComboRead = "Uninstall Task (Admin)" Then
        Local $sMsg = " You need to run as Admin to uninstall Admin task. " & @CRLF
        _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
        GUICtrlSetData($idStatusCombo, "")
        _FillCombo()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
    EndIf
    If $StatusComboRead = "Upgrade Task (Admin)" Then
        ; obtain PID for engine process
        Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
        ; get handle from PID
        Local $hWnd = _GetHwndFromPID($iPID)
        ; close engine process in a way that allows proper process cleanup
        WinClose($hWnd)
        Sleep(200)
        _InstallTask()
        Sleep(500)
        ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
        Sleep(200)
        _TaskStatusUpdate()
        GUICtrlSetData($idStatusCombo, "")
        _FillCombo()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
        ;GUICtrlSetData($idStatusCombo, "Install Task|Restart Task")
    EndIf
    If $StatusComboRead = "Restart Task" Then
        ;_IsEngineProcRunning()
        _RestartTask()
        GUICtrlSetData($idStatusCombo, "")
        _FillCombo()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
    EndIf
EndFunc

Func idStatusCombo_backup()
    Local $StatusComboRead = GUICtrlRead($idStatusCombo)
    $IsRunFromTS = _ToBoolean(IniRead($sIniPath, "StartupInfoOnly", "StartedByTask", "False"))
    If $StatusComboRead = "Install Task" Or $StatusComboRead =  "Install Task (Admin)" Then
        ; need to kill engine here if already running without task
        ; obtain PID for engine process
        Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
        ; get handle from PID
        Local $hWnd = _GetHwndFromPID($iPID)
        ; close engine process in a way that allows proper process cleanup
        WinClose($hWnd)
        Sleep(200)
        _InstallTask()
        Sleep(500)
        ; start task
        ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
        Sleep(200)
        _TaskStatusUpdate()
        GUICtrlSetData($idStatusCombo, "")
        _FillCombo()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
        ;GUICtrlSetData($idStatusCombo, "Uninstall Task|Restart Task")
    EndIf
    If $StatusComboRead = "Uninstall Task" Then
        If $IsRunFromTS Then
            _TaskSched_End()
            Sleep(100)
        ElseIf Not $IsRunFromTS Then
            ; obtain PID for engine process
            Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
            ; get handle from PID
            Local $hWnd = _GetHwndFromPID($iPID)
            ; close engine process in a way that allows proper process cleanup
            WinClose($hWnd)
            Sleep(200)
        EndIf
        _UninstallTask()
        Sleep(500)
        _TaskStatusUpdate()
        GUICtrlSetData($idStatusCombo, "")
        _FillCombo()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
        ;GUICtrlSetData($idStatusCombo, "Install Task|Restart Task")
    EndIf
    If $StatusComboRead = "Uninstall Task (Admin)" Then
        Local $sMsg = " You need to run as Admin to uninstall Admin task. " & @CRLF
        _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, $sMsg)
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
    EndIf
    If $StatusComboRead = "Upgrade Task (Admin)" Then
        If $IsRunFromTS Then
            _TaskSched_End()
            Sleep(100)
        ElseIf Not $IsRunFromTS Then
            ; obtain PID for engine process
            Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
            ; get handle from PID
            Local $hWnd = _GetHwndFromPID($iPID)
            ; close engine process in a way that allows proper process cleanup
            WinClose($hWnd)
            Sleep(200)
        EndIf
        _InstallTask()
        Sleep(500)
        ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
        Sleep(200)
        _TaskStatusUpdate()
        GUICtrlSetData($idStatusCombo, "")
        _FillCombo()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
        ;GUICtrlSetData($idStatusCombo, "Install Task|Restart Task")
    EndIf
    If $StatusComboRead = "Restart Task" Then
        ;_IsEngineProcRunning()
        _RestartTask()
        _GUICtrlComboBox_SetCurSel($idStatusCombo, -1)
    EndIf
EndFunc

Func hBtnAddRule()
    GUICtrlSetState($TargetInput, $GUI_ENABLE)
    GUICtrlSetState($idInputRuleType, $GUI_ENABLE)
    GUICtrlSetState($RuleTypeCombo, $GUI_ENABLE)
    GUICtrlSetState($hBtnRuleType, $GUI_ENABLE)
    GUICtrlSetState($RuleEnabledCombo, $GUI_ENABLE)
    GUICtrlSetState($idInputRuleEnabled, $GUI_ENABLE)
    GUICtrlSetState($hBtnRuleEnabled, $GUI_ENABLE)
    GUICtrlSetState($DeleteButton, $GUI_ENABLE)
    GUICtrlSetState($SaveButton, $GUI_ENABLE)
    ; clear everything
    _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)
    GUICtrlSetData($idInputBlurBehind, "")
    GUICtrlSetData($idInputExtendFrame, "")
	_GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)
    GUICtrlSetData($BlurTintColorInput, "")
    GUICtrlSetBkColor($BlurTintColorPickLabel, 0x000000)
    GUICtrlSetData($idInputCornerPreference, "")
    _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
    GUICtrlSetData($idInputTitleBarBackdrop, "")
    _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
    GUICtrlSetData($BorderColorInput, "")
    GUICtrlSetBkColor($colorlabelfill, 0x000000)
    GUICtrlSetData($TitlebarColorInput, "")
    GUICtrlSetBkColor($TitlebarColorLabel, 0x000000)
    GUICtrlSetData($TitlebarTextColorInput, "")
    GUICtrlSetBkColor($TitlebarTextColorLabel, 0x000000)
    GUICtrlSetData($idInputDarkTitle, "")
	_GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
    GUICtrlSetData($TargetInput, "")
    GUICtrlSetData($idInputRuleType, "")
    _GUICtrlComboBox_SetCurSel($RuleTypeCombo, -1)
    GUICtrlSetData($idInput, "")
    _GUICtrlComboBox_SetCurSel($RuleListCombo, -1)
    GUICtrlSetData($BlurColorIntensitySlider, 50)
    _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, -1)
    GUICtrlSetData($idInputRuleEnabled, "")
    ; set focus to Target input
    GUICtrlSetState($TargetInput, $GUI_FOCUS)
EndFunc

Func hBtnAddRule_nofocus()
    ; clear everything
    _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)
    GUICtrlSetData($idInputBlurBehind, "")
    GUICtrlSetData($idInputExtendFrame, "")
	_GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)
    GUICtrlSetData($BlurTintColorInput, "")
    GUICtrlSetBkColor($BlurTintColorPickLabel, 0x000000)
    GUICtrlSetData($idInputCornerPreference, "")
    _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
    GUICtrlSetData($idInputTitleBarBackdrop, "")
    _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
    GUICtrlSetData($BorderColorInput, "")
    GUICtrlSetBkColor($colorlabelfill, 0x000000)
    GUICtrlSetData($TitlebarColorInput, "")
    GUICtrlSetBkColor($TitlebarColorLabel, 0x000000)
    GUICtrlSetData($TitlebarTextColorInput, "")
    GUICtrlSetBkColor($TitlebarTextColorLabel, 0x000000)
    GUICtrlSetData($idInputDarkTitle, "")
	_GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
    GUICtrlSetData($TargetInput, "")
    GUICtrlSetData($idInputRuleType, "")
    _GUICtrlComboBox_SetCurSel($RuleTypeCombo, -1)
    GUICtrlSetData($idInput, "")
    ;_GUICtrlComboBox_SetCurSel($RuleListCombo, -1)
    GUICtrlSetData($BlurColorIntensitySlider, 50)
    _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, -1)
    GUICtrlSetData($idInputRuleEnabled, "")
EndFunc

Func hBtnAddRule_nofocusGlobal()
    ; clear everything
    _GUICtrlComboBox_SetCurSel($BlurBehindCombo, -1)
    GUICtrlSetData($idInputBlurBehind, "")
    GUICtrlSetData($idInputExtendFrame, "")
	_GUICtrlComboBox_SetCurSel($ExtendFrameCombo, -1)
    GUICtrlSetData($BlurTintColorInput, "")
    GUICtrlSetBkColor($BlurTintColorPickLabel, 0x000000)
    GUICtrlSetData($idInputCornerPreference, "")
    _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, -1)
    GUICtrlSetData($idInputTitleBarBackdrop, "")
    _GUICtrlComboBox_SetCurSel($TitleBarBackdropCombo, -1)
    GUICtrlSetData($BorderColorInput, "")
    GUICtrlSetBkColor($colorlabelfill, 0x000000)
    GUICtrlSetData($TitlebarColorInput, "")
    GUICtrlSetBkColor($TitlebarColorLabel, 0x000000)
    GUICtrlSetData($TitlebarTextColorInput, "")
    GUICtrlSetBkColor($TitlebarTextColorLabel, 0x000000)
    GUICtrlSetData($idInputDarkTitle, "")
	_GUICtrlComboBox_SetCurSel($DarkTitleCombo, -1)
    GUICtrlSetData($TargetInput, "")
    GUICtrlSetData($idInputRuleType, "")
    _GUICtrlComboBox_SetCurSel($RuleTypeCombo, -1)
    ;GUICtrlSetData($idInput, "")
    ;_GUICtrlComboBox_SetCurSel($RuleListCombo, -1)
    GUICtrlSetData($BlurColorIntensitySlider, 50)
    _GUICtrlComboBox_SetCurSel($RuleEnabledCombo, -1)
    GUICtrlSetData($idInputRuleEnabled, "")
EndFunc

Func hBtnDeleteRule()
    Local $SectionName = GUICtrlRead($RuleListCombo)
    ;ConsoleWrite("section to delete: " & $SectionName & @CRLF)
    $sMsg = " This will delete the following rule: " & $SectionName & @CRLF
	$sMsg &= " " & @CRLF
	$sMsg &= " Do you want to continue? " & @CRLF
	$iRetValue = _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 4, $sProdName, $sMsg)

	If $iRetValue = 1 Then
		IniDelete($sIniPath, $SectionName)
	ElseIf $iRetValue = 2 Then
		Return
	EndIf

    ;GUICtrlSetData($RuleListCombo, "")
    ;_GUICtrlComboBox_SetCurSel($RuleListCombo, -1)
    _GUICtrlComboBox_ResetContent($RuleListCombo)

    ; need to reload array and combo
    _ReloadRulesCombo()
    hBtnAddRule()

    _GUICtrlComboBox_InsertString($RuleListCombo, "Global Rules", 0)
    ;_GUICtrlComboBox_InsertString($RuleListCombo, "─────────────────────────────────────────────────────────────────", 1)
EndFunc

#cs
Func _WinAPI_DwmSetWindowAttribute__($hwnd, $attribute = 34, $value = 0x00FF00, $valLen = 4)
	Local $aCall = DllCall('dwmapi.dll', 'long', 'DwmSetWindowAttribute', 'hwnd', $hWnd, 'dword', $attribute, 'dword*', $value, 'dword', $valLen)
	If @error Then Return SetError(@error, @extended, 0)
	If $aCall[0] Then Return SetError(10, $aCall[0], 0)
	Return 1
EndFunc   ;==>_WinAPI_DwmSetWindowAttribute__
#ce

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
        Local $TintColorIntensity = GUICtrlRead($BlurColorIntensitySlider)
        IniWrite($sIniPath, "GlobalRules", "GlobalTintColorIntensity", $TintColorIntensity)

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
    Local $RuleEnabled = GUICtrlRead($idInputRuleEnabled)

    ; need to determine if target changed from section to initiate ini section rename if needed
    Local $SectionName = GUICtrlRead($idInput)
    If $SectionName = "Select a rule" Then Return
    If $SectionName = "" Then $SectionName = $Target
    If $SectionName <> $Target Then
        ; Rename the section labelled $SectionName to $Target
        IniRenameSection($sIniPath, $SectionName, $Target)
        $SectionName = $Target
    EndIf

    ;#cs
    Local $aSection[14][2] = [[13, ""], ["RuleType", $RuleType], ["Target", $Target], ["DarkTitleBar", $DarkTitleBar], ["BorderColor", $BorderColor], ["TitleBarColor", $TitleBarColor], ["TitleBarTextColor", $TitleBarTextColor], ["TitleBarBackdrop", $TitleBarBackdrop], ["CornerPreference", $CornerPreference], ["ExtendFrameIntoClient", $ExtendFrameIntoClient], ["EnableBlurBehind", $EnableBlurBehind], ["BlurTintColor", $BlurTintColor], ["TintColorIntensity", $TintColorIntensity], ["Enabled", $RuleEnabled]]
    ;_ArrayDisplay($aSection, "testing creation of same section")
    ;#ce

    $IniWriteStatus = IniWriteSection($sIniPath, $SectionName, $aSection)
    If $IniWriteStatus = 0 Then _ExtMsgBox(0 & ";" & @ScriptDir & "\" & $sEngName & ".exe", 0, $sProdName, " Failed to write changes to file. " & @CRLF)

    _SaveReloadRules()

    _ReloadRulesCombo()
    _UpdateColorBoxes()

    GUICtrlSetState($DeleteButton, $GUI_ENABLE)

    GUICtrlSetData($idInput, GUICtrlRead($TargetInput))
    GUICtrlSetData($RuleListCombo, GUICtrlRead($TargetInput))

    _GUICtrlComboBox_InsertString($RuleListCombo, "Global Rules", 0)
    ;_GUICtrlComboBox_InsertString($RuleListCombo, "─────────────────────────────────────────────────────────────────", 1)

    ;_SaveReloadRules()
EndFunc

Func _SaveReloadRules()
    ;_IsEngineProcRunning()
    _RestartTask()
EndFunc

Func _ReloadRulesCombo()
    _GUICtrlComboBox_ResetContent($RuleListCombo)

    ; need to reload array and combo
    Global $aCustomRules[0][14]
    _GetIniDetails()


    $aRegistry = ""
    ;$aRegistry &= "|" & "Global Rules"

    For $i = 0 To Ubound($aCustomRules)-1
            $aRegistry &= "|" & $aCustomRules[$i][13]
    Next
    GUICtrlSetData($RuleListCombo, $aRegistry)

    ;_GUICtrlComboBox_InsertString($RuleListCombo, "─────────────────────────────────────────────────────────────────", 1)
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

        ; Create an INI section structure as a string.
        ;Local $sSection = "Title=AutoIt" & @LF & "Version=" & @AutoItVersion & @LF & "OS=" & @OSVersion

        ; Write the string to the section labelled 'General'.
        ;IniWriteSection($sIniPath, "General", $sSection)

        ; Read the INI section labelled 'General'. This will return a 2 dimensional array.
        Local $aSectionNames = IniReadSectionNames($sIniPath)

        For $i = 1 To $aSectionNames[0]
                ;If StringInStr($aSectionNames[$i], "CustomRules") Then
                Local $a = $aSectionNames[$i]
                If $a <> "Configuration" And $a <> "ProcessExclusion" And $a <> "ClassExclusion" And $a <> "Settings" And $a <> "GlobalRules" And $a <> "StartupInfoOnly" Then
                        $count += 1
                        ;ConsoleWrite($aSectionNames[$i] & @CRLF)
                        Local $aArray = IniReadSection($sIniPath, $aSectionNames[$i])
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
        ; $aCustomRules[$i][13] = contains sectionname

        ; Create an INI section structure as an array. The zeroth element is how many items are in the array, in this case 3.
        Local $i = 3
        Local $aSection[13][2] = [[12, ""], ["RuleType", $aCustomRules[$i][0]], ["Target", $aCustomRules[$i][1]], ["DarkTitleBar", $aCustomRules[$i][2]], ["BorderColor", $aCustomRules[$i][3]], ["TitleBarColor", $aCustomRules[$i][4]], ["TitleBarTextColor", $aCustomRules[$i][5]], ["TitleBarBackdrop", $aCustomRules[$i][6]], ["CornerPreference", $aCustomRules[$i][7]], ["ExtendFrameIntoClient", $aCustomRules[$i][8]], ["EnableBlurBehind", $aCustomRules[$i][9]], ["BlurTintColor", $aCustomRules[$i][10]], ["TintColorIntensity", $aCustomRules[$i][11]]]

        Local $aArray = IniReadSection($sIniPath, "CustomRules_win32calc")
        ;_ArrayDisplay($aArray, "testing reading of real section")

        ;_ArrayDisplay($aSection, "testing creation of same section")

        For $i = 0 To UBound($aCustomRules) - 1
                Local $aSection[13][2] = [[12, ""], ["RuleType", $aCustomRules[$i][0]], ["Target", $aCustomRules[$i][1]], ["DarkTitleBar", $aCustomRules[$i][2]], ["BorderColor", $aCustomRules[$i][3]], ["TitleBarColor", $aCustomRules[$i][4]], ["TitleBarTextColor", $aCustomRules[$i][5]], ["TitleBarBackdrop", $aCustomRules[$i][6]], ["CornerPreference", $aCustomRules[$i][7]], ["ExtendFrameIntoClient", $aCustomRules[$i][8]], ["EnableBlurBehind", $aCustomRules[$i][9]], ["BlurTintColor", $aCustomRules[$i][10]], ["TintColorIntensity", $aCustomRules[$i][11]]]
                ;_ArrayDisplay($aSection, "testing creation of same section")
        Next


        #cs the goods
        _ArrayColDelete($aArray, 0)
        _ArrayDelete($aArray, 0)
        
        _ArrayTranspose($aArray)
        _ArrayDisplay($aArray, "_ArrayDisplay Transposed", "", 2, Default, "RuleType|Process/Class|DarkMode|BorderColor|TitleBarColor|TitleBarTextColor|CornerPreference|TitleBarBackdrop")
        #ce

        ; sort array
        _ArraySort($aCustomRules, 0, 0, 0 , 1)
        ;_ArrayDisplay($aCustomRules)

EndFunc   ;==>_GetIniDetails

Func _RuleList()
	$IFEOname = GUICtrlRead($RuleListCombo)
	;ConsoleWrite("selected: " & $IFEOname & @CRLF)

    #cs
    If $IFEOname = "Global Rules" Then
        ConsoleWrite("show the global rules" & @CRLF)
        ConsoleWrite("and disable the target and rule type stuff" & @CRLF)
        hBtnAddRule()
        Return
    EndIf
    #ce
    If $IFEOname = "─────────────────────────────────────────────────────────────────" Then
         hBtnAddRule_nofocus()
         GUICtrlSetState($DeleteButton, $GUI_DISABLE)
         Return
         ;_GUICtrlComboBox_ShowDropDown($RuleListCombo, True)
    EndIf

    If $IFEOname = "Global Rules" Or $IFEOname = "─────────────────────────────────────────────────────────────────" Then
        hBtnAddRule_nofocusGlobal()
        ; need to disable some things
        GUICtrlSetState($TargetInput, $GUI_DISABLE)
        GUICtrlSetState($idInputRuleType, $GUI_DISABLE)
        GUICtrlSetState($RuleTypeCombo, $GUI_DISABLE)
        GUICtrlSetState($hBtnRuleType, $GUI_DISABLE)
        GUICtrlSetState($RuleEnabledCombo, $GUI_DISABLE)
        GUICtrlSetState($idInputRuleEnabled, $GUI_DISABLE)
        GUICtrlSetState($hBtnRuleEnabled, $GUI_DISABLE)
        GUICtrlSetState($DeleteButton, $GUI_DISABLE)
        ;GUICtrlSetBkColor($TargetInput, 0x101010)
        ;GUICtrlSetBkColor($idInputRuleType, 0x101010)
        GUICtrlSetState($SaveButton, $GUI_ENABLE)
    Else
        GUICtrlSetState($TargetInput, $GUI_ENABLE)
        GUICtrlSetState($idInputRuleType, $GUI_ENABLE)
        GUICtrlSetState($RuleTypeCombo, $GUI_ENABLE)
        GUICtrlSetState($hBtnRuleType, $GUI_ENABLE)
        GUICtrlSetState($RuleEnabledCombo, $GUI_ENABLE)
        GUICtrlSetState($idInputRuleEnabled, $GUI_ENABLE)
        GUICtrlSetState($hBtnRuleEnabled, $GUI_ENABLE)
        GUICtrlSetState($DeleteButton, $GUI_ENABLE)
        ;GUICtrlSetBkColor($TargetInput, 0x202020)
        ;GUICtrlSetBkColor($idInputRuleType, 0x202020)
        GUICtrlSetState($SaveButton, $GUI_ENABLE)
    EndIf

    If $IFEOname = "Global Rules" Then
        GUICtrlSetData($idInputDarkTitle, $bGlobalDarkTitleBar)
		If $bGlobalDarkTitleBar = "True" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 0)
		If $bGlobalDarkTitleBar = "False" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 1)
		If $bGlobalDarkTitleBar = "" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 2)
        GUICtrlSetData($BorderColorInput, $dGlobalBorderColor)
        GUICtrlSetBkColor($colorlabelfill, $dGlobalBorderColor)
        GUICtrlSetData($TitlebarColorInput, $dGlobalTitleBarColor)
        GUICtrlSetBkColor($TitlebarColorLabel, $dGlobalTitleBarColor)
        GUICtrlSetData($TitlebarTextColorInput, $dGlobalTitleBarTextColor)
        GUICtrlSetBkColor($TitlebarTextColorLabel, $dGlobalTitleBarTextColor)
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
		If $iGlobalExtendFrameIntoClient = "" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, 2)

        GUICtrlSetData($idInputBlurBehind, $iGlobalEnableBlurBehind)
		If $iGlobalEnableBlurBehind = "True" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 0)
		If $iGlobalEnableBlurBehind = "False" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 1)
		If $iGlobalEnableBlurBehind = "" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 2)

        GUICtrlSetData($BlurTintColorInput, $dGlobalBlurTintColor)
        GUICtrlSetBkColor($BlurTintColorPickLabel, $dGlobalBlurTintColor)

        GUICtrlSetData($BlurColorIntensitySlider, $iGlobalTintColorIntensity)
        Return
    EndIf

	; determine if process rule or class rule matches for custom rules
	For $i = 0 To UBound($aCustomRules) - 1
		; run through all of the custom process/class rules for a match
		;If StringInStr($sName, $aCustomRules[$i][1], 2) Or StringInStr($sClassName, $aCustomRules[$i][1], 2) Then
		If $IFEOname = $aCustomRules[$i][13] Then
			GUICtrlSetData($idInputRuleType, $aCustomRules[$i][0])
            If $aCustomRules[$i][0] = "Class" Then _GUICtrlComboBox_SetCurSel($RuleTypeCombo, 0)
			If $aCustomRules[$i][0] = "Process" Then _GUICtrlComboBox_SetCurSel($RuleTypeCombo, 1)
			GUICtrlSetData($TargetInput, $aCustomRules[$i][1])
            ;If $IFEOname = "Global Rules" Then GUICtrlSetData($TargetInput, "")
			GUICtrlSetData($idInputDarkTitle, $aCustomRules[$i][2])
			If $aCustomRules[$i][2] = "True" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 0)
			If $aCustomRules[$i][2] = "False" Then _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 1)
			If $aCustomRules[$i][2] = "" Then
                _GUICtrlComboBox_SetCurSel($DarkTitleCombo, 2)
                GUICtrlSetData($idInputDarkTitle, "Global")
            EndIf
			GUICtrlSetData($BorderColorInput, $aCustomRules[$i][3])
            GUICtrlSetBkColor($colorlabelfill, $aCustomRules[$i][3])
            GUICtrlSetData($TitlebarColorInput, $aCustomRules[$i][4])
            GUICtrlSetBkColor($TitlebarColorLabel, $aCustomRules[$i][4])
            GUICtrlSetData($TitlebarTextColorInput, $aCustomRules[$i][5])
            GUICtrlSetBkColor($TitlebarTextColorLabel, $aCustomRules[$i][5])
            ;GUICtrlSetData($idInputTitleBarBackdrop, $aCustomRules[$i][6])
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
            If $aCustomRules[$i][6] = "" Then
                GUICtrlSetData($idInputTitleBarBackdrop, "Global")
                _GUICtrlComboBox_SetCurSel($idInputTitleBarBackdrop, 5)
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
            If $aCustomRules[$i][7] = "" Then
                GUICtrlSetData($idInputCornerPreference, "Global")
                _GUICtrlComboBox_SetCurSel($CornerPreferenceCombo, 4)
            EndIf

            GUICtrlSetData($idInputExtendFrame, $aCustomRules[$i][8])
			If $aCustomRules[$i][8] = "True" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, 0)
			If $aCustomRules[$i][8] = "False" Then _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, 1)
            If $aCustomRules[$i][8] = "" Then
                _GUICtrlComboBox_SetCurSel($ExtendFrameCombo, 2)
                GUICtrlSetData($idInputExtendFrame, "Global")
            EndIf

            GUICtrlSetData($idInputBlurBehind, $aCustomRules[$i][9])
			If $aCustomRules[$i][9] = "True" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 0)
			If $aCustomRules[$i][9] = "False" Then _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 1)
            If $aCustomRules[$i][9] = "" Then
                _GUICtrlComboBox_SetCurSel($BlurBehindCombo, 2)
                GUICtrlSetData($idInputBlurBehind, "Global")
            EndIf

            GUICtrlSetData($BlurTintColorInput, $aCustomRules[$i][10])
            GUICtrlSetBkColor($BlurTintColorPickLabel, $aCustomRules[$i][10])

            GUICtrlSetData($BlurColorIntensitySlider, $aCustomRules[$i][11])

            GUICtrlSetData($idInputRuleEnabled, $aCustomRules[$i][12])

            ;ConsoleWrite("name of section: " & $aCustomRules[$i][13] & @CRLF)
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

Func _FillCombo()
    #cs
    If $TaskInstalled = "Yes" And IsAdmin() Then
        If $TaskRunning = "No" Then
            GUICtrlSetData($idStatusCombo, "Uninstall Task")
        Else
            GUICtrlSetData($idStatusCombo, "Uninstall Task|Restart Task")
        EndIf
    EndIf
    #ce
    If $TaskInstalled = "No" And IsAdmin() Then GUICtrlSetData($idStatusCombo, "Install Task (Admin)")
    If $TaskInstalled = "No" And Not IsAdmin() Then GUICtrlSetData($idStatusCombo, "Install Task")
    If $TaskInstalled = "Yes" Then
        If $TaskIntegrity = "No" And IsAdmin() Then
            If $TaskRunning = "No" Then
                GUICtrlSetData($idStatusCombo, "Upgrade Task (Admin)|Uninstall Task")
            Else
                GUICtrlSetData($idStatusCombo, "Upgrade Task (Admin)|Uninstall Task|Restart Task")
            EndIf
        ElseIf $TaskIntegrity = "Yes" And IsAdmin() Then
            If $TaskRunning = "No" Then
                GUICtrlSetData($idStatusCombo, "Uninstall Task")
            Else
                GUICtrlSetData($idStatusCombo, "Uninstall Task|Restart Task")
            EndIf
        ElseIf $TaskIntegrity = "Yes" And Not IsAdmin() Then
            If $TaskRunning = "No" Then
                GUICtrlSetData($idStatusCombo, "Uninstall Task (Admin)")
            Else
                GUICtrlSetData($idStatusCombo, "Uninstall Task (Admin)|Restart Task")
            EndIf
        ElseIf Not IsAdmin() Then
            If $TaskRunning = "No" Then
                GUICtrlSetData($idStatusCombo, "Uninstall Task")
            Else
                GUICtrlSetData($idStatusCombo, "Uninstall Task|Restart Task")
            EndIf
        EndIf
    EndIf
EndFunc

Func _RestartTask()
    $IsRunFromTS = _ToBoolean(IniRead($sIniPath, "StartupInfoOnly", "StartedByTask", "False"))
    If Not $IsRunFromTS Then
        If @Compiled Then
            ; obtain PID for engine process
            Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
            ; get handle from PID
            Local $hWnd = _GetHwndFromPID($iPID)
            ; close engine process in a way that allows proper process cleanup
            WinClose($hWnd)
            ;Sleep(200)
            ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
        ElseIf Not @Compiled Then
            ; get program files x86 folder
            Local $sAutoIt3 = @ProgramFilesDir & "\AutoIt3\AutoIt3.exe"
            $sAutoIt3 = StringReplace($sAutoIt3, "Program Files", "Program Files (x86)")
            ; get PID of running script
            Local $iPID = Int(IniRead($sIniPath, "StartupInfoOnly", "PID", ""))
            ; get handle from PID
            Local $hWnd = _GetHwndFromPID($iPID)
            ; close engine process in a way that allows proper process cleanup
            WinClose($hWnd)
            ;Sleep(500)
            ShellExecute(@ScriptDir & "\" & $sEngName & ".au3")
        EndIf
    ElseIf $IsRunFromTS Then
        _TaskSched_End()
        Sleep(100)
        ShellExecute(@ScriptDir & "\" & $sEngName & ".exe")
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

    GUICtrlSetData($idPart0, "Task Installed: " & $TaskInstalled)
    GUICtrlSetData($idPart1, "Task Running: " & $TaskRunning)
    GUICtrlSetData($idPart2, "Task Elevated: " & $TaskIntegrity)
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

    GUICtrlSetData($idPart0, "Task Installed: " & $TaskInstalled)
    GUICtrlSetData($idPart1, "Task Running: " & $TaskRunning)
    GUICtrlSetData($idPart2, "Task Elevated: " & $TaskIntegrity)

    AdlibUnRegister("_TaskStatusUpdate_adlib")
EndFunc

Func _IsEngineProcRunning()
    $aProcessRunning = ProcessList(@ScriptDir & "\" & $sEngName & ".exe")
    If $aProcessRunning[0][0] <> 0 Then
        Local $iPID = $aProcessRunning[1][1]
        $bProcessRunning = True
        $IsRunFromTS = _ToBoolean(IniRead($sIniPath, "StartupInfoOnly", "StartedByTask", "False"))
    ElseIf $aProcessRunning[0][0] = 0 Then
        $bProcessRunning = False
        ConsoleWrite($sProdName & " process is NOT running" & @CRLF)
    EndIf
EndFunc

Func _ToBoolean($sString)
    Return (StringStripWS(StringUpper($sString), 8) = "TRUE" ? True : False)
EndFunc   ;==>_ToBoolean

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
