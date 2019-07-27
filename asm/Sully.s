%macro write_file 3
lea rdi, [rel file_name]
mov rsi, 03001o
mov rdx, 0644o
mov rax, 0x2000005
syscall
jc .leave
mov [rsp + 4], rax

mov rdi, [rsp + 4]
lea rsi, [rel code]
lea rdx, [rel code]
mov rcx, `\n`
mov r8, `"`
mov r9, `%`
mov r10, index
call _dprintf

mov rdi, [rsp + 4]
mov rax, 0x2000006
syscall
%endmacro

section .data
index: equ 5
index_1: equ index - 1
name_format: db "Sully_%d.s", 0
code: db "", 0
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