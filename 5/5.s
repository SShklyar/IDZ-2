	.file	"main.c"                   # Begin
	.intel_syntax noprefix      
	.text
	.globl	Max
	.type	Max, @function
Max:                                   # функция поиска максимального значения
	push	rbp                        # пролог функции
	mov	rbp, rsp
	push	rbx
	sub	rsp, 40                         
	mov	eax, edi
	mov	QWORD PTR -48[rbp], rsi        #подготовка стека
	mov	BYTE PTR -36[rbp], al
	mov	DWORD PTR -20[rbp], 0          #счетчик (i=0)
	jmp	.L2                            #переход к циклу
.L4:                                   #условный оператор который
	mov	eax, DWORD PTR -20[rbp]        #сравнивает текущий символ с
	movsx	rdx, eax                   #максимумом и перезаписывает его
	mov	rax, QWORD PTR -48[rbp]        #в случае если тек. эл-т больше
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	BYTE PTR -36[rbp], al
	jge	.L3
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -36[rbp], al
.L3:
	add	DWORD PTR -20[rbp], 1          #i++
.L2:                                   #цикл for
	mov	eax, DWORD PTR -20[rbp]        #счетчик
	movsx	rbx, eax
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	strlen@PLT                  #вычисляем длину строки
	sub	rax, 1
	cmp	rbx, rax                        #проводим сравнение (i < strlen(s1) - 1)
	jb	.L4
	movzx	eax, BYTE PTR -36[rbp]      #возвращаемое значение ф-ции Max
	mov	rbx, QWORD PTR -8[rbp]
	leave                               #возвращаем стек в исходное состояние
	ret
	.size	Max, .-Max
	.globl	Min
	.type	Min, @function
Min:                                    # функция поиска минимального значения
	push	rbp                         #абсолютно анадогична функции Max
	mov	rbp, rsp
	push	rbx
	sub	rsp, 40
	mov	eax, edi
	mov	QWORD PTR -48[rbp], rsi
	mov	BYTE PTR -36[rbp], al
	mov	DWORD PTR -20[rbp], 0
	jmp	.L7
.L9:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	BYTE PTR -36[rbp], al
	jle	.L8
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -36[rbp], al
.L8:
	add	DWORD PTR -20[rbp], 1
.L7:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rbx, eax
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	strlen@PLT
	sub	rax, 1
	cmp	rbx, rax
	jb	.L9
	movzx	eax, BYTE PTR -36[rbp]
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	Min, .-Min
	.section	.rodata
.LC0:                                  #форматная строка
	.string	"%c\n"
	.text
	.globl	main
	.type	main, @function
main:
	push    rbp                        #пролог
    mov     rbp, rsp
    sub     rsp, 10016                 #выделяем место на стеке
    mov     rdx, QWORD PTR stdin[rip]
    lea     rax, [rbp-10016]
    mov     esi, 10001
    mov     rdi, rax                   #кладем аргументы для fgets
    call    fgets                      #считываем строку
    mov     BYTE PTR [rbp-1], 0        #max = 0
    mov     BYTE PTR [rbp-2], 127      #min = 127
    movsx   eax, BYTE PTR [rbp-1]      #подготовка к передаче аргументов в ф-цию
    lea     rdx, [rbp-10016]
    mov     rsi, rdx
    mov     edi, eax
    call    Max                        #вызов функции
    mov     BYTE PTR [rbp-1], al
    movsx   eax, BYTE PTR [rbp-2]      #подготовка к передаче аргументов в ф-цию
    lea     rdx, [rbp-10016]
    mov     rsi, rdx
    mov     edi, eax
    call    Min                        #вызов функции
    mov     BYTE PTR [rbp-2], al
    movsx   eax, BYTE PTR [rbp-2]
    mov     esi, eax
    mov     edi, OFFSET FLAT:.LC0      #передаем форматную строку
    mov     eax, 0                     #кладем аргументы для printf
    call    printf                     #вывод значения min
    movsx   eax, BYTE PTR [rbp-1]
    mov     esi, eax
    mov     edi, OFFSET FLAT:.LC0      #передаем форматную строку
    mov     eax, 0                     #кладем аргументы для printf
    call    printf                     #вывод значения max
    mov     eax, 0                     #зануляем eax
    leave
    ret

