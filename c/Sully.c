#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
extern const char *__progname;
int main()
{
int i = 5;
if (i <= 0) { return 0; }
if (strcmp(__progname, "Sully") != 0) { i--; }
char filename[20]; sprintf(filename, "Sully_%d.c", i);
char *code = "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$cextern const char *__progname;%1$cint main()%1$c{%1$cint i = %4$d;%1$cif (i <= 0) { return 0; }%1$cif (strcmp(__progname, %2$cSully%2$c) != 0) { i--; }%1$cchar filename[20]; sprintf(filename, %2$cSully_%3$cd.c%2$c, i);%1$cchar *code = %2$c%5$s%2$c;%1$cint fd = open(filename, O_RDWR | O_CREAT, 00644); if (fd < 0) { return 0; }%1$cdprintf(fd, code, 10, 34, 37, i, code);%1$cchar cmd[100]; sprintf(cmd, %2$cgcc -Wall -Wextra -Werror -o Sully_%3$cd %3$cs && ./Sully_%3$cd%2$c, i, filename, i);%1$csystem(cmd); i--;%1$creturn 0;%1$c}%1$c";
int fd = open(filename, O_RDWR | O_CREAT, 00644); if (fd < 0) { return 0; }
dprintf(fd, code, 10, 34, 37, i, code);
char cmd[100]; sprintf(cmd, "gcc -Wall -Wextra -Werror -o Sully_%d %s && ./Sully_%d", i, filename, i);
system(cmd); i--;
return 0;
}
