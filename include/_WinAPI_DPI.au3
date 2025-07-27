;Coded by UEZ build 2023-08-15 beta
#include-once
#include <GDIPlus.au3>
#include <Misc.au3>
#include <WinAPISysWin.au3>
#include <WinAPIsysinfoConstants.au3>

#Region DPI Constants
;https://learn.microsoft.com/en-us/windows/win32/api/windef/ne-windef-dpi_awareness
Global Enum $DPI_AWARENESS_INVALID = -1, $DPI_AWARENESS_UNAWARE = 0, $DPI_AWARENESS_SYSTEM_AWARE = 1, $DPI_AWARENESS_PER_MONITOR_AWARE = 2

;https://learn.microsoft.com/en-us/windows/win32/hidpi/dpi-awareness-context
Global Const $DPI_AWARENESS_CONTEXT_UNAWARE = $DPI_AWARENESS_UNAWARE - 1
Global Const $DPI_AWARENESS_CONTEXT_SYSTEM_AWARE = $DPI_AWARENESS_UNAWARE - 2
Global Const $DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE = $DPI_AWARENESS_UNAWARE - 3
Global Const $DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 = $DPI_AWARENESS_UNAWARE - 4
Global Const $DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED = $DPI_AWARENESS_UNAWARE - 5

; enum _MONITOR_DPI_TYPE
Global Enum $MDT_EFFECTIVE_DPI = 0, $MDT_ANGULAR_DPI, $MDT_RAW_DPI
Global Const $MDT_DEFAULT = $MDT_EFFECTIVE_DPI

;Windows Message Codes
Global Const $WM_DPICHANGED = 0x02E0, $WM_DPICHANGED_BEFOREPARENT = 0x02E2, $WM_DPICHANGED_AFTERPARENT = 0x02E3, $WM_GETDPISCALEDSIZE = 0x02E4
#EndRegion DPI Constants

#Region WinAPI DPI
;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-adjustwindowrectexfordpi
Func _WinAPI_AdjustWindowRectExForDpi($dpi, $dwStyle, $dwExStyle, $bMenu = False)
    Local $tRECT = DllStructCreate($tagRECT)
    Local $aResult = DllCall("user32.dll", "bool", "AdjustWindowRectExForDpi", "struct*", $tRECT, "dword", $dwStyle, "bool", $bMenu, "dword", $dwExStyle, "int", $dpi) ;requires Win10 v1607+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If $aResult[0] Then Return SetError(2, @extended, 0)
    Return $tRECT
EndFunc   ;==>_WinAPI_AdjustWindowRectExForDpi

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-systemparametersinfofordpi
Func _WinAPI_SystemParametersInfoForDpi($uiAction, $uiParam, $pvParam, $fWinIni, $dpi)
    Local $aResult = DllCall("user32.dll", "bool", "SystemParametersInfoForDpi", "uint", $uiAction, "uint", $uiParam, "struct*", $pvParam, "uint", $fWinIni, "uint", $dpi) ;requires Win10 v1607+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_SystemParametersInfoForDpi

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-inheritwindowmonitor
Func _WinAPI_InheritWindowMonitor($hWnd, $hWndInherit)
    Local $aResult = DllCall("user32.dll", "bool", "InheritWindowMonitor", "hwnd", $hWnd, "hwnd", $hWndInherit) ;requires Win10 v1803+ / Windows Server 2016+
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_InheritWindowMonitor

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-isvaliddpiawarenesscontext
Func _WinAPI_IsValidDpiAwarenessContext($DPI_AWARENESS_CONTEXT_value)
    Local $aResult = DllCall("user32.dll", "bool", "IsValidDpiAwarenessContext", @AutoItX64 ? "int64" : "int", $DPI_AWARENESS_CONTEXT_value) ;requires Win10 v1607+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_IsValidDpiAwarenessContext

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-logicaltophysicalpointforpermonitordpi
Func _WinAPI_LogicalToPhysicalPointForPerMonitorDPI($hWnd)
    Local $tPOINT = DllStructCreate($tagPOINT)
    Local $aResult = DllCall("user32.dll", "bool", "LogicalToPhysicalPointForPerMonitorDPI", "hwnd", $hWnd, "struct*", $tPOINT) ;requires Win 8.1+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $tPOINT
EndFunc   ;==>_WinAPI_LogicalToPhysicalPointForPerMonitorDPI

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-physicaltologicalpointforpermonitordpi
Func _WinAPI_PhysicalToLogicalPointForPerMonitorDPI($hWnd)
    Local $tPOINT = DllStructCreate($tagPOINT)
    Local $aResult = DllCall("user32.dll", "bool", "PhysicalToLogicalPointForPerMonitorDPI", "hwnd", $hWnd, "struct*", $tPOINT) ;requires Win 8.1+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $tPOINT
