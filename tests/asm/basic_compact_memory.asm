.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Rebuild a valid stack address before each direction because a load may
; overwrite its address register.  Every diagnostic byte is printable ASCII.
_start:
    getsp c0
    dec16 c0
    dec16 c0
    mov c1, c0
    mov c2, c0
    mov c3, c0
    st8 [c0], c0
    getsp c0
    dec16 c0
    dec16 c0
    mov c1, c0
    mov c2, c0
    mov c3, c0
    ld8 c0, [c0]
    getsp c0
    dec16 c0
    dec16 c0
    mov c1, c0
    mov c2, c0
    mov c3, c0
    ld8 c0, [c1]
    ld8 c1, [c2]
    ld8 c2, [c3]
    ld8 c3, [c0]
    st8 [c0], c0
    st8 [c1], c1
    st8 [c2], c2
    st8 [c3], c3

    getsp c0
    dec16 c0
    dec16 c0
    mov c1, c0
    mov c2, c0
    mov c3, c0
    st16 [c0], c0
    getsp c0
    dec16 c0
    dec16 c0
    mov c1, c0
    mov c2, c0
    mov c3, c0
    ld16 c0, [c0]
    getsp c0
    dec16 c0
    dec16 c0
    mov c1, c0
    mov c2, c0
    mov c3, c0
    ld16 c0, [c1]
    ld16 c1, [c2]
    ld16 c2, [c3]
    ld16 c3, [c0]
    st16 [c0], c0
    st16 [c1], c1
    st16 [c2], c2
    st16 [c3], c3

    getsp c0
    dec16 c0
    dec16 c0
    ldi8 c3, 'D'
    st8 [c0], c3
    ld8 c1, [c0]
    mov c0, c1
    sys 0
    sys 1

.size _start, .-_start
