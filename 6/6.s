.intel_syntax noprefix
.global main
.extern printf
.extern fgets
.extern strlen
.extern stdin
.section .text
Max:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     eax, edi
        mov     QWORD PTR [rbp-48], rsi
        mov     BYTE PTR [rbp-36], al
        mov     ecx, 0                          #было: mov     DWORD PTR [rbp-20], 0
        jmp     .L2
.L4:
        mov     eax, ecx                        #было: mov     eax, DWORD PTR [rbp-20]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-48]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     BYTE PTR [rbp-36], al
        jge     .L3
        mov     eax, ecx                        #было: mov     eax, DWORD PTR [rbp-20]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-48]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rbp-36], al
.L3:
        add     ecx, 1                          #было: add     DWORD PTR [rbp-20], 1
.L2:
        mov     eax, ecx                        #было: mov     eax, DWORD PTR [rbp-20]
        movsx   rbx, eax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    strlen
        sub     rax, 1
        cmp     rbx, rax
        jb      .L4
        movzx   eax, BYTE PTR [rbp-36]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
Min:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     eax, edi
        mov     QWORD PTR [rbp-48], rsi
        mov     BYTE PTR [rbp-36], al
        mov     ecx, 0                          #было: mov     DWORD PTR [rbp-20], 0
        jmp     .L7
.L9:
        mov     eax, ecx                        #было: mov     eax, DWORD PTR [rbp-20]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-48]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     BYTE PTR [rbp-36], al
        jle     .L8
        mov     eax, ecx                        #было: mov     eax, DWORD PTR [rbp-20]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-48]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rbp-36], al
.L8:
        add     ecx, 1                          #было: add     DWORD PTR [rbp-20], 1
.L7:
        mov     eax, ecx                        #было: mov     eax, DWORD PTR [rbp-20]
        movsx   rbx, eax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    strlen
        sub     rax, 1
        cmp     rbx, rax
        jb      .L9
        movzx   eax, BYTE PTR [rbp-36]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC0:
        .string "%c\n"
main:
        push    rbx
        push    rbp                             
        mov     rbp, rsp
        sub     rsp, 10008
        mov     rdx, QWORD PTR stdin[rip]
        lea     rax, [rbp-10008]
        mov     esi, 10001
        mov     rdi, rax
        call    fgets
        mov     bh, 0                           #было: mov     BYTE PTR [rbp-1], 0
        mov     bl, 127                         #было: mov     BYTE PTR [rbp-2], 127
        movsx   eax, bh                         #было: movsx   eax, BYTE PTR [rbp-1]
        lea     rdx, [rbp-10008]
        mov     rsi, rdx
        mov     edi, eax 
        call    Max
        mov     bh, al                          #было: mov     BYTE PTR [rbp-1], al
        movsx   eax, bl                         #было: movsx   eax, BYTE PTR [rbp-2]
        lea     rdx, [rbp-10008]
        mov     rsi, rdx
        mov     edi, eax
        call    Min
        mov     bl, al                          #было: mov     BYTE PTR [rbp-2], al
        movsx   eax, bl                         #было: movsx   eax, BYTE PTR [rbp-2]
        mov     esi, eax                        
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        movsx   eax, bh
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        mov     eax, 0                          #было: movsx   eax, BYTE PTR [rbp-1]
        leave
        pop     rbx
        ret
