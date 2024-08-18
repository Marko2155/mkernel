all:
	@nasm -f bin -o ./boot.bin ./src/boot.asm
	@qemu-system-x86_64 -drive file=boot.bin,format=raw,index=0,media=disk
