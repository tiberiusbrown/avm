
math_trig_probe_outline_odd.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_trig_probe_outline_odd.c
00000100 l     O .data	00000020 probe_inputs
00000120 l     O .data	00000004 remainder_result
00000124 l     O .data	00000004 quadrant_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
000020c7 l     O .rodata	00000500 avm_reduce_windows
00000732 l     F .text	0000042c avm_reduce_extended
000025c7 l       .init_array	00000000 .hidden __init_array_end
000025c7 l       .init_array	00000000 .hidden __init_array_start
000025c7 l       .fini_array	00000000 .hidden __fini_array_start
000025c7 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000005b avm_test_main
000002c4 g     F .text	00000065 __avm_terminate
000002c2 g     F .text	00000002 avm_halt
00000329 g     F .text	00000157 __ieee754_rem_pio2f
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000c5f g     O .rodata	00001468 avm_small_pio2
00000480 g     F .text	000002b2 __kernel_rem_pio2f
00000b5e g     F .text	00000101 avm_rem_pio2f_medium

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 ae 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 9f 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 c7 25              ldi16	r4, 0x25c7
 c1 00                 ldi8	r5, 0x0
 c6 c7 25              ldi16	r6, 0x25c7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 c7 25           ldi16	r0, 0x25c7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 c7 25           ldi16	r2, 0x25c7
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 a0                    xor	r4, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c1 07                 ldi8	r5, 0x7
 f4 41                 stsp16	[sp+0x0], r5
<L0>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 aa                    xor	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 f0 16 04              leasp	r6, 0x4
 e1 96 00              call16	__ieee754_rem_pio2f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 c0 03                 ldi8	r4, 0x3
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d1 d0                 brne8	-0x30 <L0>
 c4 20 01              ldi16	r4, 0x120
 f0 6b 08              st32	[r4], q0
 c4 24 01              ldi16	r4, 0x124
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_terminate>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 27 fd              call16	-729 <__avm_run_local_dtors>
<L0>:
 c4 c7 25              ldi16	r4, 0x25c7
 c1 00                 ldi8	r5, 0x0
 c6 c7 25              ldi16	r6, 0x25c7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 c7 25           ldi16	r2, 0x25c7
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 c7 25           ldi16	r0, 0x25c7
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 de fc              call16	-802 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__ieee754_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 40              cmp32	q1, q0
 d2 05                 brult8	0x5 <L0>
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 e0 fb 00              jmp16	251 <L6>
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 09                 brult8	0x9 <L1>
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 e0 e7 00              jmp16	231 <L6>
<L1>:
 f0 06 e3 cb           ldi16	r2, 0xcbe3
 f0 07 16 40           ldi16	r3, 0x4016
 f0 69 40              cmp32	q1, q0
 d2 42                 brult8	0x42 <L3>
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 68                 mov32	q2, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 06                 fneg	q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f1 29                 mov	r6, r1
 fa df                 asr16i	r6, 0xf
 c3 01                 ldi8	r7, 0x1
 9e                    or	r7, r6
<L2>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 7b                    st16	[r6], r7
 e0 98 00              jmp16	152 <L6>
<L3>:
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 40              cmp32	q1, q0
 dc 83 00              brult16	0x83 <L4>
 f2 42                 sub	r2, r2
 f0 07 80 44           ldi16	r3, 0x4480
 f0 69 40              cmp32	q1, q0
 d2 7c                 brult8	0x7c <L5>
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 5a                 stsp16	[sp+0x6], r6
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f4 8c                 lsr16.1	r4
 f4 40                 stsp16	[sp+0x0], r4
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 c4 5f 0c              ldi16	r4, 0xc5f
 c1 00                 ldi8	r5, 0x0
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 c6 63 0c              ldi16	r6, 0xc63
 c3 00                 ldi8	r7, 0x0
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 01                 fsub
 f0 00 03              ldi8	r0, 0x3
 f4 02                 ldsp16	r6, [sp+0x0]
 f9 18                 and	r0, r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 dc 0f           ldi16	r2, 0xfdc
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 c4              cmp32	q3, q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d2 39                 brult8	0x39 <L8>
 f0 69 c8              cmp32	q3, q2
 d9 22                 brsge8	0x22 <L7>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a8                 inc16	r0
 d4 20                 jmp8	0x20 <L8>
<L4>:
 d5 45                 call8	__kernel_rem_pio2f
 d4 03                 jmp8	0x3 <L6>
<L5>:
 e1 1e 07              call16	avm_rem_pio2f_medium
