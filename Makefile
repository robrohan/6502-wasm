.PHONEY: build

CC=clang
# https://cc65.github.io/
6502CC=cc65
6502ASM=ca65
6502LNK=ld65

help:
	@echo "Hi"

setup:
#	https://cc65.github.io/
	sudo apt-get update
	sudo apt-get install cc65

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

asm:
	$(6502ASM) --cpu 6502 \
		-o build/basic.o \
		-W1 \
		tests/basic.asm
# -t none
	$(6502LNK) \
		-C tests/mon.cfg \
		-o build/basic \
		build/basic.o

# Run a GPL version of a 6502 emulator (temp until I can write it out)
6502js:
	busboy --root=6502js-master
