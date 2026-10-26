
math_pow_near_one.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_pow_near_one.c
00000100 l     O .data	00000100 inputs
00000200 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_pow.c
000009db l     F .text	0000078a avm_pow_boundary
00000000 l    df *ABS*	00000000 ef_sqrt.c
00001227 l     O .rodata	00002000 sqrt_table
00003227 l       .init_array	00000000 .hidden __init_array_end
00003227 l       .init_array	00000000 .hidden __init_array_start
00003227 l       .fini_array	00000000 .hidden __fini_array_start
00003227 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	00000096 avm_test_main
0000045d g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000045f g     F .text	0000057c powf
00001165 g     F .text	000000c2 sqrtf

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
 e1 3f 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 27 32              ldi16	r4, 0x3227
 c1 00                 ldi8	r5, 0x0
 c6 27 32              ldi16	r6, 0x3227
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 27 32           ldi16	r0, 0x3227
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 27 32           ldi16	r2, 0x3227
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
 e1 89 fc              call16	-887 <__avm_run_local_dtors>
<L0>:
 c4 27 32              ldi16	r4, 0x3227
 c1 00                 ldi8	r5, 0x0
 c6 27 32              ldi16	r6, 0x3227
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 27 32           ldi16	r2, 0x3227
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 27 32           ldi16	r0, 0x3227
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
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
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
 d6 f8                 adjsp	-0x8
 c4 f0 ff              ldi16	r4, 0xfff0
 c6 04 01              ldi16	r6, 0x104
 f2 30                 sub	r0, r0
 f0 05 00 34           ldi16	r1, 0x3400
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c3 01                 ldi8	r7, 0x1
<L0>:
 ff c0 41              s16tof	q1, r4
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 24                 fmul	q1, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 04                 fadd	q1, q0
 06                    mov	r5, r6
 c9 fc                 addi.s8	r5, -0x4
 f0 6b 4a              st32	[r5], q1
 04                    mov	r5, r4
 87                    and	r5, r7
 f2 42                 sub	r2, r2
 f0 07 80 cb           ldi16	r3, 0xcb80
 f2 30                 sub	r0, r0
 f0 05 80 4b           ldi16	r1, 0x4b80
 f4 a5                 tst8	r5
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 f0 6b 4c              st32	[r6], q1
 ca 08                 addi.s8	r6, 0x8
 f4 ac                 inc16	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 c8                 brne8	-0x38 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 04 01           ldi16	r3, 0x104
<L1>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 2a                 mov	r6, r2
 f2 2b                 add	r6, r3
 f0 6a cc              ld32	q3, [r6]
 d5 1e                 call8	powf
 ff 02                 fadd	q0, q2
 f0 0a 08              addi.s8	r2, 0x8
 c4 00 01              ldi16	r4, 0x100
 f5 14                 cmp	r2, r4
 d1 e2                 brne8	-0x1e <L1>
 c4 00 02              ldi16	r4, 0x200
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<powf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f2 67                 mov32	q1, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ff 66                 fabs	q2
 ff 67                 fabs	q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 5c                 breq8	0x5c <L0>
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 4c              cmp32	q1, q3
 f8 10                 cset.ult	r0
 f0 69 48              cmp32	q1, q2
 d2 6f                 brult8	0x6f <L2>
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 63                 bruge8	0x63 <L2>
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 db 8d 00              brne16	0x8d <L6>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 8c              cmp32	q2, q3
 d0 42                 breq8	0x42 <L1>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 f2 62                 mov32	q0, q2
 f8 25                 cset.slt	r5
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 31                    cmp	r4, r5
 d0 62                 breq8	0x62 <L5>
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 d4 5a                 jmp8	0x5a <L5>
<L0>:
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d2 11                 brult8	0x11 <L1>
 a0                    xor	r4, r4
 c1 40                 ldi8	r5, 0x40
 87                    and	r5, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L1>
 ff 0d                 fadd	q3, q1
 d4 37                 jmp8	0x37 <L4>
<L1>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 d4 31                 jmp8	0x31 <L5>
<L2>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d1 1a                 brne8	0x1a <L3>
 c6 ff ff              ldi16	r6, 0xffff
 f9 1a                 xor	r0, r6
 c3 40                 ldi8	r7, 0x40
 f4 19                 ldsp16	r5, [sp+0x6]
 8d                    and	r7, r5
 0b                    mov	r6, r7
 fa 96                 lsr16i	r6, 0x6
 f9 c1                 or	r6, r0
 c3 01                 ldi8	r7, 0x1
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d1 08                 brne8	0x8 <L5>
<L3>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
<L4>:
 f2 67                 mov32	q1, q3
