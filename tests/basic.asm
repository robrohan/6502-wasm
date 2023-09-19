; RESET = 0xFFFC 0xFFFD
; PC    = 0xFFFA 0xFFFB
; IRQ   = 0xFFFE 0XFFFF
; SP    = 0xFD

    .org  $8000

LDX #$01
LDY #$02

start:
    STA $200,X          ; offset
    ; STA $300,X          ; offset
    ; STA $400,X          ; offset
    INX
    JMP start
