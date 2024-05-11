; MS Windows -- switch Chrome tabs both with Ctrl+<NUM> and Alt+<NUM>
#IfWinActive ahk_exe chrome.exe
!1::SwitchTab(1)
!2::SwitchTab(2)
!3::SwitchTab(3)
!4::SwitchTab(4)
!5::SwitchTab(5)
!6::SwitchTab(6)
!7::SwitchTab(7)
!8::SwitchTab(8)
#IfWinActive

; MS Windows -- switch Brave tabs both with Ctrl+<NUM> and Alt+<NUM>
#IfWinActive ahk_exe brave.exe
!1::SwitchTab(1)
!2::SwitchTab(2)
!3::SwitchTab(3)
!4::SwitchTab(4)
!5::SwitchTab(5)
!6::SwitchTab(6)
!7::SwitchTab(7)
!8::SwitchTab(8)
#IfWinActive

SwitchTab(number) {
    SendInput ^%number%
}