<L5>:
 f2 69                 mov32	q2, q1
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 3f           ldi16	r1, 0x3f7f
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 d3 2a                 brslt8	0x2a <L7>
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 f0 69 40              cmp32	q1, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d0 75                 breq8	0x75 <L9>
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 69 40              cmp32	q1, q0
 d1 30                 brne8	0x30 <L8>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d3 71                 brslt8	0x71 <L11>
 e1 f1 0b              call16	sqrtf
 f2 66                 mov32	q1, q2
 d4 b6                 jmp8	-0x4a <L5>
<L7>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 69 40              cmp32	q1, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d0 56                 breq8	0x56 <L10>
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f0 69 40              cmp32	q1, q0
 d1 06                 brne8	0x6 <L8>
 ff 2a                 fmul	q2, q2
 f2 66                 mov32	q1, q2
 d4 96                 jmp8	-0x6a <L5>
<L8>:
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d3 3f                 brslt8	0x3f <L12>
 f2 30                 sub	r0, r0
 f0 05 00 c0           ldi16	r1, 0xc000
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 63                 add32	q0, q3
 f2 42                 sub	r2, r2
 f0 07 80 01           ldi16	r3, 0x180
 f0 69 40              cmp32	q1, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d8 28                 bruge8	0x28 <L13>
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e0 e8 00              jmp16	232 <L19>
<L9>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 36                 fdiv	q1, q2
 e0 51 ff              jmp16	-175 <L5>
<L10>:
 f2 66                 mov32	q1, q2
 e0 4c ff              jmp16	-180 <L5>
<L11>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
<L12>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
<L13>:
 f0 02 01              ldi8	r2, 0x1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 4b           ldi16	r1, 0x4b7f
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 d8 09                 bruge8	0x9 <L14>
 f1 1a                 mov	r3, r2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e0 af 00              jmp16	175 <L19>
<L14>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 69 c0              cmp32	q3, q0
 d2 65                 brult8	0x65 <L15>
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 fa 77                 lsr16i	r4, 0x7
 c3 86                 ldi8	r7, 0x86
 3c                    cmp	r7, r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d2 5a                 brult8	0x5a <L16>
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f2 4b                 sub	r3, r3
 f6 2e                 tst16	r6
 f1 2b                 mov	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d1 74                 brne8	0x74 <L18>
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 2e                    sub	r7, r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 00 7f              ldi8	r0, 0x7f
 f0 36 16              ldsp16	r6, [sp+0x16]
 f9 18                 and	r0, r6
 c2 80                 ldi8	r6, 0x80
 f9 c1                 or	r6, r0
 f0 3e 16              stsp16	[sp+0x16], r6
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c7 ff ff              ldi16	r7, 0xffff
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 fa 0e                 shl16v	r7, r6
 c6 ff ff              ldi16	r6, 0xffff
 ae                    xor	r7, r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 f1 2b                 mov	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
 d1 41                 brne8	0x41 <L18>
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 fa 1b                 lsr16v	r6, r7
 f0 03 01              ldi8	r3, 0x1
 d4 2f                 jmp8	0x2f <L17>
<L15>:
 f2 4b                 sub	r3, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 37                 jmp8	0x37 <L19>
<L16>:
 c3 96                 ldi8	r7, 0x96
 2c                    sub	r7, r4
 c5 ff ff              ldi16	r5, 0xffff
 01                    mov	r4, r5
 fa 03                 shl16v	r4, r7
 a1                    xor	r4, r5
 82                    and	r4, r6
 f2 4b                 sub	r3, r3
 f6 2c                 tst16	r4
 f1 2b                 mov	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d1 12                 brne8	0x12 <L18>
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 37 14              ldsp16	r7, [sp+0x14]
 fa 1b                 lsr16v	r6, r7
 f0 03 01              ldi8	r3, 0x1
<L17>:
 f9 cc                 and	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
<L18>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 14              ldsp16	r7, [sp+0x14]
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 f8 02                 cset.eq	r2
<L19>:
 f0 3a 10              stsp16	[sp+0x10], r2
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d0 05                 breq8	0x5 <L20>
 f0 69 c0              cmp32	q3, q0
 d1 27                 brne8	0x27 <L21>
