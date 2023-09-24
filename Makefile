CC=gcc
all: run

run: run.c
	$(CC) -z execstack run.c -o run

clean:
	rm run arm_rev_sh.o arm_rev_sh arm_rev_sh.bin shellcode
