.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS fmodf coverage:
;   * symbolic `sys fmodf` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; fmodf(5.5,2) = 1.5
    syslibm_binary_exact fmodf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x40b0, 0x0000, 0x4000, 0x0000, 0x3fc0
    ; fmodf(-5.5,2) = -1.5
    syslibm_binary_exact fmodf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0xc0b0, 0x0000, 0x4000, 0x0000, 0xbfc0
    ; fmodf(5.5,-2) = 1.5
    syslibm_binary_exact fmodf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x40b0, 0x0000, 0xc000, 0x0000, 0x3fc0
    ; fmodf(2,2) = +0
    syslibm_binary_exact fmodf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0000, 0x4000, 0x0000, 0x4000, 0x0000, 0x0000
    ; fmodf(-2,2) = -0
    syslibm_binary_exact fmodf, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0xc000, 0x0000, 0x4000, 0x0000, 0x8000
    ; fmodf(1,+Inf) = 1
    syslibm_binary_exact fmodf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x3f80, 0x0000, 0x7f80, 0x0000, 0x3f80
    ; fmodf(+Inf,1) is invalid; result must classify as NaN.
    syslibm_binary_nan fmodf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x7f80, 0x0000, 0x3f80
    ; fmodf(1,0) is invalid; result must classify as NaN.
    syslibm_binary_nan fmodf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x3f80, 0x0000, 0x0000
    ; fmodf(NaN,1) produces NaN; result must classify as NaN.
    syslibm_binary_nan fmodf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x2345, 0x7fc1, 0x0000, 0x3f80

    jmp16 syslibm_pass
