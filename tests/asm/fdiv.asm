.include "include/fp_binary_test.inc"

.section .text,"ax",@progbits

; FDIV coverage:
;   * all 16 qD,qS combinations, including every self-alias;
;   * exact destination bits, source preservation, and all uninvolved registers;
;   * five compare-derived CC states, verified after the floating operation;
;   * normals, signed zeros, infinities, subnormals, overflow/underflow,
;     and round-to-nearest-ties-to-even boundary cases;
;   * invalid operations and qNaN/sNaN operands with payload-independent
;     NaN classification;
;   * a static assertion that every instruction occupies exactly two bytes.

.globl _start
.type _start, @function
_start:

    ; Destination q0, every source.
    ; qD=q0, qS=q0; 7 / 7 -> 1; result=0x3f800000; CC=EQ.
    fp_binary_exact_case fdiv, q0, q0, 0x1357, 0x1357, 0x0000, 0x40e0, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q0, qS=q1; 7 / 2; result=0x40600000; CC=LT.
    fp_binary_exact_case fdiv, q0, q1, 0x0001, 0x0002, 0x0000, 0x40e0, 0x0000, 0x4000, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q0, qS=q2; -7 / 2; result=0xc0600000; CC=GT.
    fp_binary_exact_case fdiv, q0, q2, 0x0002, 0x0001, 0x0000, 0xc0e0, 0xcdef, 0x89ab, 0x0000, 0x4000, 0xace0, 0x2468
    ; qD=q0, qS=q3; 1 / 3 rounded; result=0x3eaaaaab; CC=SLT_UGE.
    fp_binary_exact_case fdiv, q0, q3, 0x8000, 0x7fff, 0x0000, 0x3f80, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0000, 0x4040

    ; Destination q1, every source.
    ; qD=q1, qS=q0; 1 / +0 -> +inf; result=0x7f800000; CC=SGE_ULT.
    fp_binary_exact_case fdiv, q1, q0, 0x7fff, 0x8000, 0x0000, 0x0000, 0x0000, 0x3f80, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q1; -2 / -2 -> 1; result=0x3f800000; CC=EQ.
    fp_binary_exact_case fdiv, q1, q1, 0x1357, 0x1357, 0x4567, 0x0123, 0x0000, 0xc000, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q2; -1 / +0 -> -inf; result=0xff800000; CC=LT.
    fp_binary_exact_case fdiv, q1, q2, 0x0001, 0x0002, 0x4567, 0x0123, 0x0000, 0xbf80, 0x0000, 0x0000, 0xace0, 0x2468
    ; qD=q1, qS=q3; +0 / -2 -> -0; result=0x80000000; CC=GT.
    fp_binary_exact_case fdiv, q1, q3, 0x0002, 0x0001, 0x4567, 0x0123, 0x0000, 0x0000, 0x9bdf, 0x1357, 0x0000, 0xc000

    ; Destination q2, every source.
    ; qD=q2, qS=q0; +0 / -2 -> -0; result=0x80000000; CC=SLT_UGE.
    fp_binary_exact_case fdiv, q2, q0, 0x8000, 0x7fff, 0x0000, 0xc000, 0xcdef, 0x89ab, 0x0000, 0x0000, 0xace0, 0x2468
    ; qD=q2, qS=q1; finite / +inf -> +0; result=0x00000000; CC=SGE_ULT.
    fp_binary_exact_case fdiv, q2, q1, 0x7fff, 0x8000, 0x4567, 0x0123, 0x0000, 0x7f80, 0x0000, 0x4120, 0xace0, 0x2468
    ; qD=q2, qS=q2; minnormal / itself -> 1; result=0x3f800000; CC=EQ.
    fp_binary_exact_case fdiv, q2, q2, 0x1357, 0x1357, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x0000, 0x0080, 0xace0, 0x2468
    ; qD=q2, qS=q3; +inf / -2 -> -inf; result=0xff800000; CC=LT.
    fp_binary_exact_case fdiv, q2, q3, 0x0001, 0x0002, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x0000, 0x7f80, 0x0000, 0xc000

    ; Destination q3, every source.
    ; qD=q3, qS=q0; minnormal / 2 -> subnormal; result=0x00400000; CC=GT.
    fp_binary_exact_case fdiv, q3, q0, 0x0002, 0x0001, 0x0000, 0x4000, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0000, 0x0080
    ; qD=q3, qS=q1; minsub / 2, halfway -> +0; result=0x00000000; CC=SLT_UGE.
    fp_binary_exact_case fdiv, q3, q1, 0x8000, 0x7fff, 0x4567, 0x0123, 0x0000, 0x4000, 0x9bdf, 0x1357, 0x0001, 0x0000
    ; qD=q3, qS=q2; max / minnormal -> +inf; result=0x7f800000; CC=SGE_ULT.
    fp_binary_exact_case fdiv, q3, q2, 0x7fff, 0x8000, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x0000, 0x0080, 0xffff, 0x7f7f
    ; qD=q3, qS=q3; -3 / -3 -> 1; result=0x3f800000; CC=EQ.
    fp_binary_exact_case fdiv, q3, q3, 0x1357, 0x1357, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0000, 0xc040

    ; NaN-result cases: result payload/sign are intentionally not compared.
    ; qD=q0, qS=q1; +0 / +0 invalid; CC=LT.
    fp_binary_nan_case fdiv, q0, q1, 0, 0x0001, 0x0002, 0x0000, 0x0000, 0x0000, 0x0000, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q2; +inf / +inf invalid; CC=GT.
    fp_binary_nan_case fdiv, q1, q2, 1, 0x0002, 0x0001, 0x4567, 0x0123, 0x0000, 0x7f80, 0x0000, 0x7f80, 0xace0, 0x2468
    ; qD=q2, qS=q3; qNaN right; CC=SLT_UGE.
    fp_binary_nan_case fdiv, q2, q3, 2, 0x8000, 0x7fff, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x0000, 0x3f80, 0x4321, 0xffc5
    ; qD=q3, qS=q0; sNaN left; CC=SGE_ULT.
    fp_binary_nan_case fdiv, q3, q0, 3, 0x7fff, 0x8000, 0x0000, 0x4000, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x2345, 0x7fa1
    ; qD=q2, qS=q2; qNaN self-alias; CC=EQ.
    fp_binary_nan_case fdiv, q2, q2, 2, 0x1357, 0x1357, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x2345, 0x7fc1, 0xace0, 0x2468

    sys debug_break
