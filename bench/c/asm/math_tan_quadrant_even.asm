
math_tan_quadrant_even.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_tan_quadrant_even.c
00000100 l     O .data	00000004 tangent_sink
00000104 l     O .data	00000080 tangent_inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
0000225b l     O .rodata	00000500 avm_reduce_windows
000008c3 l     F .text	0000041f avm_reduce_extended
0000275b l       .init_array	00000000 .hidden __init_array_end
0000275b l       .init_array	00000000 .hidden __init_array_start
0000275b l       .fini_array	00000000 .hidden __fini_array_start
0000275b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000159 avm_test_main
00000420 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000422 g     F .text	000001ef tanf
00000611 g     F .text	000002b2 __kernel_rem_pio2f
00000ce2 g     F .text	00000111 avm_rem_pio2f_medium
00000df3 g     O .rodata	00001468 avm_small_pio2

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 02 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 5b 27              ldi16	r4, 0x275b
 c1 00                 ldi8	r5, 0x0
 c6 5b 27              ldi16	r6, 0x275b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 5b 27           ldi16	r0, 0x275b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 5b 27           ldi16	r2, 0x275b
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

<avm_run_destructors>:
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
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 5b 27              ldi16	r4, 0x275b
 c1 00                 ldi8	r5, 0x0
 c6 5b 27              ldi16	r6, 0x275b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 5b 27           ldi16	r2, 0x275b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 5b 27           ldi16	r0, 0x275b
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
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 a0                    xor	r4, r4
 c5 50 40              ldi16	r5, 0x4050
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 51 40              ldi16	r5, 0x4051
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 52 40              ldi16	r5, 0x4052
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 53 40              ldi16	r5, 0x4053
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 54 40              ldi16	r5, 0x4054
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 55 40              ldi16	r5, 0x4055
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 56 40              ldi16	r5, 0x4056
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 57 40              ldi16	r5, 0x4057
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 00 80              ldi8	r0, 0x80
<L0>:
 f1 21                 mov	r4, r1
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 d5 19                 call8	tanf
 ff 06                 fadd	q1, q2
 f0 09 04              addi.s8	r1, 0x4
 f5 08                 cmp	r1, r0
 d1 ec                 brne8	-0x14 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c0              cmp32	q3, q0
 d2 2e                 brult8	0x2e <L0>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 6b              fcmp	r6, q2, q3
 f6 2e                 tst16	r6
 da 8f 01              breq16	0x18f <L11>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 27                 fmul	q1, q3
 ff 24                 fmul	q1, q0
 ff 09                 fadd	q2, q1
 e0 6b 01              jmp16	363 <L11>
<L0>:
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c0              cmp32	q3, q0
 d2 4b                 brult8	0x4b <L2>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 df cd 00              brsge16	0xcd <L4>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 42              fcmp	r4, q0, q2
 f6 2c                 tst16	r4
 d0 1d                 breq8	0x1d <L1>
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff 26                 fmul	q1, q2
 ff 01                 fadd	q0, q1
<L1>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 38                 fdiv	q2, q0
 e0 15 01              jmp16	277 <L11>
<L2>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d2 08                 brult8	0x8 <L3>
 aa                    xor	r6, r6
 f4 4a                 stsp16	[sp+0x2], r6
 ff 1a                 fsub	q2, q2
 e0 c9 00              jmp16	201 <L8>
<L3>:
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c0              cmp32	q3, q0
 dc af 00              brult16	0xaf <L6>
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 f0 69 c0              cmp32	q3, q0
 dc ad 00              brult16	0xad <L7>
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff c3 61              ftou16	r6, q1
 f4 ae                 inc16	r6
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 f4 8e                 lsr16.1	r6
 f4 42                 stsp16	[sp+0x0], r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 c6 f3 0d              ldi16	r6, 0xdf3
 c3 00                 ldi8	r7, 0x0
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 13                 fsub	q0, q3
 c6 f7 0d              ldi16	r6, 0xdf7
 c3 00                 ldi8	r7, 0x0
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 13                 fsub	q0, q3
 c2 03                 ldi8	r6, 0x3
 f4 03                 ldsp16	r7, [sp+0x0]
 8b                    and	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 06 dc 0f           ldi16	r2, 0xfdc
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 c4              cmp32	q3, q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 dc b1 00              brult16	0xb1 <L14>
 f0 69 c0              cmp32	q3, q0
 df 95 00              brsge16	0x95 <L12>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 e0 92 00              jmp16	146 <L13>
