.include "include/debug_output.inc"

.section .text,"ax",@progbits

; MOV32 test coverage:
;   * all 16 qD,qS combinations;
;   * both bit-pattern sets for every combination;
;   * all four q2/q3-to-q2/q3 assembler-expansion cases;
;   * all four qD == qS cases;
;   * destination value, source preservation, and every uninvolved register;
;   * five compare-derived CC states distributed across every encoding path;
;   * a static assertion that every MOV32 pseudo occupies exactly two bytes.

.macro mov32_emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

; Print EQ, NE, ULT, UGE, SLT, and SGE as A=false / B=true.
; Every instruction used here preserves architectural CC.
.macro mov32_print_cc
    breq8 .Lmov32_eq_true_\@
    mov32_emit_char 'A'
    jmp8 .Lmov32_eq_done_\@
.Lmov32_eq_true_\@:
    mov32_emit_char 'B'
.Lmov32_eq_done_\@:

    brne8 .Lmov32_ne_true_\@
    mov32_emit_char 'A'
    jmp8 .Lmov32_ne_done_\@
.Lmov32_ne_true_\@:
    mov32_emit_char 'B'
.Lmov32_ne_done_\@:

    brult8 .Lmov32_ult_true_\@
    mov32_emit_char 'A'
    jmp8 .Lmov32_ult_done_\@
.Lmov32_ult_true_\@:
    mov32_emit_char 'B'
.Lmov32_ult_done_\@:

    bruge8 .Lmov32_uge_true_\@
    mov32_emit_char 'A'
    jmp8 .Lmov32_uge_done_\@
.Lmov32_uge_true_\@:
    mov32_emit_char 'B'
.Lmov32_uge_done_\@:

    brslt8 .Lmov32_slt_true_\@
    mov32_emit_char 'A'
    jmp8 .Lmov32_slt_done_\@
.Lmov32_slt_true_\@:
    mov32_emit_char 'B'
.Lmov32_slt_done_\@:

    brsge8 .Lmov32_sge_true_\@
    mov32_emit_char 'A'
    jmp8 .Lmov32_sge_done_\@
.Lmov32_sge_true_\@:
    mov32_emit_char 'B'
.Lmov32_sge_done_\@:
.endm

; Print r0-r7, then the six-character CC signature, then a newline.
; Saving r7 first and r0 last lets eight pops into r0 recover the original
; register values in ascending architectural-register order.
.type mov32_print_state, @function
mov32_print_state:
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0

    .rept 8
        pop16 r0
        call debug_print_r0
    .endr

    mov32_print_cc
    mov32_emit_char '\n'
    ret

.macro mov32_case qd, qs, cc_lhs, cc_rhs, v0, v1, v2, v3, v4, v5, v6, v7
    ; Establish CC before loading the test pattern; LDI16 preserves CC.
    ldi16 r6, \cc_lhs
    ldi16 r7, \cc_rhs
    cmp r6, r7

    ldi16 r0, \v0
    ldi16 r1, \v1
    ldi16 r2, \v2
    ldi16 r3, \v3
    ldi16 r4, \v4
    ldi16 r5, \v5
    ldi16 r6, \v6
    ldi16 r7, \v7

.Lmov32_begin_\@:
    mov32 \qd, \qs
.Lmov32_end_\@:
    .if (.Lmov32_end_\@ - .Lmov32_begin_\@) != 2
        .error "MOV32 must occupy exactly two bytes"
    .endif

    call mov32_print_state
.endm

