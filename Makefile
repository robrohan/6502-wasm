.PHONEY: build

CC=clang
# https://cc65.github.io/
6502CC=cc65
6502ASM=ca65
6502LNK=ld65

# pixels
ASM=basic

help:
	@echo "Hi"

setup:
#	https://cc65.github.io/
	sudo apt-get update
	sudo apt-get install cc65
	sudo apt-get install lld

clean:
	rm -rf build

build:
	mkdir -p build
	$(CC) -o build/board src/board.c src/fake6502.c

# Compile the 6502 CPU emulator into WASM
wasm:
	mkdir -p build
	$(CC) \
		--target=wasm32 \
		-std=c99 \
		-Wall \
		-Wextra \
		-g \
		-O3 -flto \
		-nostdlib \
		-Wl,--export-dynamic \
		-Wl,--no-entry \
		-Wl,--lto-O3 \
		-Wl,-z,stack-size=$$(( 8 * 1024 * 1024 )) \
		-o build/6502.wasm \
		src/board.c src/fake6502.c
	cp public/index.html build/index.html

serve_asm:
	busboy --root=./build

asm:
	mkdir -p build
#	asm to object file
	$(6502ASM) --cpu 6502 \
		-o build/$(ASM).o \
		-W1 \
		tests/$(ASM).asm
#	object to binary file
#	-t none
	$(6502LNK) \
		-C src/mon.cfg \
		-o build/rom.bin \
		build/$(ASM).o
	rm build/$(ASM).o
#	binary file to c array to include (temp)
#	xxd -i build/rom.bin > src/rom.h
