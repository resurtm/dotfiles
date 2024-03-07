; --- VERSION 1 --- BEGIN ---
; MS Windows -- switch language layouts with Caps Lock
; capslock::
;    send {Lalt down}{Shift}{Lalt up}
; return
; --- VERSION 1 --- END ---

; --- VERSION 2 --- BEGIN ---
; https://superuser.com/a/1323924
; https://learn.microsoft.com/de-de/windows/win32/intl/language-identifier-constants-and-strings?redirectedfrom=MSDN
; https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-LCID/%5bMS-LCID%5d-210407.pdf
; CapsLock::
; Send, {Alt Down}{Shift Down}{Shift Up}{Alt Up}

; if !LangID := GetKeyboardLanguage(WinActive("A")) {
;     MsgBox, % "GetKeyboardLayout function failed " ErrorLevel
;     return
; }

; if LangID = 0x0407
;     Send, {Alt Down}{Shift Down}{Shift Up}{Alt Up}
; return

; GetKeyboardLanguage(_hWnd=0) {
;     if !_hWnd
;         ThreadId=0
;     else if !ThreadId := DllCall("user32.dll\GetWindowThreadProcessId", "Ptr", _hWnd, "UInt", 0, "UInt")
;         return false

;     if !KBLayout := DllCall("user32.dll\GetKeyboardLayout", "UInt", ThreadId, "UInt")
;         return false

;     return KBLayout & 0xFFFF
; }
; --- VERSION 2 --- END ---

; --- VERSION 3 --- BEGIN ---
; https://superuser.com/a/1323924
; https://learn.microsoft.com/de-de/windows/win32/intl/language-identifier-constants-and-strings?redirectedfrom=MSDN
; https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-LCID/%5bMS-LCID%5d-210407.pdf
CapsLock::
LangID := GetKeyboardLanguage(WinActive("A"))
; MsgBox % LangID
if (LangID = 0x043F or LangID = 0x0419 or LangID = 0x0407) {
    Send, {Shift Down}{Control Down}1{Control Up}{Shift Up}
} else {
    Send, {Shift Down}{Control Down}2{Control Up}{Shift Up}
}
return
GetKeyboardLanguage(_hWnd=0) {
    if !_hWnd
        ThreadId=0
    else if !ThreadId := DllCall("user32.dll\GetWindowThreadProcessId", "Ptr", _hWnd, "UInt", 0, "UInt")
        return false
    if !KBLayout := DllCall("user32.dll\GetKeyboardLayout", "UInt", ThreadId, "UInt")
        return false
    return KBLayout & 0xFFFF
}
; --- VERSION 3 --- END ---
