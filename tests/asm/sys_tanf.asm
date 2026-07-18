.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS tanf coverage:
;   * symbolic `sys tanf` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; tanf(+0) = +0
    syslibm_unary_exact tanf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x0000, 0x0000, 0x0000
    ; tanf(-0) = -0
    syslibm_unary_exact tanf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x8000, 0x0000, 0x8000
    ; tanf(0.5) ≈ 0.5463025; accepted raw interval ±128 ULP encodings.
    syslibm_unary_range tanf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x3f00, 0xd9fb, 0x3f0b, 0xdafb, 0x3f0b
    ; tanf(float(pi/4)) ≈ 1; accepted raw interval ±128 ULP encodings.
    syslibm_unary_range tanf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0fdb, 0x3f49, 0xff80, 0x3f7f, 0x0080, 0x3f80
    ; tanf(+Inf) is invalid; result must classify as NaN.
    syslibm_unary_nan tanf, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0x7f80
    ; tanf(qNaN) produces NaN; result must classify as NaN.
    syslibm_unary_nan tanf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x2345, 0x7fc1

    jmp16 syslibm_pass
