SECTION .data
	; no data

SECTION .text
	global fib

fib:
	PUSH ebp	; create new Stackframe
	MOV ebp, esp

	CMP dword [ebp+8], 0	; Prüfe ob Parameter n 0 oder 1
	JE l1
	CMP dword [ebp+8], 1
	JE l2

	; Nun wird fib(n) = fib(n-1) + fib(n-2) ausgeführt
	MOV ecx, dword [ebp+8]
	DEC ecx
	PUSH ecx
	CALL fib 	; fib(n-1) aufrufen
	ADD esp, 4	; Parameter vom Stack nehmen

	MOV edx, eax	; erstes Teilergebnis sichern
	
	MOV ecx, dword [ebp+8]
	SUB ecx, 2
	PUSH ecx
	CALL fib	; fib(n-2) aufrufen
	ADD esp, 4	; Parameter vom Stack nehmen

	ADD eax, edx	; Summiere: fib(n-1) + fib(n-2)
	JMP return	
l1:
	MOV eax, 0	; wenn n = 0 return 0
	JMP return
l2:
	MOV eax, 1	; wenn n = 1 return 1
	
return:
	MOV esp, ebp	; Stackframe restaurieren und Rückgabe
	POP ebp
	RET
