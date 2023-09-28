;======================================
;
;======================================
LDX #$06
LDY #$07

LDA #$06
CLC
ADC #$07

LDA #$00
LDX #$00

start:
    STA $2000, X          ; offset
    STA $2100, X
    STA $2200, X
    STA $2300, X
    STA $2400, X
    STA $2500, X
    STA $2600, X
    STA $2700, X
    STA $2800, X
    STA $2900, X
    STA $2A00, X
    STA $2B00, X
    STA $2C00, X
    STA $2D00, X
    STA $2E00, X
    STA $2F00, X
    STA $3000, X          ; offset
    STA $3100, X
    STA $3200, X
    STA $3300, X
    STA $3400, X
    STA $3500, X
    STA $3600, X
    STA $3700, X
    STA $3800, X
    STA $3900, X
    STA $3A00, X
    STA $3B00, X
    STA $3C00, X
    STA $3D00, X
    STA $3E00, X
    STA $3F00, X
    ; STA $4000, X
    INX
    ADC #$01
    JMP start
