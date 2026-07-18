.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS logf coverage:
;   * symbolic `sys logf` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; logf(1) = +0
    syslibm_unary_exact logf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x3f80, 0x0000, 0x0000
    ; logf(2) ≈ ln 2; accepted raw interval ±256 ULP encodings.
    syslibm_unary_range logf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x4000, 0x7118, 0x3f31, 0x7318, 0x3f31
    ; logf(float(e)) ≈ 1; accepted raw interval ±256 ULP encodings.
    syslibm_unary_range logf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0xf854, 0x402d, 0xfeff, 0x3f7f, 0x00ff, 0x3f80
    ; logf(+0) = -Inf
    syslibm_unary_exact logf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0000, 0x0000, 0x0000, 0xff80
    ; logf(+Inf) = +Inf
    syslibm_unary_exact logf, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0x7f80, 0x0000, 0x7f80
    ; logf(-1) is invalid; result must classify as NaN.
    syslibm_unary_nan logf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0xbf80
    ; logf(qNaN) produces NaN; result must classify as NaN.
    syslibm_unary_nan logf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x2345, 0x7fc1

    jmp16 syslibm_pass
