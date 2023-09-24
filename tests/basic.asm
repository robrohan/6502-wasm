; RESET = 0xFFFC 0xFFFD
; PC    = 0xFFFA 0xFFFB
; IRQ   = 0xFFFE 0XFFFF
; SP    = 0xFD

;    .org  $8000

LDX #$06
LDY #$07

LDA #$06
CLC
ADC #$07

LDX #$00
start:
    STA $4000,X          ; offset
    INX
    JMP start