<L4>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 42              fcmp	r4, q0, q2
 f6 2c                 tst16	r4
 d0 1d                 breq8	0x1d <L5>
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff 26                 fmul	q1, q2
 ff 01                 fadd	q0, q1
<L5>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 38                 fdiv	q2, q0
 d4 49                 jmp8	0x49 <L11>
<L6>:
 f0 16 02              leasp	r6, 0x2
 e1 84 00              call16	__kernel_rem_pio2f
 d4 06                 jmp8	0x6 <L8>
<L7>:
 f0 16 02              leasp	r6, 0x2
 e1 4d 07              call16	avm_rem_pio2f_medium
<L8>:
 f2 66                 mov32	q1, q2
<L9>:
 c0 01                 ldi8	r4, 0x1
 f4 0a                 ldsp16	r6, [sp+0x2]
 88                    and	r6, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d0 21                 breq8	0x21 <L10>
 f2 61                 mov32	q0, q1
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f4 42                 stsp16	[sp+0x0], r6
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 ff 2e                 fmul	q3, q2
 ff 07                 fadd	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
<L10>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f4 a6                 tst8	r6
 d0 3a                 breq8	0x3a <L15>
 ff 39                 fdiv	q2, q1
<L11>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L12>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b6                 dec16	r6
<L13>:
 f4 42                 stsp16	[sp+0x0], r6
<L14>:
 f2 64                 mov32	q1, q0
 ff 61                 fneg	q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 fd 10                 cmov.slt	r2, r0
 fd 19                 cmov.slt	r3, r1
 a0                    xor	r4, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 d4 8f                 jmp8	-0x71 <L9>
