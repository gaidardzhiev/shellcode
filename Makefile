CC=gcc
all: run inject revsh

run: run.c
	$(CC) -z execstack run.c -o run

inject: inject.c
	$(CC) inject.c -o inject

revsh: revsh.c
	$(CC) revsh.c -o revsh

clean:
	rm revsh inject spawn_shell spawn_shell.o run arm_rev_sh.o arm_rev_sh arm_rev_sh.bin shellcode0 arm_bind_sh.o arm_bind_sh arm_bind_sh.bin shellcode1
