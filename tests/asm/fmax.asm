.include "include/fp_binary_test.inc"

.section .text,"ax",@progbits

; FMAX exhaustive coverage:
;   * all 16 qD,qS combinations in three independent matrices;
;   * both operand-selection directions for every non-alias encoding;
;   * all self-aliases, source preservation, and every uninvolved register;
;   * five compare-derived CC states, verified after every instruction;
;   * positive/negative normals, subnormals, zeros, and infinities;
;   * exact one-NaN and two-NaN operand-selection order;
;   * exact qNaN/sNaN sign, payload, and signaling-bit preservation;
;   * a static assertion that every instruction occupies exactly two bytes.

.globl _start
.type _start, @function
_start:

    ; -----------------------------------------------------------------
    ; Numeric matrix A
    ; -----------------------------------------------------------------

    ; Destination q0, every source.
    ; qD=q0, qS=q0; positive normal self-alias; result=0x3fc00000 (self); CC=EQ.
    fp_binary_exact_case fmax, q0, q0, 0x1357, 0x1357, 0x0000, 0x3fc0, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q0, qS=q1; positive normal ascending; result=0x40100000 (qS); CC=LT.
    fp_binary_exact_case fmax, q0, q1, 0x0001, 0x0002, 0x0000, 0x3fc0, 0x0000, 0x4010, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q0, qS=q2; negative versus positive; result=0x40100000 (qS); CC=GT.
    fp_binary_exact_case fmax, q0, q2, 0x0002, 0x0001, 0x0000, 0xbfc0, 0xcdef, 0x89ab, 0x0000, 0x4010, 0xace0, 0x2468
    ; qD=q0, qS=q3; maximum finite versus +infinity; result=0x7f800000 (qS); CC=SLT_UGE.
    fp_binary_exact_case fmax, q0, q3, 0x8000, 0x7fff, 0xffff, 0x7f7f, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0000, 0x7f80

    ; Destination q1, every source.
    ; qD=q1, qS=q0; positive normal descending; result=0x40100000 (qD); CC=SGE_ULT.
    fp_binary_exact_case fmax, q1, q0, 0x7fff, 0x8000, 0x0000, 0x3fc0, 0x0000, 0x4010, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q1; negative normal self-alias; result=0xc0100000 (self); CC=EQ.
    fp_binary_exact_case fmax, q1, q1, 0x1357, 0x1357, 0x4567, 0x0123, 0x0000, 0xc010, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q2; negative values ascending numerically; result=0xbfc00000 (qS); CC=LT.
    fp_binary_exact_case fmax, q1, q2, 0x0001, 0x0002, 0x4567, 0x0123, 0x0000, 0xc010, 0x0000, 0xbfc0, 0xace0, 0x2468
    ; qD=q1, qS=q3; positive subnormal versus normal; result=0x00800000 (qS); CC=GT.
    fp_binary_exact_case fmax, q1, q3, 0x0002, 0x0001, 0x4567, 0x0123, 0x0001, 0x0000, 0x9bdf, 0x1357, 0x0000, 0x0080

    ; Destination q2, every source.
    ; qD=q2, qS=q0; positive versus negative; result=0x40100000 (qD); CC=SLT_UGE.
    fp_binary_exact_case fmax, q2, q0, 0x8000, 0x7fff, 0x0000, 0xbfc0, 0xcdef, 0x89ab, 0x0000, 0x4010, 0xace0, 0x2468
    ; qD=q2, qS=q1; negative values descending numerically; result=0xbfc00000 (qD); CC=SGE_ULT.
    fp_binary_exact_case fmax, q2, q1, 0x7fff, 0x8000, 0x4567, 0x0123, 0x0000, 0xc010, 0x0000, 0xbfc0, 0xace0, 0x2468
    ; qD=q2, qS=q2; +infinity self-alias; result=0x7f800000 (self); CC=EQ.
    fp_binary_exact_case fmax, q2, q2, 0x1357, 0x1357, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x0000, 0x7f80, 0xace0, 0x2468
    ; qD=q2, qS=q3; -infinity versus negative maximum finite; result=0xff7fffff (qS); CC=LT.
    fp_binary_exact_case fmax, q2, q3, 0x0001, 0x0002, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x0000, 0xff80, 0xffff, 0xff7f

    ; Destination q3, every source.
    ; qD=q3, qS=q0; minimum normal versus largest subnormal; result=0x00800000 (qD); CC=GT.
    fp_binary_exact_case fmax, q3, q0, 0x0002, 0x0001, 0xffff, 0x007f, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0000, 0x0080
    ; qD=q3, qS=q1; negative normal versus negative subnormal; result=0x807fffff (qS); CC=SLT_UGE.
    fp_binary_exact_case fmax, q3, q1, 0x8000, 0x7fff, 0x4567, 0x0123, 0xffff, 0x807f, 0x9bdf, 0x1357, 0x0000, 0x8080
    ; qD=q3, qS=q2; opposite-sign maximum finite values; result=0x7f7fffff (qD); CC=SGE_ULT.
    fp_binary_exact_case fmax, q3, q2, 0x7fff, 0x8000, 0x4567, 0x0123, 0xcdef, 0x89ab, 0xffff, 0xff7f, 0xffff, 0x7f7f
    ; qD=q3, qS=q3; negative-zero self-alias; result=0x80000000 (self); CC=EQ.
    fp_binary_exact_case fmax, q3, q3, 0x1357, 0x1357, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0000, 0x8000

    ; -----------------------------------------------------------------
    ; Numeric matrix B (all non-alias pairs reversed)
    ; -----------------------------------------------------------------

    ; Destination q0, every source.
    ; qD=q0, qS=q0; -infinity self-alias; result=0xff800000 (self); CC=LT.
    fp_binary_exact_case fmax, q0, q0, 0x0001, 0x0002, 0x0000, 0xff80, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q0, qS=q1; reversed positive normals; result=0x40100000 (qD); CC=GT.
    fp_binary_exact_case fmax, q0, q1, 0x0002, 0x0001, 0x0000, 0x4010, 0x0000, 0x3fc0, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q0, qS=q2; reversed positive/negative pair; result=0x40100000 (qD); CC=SLT_UGE.
    fp_binary_exact_case fmax, q0, q2, 0x8000, 0x7fff, 0x0000, 0x4010, 0xcdef, 0x89ab, 0x0000, 0xbfc0, 0xace0, 0x2468
    ; qD=q0, qS=q3; reversed infinity/finite pair; result=0x7f800000 (qD); CC=SGE_ULT.
    fp_binary_exact_case fmax, q0, q3, 0x7fff, 0x8000, 0x0000, 0x7f80, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0xffff, 0x7f7f

    ; Destination q1, every source.
    ; qD=q1, qS=q0; reversed descending positive pair; result=0x40100000 (qS); CC=EQ.
    fp_binary_exact_case fmax, q1, q0, 0x1357, 0x1357, 0x0000, 0x4010, 0x0000, 0x3fc0, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q1; positive-zero self-alias; result=0x00000000 (self); CC=LT.
    fp_binary_exact_case fmax, q1, q1, 0x0001, 0x0002, 0x4567, 0x0123, 0x0000, 0x0000, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q2; reversed negative pair; result=0xbfc00000 (qD); CC=GT.
    fp_binary_exact_case fmax, q1, q2, 0x0002, 0x0001, 0x4567, 0x0123, 0x0000, 0xbfc0, 0x0000, 0xc010, 0xace0, 0x2468
    ; qD=q1, qS=q3; reversed normal/subnormal pair; result=0x00800000 (qD); CC=SLT_UGE.
    fp_binary_exact_case fmax, q1, q3, 0x8000, 0x7fff, 0x4567, 0x0123, 0x0000, 0x0080, 0x9bdf, 0x1357, 0x0001, 0x0000

    ; Destination q2, every source.
    ; qD=q2, qS=q0; reversed positive/negative pair; result=0x40100000 (qS); CC=SGE_ULT.
    fp_binary_exact_case fmax, q2, q0, 0x7fff, 0x8000, 0x0000, 0x4010, 0xcdef, 0x89ab, 0x0000, 0xbfc0, 0xace0, 0x2468
    ; qD=q2, qS=q1; reversed negative ordering; result=0xbfc00000 (qS); CC=EQ.
    fp_binary_exact_case fmax, q2, q1, 0x1357, 0x1357, 0x4567, 0x0123, 0x0000, 0xbfc0, 0x0000, 0xc010, 0xace0, 0x2468
    ; qD=q2, qS=q2; maximum-finite self-alias; result=0x7f7fffff (self); CC=LT.
    fp_binary_exact_case fmax, q2, q2, 0x0001, 0x0002, 0x4567, 0x0123, 0xcdef, 0x89ab, 0xffff, 0x7f7f, 0xace0, 0x2468
    ; qD=q2, qS=q3; reversed negative infinity pair; result=0xff7fffff (qD); CC=GT.
    fp_binary_exact_case fmax, q2, q3, 0x0002, 0x0001, 0x4567, 0x0123, 0xcdef, 0x89ab, 0xffff, 0xff7f, 0x0000, 0xff80

    ; Destination q3, every source.
    ; qD=q3, qS=q0; reversed subnormal/normal pair; result=0x00800000 (qS); CC=SLT_UGE.
    fp_binary_exact_case fmax, q3, q0, 0x8000, 0x7fff, 0x0000, 0x0080, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0xffff, 0x007f
    ; qD=q3, qS=q1; reversed negative subnormal/normal pair; result=0x807fffff (qD); CC=SGE_ULT.
    fp_binary_exact_case fmax, q3, q1, 0x7fff, 0x8000, 0x4567, 0x0123, 0x0000, 0x8080, 0x9bdf, 0x1357, 0xffff, 0x807f
    ; qD=q3, qS=q2; reversed opposite-sign maximum values; result=0x7f7fffff (qS); CC=EQ.
    fp_binary_exact_case fmax, q3, q2, 0x1357, 0x1357, 0x4567, 0x0123, 0xcdef, 0x89ab, 0xffff, 0x7f7f, 0xffff, 0xff7f
    ; qD=q3, qS=q3; minimum-subnormal self-alias; result=0x00000001 (self); CC=LT.
    fp_binary_exact_case fmax, q3, q3, 0x0001, 0x0002, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0001, 0x0000

    ; -----------------------------------------------------------------
    ; NaN, signed-zero, infinity, and subnormal edge matrix
    ; -----------------------------------------------------------------

    ; Destination q0, every source.
    ; qD=q0, qS=q0; qNaN self-alias remains bit-identical; result=0x7fc12345 (self); CC=GT.
    fp_binary_exact_case fmax, q0, q0, 0x0002, 0x0001, 0x2345, 0x7fc1, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q0, qS=q1; +0 left, -0 right; result=0x00000000 (qD); CC=SLT_UGE.
    fp_binary_exact_case fmax, q0, q1, 0x8000, 0x7fff, 0x0000, 0x0000, 0x0000, 0x8000, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q0, qS=q2; left qNaN returns numeric right operand; result=0x40400000 (qS); CC=SGE_ULT.
    fp_binary_exact_case fmax, q0, q2, 0x7fff, 0x8000, 0x2345, 0x7fc1, 0xcdef, 0x89ab, 0x0000, 0x4040, 0xace0, 0x2468
    ; qD=q0, qS=q3; right qNaN returns numeric left operand; result=0x40400000 (qD); CC=EQ.
    fp_binary_exact_case fmax, q0, q3, 0x1357, 0x1357, 0x0000, 0x4040, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x4321, 0x7fc5

    ; Destination q1, every source.
    ; qD=q1, qS=q0; -0 left, +0 right; result=0x00000000 (qS); CC=LT.
    fp_binary_exact_case fmax, q1, q0, 0x0001, 0x0002, 0x0000, 0x0000, 0x0000, 0x8000, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q1; sNaN self-alias remains bit-identical; result=0x7fa12345 (self); CC=GT.
    fp_binary_exact_case fmax, q1, q1, 0x0002, 0x0001, 0x4567, 0x0123, 0x2345, 0x7fa1, 0x9bdf, 0x1357, 0xace0, 0x2468
    ; qD=q1, qS=q2; left sNaN returns numeric right operand; result=0xc0100000 (qS); CC=SLT_UGE.
    fp_binary_exact_case fmax, q1, q2, 0x8000, 0x7fff, 0x4567, 0x0123, 0x2345, 0x7fa1, 0x0000, 0xc010, 0xace0, 0x2468
    ; qD=q1, qS=q3; right sNaN returns numeric left operand; result=0xc0100000 (qD); CC=SGE_ULT.
    fp_binary_exact_case fmax, q1, q3, 0x7fff, 0x8000, 0x4567, 0x0123, 0x0000, 0xc010, 0x9bdf, 0x1357, 0x4321, 0xffa5

    ; Destination q2, every source.
    ; qD=q2, qS=q0; two qNaNs return second operand exactly; result=0x7fc54321 (qS); CC=EQ.
    fp_binary_exact_case fmax, q2, q0, 0x1357, 0x1357, 0x4321, 0x7fc5, 0xcdef, 0x89ab, 0x2345, 0x7fc1, 0xace0, 0x2468
    ; qD=q2, qS=q1; sNaN then qNaN returns second operand exactly; result=0x7fc54321 (qS); CC=LT.
    fp_binary_exact_case fmax, q2, q1, 0x0001, 0x0002, 0x4567, 0x0123, 0x4321, 0x7fc5, 0x2345, 0x7fa1, 0xace0, 0x2468
    ; qD=q2, qS=q2; negative-zero self-alias; result=0x80000000 (self); CC=GT.
    fp_binary_exact_case fmax, q2, q2, 0x0002, 0x0001, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x0000, 0x8000, 0xace0, 0x2468
    ; qD=q2, qS=q3; negative qNaN then negative sNaN returns second; result=0xffa54321 (qS); CC=SLT_UGE.
    fp_binary_exact_case fmax, q2, q3, 0x8000, 0x7fff, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x468a, 0xffc2, 0x4321, 0xffa5

    ; Destination q3, every source.
    ; qD=q3, qS=q0; +infinity versus -infinity; result=0x7f800000 (qD); CC=SGE_ULT.
    fp_binary_exact_case fmax, q3, q0, 0x7fff, 0x8000, 0x0000, 0xff80, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0000, 0x7f80
    ; qD=q3, qS=q1; -infinity versus +infinity; result=0x7f800000 (qS); CC=EQ.
    fp_binary_exact_case fmax, q3, q1, 0x1357, 0x1357, 0x4567, 0x0123, 0x0000, 0x7f80, 0x9bdf, 0x1357, 0x0000, 0xff80
    ; qD=q3, qS=q2; opposite-sign minimum subnormals; result=0x00000001 (qD); CC=LT.
    fp_binary_exact_case fmax, q3, q2, 0x0001, 0x0002, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x0001, 0x8000, 0x0001, 0x0000
    ; qD=q3, qS=q3; positive-zero self-alias; result=0x00000000 (self); CC=GT.
    fp_binary_exact_case fmax, q3, q3, 0x0002, 0x0001, 0x4567, 0x0123, 0xcdef, 0x89ab, 0x9bdf, 0x1357, 0x0000, 0x0000

    sys debug_break