EndFunc   ;==>_WinAPI_PhysicalToLogicalPointForPerMonitorDPI


Func _GDIPlus_GetDPI($hGUI = 0)
    _GDIPlus_Startup()
    Local $hGfx = _GDIPlus_GraphicsCreateFromHWND($hGUI)
    If @error Then Return SetError(1, @extended, 0)
    Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipGetDpiX", "handle", $hGfx, "float*", 0)
    If @error Then Return SetError(2, @extended, 0)
    _GDIPlus_GraphicsDispose($hGfx)
    _GDIPlus_Shutdown()
    Return $aResult[2]
EndFunc   ;==>_GDIPlus_GetDPI

Func _WinAPI_GetDPI($hWnd = 0)
    $hWnd = Not $hWnd ? _WinAPI_GetDesktopWindow() : $hWnd
    Local Const $hDC = _WinAPI_GetDC($hWnd)
    If @error Then Return SetError(1, 0, 0)
    Local Const $iDPI = _WinAPI_GetDeviceCaps($hDC, $LOGPIXELSX)
    If @error Or Not $iDPI Then
        _WinAPI_ReleaseDC($hWnd, $hDC)
        Return SetError(2, 0, 0)
    EndIf
    _WinAPI_ReleaseDC($hWnd, $hDC)
    Return $iDPI
EndFunc   ;==>_WinAPI_GetDPI

;https://learn.microsoft.com/en-us/windows/win32/api/shellscalingapi/nf-shellscalingapi-getdpiformonitor
Func _WinAPI_GetDpiForPrimaryMonitor($hMOnitor = 0, $dpiType = $MDT_DEFAULT)
    If $hMOnitor = 0 Then
        Local $aMonitors = _WinAPI_EnumDisplayMonitors()
        If @error Or Not IsArray($aMonitors) Then Return SetError(1, 0, 0)
        Local $i
        For $i = 1 To $aMonitors[0][0]
            If _WinAPI_GetMonitorInfo($aMonitors[$i][0])[2] = 1 Then
                $hMOnitor = $aMonitors[$i][0]
                ExitLoop
            EndIf
        Next
    EndIf
    Local $tx = DllStructCreate("int dpiX"), $tY = DllStructCreate("int dpiY")
    Local $aResult = DllCall("Shcore.dll", "long", "GetDpiForMonitor", "handle", $hMOnitor, "long", $dpiType, "struct*", $tx, "struct*", $tY)
    If @error Or Not IsArray($aResult) Then Return SetError(2, 0, 0)
    Return $tx.dpiX
EndFunc   ;==>_WinAPI_GetDpiForPrimaryMonitor

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getdpiforwindow
Func _WinAPI_GetDpiForWindow($hWnd)
    Local $aResult = DllCall("user32.dll", "uint", "GetDpiForWindow", "hwnd", $hWnd) ;requires Win10 v1607+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDpiForWindow

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getdpiforsystem
Func _WinAPI_GetDpiForSystem()
    Local $aResult = DllCall("user32.dll", "uint", "GetDpiForSystem") ;requires Win10 v1607+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDpiForSystem

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getthreaddpiawarenesscontext
Func _WinAPI_GetThreadDpiAwarenessContext()
    Local $aResult = DllCall("user32.dll", "uint", "GetThreadDpiAwarenessContext") ;requires Win10 v1607+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_GetThreadDpiAwarenessContext

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getdpifromdpiawarenesscontext
Func _WinAPI_GetDpiFromDpiAwarenessContext($DPI_AWARENESS_CONTEXT_value)
    Local $aResult = DllCall("user32.dll", "uint", "GetDpiFromDpiAwarenessContext", @AutoItX64 ? "int64" : "int", $DPI_AWARENESS_CONTEXT_value) ;requires Win10 v1803+ / Windows Server 2016+
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDpiFromDpiAwarenessContext

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getawarenessfromdpiawarenesscontext
Func _WinAPI_GetAwarenessFromDpiAwarenessContext($DPI_AWARENESS_CONTEXT_value)
    Local $aResult = DllCall("user32.dll", "uint", "GetAwarenessFromDpiAwarenessContext", @AutoItX64 ? "int64" : "int", $DPI_AWARENESS_CONTEXT_value) ;requires Win10 v1607+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_GetAwarenessFromDpiAwarenessContext

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getdpiawarenesscontextforprocess
Func _WinAPI_GetDpiAwarenessContextForProcess($hProcess)
    Local $aResult = DllCall("user32.dll", "uint", "GetDpiAwarenessContextForProcess", "handle", $hProcess) ;requires Win10 v1803+ / Windows Server 2016+
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDpiAwarenessContextForProcess

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getsystemdpiforprocess
Func _WinAPI_GetSystemDpiForProcess($hProcess)
    Local $aResult = DllCall("user32.dll", "uint", "GetSystemDpiForProcess", "handle", $hProcess) ;requires Win10 v1803+ / Windows Server 2016+
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_GetSystemDpiForProcess

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getwindowdpiawarenesscontext
Func _WinAPI_GetWindowDpiAwarenessContext($hWnd)
    Local $aResult = DllCall("user32.dll", "uint", "GetWindowDpiAwarenessContext", "hwnd", $hWnd) ;requires Win10 v1607+ / no server support
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_GetWindowDpiAwarenessContext


