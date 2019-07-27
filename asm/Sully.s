%macro write_file 3
lea rdi, [rel %1]
mov rsi, 03001o
mov rdx, 0644o
mov rax, 0x2000005
syscall
jc .leave
mov [rsp + 4], rax

mov rdi, [rsp + 4]
lea rsi, [rel %2]
lea rdx, [rel %2]
mov rcx, `\n`
mov r8, `"`
mov r9, `%`
mov qword[rsp], %3
call _dprintf

mov rdi, [rsp + 4]
mov rax, 0x2000006
syscall
%endmacro

section .data
index: equ 5
index_1: equ index - 1
name_format: db "Sully_%d.s", 0
code: db "%4$cmacro write_file 3%2$clea rdi, [rel %4$c1]%2$cmov rsi, 03001o%2$cmov rdx, 0644o%2$cmov rax, 0x2000005%2$csyscall%2$cjc .leave%2$cmov [rsp + 4], rax%2$c%2$cmov rdi, [rsp + 4]%2$clea rsi, [rel %4$c2]%2$clea rdx, [rel %4$c2]%2$cmov rcx, `\n`%2$cmov r8, `%3$c`%2$cmov r9, `%4$c`%2$cmov qword[rsp], %4$c3%2$ccall _dprintf%2$c%2$cmov rdi, [rsp + 4]%2$cmov rax, 0x2000006%2$csyscall%2$c%4$cendmacro%2$c%2$csection .data%2$cindex: equ %5$d%2$cindex_1: equ index - 1%2$cname_format: db %3$cSully_%4$cd.s%3$c, 0%2$ccode: db %3$c%1$s%3$c, 0%2$ccompil: db %3$cnasm -f macho64 Sully_%4$c1$d.s -o objs/Sully_%4$c1$d.o && ld -macosx_version_min 10.8 -lSystem objs/Sully_%4$c1$d.o -o Sully_%4$c1$d && ./Sully_%4$c1$d%3$c, 0%2$c%2$csection .bss%2$cfile_name: resb 20%2$ccmd: resb 150%2$c%2$csection .text%2$cglobal start%2$cglobal _main%2$cextern _sprintf%2$cextern _dprintf%2$cextern _system%2$c%2$cstart:%2$ccall _main%2$cret%2$c%2$c_main:%2$cpush rbp%2$cmov rbp, rsp%2$csub rsp, 64%2$c; write itself%2$cmov rdi, file_name%2$cmov rsi, name_format%2$cmov rdx, index%2$ccall _sprintf%2$cwrite_file file_name, code, index%2$c; if index is not 0%2$cmov qword[rsp], index%2$ccmp qword[rsp], 0%2$cje .leave%2$c; write a son%2$cmov rdi, file_name%2$cmov rsi, name_format%2$cmov rdx, index_1%2$ccall _sprintf%2$cwrite_file file_name, code, index_1%2$c; and execute son%2$cmov rdi, cmd%2$cmov rsi, compil%2$cmov rdx, index_1%2$ccall _sprintf%2$cmov rdi, cmd%2$ccall _system%2$c.leave:%2$cleave%2$cret%2$c", 0
compil: db "nasm -f macho64 Sully_%1$d.s -o objs/Sully_%1$d.o && ld -macosx_version_min 10.8 -lSystem objs/Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d", 0

section .bss
file_name: resb 20
cmd: resb 150

section .text
global start
global _main
extern _sprintf
extern _dprintf
extern _system

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 64
; write itself
mov rdi, file_name
mov rsi, name_format
mov rdx, index
call _sprintf
write_file file_name, code, index
; if index is not 0
mov qword[rsp], index
cmp qword[rsp], 0
je .leave
; write a son
mov rdi, file_name
mov rsi, name_format
mov rdx, index_1
call _sprintf
write_file file_name, code, index_1
; and execute son
mov rdi, cmd
mov rsi, compil
mov rdx, index_1
call _sprintf
mov rdi, cmd
call _system
.leave:
leave
ret