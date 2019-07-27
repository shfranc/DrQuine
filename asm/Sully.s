section .data

section .text
global start
global _main
global _sprintf

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 16
leave
ret