<L20>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 37                 fdiv	q1, q3
 f2 63                 mov32	q0, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 fd 02                 cmov.slt	r0, r2
 fd 0b                 cmov.slt	r1, r3
 f2 64                 mov32	q1, q0
 ff 61                 fneg	q1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 a4                 tst8	r4
 fb 50                 cmov.ne	r2, r0
 fb 59                 cmov.ne	r3, r1
 e0 36 fe              jmp16	-458 <L5>
<L21>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 f8 26                 cset.slt	r6
 f1 13                 mov	r2, r3
 f9 cd                 or	r6, r3
 f4 a6                 tst8	r6
 d0 18                 breq8	0x18 <L22>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 d1 12                 brne8	0x12 <L23>
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 e0 aa 02              jmp16	682 <L39>
<L22>:
 ff 1a                 fsub	q2, q2
 ff 3a                 fdiv	q2, q2
 f2 66                 mov32	q1, q2
 e0 00 fe              jmp16	-512 <L5>
<L23>:
 c0 01                 ldi8	r4, 0x1
 c5 80 41              ldi16	r5, 0x4180
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 f9 50                 and	r2, r4
 f0 0e 01              cmpi.s8	r2, 0x1
 d1 67                 brne8	0x67 <L25>
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c7 00 7e              ldi16	r7, 0x7e00
 f0 69 c8              cmp32	q3, q2
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d2 52                 brult8	0x52 <L25>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 38                 fdiv	q2, q0
 f2 64                 mov32	q1, q0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff c3 62              ftou16	r6, q2
 c1 01                 ldi8	r5, 0x1
 02                    mov	r4, r6
 81                    and	r4, r5
 f4 a4                 tst8	r4
 f2 61                 mov32	q0, q1
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f4 8e                 lsr16.1	r6
 f6 2e                 tst16	r6
 d0 7b                 breq8	0x7b <L27>
 f2 69                 mov32	q2, q1
 c3 01                 ldi8	r7, 0x1
<L24>:
 f4 42                 stsp16	[sp+0x0], r6
 8b                    and	r6, r7
 ff 20                 fmul	q0, q0
 ff 28                 fmul	q2, q0
 f4 a6                 tst8	r6
 f4 02                 ldsp16	r6, [sp+0x0]
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 f4 8e                 lsr16.1	r6
 f6 2e                 tst16	r6
 f2 66                 mov32	q1, q2
 d1 e9                 brne8	-0x17 <L24>
 e0 02 02              jmp16	514 <L36>
<L25>:
 a0                    xor	r4, r4
 c5 90 c0              ldi16	r5, 0xc090
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c3 20                 ldi8	r7, 0x20
 f0 69 c8              cmp32	q3, q2
 d2 3a                 brult8	0x3a <L26>
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 26                 fmul	q1, q2
 ff ca 07 25 49 12 3e ab aa 2a be cd cc 4c 3e 00 00 80 be ab aa aa 3e 00 00 00 bf 00 00 80 3f  fpoly	7, 0.142857149, -0.166666672, 0.200000003, -0.25, 0.333333343, -0.5, 1.0
 ff 26                 fmul	q1, q2
 c4 3b aa              ldi16	r4, 0xaa3b
 c5 b8 3f              ldi16	r5, 0x3fb8
 e0 b7 00              jmp16	183 <L32>
<L26>:
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 69 80              cmp32	q2, q0
 d2 10                 brult8	0x10 <L28>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 23                 fmul	q0, q3
 c7 68 ff              ldi16	r7, 0xff68
 d4 08                 jmp8	0x8 <L29>
<L27>:
 f2 69                 mov32	q2, q1
 e0 a0 01              jmp16	416 <L36>
<L28>:
 c7 81 ff              ldi16	r7, 0xff81
<L29>:
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 62                 add32	q0, q2
 c2 80                 ldi8	r6, 0x80
 f9 c4                 and	r6, r1
 96                    or	r5, r6
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 13                    add	r4, r7
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 ff c0 40              s16tof	q0, r4
 c0 01                 ldi8	r4, 0x1
 c5 00 41              ldi16	r5, 0x4100
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 d2 27                 brult8	0x27 <L30>
 f2 69                 mov32	q2, q1
 ff ca 08 23 54 19 be 0a 5e 71 3e 47 48 7e be 78 e0 92 3e 74 74 b8 be 9c 3c f6 3e 8e aa 38 bf 3a aa b8 3f      fpoly	8, -0.149735019, 0.235710293, -0.248322591, 0.286868811, -0.360263467, 0.480931163, -0.721352458, 1.4426949
 d4 21                 jmp8	0x21 <L31>