<L15>:
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

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
 c4 65 1d              ldi16	r4, 0x1d65
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
 f0 04 69 1d           ldi16	r0, 0x1d69
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
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 5a                 stsp16	[sp+0x6], r6
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
 da c9 00              breq16	0xc9 <L0>
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
 da aa 00              breq16	0xaa <L0>
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
 ff c4 0e              s32tof	q3, q2
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 2f           ldi16	r1, 0x2fc9
 ff 2c                 fmul	q3, q0
 f2 63                 mov32	q0, q3
 ff 60                 fneg	q0
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 48              cmp32	q1, q2
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 00                 ldsp16	r4, [sp+0x0]
 74                    st16	[r5], r4
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
 d6 c2                 adjsp	-0x3e
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 c4 69 1d              ldi16	r4, 0x1d69
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 65 1d              ldi16	r4, 0x1d65
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 fa 38                 lsl16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 f4 00                 ldsp16	r4, [sp+0x0]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f0 04 6d 1d           ldi16	r0, 0x1d6d
 f0 01 00              ldi8	r1, 0x0
 f7 63                 add32	q0, q3
 f0 62 c0              ldp16	r6, [q0]
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 f0 3f 22              stsp16	[sp+0x22], r7
 fa 5e                 lsl16i	r6, 0xe
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 06                    mov	r5, r6
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 76                 zext8	r6
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 34 22              ldsp16	r4, [sp+0x22]
 f1 74                 zext8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 98                 lsr16i	r6, 0x8
 98                    or	r6, r4
 f0 3e 24              stsp16	[sp+0x24], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 0b                    mov	r6, r7
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 0a                 ldsp16	r6, [sp+0x2]
 92                    or	r4, r6
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 f4 03                 ldsp16	r7, [sp+0x0]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 f1 76                 zext8	r6
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 34 22              ldsp16	r4, [sp+0x22]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 37 10              ldsp16	r7, [sp+0x10]
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 36 30              ldsp16	r6, [sp+0x30]
 82                    and	r4, r6
 f0 00 80              ldi8	r0, 0x80
 f9 81                 or	r4, r0
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 29                 ldsp16	r5, [sp+0xa]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 06                    mov	r5, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 32                 mul8	r4, r6
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 f1 76                 zext8	r6
 f4 18                 ldsp16	r4, [sp+0x6]
 fe 34                 mul16	r6, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 20              ldsp16	r4, [sp+0x20]
 fe 2c                 mul16	r5, r4
 16                    add	r5, r6
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 36 18              ldsp16	r6, [sp+0x18]
 02                    mov	r4, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f0 3e 38              stsp16	[sp+0x38], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 18                    add	r6, r4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 02                    mov	r4, r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 12                    add	r4, r6
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 0c                    mov	r7, r4
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f6 3e                 mul8	r7, r6
 1d                    add	r7, r5
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 35 20              ldsp16	r5, [sp+0x20]
 f1 75                 zext8	r5
 f6 34                 mul8	r5, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 14                    add	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 0e                    mov	r7, r6
 f0 34 30              ldsp16	r4, [sp+0x30]
 fe 3c                 mul16	r7, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 1c                    add	r7, r4
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 34 18              ldsp16	r4, [sp+0x18]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 3d                 mul8	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f0 35 10              ldsp16	r5, [sp+0x10]
 17                    add	r5, r7
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 3b                 mul8	r6, r7
 f0 35 38              ldsp16	r5, [sp+0x38]
 19                    add	r6, r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 11                    add	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 06                    mov	r5, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 34              ldsp16	r4, [sp+0x34]
 18                    add	r6, r4
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 08                    mov	r6, r4
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 1b                    add	r6, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 08                    mov	r6, r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f6 38                 mul8	r6, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 18                    add	r6, r4
 f0 3e 28              stsp16	[sp+0x28], r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f1 76                 zext8	r6
 f4 72                 stsp16	[sp+0xc], r6
 0e                    mov	r7, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f6 3c                 mul8	r7, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 1c                    add	r7, r4
 f0 3f 34              stsp16	[sp+0x34], r7
 02                    mov	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f6 36                 mul8	r5, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 16                    add	r5, r6
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 35 30              ldsp16	r5, [sp+0x30]
 fa 88                 lsr16i	r5, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 16                    add	r5, r6
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 36 36              ldsp16	r6, [sp+0x36]
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f3 14                 mulu8.w	r5, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 36 24              ldsp16	r6, [sp+0x24]
 0e                    mov	r7, r6
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 34              ldsp16	r4, [sp+0x34]
 1c                    add	r7, r4
 f0 3f 18              stsp16	[sp+0x18], r7
 02                    mov	r4, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 36 28              ldsp16	r6, [sp+0x28]
 12                    add	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f6 3c                 mul8	r7, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 1c                    add	r7, r4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 36                 mul8	r5, r6
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 14                    add	r5, r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 29                 ldsp16	r5, [sp+0xa]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f6 31                 mul8	r4, r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f6 3d                 mul8	r7, r5
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 1d                    add	r7, r5
 f0 3f 22              stsp16	[sp+0x22], r7
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 30              ldsp16	r4, [sp+0x30]
 fa 78                 lsr16i	r4, 0x8
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 17                    add	r5, r7
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f1 74                 zext8	r4
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 37 20              ldsp16	r7, [sp+0x20]
 13                    add	r4, r7
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 0e                    mov	r7, r6
 f6 3d                 mul8	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 38                 mul8	r6, r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 19                    add	r6, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 12              ldsp16	r6, [sp+0x12]
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f0 35 22              ldsp16	r5, [sp+0x22]
 1d                    add	r7, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 35 36              ldsp16	r5, [sp+0x36]
 f6 34                 mul8	r5, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 0c                    mov	r7, r4
 04                    mov	r5, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 20              ldsp16	r4, [sp+0x20]
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 f1 75                 zext8	r5
 fa 68                 lsl16i	r7, 0x8
 9d                    or	r7, r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 35 16              ldsp16	r5, [sp+0x16]
 19                    add	r6, r5
 f1 74                 zext8	r4
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 01                 ldsp16	r5, [sp+0x0]
 14                    add	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 17                 mov	r2, r7
 f1 1c                 mov	r3, r4
 c3 03                 ldi8	r7, 0x3
 8d                    and	r7, r5
 f9 c0                 and	r6, r0
 fa 97                 lsr16i	r6, 0x7
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 a6                 tst8	r6
 aa                    xor	r6, r6
 d0 1b                 breq8	0x1b <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 28                    sub	r6, r4
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 af                 inc16	r7
 d4 04                 jmp8	0x4 <L1>
