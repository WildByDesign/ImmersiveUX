#include-once
#include <WindowsConstants.au3>
#include <GUIConstants.au3>
#include <Constants.au3>
#include <SendMessage.au3>
#include <WinAPISysWin.au3>
#include <APISysConstants.au3>
#include <Misc.au3>

; #WCD_IPC UDF# ====================================================================================================================
; Name ..........: WCD_IPC.AU3
; Description ...: Client-Server IPC with single server and unlimited clients
;                : Based on WM_COPYDATA windows messaging
;                : Basic exchange information $tagCOPYDATA = "dword data;dword len;ptr str"
;                : data = message number that serves as the request number from client
;                : str = message string that servers as additional information on client request and response information from the server
; Author ........: Nine
; Created .......: 2020-04-30
; Modified ......: 2025-11-17
; Remarks .......: Tested on x86 and x64.  Support 3.3.16.0 and up.
; Related .......:
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Func _WCD_CreateServer () : create the WCD server.  Must be created first, before any clients
;   Return Server Handle
; Func _WCD_CreateClient ($sWindowTitle = "") : create a WCD client.  Optional title to help distinguish between multiple clients
;   Return Client Handle
; Func _WCD_GetServerHandle () : client required call to acquire the server handle
;   Return Server Handle
; Func _WCD_IsServerAvailable () : client call to detect server closure
;   Return boolean (true is server still available)
; Func _WCD_Send($hWndFrom, $hWndTo, $iData, $sString = "") : send message from/to client/server.
;                $hWndFrom : required field - handle of the transmitter
;                $hWndTo : required field - handle of the target
;                $iData : number of the request
;                $sString : optional string - additional information client request / server response
;   Return 1 on successful message sent
; Func _WCD_Client_GetResponse () : for client, to get response from server
;   Return String (server response) - Extended set to message number (data field)
; Func _WCD_Server_PeekRequest () : for server, to peek at the next request
;   Return String (client additional information request) - Extended set to message number (data field)
; Func _WCD_Server_GetRequest () : for server, to get the next request on a FIFO basis
;   Return Array [0] = handle of the client [1] = client additional information request - Extended set to message number (data field)
; Func _WCD_Server_IsRequestAvail () : for server, to know if a request is avaiable
;   Return boolean (true if client request is available)
; Func _WCD_WM_COPYDATA_CLIENT_HANDLER($hWnd, $iMsg, $wParam, $lParam) : client message handler (internal use)
; Func _WCD_WM_COPYDATA_SERVER_HANDLER($hWnd, $iMsg, $wParam, $lParam) : server message handler (internal use)
; ===============================================================================================================================

Global Const $tagCOPYDATA = "ptr data;dword len;ptr str"
Global Const $WCD_SERVER_WINDOW_NAME = "WCDServer"
Global Const $WCD_PILE_LENGTH = 500
Global Const $_WCD_LOGFILE = "WCD_Logfile.log"

Global $_WCD_ServerRequestPile[0][3], $_WCD_in = 0, $_WCD_out = 0
Global $_WCD_ClientResponse[3]
Global $_WCD_Verbose = False

Func _WCD_CreateServer()
  If Not _Singleton("WCD_IPC", 1) Then Exit MsgBox($MB_SYSTEMMODAL, "Error", "An Instance of the server already exists")
  __WCD_Verbose("==============  Server initiated ==============")
  __WCD_CheckAdminRights()
  If @error Then Return SetError(1)
  ReDim $_WCD_ServerRequestPile[$WCD_PILE_LENGTH][3]
  Local $hWCD = GUICreate($WCD_SERVER_WINDOW_NAME)
  __WCD_Verbose("Server handle = " & $hWCD)
  GUIRegisterMsg($WM_COPYDATA, _WCD_WM_COPYDATA_SERVER_HANDLER)
  Return $hWCD
EndFunc   ;==>_WCD_CreateServer

Func _WCD_CreateClient($sWindowTitle = "")
  If Not _WCD_IsServerAvailable() Then Exit MsgBox($MB_SYSTEMMODAL, "Error", "You must start the WCD Server first")
  __WCD_Verbose("--------------  Client initiated --------------")
  __WCD_CheckAdminRights()
  If @error Then Return SetError(1)
  Local $hWCD = GUICreate($sWindowTitle)
  __WCD_Verbose("Client handle = " & $hWCD)
  GUIRegisterMsg($WM_COPYDATA, _WCD_WM_COPYDATA_CLIENT_HANDLER)
  Return $hWCD
EndFunc   ;==>_WCD_CreateClient

Func _WCD_GetServerHandle()
  Return WinGetHandle($WCD_SERVER_WINDOW_NAME)
EndFunc   ;==>_WCD_GetServerHandle

Func _WCD_IsServerAvailable()
  Return WinExists($WCD_SERVER_WINDOW_NAME)
EndFunc   ;==>_WCD_IsServerAvailable

Func _WCD_Send($hWndFrom, $hWndTo, $iData, $sString = "")
  Local $tData = DllStructCreate($tagCOPYDATA)
  Local $iLen = StringLen($sString)
  If $iLen Then
    $tData.len = $iLen + 1
    Local $tStr = DllStructCreate('char str[' & $tData.len & ']')
    $tStr.str = $sString
    $tData.str = DllStructGetPtr($tStr)
  EndIf
  $tData.data = $iData
  __WCD_Verbose("Sending From " & $hWndFrom & " To " & $hWndTo & " with Data " & $iData & " and String " & $sString)
  Return _SendMessage($hWndTo, $WM_COPYDATA, $hWndFrom, DllStructGetPtr($tData))
