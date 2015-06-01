CC = gcc
CFLAGS = -m32
ASM = nasm
ASMFLAGS = -f elf32 -g -F dwarf

NAME = Prog

.PHONY: clean all

$(NAME): main.o fib.o
	$(CC) $(CFLAGS) -o $(NAME) main.o fib.o

main.o:	main.asm
	$(ASM) $(ASMFLAGS) -o main.o main.asm

fib.o: fib.asm
	$(ASM) $(ASMFLAGS) -o fib.o fib.asm

all:
	make $(NAME)

clean:
	rm $(NAME) *.o