<L6>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L7>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b0                 dec16	r0
<L8>:
 f0 38 00              stsp16	[sp+0x0], r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 af                    xor	r7, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 2e                    sub	r7, r6
 fd 3e                 cmov.slt	r7, r6
 e0 22 ff              jmp16	-222 <L2>

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d4                 adjsp	-0x2c
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 c1 7f                 ldi8	r5, 0x7f
 f0 36 22              ldsp16	r6, [sp+0x22]
 86                    and	r5, r6
 c2 80                 ldi8	r6, 0x80
 99                    or	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 c4 d1 1b              ldi16	r4, 0x1bd1
 c1 00                 ldi8	r5, 0x0
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 0c                    mov	r7, r4
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 7b                 stsp16	[sp+0xe], r7
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 5a                 stsp16	[sp+0x6], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 0c                    mov	r7, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 73                 stsp16	[sp+0xc], r7
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 7a                 stsp16	[sp+0xe], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f3 1e                 mulu8.w	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f4 33                 ldsp16	r7, [sp+0xc]
 1b                    add	r6, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 04 d5 1b           ldi16	r0, 0x1bd5
 f0 01 00              ldi8	r1, 0x0
 f7 61                 add32	q0, q1
 f0 37 12              ldsp16	r7, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 3e                 mul8	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 08                    mov	r6, r4
 f1 76                 zext8	r6
 f4 72                 stsp16	[sp+0xc], r6
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3b                 mul8	r6, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 16              stsp16	[sp+0x16], r6
 af                    xor	r7, r7
 f4 59                 stsp16	[sp+0x6], r5
 f4 63                 stsp16	[sp+0x8], r7
 fa 88                 lsr16i	r5, 0x8
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 0e                    mov	r7, r6
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f0 36 16              ldsp16	r6, [sp+0x16]
 1e                    add	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 39                 mul8	r6, r5
 1b                    add	r6, r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 76                 zext8	r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f6 39                 mul8	r6, r5
 f0 37 18              ldsp16	r7, [sp+0x18]
 1b                    add	r6, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 09                    mov	r6, r5
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f6 3b                 mul8	r6, r7
 f4 3b                 ldsp16	r7, [sp+0xe]
 1b                    add	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 3d 20              stsp16	[sp+0x20], r5
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 26              stsp16	[sp+0x26], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f0 64 c0              ldp32	q3, [q0]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 09                    mov	r6, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 28              stsp16	[sp+0x28], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 32                 ldsp16	r6, [sp+0xc]
 f6 38                 mul8	r6, r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 18                    add	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 18                    add	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 32                 mul8	r4, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 f6 39                 mul8	r6, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 18                    add	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 12              ldsp16	r4, [sp+0x12]
 18                    add	r6, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 14                    add	r5, r4
 f1 76                 zext8	r6
 01                    mov	r4, r5
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 70                 stsp16	[sp+0xc], r4
 f0 36 20              ldsp16	r6, [sp+0x20]
 f6 32                 mul8	r4, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f6 3b                 mul8	r6, r7
 0e                    mov	r7, r6
 1c                    add	r7, r4
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 59                 stsp16	[sp+0x6], r5
 f1 75                 zext8	r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 01 ff              ldi8	r1, 0xff
 f2 42                 sub	r2, r2
 f0 3f 14              stsp16	[sp+0x14], r7
 f7 77                 sub32	q1, q3
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 aa                    xor	r6, r6
 fa 87                 lsr16i	r5, 0x7
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 a5                 tst8	r5
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 da ca 00              breq16	0xca <L0>
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 6e                 add32	q3, q2
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 01 ff              ldi8	r1, 0xff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f0 69 0c              cmp32	q0, q3
 da ab 00              breq16	0xab <L0>
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 12                 mulu8.w	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 f0 36 22              ldsp16	r6, [sp+0x22]
 fe 26                 mul16	r4, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 02                    mov	r4, r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 f1 17                 mov	r2, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 fe 16                 mul16	r2, r6
 f2 14                 add	r2, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 14                 mulu8.w	r5, r4
 f2 26                 add	r5, r2
 f0 34 20              ldsp16	r4, [sp+0x20]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 04                    mov	r5, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 03                 ldi8	r4, 0x3
 81                    and	r4, r5
 f2 04                 add	r0, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 03                    mov	r4, r7
 fa 38                 lsl16i	r4, 0x8
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 fa 58                 lsl16i	r6, 0x8
 02                    mov	r4, r6
 f2 38                 sub	r1, r0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 4c              cmp32	q1, q3
 fd 08                 cmov.slt	r1, r0
 f0 39 00              stsp16	[sp+0x0], r1
 ff 10                 s32tof
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 2f           ldi16	r1, 0x2fc9
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 01                 ldsp16	r5, [sp+0x0]
 71                    st16	[r4], r5
 f2 68                 mov32	q2, q0
 d6 2c                 adjsp	0x2c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L0>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 d6 2c                 adjsp	0x2c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 d4 00                 jmp8	avm_reduce_extended

