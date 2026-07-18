.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS hypotf coverage:
;   * symbolic `sys hypotf` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; hypotf(3,4) = 5
    syslibm_binary_exact hypotf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x4040, 0x0000, 0x4080, 0x0000, 0x40a0
    ; hypotf(0,-2) = 2
    syslibm_binary_exact hypotf, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x0000, 0x0000, 0xc000, 0x0000, 0x4000
    ; hypotf(1,1) ≈ sqrt(2); accepted raw interval ±128 ULP encodings.
    syslibm_binary_range hypotf, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x3f80, 0x0000, 0x3f80, 0x0473, 0x3fb5, 0x0573, 0x3fb5
    ; hypotf(+Inf,NaN) = +Inf
    syslibm_binary_exact hypotf, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0000, 0x7f80, 0x2345, 0x7fc1, 0x0000, 0x7f80
    ; hypotf(NaN,-Inf) = +Inf
    syslibm_binary_exact hypotf, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x2345, 0x7fc1, 0x0000, 0xff80, 0x0000, 0x7f80
    ; hypotf(NaN,1) produces NaN; result must classify as NaN.
    syslibm_binary_nan hypotf, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x2345, 0x7fc1, 0x0000, 0x3f80

    jmp16 syslibm_pass
