%include "in_out.asm"

SECTION .data
msg db 'введите N: ', 0h

SECTION .bss
N: resb 10

SECTION .text
global _start

_start:
mov eax,msg
call sprint

mov ecx,N
mov edx,10
call sread

mov eax,N
call atoi
mov [N],eax

mov ecx,[N]

label:
push ecx
sub ecx,1
mov [N],ecx
mov eax, [N]
call iprintLF
pop ecx
loop label 

call quit