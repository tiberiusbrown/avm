.include "include/sys_libm_test.inc"
.globl _start
_start:
    syslibm_set_cc 1, 2
    syslibm_load_unary 0, 0x4000
.Lpoly:
    fpoly 3
    .float 2.0, -3.0, 4.0
.Lafter:
    .if (.Lafter - .Lpoly) != 15
      .error "incorrect fpoly size"
    .endif
    syslibm_check_cc 0, 1, 1, 0, 1, 0
    syslibm_check_exact_unary 0, 0x40c0
    jmp16 syslibm_pass