<L0>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 f2 61                 mov32	q0, q1
<L1>:
 f4 43                 stsp16	[sp+0x0], r7
 ff c5 00              u32tof	q0, q0
 a0                    xor	r4, r4
 c5 80 2f              ldi16	r5, 0x2f80
 ff 22                 fmul	q0, q2
 ff c1 63              u16tof	q3, r6
 c5 80 27              ldi16	r5, 0x2780
 ff 2e                 fmul	q3, q2
 ff 0c                 fadd	q3, q0
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 2e                 fmul	q3, q2
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f2 63                 mov32	q0, q3
 ff 60                 fneg	q0
 f0 32 02              ldsp16	r2, [sp+0x2]
 f5 14                 cmp	r2, r4
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 a0                    xor	r4, r4
 f1 14                 mov	r2, r4
 f0 33 00              ldsp16	r3, [sp+0x0]
 f2 43                 sub	r2, r3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 c8              cmp32	q3, q2
 fd 1a                 cmov.slt	r3, r2
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f5 53                 st16	[r4], r3
 f2 68                 mov32	q2, q0
 d6 3e                 adjsp	0x3e
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
 d6 ee                 adjsp	-0x12
 f4 52                 stsp16	[sp+0x4], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 66                 mov32	q1, q2
 ff 65                 fabs	q1
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 04 83 f9           ldi16	r0, 0xf983
 f0 05 a2 3f           ldi16	r1, 0x3fa2
 ff 24                 fmul	q1, q0
 ff c7 05              ftou32	q1, q1
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f7 80                 lsr32.1	q0
 ff c5 08              u32tof	q2, q0
 f0 06 22 aa           ldi16	r2, 0xaa22
 f0 07 fd b9           ldi16	r3, 0xb9fd
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f2 66                 mov32	q1, q2
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 27                 fmul	q1, q3
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f2 42                 sub	r2, r2
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 29                 fmul	q2, q1
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 ff 06                 fadd	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 06                 fadd	q1, q2
 c0 03                 ldi8	r4, 0x3
 f9 80                 and	r4, r0
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff c8 57              fcmp	r5, q1, q3
 cd 01                 cmpi.s8	r5, 0x1
 d1 1b                 brne8	0x1b <L0>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 07                 fadd	q1, q3
 f4 ac                 inc16	r4
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d1 40                 brne8	0x40 <L4>
 d4 26                 jmp8	0x26 <L2>
<L0>:
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff c8 57              fcmp	r5, q1, q3
 cd ff                 cmpi.s8	r5, -0x1
 d1 12                 brne8	0x12 <L1>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 07                 fadd	q1, q3
 f4 b4                 dec16	r4
<L1>:
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d1 18                 brne8	0x18 <L4>
<L2>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 57              fcmp	r5, q1, q3
 f6 2d                 tst16	r5
 d1 2c                 brne8	0x2c <L5>
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e0 64 f8              jmp16	__kernel_rem_pio2f
<L4>:
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f7 6c                 add32	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 69 0c              cmp32	q0, q3
 d2 d4                 brult8	-0x2c <L3>
<L5>:
 f2 61                 mov32	q0, q1
 ff 60                 fneg	q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f4 78                 stsp16	[sp+0xe], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 fd 02                 cmov.slt	r0, r2
 fd 0b                 cmov.slt	r1, r3
 a5                    xor	r5, r5
 f4 38                 ldsp16	r4, [sp+0xe]
 24                    sub	r5, r4
 fd 2c                 cmov.slt	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 71                    st16	[r4], r5
 f2 68                 mov32	q2, q0
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
