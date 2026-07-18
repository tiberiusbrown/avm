.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS cosf coverage:
;   * symbolic `sys cosf` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; cosf(+0) = 1
    syslibm_unary_exact cosf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x0000, 0x0000, 0x3f80
    ; cosf(-0) = 1
    syslibm_unary_exact cosf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x8000, 0x0000, 0x3f80
    ; cosf(1) ≈ 0.54030228; accepted raw interval ±128 ULP encodings.
    syslibm_unary_range cosf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x3f80, 0x50c0, 0x3f0a, 0x51c0, 0x3f0a
    ; cosf(float(pi)) ≈ -1; accepted raw interval ±128 ULP encodings.
    syslibm_unary_range cosf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0fdb, 0x4049, 0xff80, 0xbf7f, 0x0080, 0xbf80
    ; cosf(-Inf) is invalid; result must classify as NaN.
    syslibm_unary_nan cosf, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0xff80
    ; cosf(sNaN) produces NaN; result must classify as NaN.
    syslibm_unary_nan cosf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x2345, 0x7fa1

    jmp16 syslibm_pass
