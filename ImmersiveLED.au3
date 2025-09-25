#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=app.ico
#AutoIt3Wrapper_Outfile_x64=ImmersiveLED.exe
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Immersive UX LED
#AutoIt3Wrapper_Res_Fileversion=1.4.0
#AutoIt3Wrapper_Res_ProductName=Immersive UX LED
#AutoIt3Wrapper_Res_ProductVersion=1.4.0
#AutoIt3Wrapper_Res_LegalCopyright=@ 2025 WildByDesign
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_HiDpi=Y
#AutoIt3Wrapper_Run_Au3Stripper=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <Misc.au3>

Global $hGUI, $fSpeed = 4
Global Static $hActiveWndLast
Global $DWMWA_COLOR_NONE = 0xFFFFFFFE
Global $DWMWA_COLOR_DEFAULT = 0xFFFFFFFF
Global $hDwmapi = DllOpen('dwmapi.dll')
Global $hUser32 = DllOpen('user32.dll')

; ensure that only one instance is running
If _Singleton("Immersive UX LED", 1) = 0 Then
        $sMsg = "Immersive UX LED process is already running." & @CRLF
		MsgBox($MB_ICONERROR + $MB_SYSTEMMODAL, "Error", $sMsg & @CRLF)
        Exit
EndIf

OnAutoItExitRegister(DoCleanUp)
AutoItWinSetTitle("Immersive UX LED")

While 1
    Sleep(40)
    $hActiveWnd = _WinAPI_GetForegroundWindow()
    If $hActiveWnd <> $hActiveWndLast Then
        _WinAPI_DwmSetWindowAttribute__($hActiveWndLast, 34, $DWMWA_COLOR_NONE)
        $hActiveWndLast = $hActiveWnd
    ElseIf $hActiveWnd = $hActiveWndLast Then
        _BorderEffects($hActiveWnd)
    EndIf
WEnd

Func DoCleanUp()
    $hActiveWnd = _WinAPI_GetForegroundWindow()
    _WinAPI_DwmSetWindowAttribute__($hActiveWndLast, 34, $DWMWA_COLOR_NONE)
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

Func _WinAPI_GetForegroundWindow()
    Local $aCall = DllCall($hUser32, "hwnd", "GetForegroundWindow")
    Return $aCall[0]
EndFunc   ;==>_WinAPI_GetForegroundWindow

Func _WinAPI_DwmSetWindowAttribute__($hWnd, $attribute, $value)
	DllCall($hDwmapi, 'long', 'DwmSetWindowAttribute', 'hwnd', $hWnd, 'dword', $attribute, 'dword*', $value)
EndFunc   ;==>_WinAPI_DwmSetWindowAttribute__
