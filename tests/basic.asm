;======================================
; Cycle through a bunch of colours on
; my made up display (which is 256x190
; when breaking the bytes into halfs 
; and using each half as a colour look
; up. Not sure this would work in the
; real world yet.
;
; This works by drawing columns of 
; colours. It puts the Accumulator into
; each section of screen by row. Then
; the display doubles the row size by
; drawing each half of the byte in a 
; column format.
;   y   $2000
; x +------------------
;   |    X1X2
;   |      
;   |     |
;   |    \ /
;   |
; Where X1 is the low order bits and X2
; is the high order bits
;
;======================================
LDX #$06
LDY #$07

LDA #$06
CLC
ADC #$07

LDA #$01
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
    STA $4000, X          ; offset
    STA $4100, X
    STA $4200, X
    STA $4300, X
    STA $4400, X
    STA $4500, X
    STA $4600, X
    STA $4700, X
    STA $4800, X
    STA $4900, X
    STA $4A00, X
    STA $4B00, X
    STA $4C00, X
    STA $4D00, X
    STA $4E00, X
    STA $4F00, X
    STA $5000, X          ; offset
    STA $5100, X
    STA $5200, X
    STA $5300, X
    STA $5400, X
    STA $5500, X
    STA $5600, X
    STA $5700, X
    STA $5800, X
    STA $5900, X
    STA $5A00, X
    STA $5B00, X
    STA $5C00, X
    STA $5D00, X
    STA $5E00, X
    STA $5F00, X
    STA $6000, X          ; offset
    STA $6100, X
    STA $6200, X
    STA $6300, X
    STA $6400, X
    STA $6500, X
    STA $6600, X
    STA $6700, X
    STA $6800, X
    ; STA $6900, X
    ; STA $6A00, X
    ; STA $6B00, X
    ; STA $6C00, X
    ; STA $6D00, X
    ; STA $6E00, X
    ; STA $6F00, X
    ; INX
    ; STA $7000, X          ; offset
    ; STA $7100, X
    ; STA $7200, X
    ; STA $7300, X
    ; STA $7400, X
    ; STA $7500, X
    ; STA $7600, X
    ; STA $7700, X
    ; STA $7800, X
    ; STA $7900, X
    ; STA $7A00, X
    ; STA $7B00, X
    ; STA $7C00, X
    ; STA $7D00, X
    ; STA $7E00, X
    ; STA $7F00, X
    INX
    ADC #$01               ; cycle accumulator
    JMP start
