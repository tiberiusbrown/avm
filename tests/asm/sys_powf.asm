.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS powf coverage:
;   * symbolic `sys powf` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; powf(2,0) = 1
    syslibm_binary_exact powf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x4000, 0x0000, 0x0000, 0x0000, 0x3f80
    ; powf(NaN,0) = 1
    syslibm_binary_exact powf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x2345, 0x7fc1, 0x0000, 0x0000, 0x0000, 0x3f80
    ; powf(1,NaN) = 1
    syslibm_binary_exact powf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x3f80, 0x2345, 0x7fc1, 0x0000, 0x3f80
    ; powf(2,3) ≈ 8; accepted raw interval ±512 ULP encodings.
    syslibm_binary_range powf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0000, 0x4000, 0x0000, 0x4040, 0xfe00, 0x40ff, 0x0200, 0x4100
    ; powf(-2,3) ≈ -8; accepted raw interval ±512 ULP encodings.
    syslibm_binary_range powf, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0xc000, 0x0000, 0x4040, 0xfe00, 0xc0ff, 0x0200, 0xc100
    ; powf(-2,2) ≈ 4; accepted raw interval ±512 ULP encodings.
    syslibm_binary_range powf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0xc000, 0x0000, 0x4000, 0xfe00, 0x407f, 0x0200, 0x4080
    ; powf(2,0.5) ≈ sqrt(2); accepted raw interval ±512 ULP encodings.
    syslibm_binary_range powf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x4000, 0x0000, 0x3f00, 0x02f3, 0x3fb5, 0x06f3, 0x3fb5
    ; powf(-2,0.5) is invalid; result must classify as NaN.
    syslibm_binary_nan powf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0xc000, 0x0000, 0x3f00
    ; powf(+0,-1) = +Inf
    syslibm_binary_exact powf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0000, 0x0000, 0x0000, 0xbf80, 0x0000, 0x7f80
    ; powf(-0,3) = -0
    syslibm_binary_exact powf, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0x8000, 0x0000, 0x4040, 0x0000, 0x8000

    jmp16 syslibm_pass
