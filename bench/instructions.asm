; Exhaustive AVM instruction-cycle benchmark image.
;
; Measurement protocol:
;   * The first named result is the DEBUG_BREAK-to-DEBUG_BREAK baseline.
;   * Every ordinary benchmark places setup before its leading DEBUG_BREAK.
;   * The measured interval contains only the instruction or user-visible
;     canonical pseudo named in benchmark_names.txt and the trailing break.
;   * The C++ harness subtracts the baseline from every result after the first.
;
; Reordering:
;   * Every BENCH block initializes its own SP, operands, memory, and flags.
;   * Cleanup needed after the trailing break is part of the same block.
;   * Labels are block-local by naming convention and do not cross blocks.
;   * The program-space fixture is the only shared read-only object.
;
; Coverage policy:
;   * Distinct upper, dense/full, cold, absolute, postincrement, program-space,
;     and 32-bit implementation paths are benchmarked separately.
;   * Conditional instructions are measured both taken/true and not-taken/false.
;   * Every variable and immediate 16-bit shift family is measured at counts
;     0 through 15.
;   * Division/remainder samples zero-divisor bypass, byte/word magnitude
;     cores, sparse/dense quotient bits, signed correction, and operand aliasing.
;   * Floating-point benchmarks sample normal and exceptional operand classes,
;     normalization/rounding boundaries, selection branches, conversions,
;     comparison outcomes, all classification classes, meaningful aliasing,
;     and libm SYS fast paths, argument-reduction depth, polynomial branches,
;     scaling, normalization, and exponent-gap loops.
;   * Memory SYS services are measured for n=0-8, 16, 32, and 256,
;     including ordinary-data and program-space source paths.
;   * Operand aliases are otherwise omitted when they execute the same path.
;
; benchmark_names.txt is intentionally unnumbered.

.section .text,"ax",@progbits

.equ SAFE_SP, 0x09c0

; Writable framebuffer windows used by the memory-service benchmarks.
; Each window is exactly 256 bytes and the memcpy source/destination do not overlap.
.equ BENCH_MEMCPY_SRC, 0x0500
.equ BENCH_MEMCPY_DST, 0x0600
.equ BENCH_MEMSET_DST, 0x0700

.macro bench_reset_sp
    ldi16 r7, SAFE_SP
    setsp r7
.endm

