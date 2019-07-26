; Colleen
section .data
code: db "; Colleen%1$csection .data%1$ccode: db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cglobal start%1$cglobal _main%1$cextern _printf%1$c%1$cstart:%1$ccall _main%1$cret%1$c%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 16%1$clea rdi, [rel code]%1$cmov rsi, `\n`%1$cmov rdx, `%2$c`%1$clea rcx, [rel code]%1$ccall _printf ; print source code%1$cleave%1$cret%1$c", 0

section .text
global start
global _main
extern _printf

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 16
lea rdi, [rel code]
mov rsi, `\n`
mov rdx, `"`
lea rcx, [rel code]
call _printf ; print source code
leave
ret
