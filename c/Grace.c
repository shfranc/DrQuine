/*
	Grace
*/
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define NEWLINE 10
#define QUOTE 34
#define start main
int start()
{ char *code = "/*%1$c%3$cGrace%1$c*/%1$c#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c#define NEWLINE 10%1$c#define QUOTE 34%1$c#define start main%1$cint start()%1$c{ char *code = %2$c%4$s%2$c;%1$cint fd = open(%2$cGrace_kid.c%2$c, O_RDWR | O_CREAT, 00644); if (fd < 0) { return 0; }%1$cdprintf(fd, code, NEWLINE, QUOTE, 9, code);%1$cclose(fd);%1$c}%1$c";
int fd = open("Grace_kid.c", O_RDWR | O_CREAT, 00644); if (fd < 0) { return 0; }
dprintf(fd, code, NEWLINE, QUOTE, 9, code);
close(fd);
}