<L30>:
 f2 69                 mov32	q2, q1
 ff ca 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
<L31>:
 ff 26                 fmul	q1, q2
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
<L32>:
 ff 26                 fmul	q1, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 c6 00 04              ldi16	r6, 0x400
 c7 00 bd              ldi16	r7, 0xbd00
 f7 6e                 add32	q3, q2
 f0 04 01 06           ldi16	r0, 0x601
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f2 30                 sub	r0, r0
 d2 77                 brult8	0x77 <L34>
 c6 00 02              ldi16	r6, 0x200
 c7 ea bc              ldi16	r7, 0xbcea
 f7 6b                 add32	q2, q3
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d8 66                 bruge8	0x66 <L34>
<L33>:
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 ff c8 46              fcmp	r4, q1, q2
 cc 02                 cmpi.s8	r4, 0x2
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 dc e0 00              brult16	0xe0 <L38>
 a0                    xor	r4, r4
 c5 16 c3              ldi16	r5, 0xc316
 ff c8 46              fcmp	r4, q1, q2
 cc 01                 cmpi.s8	r4, 0x1
 f2 6a                 mov32	q3, q0
 de d2 00              brslt16	0xd2 <L38>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 46              fcmp	r4, q1, q2
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 30                 sub	r0, r0
 f0 05 00 bf           ldi16	r1, 0xbf00
 cc ff                 cmpi.s8	r4, -0x1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 f2 69                 mov32	q2, q1
 ff 0b                 fadd	q2, q3
 ff c2 62              ftos16	r6, q2
 ff c0 62              s16tof	q2, r6
 ff 16                 fsub	q1, q2
 f2 69                 mov32	q2, q1
 ff ca 05 d1 b0 1e 3c 7e 0e 65 3d e1 fb 75 3e 61 70 31 3f 01 00 80 3f  fpoly	5, 0.009685711, 0.055922024, 0.240218654, 0.693121016, 1.00000012
 ce 83                 cmpi.s8	r6, -0x7d
 de 84 00              brslt16	0x84 <L37>
 fa 57                 lsl16i	r6, 0x7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 e0 8a 00              jmp16	138 <L38>
<L34>:
 d6 f8                 adjsp	-0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 14 24              leasp	r4, 0x24
 e1 80 00              call16	avm_pow_boundary
 d6 08                 adjsp	0x8
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d1 23                 brne8	0x23 <L35>
 c4 3b aa              ldi16	r4, 0xaa3b
 c5 38 b3              ldi16	r5, 0xb338
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff c8 6e              fcmp	r6, q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 ce 02                 cmpi.s8	r6, 0x2
 fc 20                 cmov.ult	r4, r0
 fc 29                 cmov.ult	r5, r1
 d4 1b                 jmp8	0x1b <L36>
<L35>:
 a0                    xor	r4, r4
 c5 16 c3              ldi16	r5, 0xc316
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 db 3e ff              brne16	-0xc2 <L33>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff c8 4e              fcmp	r4, q3, q2
 cc 01                 cmpi.s8	r4, 0x1
 f8 04                 cset.eq	r4
<L36>:
 f2 66                 mov32	q1, q2
 ff 61                 fneg	q1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 e0 72 fb              jmp16	-1166 <L5>
<L37>:
 fa 57                 lsl16i	r6, 0x7
 c7 00 32              ldi16	r7, 0x3200
 1e                    add	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 0d              ldi16	r5, 0xd80
 ff 2e                 fmul	q3, q2
<L38>:
 f2 67                 mov32	q1, q3
 ff 61                 fneg	q1
<L39>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 e0 53 fb              jmp16	-1197 <L5>

