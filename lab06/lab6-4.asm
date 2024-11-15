%include     'in_out.asm' 

  SECTION .data
   msg:  DB  'Введите значение переменной x: ',0
   rem:  DB  'результатт: ',0
    
   SECTION   .bss
   x:    RESB 80      ; Переменная, значение к-рой будем вводить с клавиатуры
      
   SECTION .text
   GLOBAL _start
     _start:
         
; ----    вычисление выражения

   mov  eax,msg
   call sprint
    
   mov ecx, x
   mov edx, 80
   call sread
      
   mov eax,x            ; Вызов подпрограммы преобразования
   call atoi            ; ASCII кода в число, 'eax=x'
      
   xor edx,edx          ; обнуляем EDX для корректной работы div
   mov ebx,3            ; EBX=3
   div ebx              ; EAX=EAX/3, EDX=остаток от деления 
   add eax,5            ; EAX=EAX+5 = (x/3)+5
   mov ebx,7            ; EBX=7
   mul ebx              ; EAX=EAX*EBX = ((x/3)+5)*7
   mov edi,eax          ; запись результата вычисления в 'edi'
   
    
 ; ---- Вывод результата на экран
  
    mov  eax,rem            ; Вызов подпрограммы печати
    call sprint           ; сообщения 'Остаток от деления: '
    mov  eax,edi           ; Вызов подпрограммы печати значения
    call iprintLF          ; из 'edx' (остаток) в виде символов
  
    
    call  quit              ; Вызов подпрограммы завершения