EndFunc   ;==>_WCD_Send

Func _WCD_WM_COPYDATA_CLIENT_HANDLER($hWnd, $iMsg, $wParam, $lParam)
  Local $tData = DllStructCreate($tagCOPYDATA, $lParam), $sString = ""
  If $tData.len Then
    Local $tStr = DllStructCreate('char str[' & $tData.len - 1 & ']', $tData.str)
    $sString = $tStr.str
  EndIf
  $_WCD_ClientResponse[0] = True
  $_WCD_ClientResponse[1] = $tData.data
  $_WCD_ClientResponse[2] = $sString
  __WCD_Verbose("Client Reception From " & $wParam & " To " & $hWnd & " with Data " & $tData.data & " and String " & $sString)
  Return 1
EndFunc   ;==>_WCD_WM_COPYDATA_CLIENT_HANDLER

Func _WCD_Client_GetResponse()
  If Not $_WCD_ClientResponse[0] Then Return ""
  $_WCD_ClientResponse[0] = False
  __WCD_Verbose("Client Response cleared with data " & $_WCD_ClientResponse[1] & " and string " & $_WCD_ClientResponse[2])
  Return SetExtended($_WCD_ClientResponse[1], $_WCD_ClientResponse[2])
EndFunc   ;==>_WCD_Client_GetResponse

Func _WCD_WM_COPYDATA_SERVER_HANDLER($hWnd, $iMsg, $wParam, $lParam)
  Local $tData = DllStructCreate($tagCOPYDATA, $lParam), $sString = ""
  If $tData.len Then
    Local $tStr = DllStructCreate('char str[' & $tData.len - 1 & ']', $tData.str)
    $sString = $tStr.str
  EndIf
  $_WCD_ServerRequestPile[$_WCD_in][0] = $wParam
  $_WCD_ServerRequestPile[$_WCD_in][1] = $tData.data
  $_WCD_ServerRequestPile[$_WCD_in][2] = $sString
  $_WCD_in += 1
  If $_WCD_in = $WCD_PILE_LENGTH Then $_WCD_in = 0
  __WCD_Verbose("Server Reception From " & $wParam & " To " & $hWnd & " with Data " & $tData.data & " and String " & $sString)
  Return 1
EndFunc   ;==>_WCD_WM_COPYDATA_SERVER_HANDLER

Func _WCD_Server_PeekRequest()
  If $_WCD_in = $_WCD_out Then Return ""
  __WCD_Verbose("Server Peek Request with data set @extended " & $_WCD_ServerRequestPile[$_WCD_out][1] & _
      " and string returned " & $_WCD_ServerRequestPile[$_WCD_in][2])
  Return SetExtended($_WCD_ServerRequestPile[$_WCD_out][1], $_WCD_ServerRequestPile[$_WCD_in][2])
EndFunc   ;==>_WCD_Server_PeekRequest

Func _WCD_Server_GetRequest()
  If $_WCD_in = $_WCD_out Then Return ""
  Local $iCurrent = $_WCD_out
  $_WCD_out += 1
  If $_WCD_out = $WCD_PILE_LENGTH Then $_WCD_out = 0
  Local $aRet = [$_WCD_ServerRequestPile[$iCurrent][0], $_WCD_ServerRequestPile[$iCurrent][2]]
  __WCD_Verbose("Server Get Request with data set @extended " & $_WCD_ServerRequestPile[$iCurrent][1] & _
      " and array returned (wParam | String) " & $_WCD_ServerRequestPile[$iCurrent][0] & "|" & $_WCD_ServerRequestPile[$iCurrent][2])
  Return SetExtended($_WCD_ServerRequestPile[$iCurrent][1], $aRet)
EndFunc   ;==>_WCD_Server_GetRequest

Func _WCD_Server_IsRequestAvail()
  Return $_WCD_in <> $_WCD_out
EndFunc   ;==>_WCD_Server_IsRequestAvail

Func __WCD_Exit()
  Local $iRep
  If _WCD_Server_IsRequestAvail() Then
    $iRep = MsgBox($MB_ICONWARNING + $MB_OKCANCEL, "WCD Server", "There are still some unprocessed requests." & @CRLF & "Are you sure you want to exit ?")
    If $iRep = $IDCANCEL Then Return
  EndIf
  Exit
EndFunc   ;==>__WCD_Exit

Func __WCD_Verbose($sMessage)
  If Not $_WCD_Verbose Then Return
  Local Const $sTime = "[" & @YEAR & "-" & @MON & "-" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC & "] "
  FileWriteLine($_WCD_LOGFILE, $sTime & $sMessage)
EndFunc   ;==>__WCD_Verbose

Func __WCD_CheckAdminRights()
  If IsAdmin() Then
    If Not _WinAPI_ChangeWindowMessageFilterEx(0, $WM_COPYDATA, $MSGFLT_ALLOW) Then Return SetError(1)
    __WCD_Verbose("Warning : messages are now allowed with lower privilege windows")
  EndIf
EndFunc   ;==>__WCD_CheckAdminRights
