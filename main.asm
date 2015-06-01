extern fib

SECTION .data
	n DD 5	; fib(n)

SECTION .text
	GLOBAL main

main:
	PUSH ebp	; init new Stackframe
	MOV ebp, esp

	PUSH dword [n]
	CALL fib ; Fakultät Funktion aufrufen. Rueckgabe in eax

	; Stackframe restaurieren und exit(0)
	MOV esp, ebp
	POP ebp

	MOV ebx, 0
	MOV eax, 1
	INT 0x80
