.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS log2f coverage:
;   * symbolic `sys log2f` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; log2f(1) = +0
    syslibm_unary_exact log2f, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x3f80, 0x0000, 0x0000
    ; log2f(2) = 1
    syslibm_unary_exact log2f, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x4000, 0x0000, 0x3f80
    ; log2f(8) = 3
    syslibm_unary_exact log2f, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x4100, 0x0000, 0x4040
    ; log2f(+0) = -Inf
    syslibm_unary_exact log2f, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0000, 0x0000, 0x0000, 0xff80
    ; log2f(+Inf) = +Inf
    syslibm_unary_exact log2f, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0x7f80, 0x0000, 0x7f80
    ; log2f(-1) is invalid; result must classify as NaN.
    syslibm_unary_nan log2f, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0xbf80
    ; log2f(sNaN) produces NaN; result must classify as NaN.
    syslibm_unary_nan log2f, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x2345, 0x7fa1

    jmp16 syslibm_pass
