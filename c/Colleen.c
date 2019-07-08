/* Colleen */
#include <stdio.h>
#define NL 10
#define	QUOTE 34

void print(char *code)
{
	/* print source code */
	printf(code, QUOTE, code, QUOTE);
}

int	main()
{
	char *code = "#include <stdio.h>\n\
#define NL 10\n\
#define	QUOTE 34\n\
\n\
void print(char *code)\n\
{\n\
	/* print source code */\n\
	printf(code, QUOTE, code, QUOTE);\n\
}\n\
\n\
int	main()\n\
{\n\
	char	*code = %c%s%c;\n\
	print(code);\n\
	return 0;\n\
}\n";
	print(code);
	return 0;
}
