; Grace
section .data
code: db "%s", 0

section .text
global start
global _main
extern _printf

start:
call _main
ret

_main:
ret