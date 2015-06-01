extern fib

SECTION .data
	; no data

SECTION .text
	global main

main:
	PUSH ebp
	MOV ebp, esp

	PUSH 5
	CALL fib ; Ergebnis in eax

	MOV esp, ebp
	POP ebp

	MOV ebx, 0
	MOV eax, 1
	INT 0x80
