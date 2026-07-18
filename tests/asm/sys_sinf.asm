.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS sinf coverage:
;   * symbolic `sys sinf` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; sinf(+0) = +0
    syslibm_unary_exact sinf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x0000, 0x0000, 0x0000
    ; sinf(-0) = -0
    syslibm_unary_exact sinf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x8000, 0x0000, 0x8000
    ; sinf(1) ≈ 0.84147096; accepted raw interval ±128 ULP encodings.
    syslibm_unary_range sinf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x3f80, 0x6a24, 0x3f57, 0x6b24, 0x3f57
    ; sinf(float(pi/2)) ≈ 1; accepted raw interval ±128 ULP encodings.
    syslibm_unary_range sinf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0fdb, 0x3fc9, 0xff80, 0x3f7f, 0x0080, 0x3f80
    ; sinf(+Inf) is invalid; result must classify as NaN.
    syslibm_unary_nan sinf, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0x7f80
    ; sinf(qNaN) propagates NaN; result must classify as NaN.
    syslibm_unary_nan sinf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x2345, 0x7fc1

    jmp16 syslibm_pass
