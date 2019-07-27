; Grace
%define begin _main
%define OPEN 0x2000005
%define CLOSE 0x2000006
section .data
file_name: db "Grace_kid.s", 0
code: db "; Grace%2$c%4$cdefine begin _main%2$c%4$cdefine OPEN 0x2000005%2$c%4$cdefine CLOSE 0x2000006%2$csection .data%2$cfile_name: db %3$cGrace_kid.s%3$c, 0%2$ccode: db %3$c%1$s%3$c, 0%2$c%2$csection .text%2$cglobal start%2$cglobal begin%2$cextern _dprintf%2$c%2$cstart:%2$ccall begin%2$cret%2$c%2$cbegin:%2$cpush rbp%2$cmov rbp, rsp%2$csub rsp, 16%2$c%2$clea rdi, [rel file_name]%2$cmov rsi, 0x0201%2$cmov rdx, 0x1A4%2$cmov rax, OPEN%2$csyscall%2$cjc .leave%2$cmov [rsp], rax%2$c%2$cmov rdi, [rsp]%2$clea rsi, [rel code]%2$clea rdx, [rel code]%2$cmov rcx, `\n`%2$cmov r8, `%3$c`%2$cmov r9, `%4$c`%2$ccall _dprintf%2$c%2$cmov rdi, [rsp]%2$cmov rax, CLOSE%2$csyscall%2$c%2$c.leave:%2$cleave%2$cret%2$c", 0

section .text
global start
global begin
extern _dprintf

start:
call begin
ret

begin:
push rbp
mov rbp, rsp
sub rsp, 16

lea rdi, [rel file_name]
mov rsi, 0x0201
mov rdx, 0x1A4
mov rax, OPEN
syscall
jc .leave
mov [rsp], rax

mov rdi, [rsp]
lea rsi, [rel code]
lea rdx, [rel code]
mov rcx, `\n`
mov r8, `"`
mov r9, `%`
call _dprintf

mov rdi, [rsp]
mov rax, CLOSE
syscall

.leave:
leave
ret
