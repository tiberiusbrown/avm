.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro putc char
    ldi8 c0, '\char'
    sys 0
.endm

_start:
    jmp relative_start
relative_callee:
    putc C
    ret
relative_start:
    call relative_callee
    putc R

    call16 0x0122
    putc D
    callf 0x000128
    putc H
    ldi8 c0, 10
    sys 0
    sys 1

.p2align 1
absolute_callee:
    putc B
    ret

.p2align 1
far_callee:
    putc G
    ret

.size _start, .-_start
