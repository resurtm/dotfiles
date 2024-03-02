; MS Windows -- German umlauts typing
; https://www.autohotkey.com/board/topic/2598-yet-another-american-keyboard-remapper-for-german-umlauts/?p=295105

; -- WinKey based switching, BEGIN --
; # is the WinKey
;#a:: Send {ASC 0228}
;#o:: Send {ASC 0246}
;#u:: Send {ASC 0252}
;#s:: Send {ASC 0223}
;#+a:: Send {ASC 0196}
;#+o:: Send {ASC 0214}
;#+u:: Send {ASC 0220}
;#+s:: Send {U+1E9E} ; großes "ß" == "ẞ"
; -- WinKey based switching, END --

; -- Right Ctrl based switching, BEGIN --
>^a:: Send {ASC 0228}
>^o:: Send {ASC 0246}
>^u:: Send {ASC 0252}
>^s:: Send {ASC 0223}
>^+a:: Send {ASC 0196}
>^+o:: Send {ASC 0214}
>^+u:: Send {ASC 0220}
>^+s:: Send {U+1E9E} ; großes "ß" == "ẞ"
; -- Right Ctrl based switching, END --
