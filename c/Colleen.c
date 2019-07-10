/* Colleen */
#include <stdio.h>
#define	TAB		9
#define	NEWLINE	10
#define	QUOTE	34

void print(char *code)
{
	/* print source code */
	printf(code, NEWLINE, TAB, QUOTE, code);
}

int	main()
{
	char	*code = "/* Colleen */%1$c#include <stdio.h>%1$c#define%2$cTAB%2$c%2$c9%1$c#define%2$cNEWLINE%2$c10%1$c#define%2$cQUOTE%2$c34%1$c%1$cvoid print(char *code)%1$c{%1$c%2$c/* print source code */%1$c%2$cprintf(code, NEWLINE, TAB, QUOTE, code);%1$c}%1$c%1$cint%2$cmain()%1$c{%1$c%2$cchar%2$c*code = %3$c%s%3$c;%1$c%2$cprint(code);%1$c%2$creturn 0;%1$c}%1$c";
	print(code);
	return 0;
}