.globl _start
.type _start, @function
.p2align 1
_start:
    bench_reset_sp

    ; Warm-up interval consumed and discarded by the benchmark harness.
    sys debug_break
    sys debug_break

    ; Baseline interval. This is the first benchmark name.
    sys debug_break
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS debug_putc
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi8 r4, '.'
    sys debug_break
    sys debug_putc
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS millis
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    sys millis
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS millis32
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    sys millis32
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: NOP (MOV r4,r4 alias)
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    .byte 0x00
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CLR r4 (XOR r4,r4 alias)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0xffff
    sys debug_break
    .byte 0xa0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: MOV r4,r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r5, 0x5aa5
    sys debug_break
    .byte 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: MOV r0,r1 (full F1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r1, 0x5aa5
    sys debug_break
    .byte 0xf1, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: MOV32 q0,q1 (canonical pseudo)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x1111
    ldi16 r3, 0x2222
    sys debug_break
    .byte 0xf1, 0x02
    .byte 0xf1, 0x0b
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDI8 r4,imm8 (upper)
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    .byte 0xc0, 0xa5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDI8 r0,imm8 (cold lower)
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    .byte 0xf0, 0x00, 0xa5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDI16 r4,imm16 (upper)
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    .byte 0xc4, 0x5a, 0xa5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDI16 r0,imm16 (cold lower)
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    .byte 0xf0, 0x04, 0x5a, 0xa5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ZEXT8 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xff80
    sys debug_break
    .byte 0xf1, 0x70
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SEXT8 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xab80
    sys debug_break
    .byte 0xf6, 0x40
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SWAP8 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xab3c
    sys debug_break
    .byte 0xf1, 0x78
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BSWAP16 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x1234
    sys debug_break
    .byte 0xf6, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BOOL r0 (zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    sys debug_break
    .byte 0xf7, 0x88
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BOOL r0 (nonzero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x8000
    sys debug_break
    .byte 0xf7, 0x88
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: PUSH16 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x5aa5
    sys debug_break
    .byte 0xb0
    sys debug_break
    pop16 r1

; -----------------------------------------------------------------------------
; BENCH: POP16 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r1, 0x5aa5
    push16 r1
    sys debug_break
    .byte 0xb8
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ADJSP simm8
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    adjsp -8
    sys debug_break
    ldi16 r7, SAFE_SP
    setsp r7

; -----------------------------------------------------------------------------
; BENCH: GETSP r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    .byte 0xf1, 0x80
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SETSP r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, SAFE_SP
    sys debug_break
    .byte 0xf1, 0x88
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LEASP r0,32 (cold)
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    .byte 0xf0, 0x10, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ADD r4,r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x1234
    ldi16 r5, 0x0102
    sys debug_break
    .byte 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ADD r0,r1 (full F2)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x1234
    ldi16 r1, 0x0102
    sys debug_break
    .byte 0xf2, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SUB r4,r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x1234
    ldi16 r5, 0x0102
    sys debug_break
    .byte 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SUB r0,r1 (full F2)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x1234
    ldi16 r1, 0x0102
    sys debug_break
    .byte 0xf2, 0x31
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ADDI.S8 r4,simm8 (upper)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x1234
    sys debug_break
    .byte 0xc8, 0xef
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ADDI.S8 r0,simm8 (cold lower)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x1234
    sys debug_break
    .byte 0xf0, 0x08, 0xef
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: INC16 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x7fff
    sys debug_break
    .byte 0xf4, 0xa8
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: DEC16 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x8000
    sys debug_break
    .byte 0xf4, 0xb0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: NEG16 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x1234
    sys debug_break
    .byte 0xf6, 0x48
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ADD32 q0,q1
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xffff
    ldi16 r1, 0x1234
    ldi16 r2, 0x0001
    ldi16 r3, 0x4321
    sys debug_break
    .byte 0xf7, 0x61
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SUB32 q0,q1
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x5678
    ldi16 r2, 0x0001
    ldi16 r3, 0x1234
    sys debug_break
    .byte 0xf7, 0x71
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL32.1 q0 (ADD32 q0,q0 alias)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x4081
    ldi16 r1, 0x8000
    sys debug_break
    .byte 0xf7, 0x60
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: AND r4,r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0xf0f3
    ldi16 r5, 0x0ff0
    sys debug_break
    .byte 0x81
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: AND r0,r1 (full F9)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xf0f3
    ldi16 r1, 0x0ff0
    sys debug_break
    .byte 0xf9, 0x04
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: OR r4,r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0xf003
    ldi16 r5, 0x0ff0
    sys debug_break
    .byte 0x91
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: OR r0,r1 (full F9)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xf003
    ldi16 r1, 0x0ff0
    sys debug_break
    .byte 0xf9, 0x05
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: XOR r4,r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x55aa
    ldi16 r5, 0x0ff0
    sys debug_break
    .byte 0xa1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: XOR r0,r1 (full F9)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x55aa
    ldi16 r1, 0x0ff0
    sys debug_break
    .byte 0xf9, 0x06
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: NOT16 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x55aa
    sys debug_break
    .byte 0xf4, 0x98
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16.1 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x4081
    sys debug_break
    .byte 0xf4, 0x80
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16.1 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x8101
    sys debug_break
    .byte 0xf4, 0x88
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16.1 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x8101
    sys debug_break
    .byte 0xf4, 0x90
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR32.1 q0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x8000
    sys debug_break
    .byte 0xf7, 0x80
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR32.1 q0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x8000
    sys debug_break
    .byte 0xf7, 0x84
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 0
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 1
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 2)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 2
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 3)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 3
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 4)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 4
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 5)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 5
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 6)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 6
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 7)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 7
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 8)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 8
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 9)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 9
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 10)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 10
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 11)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 11
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 12)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 12
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 13)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 13
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 14)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 14
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SHL16V r4,r5 (count 15)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    ldi8 r5, 15
    sys debug_break
    .byte 0xfa, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 0
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 1
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 2)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 2
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 3)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 3
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 4)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 4
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 5)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 5
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 6)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 6
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 7)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 7
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 8)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 8
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 9)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 9
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 10)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 10
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 11)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 11
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 12)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 12
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 13)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 13
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 14)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 14
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16V r4,r5 (count 15)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 15
    sys debug_break
    .byte 0xfa, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 0
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 1
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 2)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 2
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 3)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 3
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 4)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 4
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 5)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 5
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 6)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 6
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 7)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 7
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 8)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 8
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 9)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 9
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 10)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 10
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 11)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 11
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 12)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 12
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 13)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 13
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 14)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 14
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16V r4,r5 (count 15)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    ldi8 r5, 15
    sys debug_break
    .byte 0xfa, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x30
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,1
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x31
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,2
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x32
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,3
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x33
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,4
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x34
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,5
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x35
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,6
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x36
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,7
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x37
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,8
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x38
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,9
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x39
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,10
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x3a
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,11
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x3b
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,12
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x3c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,13
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x3d
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,14
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x3e
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSL16I r4,15
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x4081
    sys debug_break
    .byte 0xfa, 0x3f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x70
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,1
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x71
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,2
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x72
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,3
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x73
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,4
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x74
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,5
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x75
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,6
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x76
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,7
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x77
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,8
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x78
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,9
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x79
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,10
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x7a
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,11
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x7b
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,12
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x7c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,13
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x7d
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,14
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x7e
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LSR16I r4,15
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0x7f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,1
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,2
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,3
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,4
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,5
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,6
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb6
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,7
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb7
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,8
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb8
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,9
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xb9
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,10
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xba
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,11
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xbb
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,12
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xbc
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,13
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xbd
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,14
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xbe
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ASR16I r4,15
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8101
    sys debug_break
    .byte 0xfa, 0xbf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: MUL8 r4,r5
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi8 r4, 0xf3
    ldi8 r5, 0x11
    sys debug_break
    .byte 0xf6, 0x31
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: MULU8.W r4,r5
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi8 r4, 0xf3
    ldi8 r5, 0x11
    sys debug_break
    .byte 0xf3, 0x11
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: MULS8.W r4,r5
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi8 r4, 0xf3
    ldi8 r5, 0x11
    sys debug_break
    .byte 0xf3, 0x21
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: MULSU8.W r4,r5
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi8 r4, 0xf9
    ldi8 r5, 0xc8
    sys debug_break
    .byte 0xf3, 0x31
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: MUL16 r0,r1
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x1234
    ldi16 r1, 0x4321
    sys debug_break
    .byte 0xfe, 0x01
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: UDIV16 r0,r1 (0xa5a5 / 0x0000; zero-divisor fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; zero-divisor fast path.
    ldi16 r0, 0xa5a5
    ldi16 r1, 0x0000
    sys debug_break
    udiv16 r0, r1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UDIV16 r2,r3 (0x0007 / 0x00ff; 8-bit core, quotient popcount 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, quotient popcount 0.
    ldi16 r2, 0x0007
    ldi16 r3, 0x00ff
    sys debug_break
    udiv16 r2, r3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UDIV16 r1,r6 (0x0080 / 0x0001; 8-bit core, quotient popcount 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, quotient popcount 1.
    ldi16 r1, 0x0080
    ldi16 r6, 0x0001
    sys debug_break
    udiv16 r1, r6
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UDIV16 r4,r5 (0x00ff / 0x0001; 8-bit core, quotient popcount 8)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, quotient popcount 8.
    ldi16 r4, 0x00ff
    ldi16 r5, 0x0001
    sys debug_break
    udiv16 r4, r5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UDIV16 r6,r7 (0x1234 / 0x8000; 16-bit core, quotient popcount 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, quotient popcount 0.
    ldi16 r6, 0x1234
    ldi16 r7, 0x8000
    sys debug_break
    udiv16 r6, r7
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UDIV16 r3,r4 (0x8000 / 0x0001; 16-bit core, quotient popcount 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, quotient popcount 1.
    ldi16 r3, 0x8000
    ldi16 r4, 0x0001
    sys debug_break
    udiv16 r3, r4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UDIV16 r7,r0 (0xffff / 0x0001; 16-bit core, quotient popcount 16)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, quotient popcount 16.
    ldi16 r7, 0xffff
    ldi16 r0, 0x0001
    sys debug_break
    udiv16 r7, r0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UDIV16 r5,r5 (0x00a5 / 0x00a5; 8-bit core, rD == rS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, rD == rS.
    ldi16 r5, 0x00a5
    sys debug_break
    udiv16 r5, r5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UREM16 r0,r1 (0xa5a5 / 0x0000; zero-divisor fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; zero-divisor fast path.
    ldi16 r0, 0xa5a5
    ldi16 r1, 0x0000
    sys debug_break
    urem16 r0, r1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UREM16 r2,r3 (0x0007 / 0x00ff; 8-bit core, quotient popcount 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, quotient popcount 0.
    ldi16 r2, 0x0007
    ldi16 r3, 0x00ff
    sys debug_break
    urem16 r2, r3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UREM16 r1,r6 (0x0080 / 0x0001; 8-bit core, quotient popcount 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, quotient popcount 1.
    ldi16 r1, 0x0080
    ldi16 r6, 0x0001
    sys debug_break
    urem16 r1, r6
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UREM16 r4,r5 (0x00ff / 0x0001; 8-bit core, quotient popcount 8)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, quotient popcount 8.
    ldi16 r4, 0x00ff
    ldi16 r5, 0x0001
    sys debug_break
    urem16 r4, r5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UREM16 r6,r7 (0x1234 / 0x8000; 16-bit core, quotient popcount 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, quotient popcount 0.
    ldi16 r6, 0x1234
    ldi16 r7, 0x8000
    sys debug_break
    urem16 r6, r7
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UREM16 r3,r4 (0x8000 / 0x0001; 16-bit core, quotient popcount 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, quotient popcount 1.
    ldi16 r3, 0x8000
    ldi16 r4, 0x0001
    sys debug_break
    urem16 r3, r4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UREM16 r7,r0 (0xffff / 0x0001; 16-bit core, quotient popcount 16)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, quotient popcount 16.
    ldi16 r7, 0xffff
    ldi16 r0, 0x0001
    sys debug_break
    urem16 r7, r0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: UREM16 r5,r5 (0x00a5 / 0x00a5; 8-bit core, rD == rS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, rD == rS.
    ldi16 r5, 0x00a5
    sys debug_break
    urem16 r5, r5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r0,r1 (0xcfc7 / 0x0000; zero-divisor fast path, negative dividend)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; zero-divisor fast path, negative dividend.
    ldi16 r0, 0xcfc7
    ldi16 r1, 0x0000
    sys debug_break
    sdiv16 r0, r1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r2,r3 (0x0007 / 0x007f; 8-bit core, positive operands, quotient popcount 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, positive operands, quotient popcount 0.
    ldi16 r2, 0x0007
    ldi16 r3, 0x007f
    sys debug_break
    sdiv16 r2, r3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r1,r6 (0xff80 / 0x0001; 8-bit core, one negative input, quotient popcount 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, one negative input, quotient popcount 1.
    ldi16 r1, 0xff80
    ldi16 r6, 0x0001
    sys debug_break
    sdiv16 r1, r6
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r4,r5 (0xff01 / 0x0001; 8-bit core, one negative input, quotient popcount 8)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, one negative input, quotient popcount 8.
    ldi16 r4, 0xff01
    ldi16 r5, 0x0001
    sys debug_break
    sdiv16 r4, r5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r6,r7 (0x1234 / 0x7fff; 16-bit core, positive operands, quotient popcount 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, positive operands, quotient popcount 0.
    ldi16 r6, 0x1234
    ldi16 r7, 0x7fff
    sys debug_break
    sdiv16 r6, r7
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r3,r4 (0x8000 / 0x0100; 16-bit core, one negative input, quotient popcount 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, one negative input, quotient popcount 1.
    ldi16 r3, 0x8000
    ldi16 r4, 0x0100
    sys debug_break
    sdiv16 r3, r4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r7,r0 (0x8001 / 0x0001; 16-bit core, one negative input, quotient popcount 15)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, one negative input, quotient popcount 15.
    ldi16 r7, 0x8001
    ldi16 r0, 0x0001
    sys debug_break
    sdiv16 r7, r0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r5,r2 (0x8000 / 0xffff; 16-bit core, INT16_MIN / -1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, INT16_MIN / -1.
    ldi16 r5, 0x8000
    ldi16 r2, 0xffff
    sys debug_break
    sdiv16 r5, r2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SDIV16 r4,r4 (0xffff / 0xffff; 8-bit core, two negative inputs, rD == rS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, two negative inputs, rD == rS.
    ldi16 r4, 0xffff
    sys debug_break
    sdiv16 r4, r4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r0,r1 (0xcfc7 / 0x0000; zero-divisor fast path, negative dividend)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; zero-divisor fast path, negative dividend.
    ldi16 r0, 0xcfc7
    ldi16 r1, 0x0000
    sys debug_break
    srem16 r0, r1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r2,r3 (0x0007 / 0x007f; 8-bit core, positive operands, quotient popcount 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, positive operands, quotient popcount 0.
    ldi16 r2, 0x0007
    ldi16 r3, 0x007f
    sys debug_break
    srem16 r2, r3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r1,r6 (0xff80 / 0x0001; 8-bit core, one negative input, quotient popcount 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, one negative input, quotient popcount 1.
    ldi16 r1, 0xff80
    ldi16 r6, 0x0001
    sys debug_break
    srem16 r1, r6
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r4,r5 (0xff01 / 0xffff; 8-bit core, two negative inputs, quotient popcount 8)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, two negative inputs, quotient popcount 8.
    ldi16 r4, 0xff01
    ldi16 r5, 0xffff
    sys debug_break
    srem16 r4, r5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r6,r7 (0x1234 / 0x7fff; 16-bit core, positive operands, quotient popcount 0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, positive operands, quotient popcount 0.
    ldi16 r6, 0x1234
    ldi16 r7, 0x7fff
    sys debug_break
    srem16 r6, r7
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r3,r4 (0x8000 / 0x0100; 16-bit core, one negative input, quotient popcount 1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, one negative input, quotient popcount 1.
    ldi16 r3, 0x8000
    ldi16 r4, 0x0100
    sys debug_break
    srem16 r3, r4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r7,r0 (0x8001 / 0xffff; 16-bit core, two negative inputs, quotient popcount 15)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, two negative inputs, quotient popcount 15.
    ldi16 r7, 0x8001
    ldi16 r0, 0xffff
    sys debug_break
    srem16 r7, r0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r5,r2 (0x8000 / 0xffff; 16-bit core, INT16_MIN / -1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 16-bit core, INT16_MIN / -1.
    ldi16 r5, 0x8000
    ldi16 r2, 0xffff
    sys debug_break
    srem16 r5, r2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SREM16 r4,r4 (0xffff / 0xffff; 8-bit core, two negative inputs, rD == rS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ; 8-bit core, two negative inputs, rD == rS.
    ldi16 r4, 0xffff
    sys debug_break
    srem16 r4, r4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q0,q1 (normal same-sign)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fc0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4010
    sys debug_break
    fadd q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q2,q3 (exact cancellation)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3fc0
    ldi16 r6, 0x0000
    ldi16 r7, 0xbfc0
    sys debug_break
    fadd q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q0,q1 (large exponent gap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0001
    ldi16 r3, 0x0000
    sys debug_break
    fadd q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q0,q1 (subnormal result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    ldi16 r2, 0x0001
    ldi16 r3, 0x0000
    sys debug_break
    fadd q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q0,q1 (overflow to +infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xffff
    ldi16 r1, 0x7f7f
    ldi16 r2, 0xffff
    ldi16 r3, 0x7f7f
    sys debug_break
    fadd q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q0,q1 (infinity plus finite)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fadd q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q0,q1 (invalid +infinity plus -infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0xff80
    sys debug_break
    fadd q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q0,q1 (quiet NaN operand)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fadd q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q3,q3 (qD == qS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x3fc0
    sys debug_break
    fadd q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q0,q1 (normal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x40b0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fsub q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q2,q3 (exact cancellation)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3fc0
    ldi16 r6, 0x0000
    ldi16 r7, 0x3fc0
    sys debug_break
    fsub q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q0,q1 (large exponent gap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0001
    ldi16 r3, 0x0000
    sys debug_break
    fsub q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q0,q1 (subnormal result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0080
    ldi16 r2, 0xffff
    ldi16 r3, 0x007f
    sys debug_break
    fsub q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q0,q1 (overflow to +infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xffff
    ldi16 r1, 0x7f7f
    ldi16 r2, 0xffff
    ldi16 r3, 0xff7f
    sys debug_break
    fsub q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q0,q1 (-infinity minus finite)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xff80
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fsub q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q0,q1 (invalid infinity minus infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    fsub q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q0,q1 (quiet NaN operand)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fsub q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q3,q3 (qD == qS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x3fc0
    sys debug_break
    fsub q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (normal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fc0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4010
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q2,q3 (negative result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0xbfc0
    ldi16 r6, 0x0000
    ldi16 r7, 0x4010
    sys debug_break
    fmul q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (signed zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    ldi16 r2, 0x0000
    ldi16 r3, 0x4040
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (subnormal result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0080
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f00
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (underflow halfway to zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f00
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (overflow to +infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xffff
    ldi16 r1, 0x7f7f
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (infinity times finite)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0xc000
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (invalid infinity times zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (quiet NaN operand)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q3,q3 (qD == qS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xc000
    sys debug_break
    fmul q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q0,q1 (finite destination q0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fc0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4010
    sys debug_break
    fadd q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q1,q2 (finite destination q1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x3fc0
    ldi16 r4, 0x0000
    ldi16 r5, 0x4010
    sys debug_break
    fadd q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q2,q3 (finite destination q2)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3fc0
    ldi16 r6, 0x0000
    ldi16 r7, 0x4010
    sys debug_break
    fadd q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FADD q3,q0 (finite destination q3)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4010
    ldi16 r6, 0x0000
    ldi16 r7, 0x3fc0
    sys debug_break
    fadd q3, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q0,q1 (finite destination q0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x40b0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fsub q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q1,q2 (finite destination q1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x40b0
    ldi16 r4, 0x0000
    ldi16 r5, 0x4000
    sys debug_break
    fsub q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q2,q3 (finite destination q2)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x40b0
    ldi16 r6, 0x0000
    ldi16 r7, 0x4000
    sys debug_break
    fsub q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSUB q3,q0 (finite destination q3)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4000
    ldi16 r6, 0x0000
    ldi16 r7, 0x40b0
    sys debug_break
    fsub q3, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q0,q1 (finite destination q0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fc0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4010
    sys debug_break
    fmul q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q1,q2 (finite destination q1)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x3fc0
    ldi16 r4, 0x0000
    ldi16 r5, 0x4010
    sys debug_break
    fmul q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q2,q3 (finite destination q2)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3fc0
    ldi16 r6, 0x0000
    ldi16 r7, 0x4010
    sys debug_break
    fmul q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMUL q3,q0 (finite destination q3)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4010
    ldi16 r6, 0x0000
    ldi16 r7, 0x3fc0
    sys debug_break
    fmul q3, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (exact normal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x40e0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q2,q3 (recurring normal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3f80
    ldi16 r6, 0x0000
    ldi16 r7, 0x4040
    sys debug_break
    fdiv q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (negative result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xc0e0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (signed zero numerator)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    ldi16 r2, 0x0000
    ldi16 r3, 0xc000
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (zero divisor)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (subnormal result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0080
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (underflow halfway to zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (overflow)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xffff
    ldi16 r1, 0x7f7f
    ldi16 r2, 0x0000
    ldi16 r3, 0x0080
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (finite divided by infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4120
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (infinity divided by finite)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xff80
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (invalid zero divided by zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (invalid infinity divided by infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q0,q1 (quiet NaN operand)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fdiv q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FDIV q3,q3 (qD == qS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xc040
    sys debug_break
    fdiv q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q0,q1 (left selected)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fmin q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q2,q3 (right selected)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x4000
    ldi16 r6, 0x0000
    ldi16 r7, 0x3f80
    sys debug_break
    fmin q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q0,q1 (equal finite)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fmin q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q0,q1 (opposite zeros +0,-0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    ldi16 r2, 0x0000
    ldi16 r3, 0x8000
    sys debug_break
    fmin q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q0,q1 (opposite zeros -0,+0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    fmin q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q0,q1 (first operand NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fmin q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q0,q1 (second operand NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x4321
    ldi16 r3, 0xffc5
    sys debug_break
    fmin q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q0,q1 (both operands NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x4321
    ldi16 r3, 0xffc5
    sys debug_break
    fmin q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMIN q3,q3 (qD == qS NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x2345
    ldi16 r7, 0x7fc1
    sys debug_break
    fmin q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q0,q1 (left selected)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fmax q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q2,q3 (right selected)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x4000
    ldi16 r6, 0x0000
    ldi16 r7, 0x3f80
    sys debug_break
    fmax q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q0,q1 (equal finite)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fmax q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q0,q1 (opposite zeros +0,-0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    ldi16 r2, 0x0000
    ldi16 r3, 0x8000
    sys debug_break
    fmax q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q0,q1 (opposite zeros -0,+0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    fmax q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q0,q1 (first operand NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fmax q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q0,q1 (second operand NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x4321
    ldi16 r3, 0xffc5
    sys debug_break
    fmax q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q0,q1 (both operands NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x4321
    ldi16 r3, 0xffc5
    sys debug_break
    fmax q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FMAX q3,q3 (qD == qS NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x2345
    ldi16 r7, 0x7fc1
    sys debug_break
    fmax q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FNEG q0 (signed zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    sys debug_break
    fneg q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FNEG q3 (NaN payload/sign bit path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x2345
    ldi16 r7, 0x7fc1
    sys debug_break
    fneg q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FABS q0 (signed zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    sys debug_break
    fabs q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FABS q3 (NaN payload/sign bit path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x2345
    ldi16 r7, 0x7fc1
    sys debug_break
    fabs q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q0 (+zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    fsqrt q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q1 (-zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x8000
    sys debug_break
    fsqrt q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q2 (perfect square)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x4080
    sys debug_break
    fsqrt q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q3 (irrational normal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x4000
    sys debug_break
    fsqrt q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q0 (minimum subnormal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    sys debug_break
    fsqrt q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q1 (maximum finite)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0xffff
    ldi16 r3, 0x7f7f
    sys debug_break
    fsqrt q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q2 (+infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x7f80
    sys debug_break
    fsqrt q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q3 (negative finite invalid)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xbf80
    sys debug_break
    fsqrt q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FSQRT q0 (quiet NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    sys debug_break
    fsqrt q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q0 (+zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    ftrunc q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q1 (-zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x8000
    sys debug_break
    ftrunc q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q2 (positive magnitude below one)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3f40
    sys debug_break
    ftrunc q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q3 (negative magnitude below one)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xbf40
    sys debug_break
    ftrunc q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q0 (positive fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fa0
    sys debug_break
    ftrunc q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q1 (negative fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0xbfa0
    sys debug_break
    ftrunc q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q2 (positive halfway)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x4020
    sys debug_break
    ftrunc q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q3 (negative halfway)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xc020
    sys debug_break
    ftrunc q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q0 (large integral)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4b80
    sys debug_break
    ftrunc q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q1 (+infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    ftrunc q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTRUNC q2 (quiet NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x2345
    ldi16 r5, 0x7fc1
    sys debug_break
    ftrunc q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q0 (+zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    ffloor q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q1 (-zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x8000
    sys debug_break
    ffloor q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q2 (positive magnitude below one)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3f40
    sys debug_break
    ffloor q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q3 (negative magnitude below one)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xbf40
    sys debug_break
    ffloor q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q0 (positive fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fa0
    sys debug_break
    ffloor q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q1 (negative fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0xbfa0
    sys debug_break
    ffloor q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q2 (positive halfway)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x4020
    sys debug_break
    ffloor q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q3 (negative halfway)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xc020
    sys debug_break
    ffloor q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q0 (large integral)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4b80
    sys debug_break
    ffloor q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q1 (+infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    ffloor q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FFLOOR q2 (quiet NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x2345
    ldi16 r5, 0x7fc1
    sys debug_break
    ffloor q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q0 (+zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    fceil q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q1 (-zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x8000
    sys debug_break
    fceil q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q2 (positive magnitude below one)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3f40
    sys debug_break
    fceil q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q3 (negative magnitude below one)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xbf40
    sys debug_break
    fceil q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q0 (positive fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fa0
    sys debug_break
    fceil q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q1 (negative fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0xbfa0
    sys debug_break
    fceil q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q2 (positive halfway)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x4020
    sys debug_break
    fceil q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q3 (negative halfway)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xc020
    sys debug_break
    fceil q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q0 (large integral)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4b80
    sys debug_break
    fceil q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q1 (+infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    fceil q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCEIL q2 (quiet NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x2345
    ldi16 r5, 0x7fc1
    sys debug_break
    fceil q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q0 (+zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    fround q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q1 (-zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x8000
    sys debug_break
    fround q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q2 (positive magnitude below one)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3f40
    sys debug_break
    fround q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q3 (negative magnitude below one)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xbf40
    sys debug_break
    fround q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q0 (positive fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fa0
    sys debug_break
    fround q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q1 (negative fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0xbfa0
    sys debug_break
    fround q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q2 (positive halfway)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x4020
    sys debug_break
    fround q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q3 (negative halfway)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xc020
    sys debug_break
    fround q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q0 (large integral)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4b80
    sys debug_break
    fround q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q1 (+infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    fround q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q2 (quiet NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x2345
    ldi16 r5, 0x7fc1
    sys debug_break
    fround q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q0 (positive halfway above odd integer)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4060
    sys debug_break
    fround q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FROUND q1 (negative halfway below odd integer)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0xc060
    sys debug_break
    fround q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S16TOF q0,r4 (zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    sys debug_break
    s16tof q0, r4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S16TOF q1,r5 (small positive)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r5, 0x0001
    sys debug_break
    s16tof q1, r5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S16TOF q2,r6 (small negative)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0xffff
    sys debug_break
    s16tof q2, r6
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S16TOF q3,r7 (INT16_MAX)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r7, 0x7fff
    sys debug_break
    s16tof q3, r7
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S16TOF q0,r0 (INT16_MIN with source overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x8000
    sys debug_break
    s16tof q0, r0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U16TOF q0,r4 (zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    sys debug_break
    u16tof q0, r4
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U16TOF q1,r5 (small)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r5, 0x0001
    sys debug_break
    u16tof q1, r5
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U16TOF q2,r6 (UINT16_MAX)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0xffff
    sys debug_break
    u16tof q2, r6
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U16TOF q3,r7 (high-bit value)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r7, 0x8001
    sys debug_break
    u16tof q3, r7
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS16 r4,q0 (+zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    ftos16 r4, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS16 r5,q1 (-zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x8000
    sys debug_break
    ftos16 r5, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS16 r6,q2 (positive fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8000
    ldi16 r5, 0x42f7
    sys debug_break
    ftos16 r6, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS16 r7,q3 (negative fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0xc2f7
    sys debug_break
    ftos16 r7, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS16 r0,q0 (largest in-range positive neighborhood with overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xfe00
    ldi16 r1, 0x46ff
    sys debug_break
    ftos16 r0, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS16 r1,q1 (INT16_MIN with overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0xc700
    sys debug_break
    ftos16 r1, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS16 r2,q2 (NaN unspecified result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x2345
    ldi16 r5, 0x7fc1
    sys debug_break
    ftos16 r2, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS16 r3,q3 (infinity unspecified result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x7f80
    sys debug_break
    ftos16 r3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU16 r4,q0 (zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    ftou16 r4, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU16 r5,q1 (positive fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x8000
    ldi16 r3, 0x42f7
    sys debug_break
    ftou16 r5, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU16 r6,q2 (UINT16_MAX neighborhood)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0xff00
    ldi16 r5, 0x477f
    sys debug_break
    ftou16 r6, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU16 r7,q3 (negative unspecified result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xbf80
    sys debug_break
    ftou16 r7, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU16 r0,q0 (NaN unspecified result with overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    sys debug_break
    ftou16 r0, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU16 r1,q1 (infinity unspecified result with overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    ftou16 r1, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S32TOF q0,q1 (zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    s32tof q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S32TOF q1,q2 (small positive)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0001
    ldi16 r5, 0x0000
    sys debug_break
    s32tof q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S32TOF q2,q3 (small negative)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0xffff
    ldi16 r7, 0xffff
    sys debug_break
    s32tof q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S32TOF q3,q0 (rounding above 2^24)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0100
    sys debug_break
    s32tof q3, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S32TOF q0,q1 (INT32_MAX)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0xffff
    ldi16 r3, 0x7fff
    sys debug_break
    s32tof q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S32TOF q1,q2 (INT32_MIN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x8000
    sys debug_break
    s32tof q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: S32TOF q3,q3 (qD == qS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0xffff
    ldi16 r7, 0x00ff
    sys debug_break
    s32tof q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U32TOF q0,q1 (zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    u32tof q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U32TOF q1,q2 (small)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0001
    ldi16 r5, 0x0000
    sys debug_break
    u32tof q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U32TOF q2,q3 (ties-to-even neighborhood)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0100
    sys debug_break
    u32tof q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U32TOF q3,q0 (UINT32_MAX)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xffff
    ldi16 r1, 0xffff
    sys debug_break
    u32tof q3, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: U32TOF q3,q3 (qD == qS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x8000
    sys debug_break
    u32tof q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS32 q0,q1 (zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    ftos32 q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS32 q1,q2 (positive fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8000
    ldi16 r5, 0x42f7
    sys debug_break
    ftos32 q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS32 q2,q3 (negative fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0xc2f7
    sys debug_break
    ftos32 q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS32 q3,q0 (large in-range positive)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xffff
    ldi16 r1, 0x4eff
    sys debug_break
    ftos32 q3, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS32 q0,q1 (INT32_MIN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0xcf00
    sys debug_break
    ftos32 q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS32 q1,q2 (NaN unspecified result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x2345
    ldi16 r5, 0x7fc1
    sys debug_break
    ftos32 q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS32 q2,q3 (infinity unspecified result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x7f80
    sys debug_break
    ftos32 q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOS32 q3,q3 (qD == qS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xbfa0
    sys debug_break
    ftos32 q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU32 q0,q1 (zero)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    ftou32 q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU32 q1,q2 (positive fractional)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x8000
    ldi16 r5, 0x42f7
    sys debug_break
    ftou32 q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU32 q2,q3 (large in-range unsigned)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0xffff
    ldi16 r7, 0x4f7f
    sys debug_break
    ftou32 q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU32 q3,q0 (negative unspecified result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xbf80
    sys debug_break
    ftou32 q3, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU32 q0,q1 (NaN unspecified result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x2345
    ldi16 r3, 0x7fc1
    sys debug_break
    ftou32 q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU32 q1,q2 (infinity unspecified result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x7f80
    sys debug_break
    ftou32 q1, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FTOU32 q3,q3 (qD == qS)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x3fa0
    sys debug_break
    ftou32 q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCMP r4,q0,q1 (less)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    fcmp r4, q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCMP r5,q2,q3 (greater)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x4000
    ldi16 r6, 0x0000
    ldi16 r7, 0x3f80
    sys debug_break
    fcmp r5, q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCMP r6,q0,q1 (equal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fcmp r6, q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCMP r7,q2,q3 (signed zeros equal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x8000
    ldi16 r6, 0x0000
    ldi16 r7, 0x0000
    sys debug_break
    fcmp r7, q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCMP r0,q0,q1 (left quiet NaN unordered with destination overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    fcmp r0, q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCMP r1,q0,q1 (right quiet NaN unordered with destination overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x4321
    ldi16 r3, 0xffc5
    sys debug_break
    fcmp r1, q0, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCMP r4,q2,q3 (left signaling NaN unordered)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x2345
    ldi16 r5, 0x7fa1
    ldi16 r6, 0x0000
    ldi16 r7, 0x4000
    sys debug_break
    fcmp r4, q2, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCMP r5,q3,q3 (qL == qR)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x3f80
    sys debug_break
    fcmp r5, q3, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r4,q0 (signaling NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fa1
    sys debug_break
    fclass r4, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r5,q1 (quiet NaN)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x2345
    ldi16 r3, 0x7fc1
    sys debug_break
    fclass r5, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r6,q2 (negative infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0xff80
    sys debug_break
    fclass r6, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r7,q3 (negative normal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0xbf80
    sys debug_break
    fclass r7, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r0,q0 (negative subnormal with destination overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x8000
    sys debug_break
    fclass r0, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r1,q0 (negative zero with destination overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    sys debug_break
    fclass r1, q0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r2,q1 (positive zero with destination overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    fclass r2, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r3,q1 (positive subnormal with destination overlap)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r2, 0x0001
    ldi16 r3, 0x0000
    sys debug_break
    fclass r3, q1
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r4,q2 (positive normal)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0000
    ldi16 r5, 0x3f80
    sys debug_break
    fclass r4, q2
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: FCLASS r5,q3 (positive infinity)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x7f80
    sys debug_break
    fclass r5, q3
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMP r4,r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x1234
    ldi16 r5, 0x5678
    sys debug_break
    .byte 0x31
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMP r0,r1 (full F5)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x1234
    ldi16 r1, 0x5678
    sys debug_break
    .byte 0xf5, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMP32 q0,q1 (cold F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x5678
    ldi16 r1, 0x1234
    ldi16 r2, 0x5679
    ldi16 r3, 0x1234
    sys debug_break
    .byte 0xf0, 0x69, 0x04
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMPI.S8 r4,simm8 (upper)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x1234
    sys debug_break
    .byte 0xcc, 0xef
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMPI.S8 r0,simm8 (cold lower)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x1234
    sys debug_break
    .byte 0xf0, 0x0c, 0xef
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: TST8 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xab80
    sys debug_break
    .byte 0xf4, 0xa0
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: TST16 r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x8000
    sys debug_break
    .byte 0xf6, 0x28
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.EQ r0 (true)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x00
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.EQ r0 (false)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x00
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.NE r0 (true)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x08
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.NE r0 (false)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x08
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.ULT r0 (true)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x0001
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x10
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.ULT r0 (false)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x10
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.UGE r0 (true)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x18
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.UGE r0 (false)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x0001
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x18
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.SLT r0 (true)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.SLT r0 (false)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.SGE r0 (true)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x28
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CSET.SGE r0 (false)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    .byte 0xf8, 0x28
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.EQ r0,r1 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfb, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.EQ r0,r1 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfb, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.NE r0,r1 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfb, 0x41
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.NE r0,r1 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfb, 0x41
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.ULT r0,r1 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfc, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.ULT r0,r1 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfc, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.UGE r0,r1 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfc, 0x41
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.UGE r0,r1 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfc, 0x41
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.SLT r0,r1 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0x0000
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfd, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.SLT r0,r1 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfd, 0x01
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.SGE r0,r1 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfd, 0x41
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CMOV.SGE r0,r1 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0x0000
    cmp r6, r7
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    sys debug_break
    .byte 0xfd, 0x41
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD8U r4,[r6] (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi8 r5, 0xa5
    st8 [r6], r5
    ldi16 r6, 0x0600
    sys debug_break
    .byte 0x42
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST8 [r6],r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0x81a5
    sys debug_break
    .byte 0x59
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD16 r4,[r6] (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0xa55a
    st16 [r6], r5
    ldi16 r6, 0x0600
    sys debug_break
    .byte 0x62
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST16 [r6],r5 (upper one-byte)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0xa55a
    sys debug_break
    .byte 0x79
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST8 [r6],r0 (dense F3)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r0, 0x81a5
    sys debug_break
    .byte 0xf3, 0x08
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD8U r0,[r6] (dense F5)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi8 r5, 0xa5
    st8 [r6], r5
    ldi16 r6, 0x0600
    sys debug_break
    .byte 0xf5, 0x38
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD16 r0,[r6] (dense F5)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0xa55a
    st16 [r6], r5
    ldi16 r6, 0x0600
    sys debug_break
    .byte 0xf5, 0x48
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST16 [r6],r0 (dense F5)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r0, 0xa55a
    sys debug_break
    .byte 0xf5, 0x58
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD8U r0,[r6+] (dense F7)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi8 r5, 0xa5
    st8 [r6], r5
    ldi16 r6, 0x0600
    sys debug_break
    .byte 0xf7, 0x10
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD16 r0,[r6+] (dense F7)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0xa55a
    st16 [r6], r5
    ldi16 r6, 0x0600
    sys debug_break
    .byte 0xf7, 0x30
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST8 [r6+],r0 (dense F6)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r0, 0x81a5
    sys debug_break
    .byte 0xf6, 0x10
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST16 [r6+],r0 (dense F7)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r0, 0xa55a
    sys debug_break
    .byte 0xf7, 0x50
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD8U r0,[r1] (cold general F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi8 r5, 0xa5
    st8 [r6], r5
    ldi16 r1, 0x0600
    sys debug_break
    .byte 0xf0, 0x6c, 0x02
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD16 r0,[r1] (cold general F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0xa55a
    st16 [r6], r5
    ldi16 r1, 0x0600
    sys debug_break
    .byte 0xf0, 0x6c, 0x12
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST8 [r1],r0 (cold general F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r1, 0x0600
    ldi16 r0, 0x81a5
    sys debug_break
    .byte 0xf0, 0x6d, 0x02
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST16 [r1],r0 (cold general F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r1, 0x0600
    ldi16 r0, 0xa55a
    sys debug_break
    .byte 0xf0, 0x6d, 0x12
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD8U r0,[r1+] (cold general F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi8 r5, 0xa5
    st8 [r6], r5
    ldi16 r1, 0x0600
    sys debug_break
    .byte 0xf0, 0x6c, 0x03
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD16 r0,[r1+] (cold general F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0xa55a
    st16 [r6], r5
    ldi16 r1, 0x0600
    sys debug_break
    .byte 0xf0, 0x6c, 0x13
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST8 [r1+],r0 (cold general F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r1, 0x0600
    ldi16 r0, 0x81a5
    sys debug_break
    .byte 0xf0, 0x6d, 0x03
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST16 [r1+],r0 (cold general F0)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r1, 0x0600
    ldi16 r0, 0xa55a
    sys debug_break
    .byte 0xf0, 0x6d, 0x13
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDSP8U r4,[SP+8] (upper short)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x09c8
    ldi8 r5, 0xa5
    st8 [r6], r5
    sys debug_break
    .byte 0xf3, 0x60
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: STSP8 [SP+8],r4 (upper short)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x81a5
    sys debug_break
    .byte 0xf1, 0x50
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDSP16 r4,[SP+8] (upper short)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x09c8
    ldi16 r5, 0xa55a
    st16 [r6], r5
    sys debug_break
    .byte 0xf4, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: STSP16 [SP+8],r4 (upper short)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0xa55a
    sys debug_break
    .byte 0xf4, 0x60
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDSP8U r0,[SP+32] (cold)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x09e0
    ldi8 r5, 0xa5
    st8 [r6], r5
    sys debug_break
    .byte 0xf0, 0x18, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDSP8S r0,[SP+32] (cold)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x09e0
    ldi8 r5, 0x80
    st8 [r6], r5
    sys debug_break
    .byte 0xf0, 0x20, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: STSP8 [SP+32],r0 (cold)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x81a5
    sys debug_break
    .byte 0xf0, 0x28, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDSP16 r0,[SP+32] (cold)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x09e0
    ldi16 r5, 0xa55a
    st16 [r6], r5
    sys debug_break
    .byte 0xf0, 0x30, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: STSP16 [SP+32],r0 (cold)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xa55a
    sys debug_break
    .byte 0xf0, 0x38, 0x20
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDM8U r0,0x0600
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi8 r5, 0xa5
    st8 [r6], r5
    sys debug_break
    .byte 0xf0, 0x40, 0x00, 0x06
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: STM8 0x0600,r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x81a5
    sys debug_break
    .byte 0xf0, 0x48, 0x00, 0x06
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDM16 r0,0x0600
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0xa55a
    st16 [r6], r5
    sys debug_break
    .byte 0xf0, 0x50, 0x00, 0x06
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: STM16 0x0600,r0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0xa55a
    sys debug_break
    .byte 0xf0, 0x58, 0x00, 0x06
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LD32 q0,[r4]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0600
    ldi16 r5, 0x3412
    st16 [r6], r5
    ldi16 r6, 0x0602
    ldi16 r5, 0x7856
    st16 [r6], r5
    ldi16 r4, 0x0600
    sys debug_break
    .byte 0xf0, 0x6a, 0x08
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: ST32 [r4],q0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r4, 0x0600
    ldi16 r0, 0x3412
    ldi16 r1, 0x7856
    sys debug_break
    .byte 0xf0, 0x6b, 0x08
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP8U r0,[q3]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x60, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP8S r0,[q3]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x61, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP16 r0,[q3]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x62, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP24 q0,[q3]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x63, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP32 q0,[q3]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x64, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP8U r0,[q3+]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x65, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP16 r0,[q3+]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x66, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP24 q0,[q3+]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x67, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: LDP32 q0,[q3+]
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    sys debug_break
    .byte 0xf0, 0x68, 0x0c
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BREQ8 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    sys debug_break
    breq8 .Lbench_001_breq8_not_taken_target
    sys debug_break
.Lbench_001_breq8_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BREQ8 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    sys debug_break
    breq8 .Lbench_002_breq8_taken_target
    sys debug_break    ; skipped
.Lbench_002_breq8_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRNE8 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    sys debug_break
    brne8 .Lbench_003_brne8_not_taken_target
    sys debug_break
.Lbench_003_brne8_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRNE8 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    sys debug_break
    brne8 .Lbench_004_brne8_taken_target
    sys debug_break    ; skipped
.Lbench_004_brne8_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRULT8 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brult8 .Lbench_005_brult8_not_taken_target
    sys debug_break
.Lbench_005_brult8_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRULT8 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x0001
    cmp r6, r7
    sys debug_break
    brult8 .Lbench_006_brult8_taken_target
    sys debug_break    ; skipped
.Lbench_006_brult8_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRUGE8 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x0001
    cmp r6, r7
    sys debug_break
    bruge8 .Lbench_007_bruge8_not_taken_target
    sys debug_break
.Lbench_007_bruge8_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRUGE8 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    bruge8 .Lbench_008_bruge8_taken_target
    sys debug_break    ; skipped
.Lbench_008_bruge8_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRSLT8 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brslt8 .Lbench_009_brslt8_not_taken_target
    sys debug_break
.Lbench_009_brslt8_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRSLT8 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brslt8 .Lbench_010_brslt8_taken_target
    sys debug_break    ; skipped
.Lbench_010_brslt8_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRSGE8 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brsge8 .Lbench_011_brsge8_not_taken_target
    sys debug_break
.Lbench_011_brsge8_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRSGE8 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brsge8 .Lbench_012_brsge8_taken_target
    sys debug_break    ; skipped
.Lbench_012_brsge8_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BREQ16 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    sys debug_break
    breq16 .Lbench_013_breq16_not_taken_target
    sys debug_break
.Lbench_013_breq16_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BREQ16 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    sys debug_break
    breq16 .Lbench_014_breq16_taken_target
    sys debug_break    ; skipped
.Lbench_014_breq16_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRNE16 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    sys debug_break
    brne16 .Lbench_015_brne16_not_taken_target
    sys debug_break
.Lbench_015_brne16_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRNE16 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    sys debug_break
    brne16 .Lbench_016_brne16_taken_target
    sys debug_break    ; skipped
.Lbench_016_brne16_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRULT16 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brult16 .Lbench_017_brult16_not_taken_target
    sys debug_break
.Lbench_017_brult16_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRULT16 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x0001
    cmp r6, r7
    sys debug_break
    brult16 .Lbench_018_brult16_taken_target
    sys debug_break    ; skipped
.Lbench_018_brult16_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRUGE16 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0000
    ldi16 r7, 0x0001
    cmp r6, r7
    sys debug_break
    bruge16 .Lbench_019_bruge16_not_taken_target
    sys debug_break
.Lbench_019_bruge16_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRUGE16 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    bruge16 .Lbench_020_bruge16_taken_target
    sys debug_break    ; skipped
.Lbench_020_bruge16_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRSLT16 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brslt16 .Lbench_021_brslt16_not_taken_target
    sys debug_break
.Lbench_021_brslt16_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRSLT16 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brslt16 .Lbench_022_brslt16_taken_target
    sys debug_break    ; skipped
.Lbench_022_brslt16_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: BRSGE16 (not taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x8000
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brsge16 .Lbench_023_brsge16_not_taken_target
    sys debug_break
.Lbench_023_brsge16_not_taken_target:

; -----------------------------------------------------------------------------
; BENCH: BRSGE16 (taken)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp r6, r7
    sys debug_break
    brsge16 .Lbench_024_brsge16_taken_target
    sys debug_break    ; skipped
.Lbench_024_brsge16_taken_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: JMP8 rel8
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    jmp8 .Lbench_025_jmp8_rel8_target
    sys debug_break    ; unreachable
.Lbench_025_jmp8_rel8_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CALL8 rel8
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    call8 .Lbench_026_call8_rel8_target
    jmp8 .Lbench_027_call8_rel8_done
.Lbench_026_call8_rel8_target:
    sys debug_break
    ret
.Lbench_027_call8_rel8_done:

; -----------------------------------------------------------------------------
; BENCH: JMP16 rel16
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    jmp16 .Lbench_028_jmp16_rel16_target
    sys debug_break    ; unreachable
.Lbench_028_jmp16_rel16_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CALL16 rel16
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    call16 .Lbench_029_call16_rel16_target
    jmp8 .Lbench_030_call16_rel16_done
.Lbench_029_call16_rel16_target:
    sys debug_break
    ret
.Lbench_030_call16_rel16_done:

; -----------------------------------------------------------------------------
; BENCH: JMPF target24
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    jmpf .Lbench_031_jmpf_target24_target
    sys debug_break    ; unreachable
.Lbench_031_jmpf_target24_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CALLF target24
; -----------------------------------------------------------------------------
    bench_reset_sp
    sys debug_break
    callf .Lbench_032_callf_target24_target
    jmp8 .Lbench_033_callf_target24_done
.Lbench_032_callf_target24_target:
    sys debug_break
    ret
.Lbench_033_callf_target24_done:

; -----------------------------------------------------------------------------
; BENCH: JMPP q0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, %lo16(.Lbench_034_jmpp_q0_target)
    ldi8 r1, %hi8(.Lbench_034_jmpp_q0_target)
    sys debug_break
    jmpp q0
    sys debug_break    ; unreachable
.Lbench_034_jmpp_q0_target:
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: CALLP q0
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, %lo16(.Lbench_035_callp_q0_target)
    ldi8 r1, %hi8(.Lbench_035_callp_q0_target)
    sys debug_break
    callp q0
    jmp8 .Lbench_036_callp_q0_done
.Lbench_035_callp_q0_target:
    sys debug_break
    ret
.Lbench_036_callp_q0_done:

; =============================================================================
; AVR-LIBM SYS PERFORMANCE CORNERS
; =============================================================================
; Arguments use the standard q0/q1 floating-point calling convention.
; Setup remains outside each measured DEBUG_BREAK interval.

; -----------------------------------------------------------------------------
; BENCH: SYS sinf (+zero; smallest argument path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    sys sinf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS sinf (0.125; no reduction loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3e00
    sys debug_break
    sys sinf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS sinf (pi/4; polynomial endpoint)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0fdb
    ldi16 r1, 0x3f49
    sys debug_break
    sys sinf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS sinf (pi/2; quadrant correction)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0fdb
    ldi16 r1, 0x3fc9
    sys debug_break
    sys sinf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS sinf (100; multi-step argument reduction)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x42c8
    sys debug_break
    sys sinf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS sinf (2^100; long argument-reduction loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7180
    sys debug_break
    sys sinf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS sinf (+infinity; invalid fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    sys debug_break
    sys sinf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS cosf (+zero; smallest argument path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    sys cosf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS cosf (0.125; no reduction loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3e00
    sys debug_break
    sys cosf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS cosf (pi/4; polynomial endpoint)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0fdb
    ldi16 r1, 0x3f49
    sys debug_break
    sys cosf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS cosf (pi/2; quadrant correction)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0fdb
    ldi16 r1, 0x3fc9
    sys debug_break
    sys cosf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS cosf (100; multi-step argument reduction)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x42c8
    sys debug_break
    sys cosf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS cosf (2^100; long argument-reduction loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7180
    sys debug_break
    sys cosf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS cosf (+infinity; invalid fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    sys debug_break
    sys cosf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS atan2f (+0,+0; zero fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    sys atan2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS atan2f (y=1,x=2; no swap or displacement)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    sys atan2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS atan2f (y=2,x=1; swap and pi/2 displacement)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4000
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    sys atan2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS atan2f (y=1,x=-2; positive pi displacement)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0xc000
    sys debug_break
    sys atan2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS atan2f (y=-1,x=-2; negative pi displacement)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xbf80
    ldi16 r2, 0x0000
    ldi16 r3, 0xc000
    sys debug_break
    sys atan2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS atan2f (y=+infinity,x=1; nonfinite normalization)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    sys atan2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS atan2f (y=qNaN,x=1; NaN fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    sys atan2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS tanf (+zero; smallest argument path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    sys tanf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS tanf (0.125; direct odd polynomial)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3e00
    sys debug_break
    sys tanf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS tanf (pi/4; reciprocal boundary)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0fdb
    ldi16 r1, 0x3f49
    sys debug_break
    sys tanf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS tanf (1.0; reciprocal branch)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    sys debug_break
    sys tanf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS tanf (pi/2; pole quadrant path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0fdb
    ldi16 r1, 0x3fc9
    sys debug_break
    sys tanf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS tanf (100; multi-step argument reduction)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x42c8
    sys debug_break
    sys tanf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS tanf (2^100; long argument-reduction loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7180
    sys debug_break
    sys tanf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS tanf (+infinity; invalid fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    sys debug_break
    sys tanf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS expf (0; polynomial center)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    sys expf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS expf (+1; positive-argument inverse path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    sys debug_break
    sys expf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS expf (-1; negative direct path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xbf80
    sys debug_break
    sys expf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS expf (+10; positive scaling)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4120
    sys debug_break
    sys expf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS expf (-10; negative scaling)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xc120
    sys debug_break
    sys expf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS expf (+128; overflow threshold fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4300
    sys debug_break
    sys expf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS expf (-128; underflow threshold fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xc300
    sys debug_break
    sys expf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS expf (qNaN; nonfinite fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    sys debug_break
    sys expf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS logf (1.0; low-table zero result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    sys debug_break
    sys logf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS logf (1.25; low polynomial table)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fa0
    sys debug_break
    sys logf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS logf (1.75; high polynomial table)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fe0
    sys debug_break
    sys logf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS logf (minimum normal; exponent conversion)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0080
    sys debug_break
    sys logf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS logf (minimum subnormal; longest normalization loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    sys debug_break
    sys logf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS logf (+zero; negative-infinity fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    sys logf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS logf (-1; domain-error NaN fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xbf80
    sys debug_break
    sys logf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS logf (+infinity; pass-through fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    sys debug_break
    sys logf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log2f (1.0; low-table zero result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    sys debug_break
    sys log2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log2f (1.25; low polynomial table)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fa0
    sys debug_break
    sys log2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log2f (1.75; high polynomial table)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fe0
    sys debug_break
    sys log2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log2f (minimum normal; exponent conversion)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0080
    sys debug_break
    sys log2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log2f (minimum subnormal; longest normalization loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    sys debug_break
    sys log2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log2f (+zero; negative-infinity fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    sys log2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log2f (-1; domain-error NaN fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xbf80
    sys debug_break
    sys log2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log2f (+infinity; pass-through fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    sys debug_break
    sys log2f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log10f (1.0; low-table zero result)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    sys debug_break
    sys log10f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log10f (1.25; low polynomial table)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fa0
    sys debug_break
    sys log10f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log10f (1.75; high polynomial table)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3fe0
    sys debug_break
    sys log10f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log10f (minimum normal; exponent conversion)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0080
    sys debug_break
    sys log10f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log10f (minimum subnormal; longest normalization loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    sys debug_break
    sys log10f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log10f (+zero; negative-infinity fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    sys debug_break
    sys log10f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log10f (-1; domain-error NaN fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xbf80
    sys debug_break
    sys log10f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS log10f (+infinity; pass-through fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    sys debug_break
    sys log10f
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf (2^0; zero-exponent fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4000
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf (1^123; unit-base fast path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x42f6
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf (2^8; ordinary log-multiply-exp path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4000
    ldi16 r2, 0x0000
    ldi16 r3, 0x4100
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf (0.5^-10; inverse and scaling path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f00
    ldi16 r2, 0x0000
    ldi16 r3, 0xc120
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf ((-2)^3; odd-integral sign correction)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xc000
    ldi16 r2, 0x0000
    ldi16 r3, 0x4040
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf ((-2)^4; even-integral sign correction)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xc000
    ldi16 r2, 0x0000
    ldi16 r3, 0x4080
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf ((-2)^0.5; nonintegral domain error)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xc000
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f00
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf (0^-3; zero base with negative exponent)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    ldi16 r2, 0x0000
    ldi16 r3, 0xc040
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf (+infinity^-2; infinite-base path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0xc000
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS powf (qNaN^0; zero-exponent precedence)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    sys powf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS hypotf (0,3; zero-operand fast return)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0000
    ldi16 r2, 0x0000
    ldi16 r3, 0x4040
    sys debug_break
    sys hypotf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS hypotf (3,4; ordinary unscaled core)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x4040
    ldi16 r2, 0x0000
    ldi16 r3, 0x4080
    sys debug_break
    sys hypotf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS hypotf (1,2^20; exponent-gap fast return)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x4980
    sys debug_break
    sys hypotf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS hypotf (2^100,2^100; scale-down path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7180
    ldi16 r2, 0x0000
    ldi16 r3, 0x7180
    sys debug_break
    sys hypotf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS hypotf (2^-100,2^-100; scale-up path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x0d80
    ldi16 r2, 0x0000
    ldi16 r3, 0x0d80
    sys debug_break
    sys hypotf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS hypotf (minimum subnormal pair; normalization loops)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    ldi16 r2, 0x0001
    ldi16 r3, 0x0000
    sys debug_break
    sys hypotf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS hypotf (+infinity,qNaN; infinity wins)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x2345
    ldi16 r3, 0x7fc1
    sys debug_break
    sys hypotf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS hypotf (qNaN,1; NaN with finite operand)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    sys hypotf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (1,2; magnitude fast return)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    sys fmodf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (-2,2; equal-magnitude signed-zero path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0xc000
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    sys fmodf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (5.5,2; ordinary short loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x40b0
    ldi16 r2, 0x0000
    ldi16 r3, 0x4000
    sys debug_break
    sys fmodf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (123456,0.75; medium exponent-gap loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2000
    ldi16 r1, 0x47f1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f40
    sys debug_break
    sys fmodf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (2^100,3; long exponent-gap loop)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7180
    ldi16 r2, 0x0000
    ldi16 r3, 0x4040
    sys debug_break
    sys fmodf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (1,+infinity; infinite-divisor fast return)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x7f80
    sys debug_break
    sys fmodf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (1,0; zero-divisor NaN path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x3f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x0000
    sys debug_break
    sys fmodf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (+infinity,1; infinite-dividend NaN path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x0000
    ldi16 r1, 0x7f80
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    sys fmodf
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: SYS fmodf (qNaN,1; NaN path)
; -----------------------------------------------------------------------------
    bench_reset_sp
    ldi16 r0, 0x2345
    ldi16 r1, 0x7fc1
    ldi16 r2, 0x0000
    ldi16 r3, 0x3f80
    sys debug_break
    sys fmodf
    sys debug_break

; =============================================================================
; MEMORY SYS SIZE SWEEP
; =============================================================================
; All initialization is outside the measured DEBUG_BREAK interval.  The
; ordinary memcpy source and all destinations use disjoint 256-byte framebuffer
; windows.  memcpy_P reads from the shared 256-byte program-space fixture.


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=0)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 0
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 0
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 0
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=1)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 1
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 1
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 1
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=2)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 2
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 2
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 2
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=3)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 3
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 3
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 3
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=4)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 4
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 4
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 4
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=5)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 5
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 5
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 5
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=6)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 6
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 6
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 6
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=7)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 7
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 7
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 7
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=8)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 8
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 8
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 8
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=16)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 16
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 16
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 16
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=32)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 32
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 32
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 32
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy (n=256)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize source and destination to different values before measurement.
    ldi16 r4, BENCH_MEMCPY_SRC
    ldi16 r5, 0x005a
    ldi16 r6, 256
    sys memset
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 256
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, BENCH_MEMCPY_SRC
    ldi16 r6, 256
    sys debug_break
    sys memcpy
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=0)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 0
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 0
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=1)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 1
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 1
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=2)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 2
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 2
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=3)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 3
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 3
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=4)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 4
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 4
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=5)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 5
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 5
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=6)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 6
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 6
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=7)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 7
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 7
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=8)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 8
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 8
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=16)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 16
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 16
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=32)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 32
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 32
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memcpy_P (n=256)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Initialize the destination before loading q3 with the program source.
    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r5, 0x00a5
    ldi16 r6, 256
    sys memset

    ldi16 r4, BENCH_MEMCPY_DST
    ldi16 r6, %lo16(.Lbench_program_data)
    ldi8 r7, %hi8(.Lbench_program_data)
    ldi16 r5, 256
    sys debug_break
    sys memcpy_P
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=0)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 0
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 0
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=1)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 1
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 1
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=2)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 2
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 2
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=3)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 3
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 3
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=4)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 4
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 4
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=5)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 5
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 5
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=6)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 6
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 6
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=7)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 7
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 7
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=8)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 8
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 8
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=16)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 16
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 16
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=32)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 32
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 32
    sys debug_break
    sys memset
    sys debug_break


; -----------------------------------------------------------------------------
; BENCH: SYS memset (n=256)
; -----------------------------------------------------------------------------
    bench_reset_sp

    ; Establish a distinct initial value outside the measured interval.
    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x0000
    ldi16 r6, 256
    sys memset

    ldi16 r4, BENCH_MEMSET_DST
    ldi16 r5, 0x12a5
    ldi16 r6, 256
    sys debug_break
    sys memset
    sys debug_break

; -----------------------------------------------------------------------------
; BENCH: RET
; -----------------------------------------------------------------------------
    bench_reset_sp
    call8 .Lbench_037_ret_body
    sys debug_break
    jmp8 .Lbench_038_ret_done
.Lbench_037_ret_body:
    sys debug_break
    ret
.Lbench_038_ret_done:
    ; Restore a stable SP and remain at a debugger-visible sentinel.
    bench_reset_sp
.Lbench_done:
    sys debug_break
    jmp8 .Lbench_done

    ; Shared 256-byte read-only program-space fixture for LDP and memcpy_P.
.p2align 1
.Lbench_program_data:
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde
    .byte 0x80, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde

.size _start, .-_start
