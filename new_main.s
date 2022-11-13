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
	mov	QWORD PTR -48[rbp], rsi
	mov	BYTE PTR -36[rbp], al
	mov	DWORD PTR -20[rbp], 0
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -48[rbp]
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
	add	DWORD PTR -20[rbp], 1
.L2:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rbx, eax
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	strlen@PLT
	sub	rax, 1
	cmp	rbx, rax
	jb	.L4
	movzx	eax, BYTE PTR -36[rbp]
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	Max, .-Max
	.globl	Min
	.type	Min, @function
Min:
	push	rbp
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
.LC0:
	.string	"%c\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1840
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rdx, QWORD PTR stdin[rip]
	lea	rax, -10016[rbp]
	mov	esi, 10001
	mov	rdi, rax
	call	fgets@PLT
	mov	BYTE PTR -10018[rbp], 0
	mov	BYTE PTR -10017[rbp], 127
	movsx	eax, BYTE PTR -10018[rbp]
	lea	rdx, -10016[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	Max
	mov	BYTE PTR -10018[rbp], al
	movsx	eax, BYTE PTR -10017[rbp]
	lea	rdx, -10016[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	Min
	mov	BYTE PTR -10017[rbp], al
	movsx	eax, BYTE PTR -10017[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	movsx	eax, BYTE PTR -10018[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
