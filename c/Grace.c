/*
	Grace
*/
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define FILENAME "Grace_kid.c"
#define CODE "/*%2$c%1$cGrace%2$c*/%2$c#include <stdio.h>%2$c#include <fcntl.h>%2$c#include <unistd.h>%2$c#define FILENAME %3$cGrace_kid.c%3$c%2$c#define CODE %3$c%5$s%3$c%2$c#define FT()int main(){%4$c%2$cchar *code = CODE;%4$c%2$cint fd = open(FILENAME, O_RDWR | O_CREAT | O_TRUNC, 00644); if (fd < 0) { return 0; }%4$c%2$cdprintf(fd, code, 9, 10, 34, 92, code); close(fd);%4$c%2$creturn 0;%4$c%2$c}%2$c%2$cFT()%2$c"
#define FT()int main(){\
char *code = CODE;\
int fd = open(FILENAME, O_RDWR | O_CREAT | O_TRUNC, 00644); if (fd < 0) { return 0; }\
dprintf(fd, code, 9, 10, 34, 92, code); close(fd);\
return 0;\
}

FT()