<avm_pow_boundary>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c6                 adjsp	-0x3a
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 34 49              ldsp16	r4, [sp+0x49]
 f0 35 4b              ldsp16	r5, [sp+0x4b]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 34 45              ldsp16	r4, [sp+0x45]
 f0 35 47              ldsp16	r5, [sp+0x47]
 f2 62                 mov32	q0, q2
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 69 84              cmp32	q2, q1
 f2 4b                 sub	r3, r3
 dc d0 00              brult16	0xd0 <L0>
 f0 69 04              cmp32	q0, q1
 db ca 00              brne16	0xca <L0>
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
 ff c0 43              s16tof	q3, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 02                    mov	r4, r6
 07                    mov	r5, r7
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 69 84              cmp32	q2, q1
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 18                 fsub	q2, q0
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 2d                 fmul	q3, q1
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 17                 fsub	q1, q3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 21                 fmul	q0, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 13                 fsub	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 03                 fadd	q0, q3
 f2 66                 mov32	q1, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 27                 fmul	q1, q3
 ff 04                 fadd	q1, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 28                 fmul	q2, q0
 ff 09                 fadd	q2, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0c                 fadd	q3, q0
 ff 0e                 fadd	q3, q2
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f2 69                 mov32	q2, q1
 ff 0b                 fadd	q2, q3
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 6b 80              st32	[r0], q2
 ff 19                 fsub	q2, q1
 ff 1e                 fsub	q3, q2
 f0 08 04              addi.s8	r0, 0x4
 f0 6b c0              st32	[r0], q3
 e0 7c 06              jmp16	1660 <L3>
