/* Grace */
#include <stdio.h>
#include <fcntl.h>
#define NEWLINE 10
#define QUOTE 34
#define start main
int start()
{ char *code = "/* Grace */%1$c#include <stdio.h>%1$c#include <fcntl.h>%1$c#define NEWLINE 10%1$c#define QUOTE 34%1$c#define start main%1$cint start()%1$c{ char *code = %2$c%s%2$c;%1$cint fd = open(%2$cGrace_kid.c%2$c, O_RDWR | O_CREAT, 00644);%1$cdprintf(fd, code, NEWLINE, QUOTE, code);%1$c}%1$c";
int fd = open("Grace_kid.c", O_RDWR | O_CREAT, 00644);
dprintf(fd, code, NEWLINE, QUOTE, code);
}