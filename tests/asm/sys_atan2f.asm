.include "include/sys_libm_test.inc"

.section .text,"ax",@progbits

; SYS atan2f coverage:
;   * symbolic `sys atan2f` encoding and two-byte width;
;   * exact IEEE special cases and representative finite values;
;   * q1-q3 preservation and all five compare-derived CC states;
;   * NaN classification without relying on FCLASS.

.globl _start
.type _start, @function
_start:

    ; atan2f(+0,+0) = +0 (avr-libc behavior)
    syslibm_binary_exact atan2f, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
    ; atan2f(-0,-0) = +0 (avr-libc behavior)
    syslibm_binary_exact atan2f, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x0000, 0x8000, 0x0000, 0x8000, 0x0000, 0x0000
    ; atan2f(1,0) ≈ pi/2; accepted raw interval ±128 ULP encodings.
    syslibm_binary_range atan2f, 0x0002, 0x0001, 0, 1, 0, 1, 0, 1, 0x0000, 0x3f80, 0x0000, 0x0000, 0x0f5b, 0x3fc9, 0x105b, 0x3fc9
    ; atan2f(+0,-1) ≈ pi; accepted raw interval ±128 ULP encodings.
    syslibm_binary_range atan2f, 0x8000, 0x7fff, 0, 1, 0, 1, 1, 0, 0x0000, 0x0000, 0x0000, 0xbf80, 0x0f5b, 0x4049, 0x105b, 0x4049
    ; atan2f(1,1) ≈ pi/4; accepted raw interval ±128 ULP encodings.
    syslibm_binary_range atan2f, 0x7fff, 0x8000, 0, 1, 1, 0, 0, 1, 0x0000, 0x3f80, 0x0000, 0x3f80, 0x0f5b, 0x3f49, 0x105b, 0x3f49
    ; atan2f(-1,1) ≈ -pi/4; accepted raw interval ±128 ULP encodings.
    syslibm_binary_range atan2f, 0x1357, 0x1357, 1, 0, 0, 1, 0, 1, 0x0000, 0xbf80, 0x0000, 0x3f80, 0x0f5b, 0xbf49, 0x105b, 0xbf49
    ; atan2f(NaN,1); result must classify as NaN.
    syslibm_binary_nan atan2f, 0x0001, 0x0002, 0, 1, 1, 0, 1, 0, 0x2345, 0x7fc1, 0x0000, 0x3f80

    jmp16 syslibm_pass
