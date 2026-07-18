.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS log10f coverage:
;   * symbolic `sys log10f` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; log10f(1) = +0
    syslibm_unary_exact log10f, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x3f80, 0x0000, 0x0000
    ; log10f(10) ≈ 1; accepted raw interval ±256 ULP encodings.
    syslibm_unary_range log10f, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x4120, 0xff00, 0x3f7f, 0x0100, 0x3f80
    ; log10f(100) ≈ 2; accepted raw interval ±256 ULP encodings.
    syslibm_unary_range log10f, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x42c8, 0xff00, 0x3fff, 0x0100, 0x4000
    ; log10f(+0) = -Inf
    syslibm_unary_exact log10f, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0000, 0x0000, 0x0000, 0xff80
    ; log10f(+Inf) = +Inf
    syslibm_unary_exact log10f, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0x7f80, 0x0000, 0x7f80
    ; log10f(-1) is invalid; result must classify as NaN.
    syslibm_unary_nan log10f, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0xbf80
    ; log10f(qNaN) produces NaN; result must classify as NaN.
    syslibm_unary_nan log10f, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x2345, 0x7fc1

    jmp16 syslibm_pass