.globl _start
.type _start, @function
_start:
    ; Destination q0, every source.
    ; qD=q0, qS=q0, pattern A, CC=EQ.
    mov32_case q0, q0, 0x1357, 0x1357, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q0, qS=q0, pattern B, CC=LT.
    mov32_case q0, q0, 0x0001, 0x0002, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q0, qS=q1, pattern A, CC=GT.
    mov32_case q0, q1, 0x0002, 0x0001, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q0, qS=q1, pattern B, CC=SLT_UGE.
    mov32_case q0, q1, 0x8000, 0x7fff, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q0, qS=q2, pattern A, CC=SGE_ULT.
    mov32_case q0, q2, 0x7fff, 0x8000, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q0, qS=q2, pattern B, CC=EQ.
    mov32_case q0, q2, 0x1357, 0x1357, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q0, qS=q3, pattern A, CC=LT.
    mov32_case q0, q3, 0x0001, 0x0002, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q0, qS=q3, pattern B, CC=GT.
    mov32_case q0, q3, 0x0002, 0x0001, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; Destination q1, every source.
    ; qD=q1, qS=q0, pattern A, CC=SLT_UGE.
    mov32_case q1, q0, 0x8000, 0x7fff, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q1, qS=q0, pattern B, CC=SGE_ULT.
    mov32_case q1, q0, 0x7fff, 0x8000, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q1, qS=q1, pattern A, CC=EQ.
    mov32_case q1, q1, 0x1357, 0x1357, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q1, qS=q1, pattern B, CC=LT.
    mov32_case q1, q1, 0x0001, 0x0002, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q1, qS=q2, pattern A, CC=GT.
    mov32_case q1, q2, 0x0002, 0x0001, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q1, qS=q2, pattern B, CC=SLT_UGE.
    mov32_case q1, q2, 0x8000, 0x7fff, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q1, qS=q3, pattern A, CC=SGE_ULT.
    mov32_case q1, q3, 0x7fff, 0x8000, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q1, qS=q3, pattern B, CC=EQ.
    mov32_case q1, q3, 0x1357, 0x1357, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; Destination q2, every source.
    ; qD=q2, qS=q0, pattern A, CC=LT.
    mov32_case q2, q0, 0x0001, 0x0002, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q2, qS=q0, pattern B, CC=GT.
    mov32_case q2, q0, 0x0002, 0x0001, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q2, qS=q1, pattern A, CC=SLT_UGE.
    mov32_case q2, q1, 0x8000, 0x7fff, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q2, qS=q1, pattern B, CC=SGE_ULT.
    mov32_case q2, q1, 0x7fff, 0x8000, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q2, qS=q2, pattern A, CC=EQ.
    mov32_case q2, q2, 0x1357, 0x1357, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q2, qS=q2, pattern B, CC=LT.
    mov32_case q2, q2, 0x0001, 0x0002, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q2, qS=q3, pattern A, CC=GT.
    mov32_case q2, q3, 0x0002, 0x0001, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q2, qS=q3, pattern B, CC=SLT_UGE.
    mov32_case q2, q3, 0x8000, 0x7fff, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; Destination q3, every source.
    ; qD=q3, qS=q0, pattern A, CC=SGE_ULT.
    mov32_case q3, q0, 0x7fff, 0x8000, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q3, qS=q0, pattern B, CC=EQ.
    mov32_case q3, q0, 0x1357, 0x1357, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q3, qS=q1, pattern A, CC=LT.
    mov32_case q3, q1, 0x0001, 0x0002, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q3, qS=q1, pattern B, CC=GT.
    mov32_case q3, q1, 0x0002, 0x0001, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q3, qS=q2, pattern A, CC=SLT_UGE.
    mov32_case q3, q2, 0x8000, 0x7fff, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q3, qS=q2, pattern B, CC=SGE_ULT.
    mov32_case q3, q2, 0x7fff, 0x8000, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    ; qD=q3, qS=q3, pattern A, CC=EQ.
    mov32_case q3, q3, 0x1357, 0x1357, 0x0000, 0x0001, 0x7fff, 0xffff, 0xaa55, 0x55aa, 0x7ffe, 0x8001

    ; qD=q3, qS=q3, pattern B, CC=LT.
    mov32_case q3, q3, 0x0001, 0x0002, 0x1357, 0x2468, 0x89ab, 0xcdef, 0x0000, 0xffff, 0xf0f0, 0x0f0f

    sys debug_break
