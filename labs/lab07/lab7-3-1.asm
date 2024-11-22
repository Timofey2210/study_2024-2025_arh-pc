%include 'in_out.asm'
section .data
msg1 db 'Введите A: ',0h
msg2 db 'Введите В: ',0h
msg3 db 'Введите С: ',0h
msg4 db "Наименьшее число: ",0h
section .bss
min resb 10
A resb 10
B resb 10
C resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите A: '
mov eax,msg1
call sprint
; ---------- Ввод 'A'
mov ecx,A
mov edx,10
call sread
; ---------- Преобразование 'A' из символа в число
mov eax,A
call atoi ; Вызов подпрограммы перевода символа в число
mov [A],eax ; запись преобразованного числа в 'B'
; ---------- Вывод сообщения 'Введите B: '
mov eax,msg2
call sprint
; ---------- Ввод 'B'
mov ecx,B
mov edx,10
call sread
mov eax,B
call atoi
mov [B],eax
; ---------- Вывод сообщения 'Введите C: '
mov eax,msg3
call sprint
; ---------- Ввод 'C'
mov ecx,C
mov edx,10
call sread
; ---------- Преобразование 'C' из символа в число
mov eax,C
call atoi ; Вызов подпрограммы перевода символа в число
mov [C],eax ; запись преобразованного числа в 'C
mov ecx,[A] 
mov [min],ecx 
cmp ecx,[C] 
jl check_B 
mov ecx,[C] 
mov [min],ecx
check_B:
mov eax,[min]
cmp ecx,[B]
jl fin
mov ecx,[B]
mov [min],ecx
fin:
mov eax, msg4
call sprint 
mov eax,[min]
call iprintLF 
call quit 