<L0>:
 f0 69 c8              cmp32	q3, q2
 d2 1d                 brult8	0x1d <L1>
 a0                    xor	r4, r4
 c5 00 4c              ldi16	r5, 0x4c00
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 22                 fmul	q0, q2
 c4 68 ff              ldi16	r4, 0xff68
 f4 50                 stsp16	[sp+0x4], r4
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f2 63                 mov32	q0, q3
 d4 08                 jmp8	0x8 <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
 f4 52                 stsp16	[sp+0x4], r6
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
<L2>:
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6c                 add32	q3, q0
 c1 80                 ldi8	r5, 0x80
 87                    and	r5, r7
 f9 35                 or	r1, r5
 f1 10                 mov	r2, r0
 f1 19                 mov	r3, r1
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f4 11                 ldsp16	r5, [sp+0x4]
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 69                 mov32	q2, q1
 ff 08                 fadd	q2, q0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 19                 fsub	q2, q1
 ff 12                 fsub	q0, q2
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 18                 fsub	q2, q0
 ff 09                 fadd	q2, q1
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 04                 fadd	q1, q0
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 f4 13                 ldsp16	r7, [sp+0x4]
 1b                    add	r6, r7
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 3f 38              stsp16	[sp+0x38], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 06                 fadd	q1, q2
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 01                 fadd	q0, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6a                 mov32	q3, q0
 f2 66                 mov32	q1, q2
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 38                 fdiv	q2, q0
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 62                 mov32	q0, q2
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 26                 fmul	q1, q2
 f0 3a 28              stsp16	[sp+0x28], r2
 f0 3b 2a              stsp16	[sp+0x2a], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 ff 2c                 fmul	q3, q0
 ff 1d                 fsub	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 12                 fsub	q0, q2
 f2 68                 mov32	q2, q0
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 ff 29                 fmul	q2, q1
 ff 0b                 fadd	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 1d                 fsub	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 ff 2d                 fmul	q3, q1
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 19                 fsub	q2, q1
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 06                 fadd	q1, q2
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 22                 fmul	q0, q2
 ff 03                 fadd	q0, q3
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 2b                 fmul	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 ff 2d                 fmul	q3, q1
 ff 0e                 fadd	q3, q2
 ff 0c                 fadd	q3, q0
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f2 69                 mov32	q2, q1
 ff 0b                 fadd	q2, q3
 f2 62                 mov32	q0, q2
 ff 11                 fsub	q0, q1
 ff 13                 fsub	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 1e                 fsub	q3, q2
 ff 0c                 fadd	q3, q0
 f2 63                 mov32	q0, q3
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 2a                 fmul	q2, q2
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 ff 1e                 fsub	q3, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 29                 fmul	q2, q1
 ff 0e                 fadd	q3, q2
 ff 0b                 fadd	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 33                 fdiv	q0, q3
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 25                 fmul	q1, q1
 ff 06                 fadd	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 28                 fmul	q2, q0
 ff 0a                 fadd	q2, q2
 ff 06                 fadd	q1, q2
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 0d                 fadd	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 06 f1 f0 70 3d 89 88 88 3d d9 89 9d 3d 8c 2e ba 3d 39 8e e3 3d 25 49 12 3e      fpoly	6, 0.0588235296, 0.0666666701, 0.0769230798, 0.0909090936, 0.111111112, 0.142857149
 ff 2b                 fmul	q2, q3
 f0 06 cd cc           ldi16	r2, 0xcccd
 f0 07 4c be           ldi16	r3, 0xbe4c
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 f2 62                 mov32	q0, q2
 ff 03                 fadd	q0, q3
 f2 6a                 mov32	q3, q0
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 ff 01                 fadd	q0, q1
 f2 66                 mov32	q1, q2
 ff 14                 fsub	q1, q0
 ff 13                 fsub	q0, q3
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c 3e              ldi16	r5, 0x3e4c
 ff 02                 fadd	q0, q2
 ff 04                 fadd	q1, q0
 c5 4c b1              ldi16	r5, 0xb14c
 ff 06                 fadd	q1, q2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f2 63                 mov32	q0, q3
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 ff 2e                 fmul	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 28                 fmul	q2, q0
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 27                 fmul	q1, q3
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 3b 32              stsp16	[sp+0x32], r3
 ff 19                 fsub	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0b                 fadd	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2c                 fmul	q3, q0
 ff 0e                 fadd	q3, q2
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 19                 fsub	q2, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0e                 fadd	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 29                 fmul	q2, q1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 2b                 fmul	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f2 69                 mov32	q2, q1
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 0b                 fadd	q2, q3
 ff 16                 fsub	q1, q2
 ff 0d                 fadd	q3, q1
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 ff 2d                 fmul	q3, q1
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 ff 0d                 fadd	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1d                 fsub	q3, q1
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 ff 2c                 fmul	q3, q0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 ff 21                 fmul	q0, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 ff 13                 fsub	q0, q3
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 03                 fadd	q0, q3
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 ff 2d                 fmul	q3, q1
 ff 0c                 fadd	q3, q0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 23                 fmul	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2e                 fmul	q3, q2
 ff 0c                 fadd	q3, q0
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 0e                 fadd	q3, q2
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 ff 26                 fmul	q1, q2
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 ff 0b                 fadd	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 ff 18                 fsub	q2, q0
 ff 1e                 fsub	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 06                 fadd	q1, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0d                 fadd	q3, q1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 aa be           ldi16	r1, 0xbeaa
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 0b                 fadd	q2, q3
 f2 66                 mov32	q1, q2
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 07                 fadd	q1, q3
 f2 6b                 mov32	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ff 04                 fadd	q1, q0
 f2 61                 mov32	q0, q1
 ff 13                 fsub	q0, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 03                 fadd	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1d                 fsub	q3, q1
 ff 0c                 fadd	q3, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a b2           ldi16	r1, 0xb22a
 ff 0c                 fadd	q3, q0
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 ff 18                 fsub	q2, q0
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 16                 fsub	q1, q2
 ff 07                 fadd	q1, q3
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 01                 fadd	q0, q1
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f2 6a                 mov32	q3, q0
 88                    and	r6, r4
 8d                    and	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 28                 fmul	q2, q0
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 ff 27                 fmul	q1, q3
 ff 16                 fsub	q1, q2
 f2 68                 mov32	q2, q0
 ff 1b                 fsub	q2, q3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 2b                 fmul	q2, q3
 ff 06                 fadd	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 1b                 fsub	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 ff 2c                 fmul	q3, q0
 ff 0d                 fadd	q3, q1
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 ff 29                 fmul	q2, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 ff 24                 fmul	q1, q0
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 14                 fsub	q1, q0
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 03                 fadd	q0, q3
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 24                 fmul	q1, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0d                 fadd	q3, q1
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 ff 0b                 fadd	q2, q3
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 1d                 fsub	q3, q1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 13                 fsub	q0, q3
 ff 14                 fsub	q1, q0
 f2 62                 mov32	q0, q2
 ff 13                 fsub	q0, q3
 ff 01                 fadd	q0, q1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 0c                 fadd	q3, q0
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 ff 18                 fsub	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 12                 fsub	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 08                 fadd	q2, q0
 f2 66                 mov32	q1, q2
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 f2 62                 mov32	q0, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 23                 fmul	q0, q3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f2 6b                 mov32	q3, q1
 f0 06 00 a0           ldi16	r2, 0xa000
 f0 07 38 40           ldi16	r3, 0x4038
 ff 2d                 fmul	q3, q1
 ff 1c                 fsub	q3, q0
 f0 06 00 b0           ldi16	r2, 0xb000
 f0 07 23 3a           ldi16	r3, 0x3a23
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 21                 fmul	q0, q1
 ff 03                 fadd	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 1d                 fsub	q3, q1
 f0 06 00 a0           ldi16	r2, 0xa000
 f0 07 38 40           ldi16	r3, 0x4038
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 ff 08                 fadd	q2, q0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 04 00 b0           ldi16	r0, 0xb000
 f0 05 23 3a           ldi16	r1, 0x3a23
 ff 2c                 fmul	q3, q0
 c4 60 70              ldi16	r4, 0x7060
 c5 25 33              ldi16	r5, 0x3325
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 62                 mov32	q0, q2
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 21                 fmul	q0, q1
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 18                 fsub	q2, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 0c                 fadd	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 12                 fsub	q0, q2
 c4 3b aa              ldi16	r4, 0xaa3b
 c5 38 40              ldi16	r5, 0x4038
 ff 22                 fmul	q0, q2
 f2 68                 mov32	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 02                 fadd	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 34 36              ldsp16	r4, [sp+0x36]
 ff c0 43              s16tof	q3, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 08                 fadd	q2, q0
 f2 62                 mov32	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 13                 fsub	q0, q3
 f2 64                 mov32	q1, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 17                 fsub	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 07                 fadd	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1c                 fsub	q3, q0
 ff 0d                 fadd	q3, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 18                 fsub	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 12                 fsub	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0c                 fadd	q3, q0
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 ff 2b                 fmul	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2d                 fmul	q3, q1
 ff 1e                 fsub	q3, q2
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 12                 fsub	q0, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 ff 0b                 fadd	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 1d                 fsub	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 2d                 fmul	q3, q1
 ff 0e                 fadd	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 22                 fmul	q0, q2
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff 26                 fmul	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1e                 fsub	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fadd	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 2b                 fmul	q2, q3
 ff 06                 fadd	q1, q2
 ff 04                 fadd	q1, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 68                 mov32	q2, q0
 ff 09                 fadd	q2, q1
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 6b 8c              st32	[r6], q2
 ff 18                 fsub	q2, q0
 ff 16                 fsub	q1, q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 4c              st32	[r6], q1
