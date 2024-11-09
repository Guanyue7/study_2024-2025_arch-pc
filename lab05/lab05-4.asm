;--------------------------------------------------------------------------------------------------------------------------
;Программа вывода сообщения на экран и ввода строки с клавиатуры
;--------------------------------------------------------------------------------------------------------------------------


 %include 'in_out.asm'              ; подключение внешнего файла


 SECTION .data                  ; Секция инициированных данных
 msg  DB  'Введите строку:',0h  ; сообщение


 SECTION   .bss       ; Секция не инициированных данных
 buf1:     RESB 80    ; Буфер размером 80 байт


  SECTION .text        ; Код программы
     GLOBAL _start     ; Начало программы
     _start:           ; Точка входа в программу


      mov   eax, msg    ; запись адреса выводимого сообщения в 'EAX'
      call  sprint      ; вызов подпрограммы печати сообщения


      mov   ecx, buf1   ; запись адреса переменной в 'EAX'
      mov   edx, 80     ; запись длины вводимого сообщения в 'EBX'

      call  sread       ; вызов подпрограммы ввода сообщения

      mov   eax,4       ; Системнный вызов для записи (sys_write)
      mov   ebx,1       ; Описатель файла 1 -  стандартный вывод
      mov   ecx,buf1    ; Адрес строки 'msg' в 'ecx'
      int   80h         ; Вызов ядра
      call  quit        ; вызов подпрограммы завершения
