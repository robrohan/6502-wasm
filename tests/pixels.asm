

start:
    LDX #$01
    LDA #$20
    STA $2000, X

    LDX #$7F
    LDA #$02
    STA $2000, X
    ; 01-80 row1 == 7F (skip last)

    LDX #$81
    LDA #$20
    STA $2000, X

    LDX #$ff
    LDA #$02
    STA $2000, X
    ; 81-ff row2 == 7E

    ; -----------

    LDX #$01
    LDA #$20
    STA $6700, X

    LDX #$7F
    LDA #$02
    STA $6700, X

    LDX #$81
    LDA #$20
    STA $6700, X

    LDX #$ff
    LDA #$02
    STA $6700, X

    JMP start