;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setprocessdpiawarenesscontext
Func _WinAPI_SetProcessDpiAwarenessContext($DPI_AWARENESS_CONTEXT_value)
    Local $aResult = DllCall("user32.dll", "bool", "SetProcessDpiAwarenessContext", @AutoItX64 ? "int64" : "int", $DPI_AWARENESS_CONTEXT_value) ;requires Win10 v1703+ / Windows Server 2016+
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_SetProcessDpiAwarenessContext

;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setthreaddpiawarenesscontext
Func _WinAPI_SetThreadDpiAwarenessContext($DPI_AWARENESS_CONTEXT_value)
    Local $aResult = DllCall("user32.dll", "uint", "SetThreadDpiAwarenessContext", @AutoItX64 ? "int64" : "int", $DPI_AWARENESS_CONTEXT_value) ;requires Win10 v1703+ / Windows Server 2016+
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If Not $aResult[0] Then Return SetError(2, @extended, 0)
    Return $aResult[0]
EndFunc   ;==>_WinAPI_SetThreadDpiAwarenessContext

;https://learn.microsoft.com/en-us/windows/win32/api/shellscalingapi/nf-shellscalingapi-setprocessdpiawareness
Func _WinAPI_SetProcessDpiAwareness($PROCESS_DPI_AWARENESS = $DPI_AWARENESS_PER_MONITOR_AWARE)
    Local $aResult = DllCall("Shcore.dll", "long", "SetProcessDpiAwareness", "int", $PROCESS_DPI_AWARENESS) ;requires Win 8.1+ / Server 2012 R2+
    If Not IsArray($aResult) Or @error Then Return SetError(1, @extended, 0)
    If $aResult[0] Then Return SetError(2, $aResult[0], 0)
    Return $aResult[0] ;0 is S_OK
EndFunc   ;==>_WinAPI_SetProcessDpiAwareness

Func _WinAPI_SetDPIAwareness($DPIAwareContext = $DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE, $iMode = 1)
    Switch @OSBuild
        Case 6000 To 9199
            Local $aResult = DllCall("user32.dll", "bool", "SetProcessDPIAware") ;requires Vista+ / Server 2008+
            If Not $aResult[0] Then Return SetError(1, 0, 0)
        Case 9200 To 13999
            $DPIAwareContext = ($DPIAwareContext < 0) ? 0 : ($DPIAwareContext > 2) ? 2 : $DPIAwareContext
            _WinAPI_SetProcessDpiAwareness($DPIAwareContext)
            If @error Then Return SetError(2, @error, 0)
        Case @OSBuild > 13999
            $DPIAwareContext = ($DPIAwareContext < -5) ? -5 : ($DPIAwareContext > -1) ? -1 : $DPIAwareContext
            $iMode = ($iMode < 1) ? 1 : ($iMode > 2) ? 2 : $iMode
            Local $iResult
            Switch $iMode
                Case 1
                    $iResult = _WinAPI_SetProcessDpiAwarenessContext($DPIAwareContext)
                    If Not $iResult Or @error Then Return SetError(3, 0, 0)
                Case 2
                    #cs
                        Return DPI_AWARENESS_CONTEXT values
                        $DPI_AWARENESS_CONTEXT_UNAWARE = 0x6010 / 24592
                        $DPI_AWARENESS_CONTEXT_SYSTEM_AWARE = 0x9011 / 36881
                        $DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE = 0x12 / 18
                        $DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 = 0x22 / 34
                        $DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED = 0x40006010 / 1073766416
                    #ce
                    $iResult = _WinAPI_SetThreadDpiAwarenessContext($DPIAwareContext)
                    If Not $iResult Or @error Then Return SetError(4, 0, 0)
            EndSwitch
    EndSwitch
    Local $iDPI
    If @OSBuild < 9200 Then
        $iDPI = _WinAPI_GetDPI()
        If @error Or Not $iDPI Then Return SetError(5, 0, 0)
    Else
        $iDPI = _WinAPI_GetDpiForPrimaryMonitor()
        If @error Or Not $iDPI Then Return SetError(6, 0, 0)
    EndIf

    Return $iDPI
EndFunc   ;==>_WinAPI_SetDPIAwareness
#EndRegion WinAPI DPI