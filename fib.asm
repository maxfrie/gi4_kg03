SECTION .data
	; no data

SECTION .text
	global fib

fib:
	PUSH ebp	; create new Stackframe
	MOV ebp, esp

	CMP dword [ebp+8], 0
	JE l1
	CMP dword [ebp+8], 1
	JE l2

	MOV ecx, dword [ebp+8]
	DEC ecx
	PUSH ecx
	CALL fib

	PUSH eax
	
	MOV ecx, dword [ebp+8]
	SUB ecx, 2
	PUSH ecx
	CALL fib
	ADD esp, 4

	POP edx
	ADD eax, edx
	JMP return	
l1:
	MOV eax, 0
	JMP return
l2:
	MOV eax, 1
	
return:
	MOV esp, ebp
	POP ebp
	RET
