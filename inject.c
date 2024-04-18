#include<string.h>
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char *argv[]) {
        char cmdbuf[2048] = {0};
        char buf[2048] = {0};
        printf("usage: $(<inject_comand_here>)");
        scanf("%2048s", buf);
        snprintf(cmdbuf, 2048, "echo \" %s\"", buf);
        system(cmdbuf);
}
