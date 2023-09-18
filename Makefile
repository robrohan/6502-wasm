.PHONEY: build

CC=clang

help:
	@echo "Hi"

clean:
	rm -rf build

build:
	mkdir -p build
	$(CC) -o build/board src/board.c src/fake6502.c

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

6502js:
	busboy --root=6502js-master