<avm_reduce_extended>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c0                 adjsp	-0x40
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3d 34              stsp16	[sp+0x34], r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 c4 d5 1b              ldi16	r4, 0x1bd5
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 d1 1b              ldi16	r4, 0x1bd1
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 fa 38                 lsl16i	r4, 0x8
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f0 04 d9 1b           ldi16	r0, 0x1bd9
 f0 01 00              ldi8	r1, 0x0
 f7 63                 add32	q0, q3
 f0 62 c0              ldp16	r6, [q0]
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 f0 3f 24              stsp16	[sp+0x24], r7
 fa 5e                 lsl16i	r6, 0xe
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 78                 lsr16i	r4, 0x8
 f0 3c 1a              stsp16	[sp+0x1a], r4
 06                    mov	r5, r6
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 76                 zext8	r6
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 34 24              ldsp16	r4, [sp+0x24]
 f1 74                 zext8	r4
 f4 78                 stsp16	[sp+0xe], r4
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 98                 lsr16i	r6, 0x8
 98                    or	r6, r4
 f0 3e 26              stsp16	[sp+0x26], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 0b                    mov	r6, r7
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 92                    or	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 76                 zext8	r6
 f0 3e 38              stsp16	[sp+0x38], r6
 f0 37 20              ldsp16	r7, [sp+0x20]
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 34 14              ldsp16	r4, [sp+0x14]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 36 32              ldsp16	r6, [sp+0x32]
 82                    and	r4, r6
 f0 01 80              ldi8	r1, 0x80
 f9 85                 or	r4, r1
 f4 68                 stsp16	[sp+0xa], r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 30              stsp16	[sp+0x30], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f6 32                 mul8	r4, r6
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f1 76                 zext8	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 fe 34                 mul16	r6, r4
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 34 22              ldsp16	r4, [sp+0x22]
 fe 2c                 mul16	r5, r4
 16                    add	r5, r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 36 16              ldsp16	r6, [sp+0x16]
 02                    mov	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 18                    add	r6, r4
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f0 37 18              ldsp16	r7, [sp+0x18]
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 12                    add	r4, r6
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 0c                    mov	r7, r4
 f0 36 30              ldsp16	r6, [sp+0x30]
 f6 3e                 mul8	r7, r6
 1d                    add	r7, r5
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 35 22              ldsp16	r5, [sp+0x22]
 f1 75                 zext8	r5
 f6 34                 mul8	r5, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 14                    add	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 0e                    mov	r7, r6
 f0 34 32              ldsp16	r4, [sp+0x32]
 fe 3c                 mul16	r7, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 1c                    add	r7, r4
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 3d                 mul8	r7, r5
 f4 7b                 stsp16	[sp+0xe], r7
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f4 39                 ldsp16	r5, [sp+0xe]
 17                    add	r5, r7
 f4 79                 stsp16	[sp+0xe], r5
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f6 3b                 mul8	r6, r7
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 19                    add	r6, r5
 f0 3e 32              stsp16	[sp+0x32], r6
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 11                    add	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 36              ldsp16	r4, [sp+0x36]
 18                    add	r6, r4
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 08                    mov	r6, r4
 f0 37 30              ldsp16	r7, [sp+0x30]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 1b                    add	r6, r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 08                    mov	r6, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 f6 38                 mul8	r6, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 18                    add	r6, r4
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 76                 zext8	r6
 f4 5a                 stsp16	[sp+0x6], r6
 0e                    mov	r7, r6
 f4 28                 ldsp16	r4, [sp+0xa]
 f6 3c                 mul8	r7, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 1c                    add	r7, r4
 f0 3f 36              stsp16	[sp+0x36], r7
 02                    mov	r4, r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 36                 mul8	r5, r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 16                    add	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 35 32              ldsp16	r5, [sp+0x32]
 fa 88                 lsr16i	r5, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 16                    add	r5, r6
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 36 38              ldsp16	r6, [sp+0x38]
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 30              stsp16	[sp+0x30], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f3 14                 mulu8.w	r5, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 18                 mulu8.w	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 0e                    mov	r7, r6
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 36              ldsp16	r4, [sp+0x36]
 1c                    add	r7, r4
 f0 3f 16              stsp16	[sp+0x16], r7
 02                    mov	r4, r6
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 12                    add	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 3c                 mul8	r7, r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 1c                    add	r7, r4
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 36                 mul8	r5, r6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 14                    add	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f6 31                 mul8	r4, r5
 f0 36 26              ldsp16	r6, [sp+0x26]
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f6 3d                 mul8	r7, r5
 f0 35 30              ldsp16	r5, [sp+0x30]
 1d                    add	r7, r5
 f0 3f 24              stsp16	[sp+0x24], r7
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 34 32              ldsp16	r4, [sp+0x32]
 fa 78                 lsr16i	r4, 0x8
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 17                    add	r5, r7
 f0 3d 20              stsp16	[sp+0x20], r5
 f1 74                 zext8	r4
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 35 22              ldsp16	r5, [sp+0x22]
 11                    add	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 02                    mov	r4, r6
 f6 3b                 mul8	r6, r7
 f4 39                 ldsp16	r5, [sp+0xe]
 19                    add	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 32                 mul8	r4, r6
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 07                    mov	r5, r7
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 34 24              ldsp16	r4, [sp+0x24]
 14                    add	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 37 38              ldsp16	r7, [sp+0x38]
 f6 3e                 mul8	r7, r6
 f4 18                 ldsp16	r4, [sp+0x6]
 1c                    add	r7, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f0 34 20              ldsp16	r4, [sp+0x20]
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 22              ldsp16	r6, [sp+0x22]
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 37 16              ldsp16	r7, [sp+0x16]
 1b                    add	r6, r7
 f1 74                 zext8	r4
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 37 14              ldsp16	r7, [sp+0x14]
 13                    add	r4, r7
 f1 76                 zext8	r6
 0c                    mov	r7, r4
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 1e                    add	r7, r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 0e                    mov	r7, r6
 09                    mov	r6, r5
 f0 00 03              ldi8	r0, 0x3
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f9 14                 and	r0, r5
 f9 84                 and	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f2 4b                 sub	r3, r3
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f4 a4                 tst8	r4
 f2 39                 sub	r1, r1
 d0 17                 breq8	0x17 <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 3c                 sub	r1, r4
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 a8                 inc16	r0
 d4 06                 jmp8	0x6 <L1>