<L3>:
 d6 3a                 adjsp	0x3a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sqrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 da a3 00              breq16	0xa3 <L4>
 f0 69 80              cmp32	q2, q0
 d3 10                 brslt8	0x10 <L0>
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 0c                 brult8	0xc <L1>
 ff 0a                 fadd	q2, q2
 e0 8e 00              jmp16	142 <L4>
<L0>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e0 87 00              jmp16	135 <L4>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 d2 0b                 brult8	0xb <L2>
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 2b                 fmul	q2, q3
 c6 e8 ff              ldi16	r6, 0xffe8
 d4 01                 jmp8	0x1 <L3>
<L2>:
 aa                    xor	r6, r6
<L3>:
 f4 5a                 stsp16	[sp+0x6], r6
 f0 00 7f              ldi8	r0, 0x7f
 f9 14                 and	r0, r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c1 01                 ldi8	r5, 0x1
 86                    and	r5, r6
 fa 47                 lsl16i	r5, 0x7
 f9 a1                 or	r5, r0
 c2 08                 ldi8	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 fa 7b                 lsr16i	r4, 0xb
 f1 2b                 mov	r6, r3
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 04 f8 1f           ldi16	r0, 0x1ff8
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c6 27 12              ldi16	r6, 0x1227
 c3 00                 ldi8	r7, 0x0
 f7 6c                 add32	q3, q0
 f0 14 08              leasp	r4, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 10                 sys	memcpy_p
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 61                 add32	q0, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 08                 ldsp16	r4, [sp+0x2]
 12                    add	r4, r6
 c6 00 c0              ldi16	r6, 0xc000
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 ff 13                 fsub	q0, q3
 08                    mov	r6, r4
 fa 56                 lsl16i	r6, 0x6
 c4 80 ff              ldi16	r4, 0xff80
 82                    and	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2c                 fmul	q3, q0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 07                 fadd	q1, q3
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 69                 add32	q2, q1
<L4>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
