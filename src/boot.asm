bits 16
org 0x7c00


boot:
	mov ah, 0x06
	xor al, al
	xor cx, cx
	mov dx, 0x184f
	mov bh, 0x1F
	int 0x10
	mov si, text
	mov ah, 0x0e
.loop:
	lodsb
	or al, al
	jz halt
	int 0x10
	jmp .loop
halt:
	mov ah, 0x01
	mov ch, 0x20
	mov cl, 0x20
	int 0x10
	cli
	hlt
text: db "   O     O", 13, 10, "   O     O", 13, 10, "   O     O", 13, 10, "", 13, 10, "  O       O", 13, 10, "   OOOOOOO", 13, 10, 13, 10, 13, 10, "Hello Assembly!", 13, 10, "Made by Marko2155 (https://youtube.com/c/Marko2155)", 0
times 510-($-$$) db 0
dw 0xaa55