<L0>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
<L1>:
 f0 38 0a              stsp16	[sp+0xa], r0
 ff 11                 u32tof
 aa                    xor	r6, r6
 c7 80 2f              ldi16	r7, 0x2f80
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f1 21                 mov	r4, r1
 ff 0d                 u16tof
 c7 80 27              ldi16	r7, 0x2780
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f2 69                 mov32	q2, q1
 ff 06                 fneg	q2
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f5 06                 cmp	r0, r6
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 aa                    xor	r6, r6
 f1 06                 mov	r0, r6
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 31                 sub	r0, r1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 fd 08                 cmov.slt	r1, r0
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 f5 59                 st16	[r6], r1
 d6 40                 adjsp	0x40
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_rem_pio2f_medium>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 72                 stsp16	[sp+0xc], r6
 f2 62                 mov32	q0, q2
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 ff 08                 fabs	q0
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 ff 13                 ftou32
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f7 81                 lsr32.1	q1
 f2 69                 mov32	q2, q1
 ff 11                 u32tof
 c6 00 80              ldi16	r6, 0x8000
 99                    or	r6, r5
 0e                    mov	r7, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd 39              ldi16	r7, 0x39fd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 1e                 fma
 f0 00 03              ldi8	r0, 0x3
 f9 08                 and	r0, r2
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 14                 brne8	0x14 <L0>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a8                 inc16	r0
 d4 1e                 jmp8	0x1e <L1>
<L0>:
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 12                 brne8	0x12 <L1>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b0                 dec16	r0
<L1>:
 c2 01                 ldi8	r6, 0x1
 f0 38 04              stsp16	[sp+0x4], r0
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 17                 brne8	0x17 <L3>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 2c                 brne8	0x2c <L4>
<L2>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e0 69 f8              jmp16	__kernel_rem_pio2f
<L3>:
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 6c                 add32	q3, q0
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 69 4c              cmp32	q1, q3
 d2 d4                 brult8	-0x2c <L2>
<L4>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 40              cmp32	q1, q0
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 a0                    xor	r4, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 74                    st16	[r5], r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
