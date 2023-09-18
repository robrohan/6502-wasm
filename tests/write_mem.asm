; Program starts at $0600
; Screen space is $200 to $5ff

LDA #$01
LDX #$00

start:
    LDA $fe             ; Load the value stored in fe. With a # would be the number fe
    STA $200,X          ; offset

    LDA $fe
    STA $300,X

    LDA $fe
    STA $400,X

    LDA $fe
    STA $500,X
    
    INX
    JMP start
