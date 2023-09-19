#include <stdint.h>
#include "fake6502.h"
#include "wasm.h"
#include "basic.h"

// EXPORT uint8_t ram[65535];

EXPORT
uint8_t read6502(uint16_t address) 
{
    return ram[address];
}

EXPORT
void write6502(uint16_t address, uint8_t value)
{
    ram[address] = value;
}

int main()
{
    reset6502();
    // exec6502(1000);
    step6502();
    step6502();
    step6502();

    // printf("Ran.\n");
    return 0;
}
