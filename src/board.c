#include <stdint.h>
#include "fake6502.h"
#include "wasm.h"

////////////////////////////
#include "rom.h"
EXPORT uint8_t zp[0x0100];
EXPORT uint8_t stack[0x0100];
EXPORT uint8_t ram[0x4000];
EXPORT uint8_t io[0x4000];
////////////////////////////

EXPORT
uint8_t read6502(uint16_t address) 
{
    if(address == 0xFFFC) return 0x00;
    if(address == 0xFFFD) return 0x80;

    if(address <= 0x00FF) 
    {
        return zp[address];
    }
    else if(address <= 0x01FF) 
    {
        return stack[address - 0x0100];
    }
    else if(address >= 0x4000 && address < 0x8000)
    {
        return ram[address - 0x4000];
    }
    // else if(address <= 0x8000)
    // {
    //     return io[address - 0x4000];
    // }
    else
    {
        return rom[address - 0x8000];
    }
    return 0; // ram[address];
}

EXPORT
void write6502(uint16_t address, uint8_t value)
{
    if(address <= 0x00FF) 
    {
        zp[address] = value;
    }
    else if(address <= 0x01FF) 
    {
        stack[address - 0x0100] = value;
    }
    else if(address >= 0x4000 && address < 0x8000)
    {
        ram[address - 0x4000] = value;
    }
    // else if(address <= 0x8000)
    // {
    //     io[address - 0x4000] = value;
    // }
    else
    {
        rom[address - 0x8000] = value;
    }
    // ram[address] = value;
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
