
    .org  $F000
;    .BYTE "HELLO"

LDX #$01

start:
    STA $200,X          ; offset
    INX
    JMP start
