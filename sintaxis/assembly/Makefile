script: script.o
	ld -o script script.o

script.o: script.asm
	nasm -f  elf script.asm

clean:
	rm *.o script
