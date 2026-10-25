
math_pow_bounded.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_pow_bounded.c
00000100 l     O .data	00000100 inputs
00000200 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_pow.c
00000000 l    df *ABS*	00000000 ef_exp.c
00000000 l    df *ABS*	00000000 ef_sqrt.c
000013fa l     O .rodata	00000600 sqrt_table
00000000 l    df *ABS*	00000000 sf_scalbn.c
00000000 l    df *ABS*	00000000 integer.c
000019fa l       .init_array	00000000 .hidden __init_array_end
000019fa l       .init_array	00000000 .hidden __init_array_start
000019fa l       .fini_array	00000000 .hidden __fini_array_start
000019fa l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	0000003b avm_test_main
00000402 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000404 g     F .text	00000ae5 powf
00000ee9 g     F .text	00000203 expf
000013a3 g     F .text	0000002c __avm_lshrsi3
00001377 g     F .text	0000002c __avm_ashlsi3
000010ec g     F .text	00000156 sqrtf
000013cf g     F .text	0000002b __avm_ashrsi3
00001242 g     F .text	00000135 scalbnf

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
 e1 e4 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 fa 19              ldi16	r4, 0x19fa
 c1 00                 ldi8	r5, 0x0
 c6 fa 19              ldi16	r6, 0x19fa
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 fa 19           ldi16	r0, 0x19fa
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 fa 19           ldi16	r2, 0x19fa
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
 c4 fa 19              ldi16	r4, 0x19fa
 c1 00                 ldi8	r5, 0x0
 c6 fa 19              ldi16	r6, 0x19fa
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 fa 19           ldi16	r2, 0x19fa
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 fa 19           ldi16	r0, 0x19fa
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
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 2a                 mov	r6, r2
 c7 04 01              ldi16	r7, 0x104
 1b                    add	r6, r7
 f0 6a cc              ld32	q3, [r6]
 d5 19                 call8	powf
 ff 02                 fadd	q0, q2
 f0 0a 08              addi.s8	r2, 0x8
 f5 13                 cmp	r2, r3
 d1 e3                 brne8	-0x1d <L0>
 c4 00 02              ldi16	r4, 0x200
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
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
 d6 c8                 adjsp	-0x38
 f2 67                 mov32	q1, q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f2 63                 mov32	q0, q3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 46                 breq8	0x46 <L0>
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 69 c0              cmp32	q3, q0
 d2 5f                 brult8	0x5f <L1>
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d8 55                 bruge8	0x55 <L1>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 d9 78                 brsge8	0x78 <L3>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 da 1c 01              breq16	0x11c <L8>
 e0 dd 00              jmp16	221 <L7>
<L0>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 dc 5a 04              brult16	0x45a <L24>
 a0                    xor	r4, r4
 c1 40                 ldi8	r5, 0x40
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 ac                 and	r5, r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db 47 04              brne16	0x447 <L24>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 06                 fadd	q1, q2
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 e0 38 04              jmp16	1080 <L24>
<L1>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 d1 18                 brne8	0x18 <L2>
 c5 ff ff              ldi16	r5, 0xffff
 a1                    xor	r4, r5
 f0 03 40              ldi8	r3, 0x40
 f4 2b                 ldsp16	r7, [sp+0xa]
 f9 7c                 and	r3, r7
 f1 2b                 mov	r6, r3
 fa 96                 lsr16i	r6, 0x6
 98                    or	r6, r4
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 f4 a4                 tst8	r4
 db 0d 04              brne16	0x40d <L24>
<L2>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 02                 fadd	q0, q2
 e0 99 01              jmp16	409 <L17>
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 4b              ldi16	r5, 0x4b7f
 f0 69 84              cmp32	q2, q1
 d8 0f                 bruge8	0xf <L4>
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 da 98 00              breq16	0x98 <L8>
 d4 5a                 jmp8	0x5a <L7>
<L4>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d2 46                 brult8	0x46 <L5>
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 c2 96                 ldi8	r6, 0x96
 af                    xor	r7, r7
 f7 7e                 sub32	q3, q2
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f2 69                 mov32	q2, q1
 e1 8d 0e              call16	__avm_lshrsi3
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e1 52 0e              call16	__avm_ashlsi3
 f0 69 84              cmp32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d1 1d                 brne8	0x1d <L6>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 88                    and	r6, r4
 8d                    and	r7, r5
 02                    mov	r4, r6
 c2 02                 ldi8	r6, 0x2
 f7 7e                 sub32	q3, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d0 49                 breq8	0x49 <L8>
 d4 0b                 jmp8	0xb <L7>
<L5>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L6>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d0 3c                 breq8	0x3c <L8>
<L7>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d1 4c                 brne8	0x4c <L9>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 c8              cmp32	q3, q2
 da 73 03              breq16	0x373 <L23>
 c0 01                 ldi8	r4, 0x1
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 dc ee 00              brult16	0xee <L16>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 0c              cmp32	q0, q3
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e0 50 03              jmp16	848 <L23>
<L8>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 de d9 00              brslt16	0xd9 <L17>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 38                 fdiv	q2, q0
 e0 37 03              jmp16	823 <L23>
<L9>:
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 80              cmp32	q2, q0
 d1 09                 brne8	0x9 <L10>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 2a                 fmul	q2, q2
 e0 1f 03              jmp16	799 <L23>
<L10>:
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f7 69                 add32	q2, q1
 aa                    xor	r6, r6
 c3 60                 ldi8	r7, 0x60
 f0 69 c8              cmp32	q3, q2
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 d2 69                 brult8	0x69 <L15>
 a0                    xor	r4, r4
 c5 00 c8              ldi16	r5, 0xc800
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 00 0f              ldi16	r7, 0xf00
 f0 69 c8              cmp32	q3, q2
 d2 54                 brult8	0x54 <L15>
 a0                    xor	r4, r4
 c5 40 40              ldi16	r5, 0x4040
 f0 69 48              cmp32	q1, q2
 c5 a0 40              ldi16	r5, 0x40a0
 d0 0e                 breq8	0xe <L11>
 f0 69 48              cmp32	q1, q2
 d0 09                 breq8	0x9 <L11>
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f0 69 4c              cmp32	q1, q3
 d1 3a                 brne8	0x3a <L15>
<L11>:
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 a0                    xor	r4, r4
 c5 40 40              ldi16	r5, 0x4040
 f0 69 48              cmp32	q1, q2
 d0 0b                 breq8	0xb <L12>
 ff 2f                 fmul	q3, q3
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L13>
<L12>:
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
<L13>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 ff 33                 fdiv	q0, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 84              cmp32	q2, q1
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
<L14>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 e0 a0 02              jmp16	672 <L24>
<L15>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 69 08              cmp32	q0, q2
 d3 31                 brslt8	0x31 <L18>
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d1 24                 brne8	0x24 <L18>
 f2 68                 mov32	q2, q0
 e1 8b 0a              call16	sqrtf
 e0 7a 02              jmp16	634 <L23>
<L16>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 63                 fneg	q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
<L17>:
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e0 62 02              jmp16	610 <L24>
<L18>:
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 c5 00 c1              ldi16	r5, 0xc100
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 69 c8              cmp32	q3, q2
 dc 1c 01              brult16	0x11c <L19>
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f0 69 84              cmp32	q2, q1
 dc 12 01              brult16	0x112 <L19>
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 62                 add32	q0, q2
 c2 80                 ldi8	r6, 0x80
 f9 c4                 and	r6, r1
 96                    or	r5, r6
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 c5 80 3d              ldi16	r5, 0x3d80
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ff 65                 fabs	q1
 ff c8 26              fcmp	r2, q1, q2
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 ca 81                 addi.s8	r6, -0x7f
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 0e 01              cmpi.s8	r2, 0x1
 de 83 01              brslt16	0x183 <L21>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 ff 08                 fadd	q2, q0
 f2 63                 mov32	q0, q3
 ff 32                 fdiv	q0, q2
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 ff 20                 fmul	q0, q0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 04 97 88           ldi16	r0, 0x8897
 f0 05 17 3e           ldi16	r1, 0x3e17
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 25 33           ldi16	r0, 0x3325
 f0 05 3a 3e           ldi16	r1, 0x3e3a
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 25 49           ldi16	r2, 0x4925
 f0 07 92 3e           ldi16	r3, 0x3e92
 ff 01                 fadd	q0, q1
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3f           ldi16	r1, 0x3f2a
 ff 04                 fadd	q1, q0
 f0 04 4f d0           ldi16	r0, 0xd04f
 f0 05 1c 3e           ldi16	r1, 0x3e1c
 ff 28                 fmul	q2, q0
 f0 04 29 8e           ldi16	r0, 0x8e29
 f0 05 63 3e           ldi16	r1, 0x3e63
 ff 08                 fadd	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 21                 fmul	q0, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 cc 3e              ldi16	r5, 0x3ecc
 ff 02                 fadd	q0, q2
 ff 24                 fmul	q1, q0
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f2 69                 mov32	q2, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 08                 fadd	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 08                 fadd	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 ff 11                 fsub	q0, q1
 ff 0c                 fadd	q3, q0
 e0 00 01              jmp16	256 <L22>
<L19>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 62                 breq8	0x62 <L20>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 3f              ldi16	r5, 0x3fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 8c              cmp32	q2, q3
 d0 51                 breq8	0x51 <L20>
 f0 34 18              ldsp16	r4, [sp+0x18]
 fa 7f                 lsr16i	r4, 0xf
 08                    mov	r6, r4
 af                    xor	r7, r7
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 02                    mov	r4, r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 92                    or	r4, r6
 f6 2c                 tst16	r4
 da fb 00              breq16	0xfb <L25>
 c0 01                 ldi8	r4, 0x1
 c5 00 4d              ldi16	r5, 0x4d00
 f0 69 48              cmp32	q1, q2
 dc f7 00              brult16	0xf7 <L26>
 c4 f3 ff              ldi16	r4, 0xfff3
 c5 7f 3f              ldi16	r5, 0x3f7f
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 69 84              cmp32	q2, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 dc 64 01              brult16	0x164 <L28>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 de c1 00              brslt16	0xc1 <L24>
 e0 ba 00              jmp16	186 <L23>
<L20>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 fa 7f                 lsr16i	r4, 0xf
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 33                 fdiv	q0, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f4 a4                 tst8	r4
 da ee fd              breq16	-0x212 <L14>
 f2 63                 mov32	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f7 6b                 add32	q2, q3
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 69 84              cmp32	q2, q1
 da 84 00              breq16	0x84 <L25>
 ce 01                 cmpi.s8	r6, 0x1
 db 09 fe              brne16	-0x1f7 <L17>
 ff 60                 fneg	q0
 e0 04 fe              jmp16	-508 <L17>
<L21>:
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3e              ldi16	r5, 0x3e2a
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f2 30                 sub	r0, r0
 f0 05 80 3e           ldi16	r1, 0x3e80
 ff 08                 fadd	q2, q0
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 ff 08                 fadd	q2, q0
 f2 63                 mov32	q0, q3
 ff 20                 fmul	q0, q0
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
<L22>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 ff c0 42              s16tof	q2, r4
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 37           ldi16	r3, 0x3717
 ff 29                 fmul	q2, q1
 ff 0b                 fadd	q2, q3
 ff 02                 fadd	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 28                 fmul	q2, q0
 e1 0b 06              call16	expf
<L23>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
<L24>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L25>:
 ff 10                 fsub	q0, q0
 ff 30                 fdiv	q0, q0
 e0 83 fd              jmp16	-637 <L17>
<L26>:
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 8c              cmp32	q2, q3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 d2 1a                 brult8	0x1a <L27>
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 23                 fmul	q0, q3
 f2 64                 mov32	q1, q0
 c6 e8 ff              ldi16	r6, 0xffe8
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
<L27>:
 f1 2b                 mov	r6, r3
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 fa d7                 asr16i	r6, 0x7
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 c6 80 3f              ldi16	r6, 0x3f80
 99                    or	r6, r5
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 c6 81 ff              ldi16	r6, 0xff81
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 10              stsp16	[sp+0x10], r6
 f2 30                 sub	r0, r0
 f0 05 40 20           ldi16	r1, 0x2040
 c6 72 c4              ldi16	r6, 0xc472
 c3 1c                 ldi8	r7, 0x1c
 f0 69 8c              cmp32	q2, q3
 d8 2c                 bruge8	0x2c <L29>
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e0 ca 00              jmp16	202 <L32>
<L28>:
 c0 08                 ldi8	r4, 0x8
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d2 3b                 brult8	0x3b <L30>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 de 53 ff              brslt16	-0xad <L24>
 e0 4c ff              jmp16	-180 <L23>
<L29>:
 c6 d7 b3              ldi16	r6, 0xb3d7
 c3 5d                 ldi8	r7, 0x5d
 f0 69 8c              cmp32	q2, q3
 d8 7e                 bruge8	0x7e <L31>
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 10              stsp16	[sp+0x10], r4
 c5 60 20              ldi16	r5, 0x2060
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 c5 80 3f              ldi16	r5, 0x3f80
 f2 66                 mov32	q1, q2
 e0 8d 00              jmp16	141 <L33>
<L30>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 c5 80 be              ldi16	r5, 0xbe80
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa 3e              ldi16	r5, 0x3eaa
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 1e                 fsub	q3, q2
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 ff 2b                 fmul	q2, q3
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 bf              ldi16	r7, 0xbfb8
 ff 2b                 fmul	q2, q3
 c6 70 a5              ldi16	r6, 0xa570
 c7 ec 36              ldi16	r7, 0x36ec
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 c4 00 aa              ldi16	r4, 0xaa00
 c5 b8 3f              ldi16	r5, 0x3fb8
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 f2 61                 mov32	q0, q1
 ff 03                 fadd	q0, q3
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f2 68                 mov32	q2, q0
 ff 19                 fsub	q2, q1
 ff 1e                 fsub	q3, q2
 e0 19 02              jmp16	537 <L34>
<L31>:
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 05 00 3f           ldi16	r1, 0x3f00
 f9 35                 or	r1, r5
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f7 6d                 add32	q3, q1
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f1 25                 mov	r5, r1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
<L32>:
 f2 66                 mov32	q1, q2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
<L33>:
 c6 00 c0              ldi16	r6, 0xc000
 c7 15 3f              ldi16	r7, 0x3f15
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 10              ldsp16	r0, [sp+0x10]
 f4 a0                 tst8	r0
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 3f 36              stsp16	[sp+0x36], r7
 c6 dc cf              ldi16	r6, 0xcfdc
 c7 d1 35              ldi16	r7, 0x35d1
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0b                 fadd	q2, q3
 ff 36                 fdiv	q1, q2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 ff 20                 fmul	q0, q0
 c4 42 f1              ldi16	r4, 0xf142
 c5 53 3e              ldi16	r5, 0x3e53
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 55 32              ldi16	r4, 0x3255
 c5 6c 3e              ldi16	r5, 0x3e6c
 ff 06                 fadd	q1, q2
 f7 83                 lsr32.1	q3
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff 5f              ldi16	r5, 0x5fff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 f0 06 05 a3           ldi16	r2, 0xa305
 f0 07 8b 3e           ldi16	r3, 0x3e8b
 ff 0d                 fadd	q3, q1
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 69                 add32	q2, q1
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 07                 fadd	q1, q3
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 3b 32              stsp16	[sp+0x32], r3
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1e                 fsub	q3, q2
 ff 29                 fmul	q2, q1
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 ff 16                 fsub	q1, q2
 f0 3a 28              stsp16	[sp+0x28], r2
 f0 3b 2a              stsp16	[sp+0x2a], r3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 68                 mov32	q2, q0
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 2b                 fmul	q2, q3
 c6 b7 6d              ldi16	r6, 0x6db7
 c7 db 3e              ldi16	r7, 0x3edb
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 9a 99              ldi16	r4, 0x999a
 c5 19 3f              ldi16	r5, 0x3f19
 ff 0e                 fadd	q3, q2
 ff 20                 fmul	q0, q0
 ff 23                 fmul	q0, q3
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2d                 fmul	q3, q1
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 ff 1b                 fsub	q2, q3
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 2e                 fmul	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 09                 fadd	q2, q1
 ff 2b                 fmul	q2, q3
 ff 08                 fadd	q2, q0
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 ff 25                 fmul	q1, q1
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 ff 04                 fadd	q1, q0
 ff 06                 fadd	q1, q2
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 30                 sub	r0, r0
 f0 05 40 c0           ldi16	r1, 0xc040
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 61                 mov32	q0, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fadd	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 13                 fsub	q0, q3
 ff 18                 fsub	q2, q0
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 2e                 fmul	q3, q2
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 ff 21                 fmul	q0, q1
 ff 03                 fadd	q0, q3
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 2d                 fmul	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 67                 mov32	q1, q3
 ff 08                 fadd	q2, q0
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1d                 fsub	q3, q1
 ff 13                 fsub	q0, q3
 c6 4f 38              ldi16	r6, 0x384f
 c7 76 3f              ldi16	r7, 0x3f76
 ff 23                 fmul	q0, q3
 f2 64                 mov32	q1, q0
 c6 c6 23              ldi16	r6, 0x23c6
 c7 f6 b8              ldi16	r7, 0xb8f6
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 01                 fadd	q0, q1
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 c6 00 40              ldi16	r6, 0x4000
 c7 76 3f              ldi16	r7, 0x3f76
 ff 2b                 fmul	q2, q3
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff c4 07              s32tof	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0c                 fadd	q3, q0
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 ff 03                 fadd	q0, q3
 ff 01                 fadd	q0, q1
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 6a                 mov32	q3, q0
 ff 1d                 fsub	q3, q1
 f0 32 34              ldsp16	r2, [sp+0x34]
 f0 33 36              ldsp16	r3, [sp+0x36]
 ff 1d                 fsub	q3, q1
 ff 1b                 fsub	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 0e                 fadd	q3, q2
<L34>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1b                 fsub	q2, q3
 ff 28                 fmul	q2, q0
 ff 06                 fadd	q1, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 22                 fmul	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6a                 mov32	q3, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 0d                 fadd	q3, q1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 69 c8              cmp32	q3, q2
 d3 1e                 brslt8	0x1e <L36>
 c0 01                 ldi8	r4, 0x1
 c5 00 43              ldi16	r5, 0x4300
 f0 69 08              cmp32	q0, q2
 d2 61                 brult8	0x61 <L38>
<L35>:
 aa                    xor	r6, r6
 c7 80 ff              ldi16	r7, 0xff80
 f0 34 14              ldsp16	r4, [sp+0x14]
 f6 2c                 tst16	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 e0 1d fc              jmp16	-995 <L23>
<L36>:
 c0 01                 ldi8	r4, 0x1
 c5 16 43              ldi16	r5, 0x4316
 f0 69 08              cmp32	q0, q2
 d8 2e                 bruge8	0x2e <L37>
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1b                 fsub	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff c8 42              fcmp	r4, q0, q2
 cc 01                 cmpi.s8	r4, 0x1
 d9 69                 brsge8	0x69 <L39>
 a0                    xor	r4, r4
 c5 16 43              ldi16	r5, 0x4316
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 48              cmp32	q1, q2
 d1 5a                 brne8	0x5a <L39>
<L37>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f6 28                 tst16	r0
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 e0 d0 fb              jmp16	-1072 <L23>
<L38>:
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 69 08              cmp32	q0, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d1 2c                 brne8	0x2c <L39>
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 1b                 fsub	q2, q3
 c6 3c aa              ldi16	r6, 0xaa3c
 c7 38 33              ldi16	r7, 0x3338
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f2 6a                 mov32	q3, q0
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 ff 0d                 fadd	q3, q1
 ff c8 4e              fcmp	r4, q3, q2
 cc 01                 cmpi.s8	r4, 0x1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 da 5c ff              breq16	-0xa4 <L35>
 d4 10                 jmp8	0x10 <L40>
<L39>:
 c0 01                 ldi8	r4, 0x1
 c5 00 3f              ldi16	r5, 0x3f00
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d2 7d                 brult8	0x7d <L41>
<L40>:
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 c6 82 ff              ldi16	r6, 0xff82
 c7 ff ff              ldi16	r7, 0xffff
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 e1 2e 06              call16	__avm_lshrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f7 6d                 add32	q3, q1
 c0 7f                 ldi8	r4, 0x7f
 83                    and	r4, r7
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 02                    mov	r4, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 c2 96                 ldi8	r6, 0x96
 f7 7c                 sub32	q3, q0
 e1 01 06              call16	__avm_lshrsi3
 f2 30                 sub	r0, r0
 f2 6a                 mov32	q3, q0
 f7 7e                 sub32	q3, q2
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c6 81 ff              ldi16	r6, 0xff81
 c7 ff ff              ldi16	r7, 0xffff
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e1 07 06              call16	__avm_ashrsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 82                    and	r4, r6
 87                    and	r5, r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1e                 fsub	q3, q2
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 d4 10                 jmp8	0x10 <L42>
<L41>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
<L42>:
 f0 06 00 80           ldi16	r2, 0x8000
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 69                 mov32	q2, q1
 ff 1b                 fsub	q2, q3
 ff 12                 fsub	q0, q2
 c4 18 72              ldi16	r4, 0x7218
 c5 31 3f              ldi16	r5, 0x3f31
 ff 22                 fmul	q0, q2
 c4 8c be              ldi16	r4, 0xbe8c
 c5 bf 35              ldi16	r5, 0x35bf
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 ff 0c                 fadd	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c4 00 72              ldi16	r4, 0x7200
 c5 31 3f              ldi16	r5, 0x3f31
 ff 26                 fmul	q1, q2
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 c4 4c bb              ldi16	r4, 0xbb4c
 c5 31 33              ldi16	r5, 0x3331
 ff 07                 fadd	q1, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ff 25                 fmul	q1, q1
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c6 0e ea              ldi16	r6, 0xea0e
 c7 dd b5              ldi16	r7, 0xb5dd
 ff 03                 fadd	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 55 b3           ldi16	r0, 0xb355
 f0 05 8a 38           ldi16	r1, 0x388a
 ff 0c                 fadd	q3, q0
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 61 0b              ldi16	r6, 0xb61
 c7 36 bb              ldi16	r7, 0xbb36
 ff 0b                 fadd	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 1c                 fsub	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 13                 fsub	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2c                 fmul	q3, q0
 ff 03                 fadd	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 ff 0c                 fadd	q3, q0
 ff 27                 fmul	q1, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1d                 fsub	q3, q1
 f2 30                 sub	r0, r0
 f0 05 00 c0           ldi16	r1, 0xc000
 f2 67                 mov32	q1, q3
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 31                 fdiv	q0, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 12                 fsub	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 18                 fsub	q2, q0
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 57                 lsl16i	r6, 0x7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f7 62                 add32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f2 6a                 mov32	q3, q0
 f0 69 40              cmp32	q1, q0
 d3 07                 brslt8	0x7 <L43>
 f4 32                 ldsp16	r6, [sp+0xc]
 e1 6b 03              call16	scalbnf
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L43>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 62                 fneg	q2
 f0 30 14              ldsp16	r0, [sp+0x14]
 f6 28                 tst16	r0
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 e0 52 f7              jmp16	-2222 <L14>

<expf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d2 07                 brult8	0x7 <L0>
 ff 0a                 fadd	q2, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e0 d7 01              jmp16	471 <L10>
<L0>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d1 14                 brne8	0x14 <L1>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 08              cmp32	q0, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 e0 ba 01              jmp16	442 <L10>
<L1>:
 f0 06 17 72           ldi16	r2, 0x7217
 f0 07 b1 42           ldi16	r3, 0x42b1
 f0 69 48              cmp32	q1, q2
 de ac 01              brslt16	0x1ac <L10>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 12                 brslt8	0x12 <L2>
 f0 06 b5 f1           ldi16	r2, 0xf1b5
 f0 07 cf 42           ldi16	r3, 0x42cf
 f0 69 40              cmp32	q1, q0
 d8 05                 bruge8	0x5 <L2>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e0 8f 01              jmp16	399 <L10>
<L2>:
 f0 06 19 72           ldi16	r2, 0x7219
 f0 07 b1 3e           ldi16	r3, 0x3eb1
 f0 69 04              cmp32	q0, q1
 d2 5a                 brult8	0x5a <L3>
 f0 06 91 15           ldi16	r2, 0x1591
 f0 07 85 3f           ldi16	r3, 0x3f85
 f0 69 40              cmp32	q1, q0
 d2 63                 brult8	0x63 <L4>
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 b7           ldi16	r3, 0xb717
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 fd 10                 cmov.slt	r2, r0
 fd 19                 cmov.slt	r3, r1
 c6 80 71              ldi16	r6, 0x7180
 c7 31 bf              ldi16	r7, 0xbf31
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 f4 22                 ldsp16	r6, [sp+0x8]
 a2                    xor	r4, r6
 22                    sub	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d4 6b                 jmp8	0x6b <L5>
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 33              ldi16	r7, 0x33ff
 f0 69 c0              cmp32	q3, q0
 d2 6e                 brult8	0x6e <L6>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e0 12 01              jmp16	274 <L10>
<L4>:
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c7 00 3f              ldi16	r7, 0x3f00
 f2 42                 sub	r2, r2
 f0 07 00 bf           ldi16	r3, 0xbf00
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 1e                 mov	r3, r6
 f0 69 04              cmp32	q0, q1
 f0 31 0a              ldsp16	r1, [sp+0xa]
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 04 3b aa           ldi16	r0, 0xaa3b
 f0 05 b8 3f           ldi16	r1, 0x3fb8
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 ff c2 61              ftos16	r6, q1
 f4 62                 stsp16	[sp+0x8], r6
 ff c0 63              s16tof	q3, r6
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 ff 2c                 fmul	q3, q0
<L5>:
 ff 1b                 fsub	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ff 1d                 fsub	q3, q1
 d4 05                 jmp8	0x5 <L7>
<L6>:
 aa                    xor	r6, r6
 f4 62                 stsp16	[sp+0x8], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L7>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 67                 mov32	q1, q3
 ff 25                 fmul	q1, q1
 c6 4c bb              ldi16	r6, 0xbb4c
 c7 31 33              ldi16	r7, 0x3331
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f0 04 0e ea           ldi16	r0, 0xea0e
 f0 05 dd b5           ldi16	r1, 0xb5dd
 ff 0c                 fadd	q3, q0
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f0 04 55 b3           ldi16	r0, 0xb355
 f0 05 8a 38           ldi16	r1, 0x388a
 ff 0c                 fadd	q3, q0
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f0 04 61 0b           ldi16	r0, 0xb61
 f0 05 36 bb           ldi16	r1, 0xbb36
 ff 0c                 fadd	q3, q0
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 ff 0c                 fadd	q3, q0
 ff 27                 fmul	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 63                 mov32	q0, q3
 ff 11                 fsub	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f6 2e                 tst16	r6
 d0 23                 breq8	0x23 <L8>
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 ff 1c                 fsub	q3, q0
 ff 37                 fdiv	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 1d                 fsub	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 23                 ldsp16	r7, [sp+0x8]
 cf 83                 cmpi.s8	r7, -0x7d
 d3 1c                 brslt8	0x1c <L9>
 fa 67                 lsl16i	r7, 0x7
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 d4 25                 jmp8	0x25 <L10>
<L8>:
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 ff 02                 fadd	q0, q2
 ff 34                 fdiv	q1, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1d                 fsub	q3, q1
 c5 80 3f              ldi16	r5, 0x3f80
 ff 0e                 fadd	q3, q2
 d4 10                 jmp8	0x10 <L10>
<L9>:
 fa 67                 lsl16i	r7, 0x7
 c6 00 32              ldi16	r6, 0x3200
 1b                    add	r6, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 0d              ldi16	r5, 0xd80
 ff 2e                 fmul	q3, q2
<L10>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0c                 adjsp	0xc
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
 d6 e8                 adjsp	-0x18
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 da 37 01              breq16	0x137 <L8>
 f0 69 80              cmp32	q2, q0
 d3 10                 brslt8	0x10 <L0>
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 0c                 brult8	0xc <L1>
 ff 0a                 fadd	q2, q2
 e0 22 01              jmp16	290 <L8>
<L0>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e0 1b 01              jmp16	283 <L8>
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
 f4 52                 stsp16	[sp+0x4], r6
 f0 00 7f              ldi8	r0, 0x7f
 f9 14                 and	r0, r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 01                 ldi8	r5, 0x1
 86                    and	r5, r6
 fa 47                 lsl16i	r5, 0x7
 f9 a1                 or	r5, r0
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 c0 0c                 ldi8	r4, 0xc
 04                    mov	r5, r4
 f1 2b                 mov	r6, r3
 f4 8e                 lsr16.1	r6
 fe 34                 mul16	r6, r4
 f0 04 fa 13           ldi16	r0, 0x13fa
 f0 01 00              ldi8	r1, 0x0
 f7 63                 add32	q0, q3
 f0 14 0c              leasp	r4, 0xc
 f2 6a                 mov32	q3, q0
 d7 10                 sys	memcpy_p
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 61                 add32	q0, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 a0                    xor	r4, r4
 c5 fe 7f              ldi16	r5, 0x7ffe
 f9 a4                 and	r5, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6a                 mov32	q3, q0
 ff 1e                 fsub	q3, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 02                 fadd	q0, q2
 ff 2c                 fmul	q3, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 03                 fadd	q0, q3
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 69 08              cmp32	q0, q2
 d1 0a                 brne8	0xa <L4>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3f           ldi16	r1, 0x3fff
 d4 73                 jmp8	0x73 <L7>
<L4>:
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 64                 mov32	q1, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 13                 fsub	q0, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0a                 fadd	q2, q2
 ff 28                 fmul	q2, q0
 ff 2f                 fmul	q3, q3
 ff 25                 fmul	q1, q1
 ff 1d                 fsub	q3, q1
 ff 0e                 fadd	q3, q2
 ff 20                 fmul	q0, q0
 ff 03                 fadd	q0, q3
 a0                    xor	r4, r4
 c5 00 34              ldi16	r5, 0x3400
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 19                 fsub	q2, q1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ff 1b                 fsub	q2, q3
 ff 18                 fsub	q2, q0
 f2 42                 sub	r2, r2
 f0 07 80 27           ldi16	r3, 0x2780
 ff c8 49              fcmp	r4, q2, q1
 cc 01                 cmpi.s8	r4, 0x1
 d1 0b                 brne8	0xb <L5>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 d4 1b                 jmp8	0x1b <L6>
<L5>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 ff 1c                 fsub	q3, q0
 ff c8 4d              fcmp	r4, q3, q1
 cc ff                 cmpi.s8	r4, -0x1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 d1 08                 brne8	0x8 <L7>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
<L6>:
 f7 62                 add32	q0, q2
<L7>:
 f4 00                 ldsp16	r4, [sp+0x0]
 08                    mov	r6, r4
 fa 56                 lsl16i	r6, 0x6
 c4 80 ff              ldi16	r4, 0xff80
 82                    and	r4, r6
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 68                 add32	q2, q0
<L8>:
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<scalbnf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 da b0 00              breq16	0xb0 <L7>
 f4 52                 stsp16	[sp+0x4], r6
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 22                 bruge8	0x22 <L0>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 40              cmp32	q1, q0
 d2 1a                 brult8	0x1a <L1>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 2b                 fmul	q2, q3
 c6 cf 8a              ldi16	r6, 0x8acf
 f4 13                 ldsp16	r7, [sp+0x4]
 3b                    cmp	r6, r7
 d3 13                 brslt8	0x13 <L2>
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 d4 7f                 jmp8	0x7f <L6>
<L0>:
 ff 0a                 fadd	q2, q2
 d4 7d                 jmp8	0x7d <L7>
<L1>:
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 d4 12                 jmp8	0x12 <L3>
<L2>:
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 58                 and	r2, r6
 c6 e7 ff              ldi16	r6, 0xffe7
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
<L3>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 c6 31 75              ldi16	r6, 0x7531
 3e                    cmp	r7, r6
 d3 1a                 brslt8	0x1a <L4>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 c6 ca f2              ldi16	r6, 0xf2ca
 c7 49 71              ldi16	r7, 0x7149
 f0 06 ca f2           ldi16	r2, 0xf2ca
 f0 07 49 f1           ldi16	r3, 0xf149
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 33                 jmp8	0x33 <L5>
<L4>:
 f2 62                 mov32	q0, q2
 0b                    mov	r6, r7
 fa ef                 asr16i	r7, 0xf
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6b                 add32	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d3 2c                 brslt8	0x2c <L8>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f2 68                 mov32	q2, q0
 82                    and	r4, r6
 87                    and	r5, r7
 c6 ca f2              ldi16	r6, 0xf2ca
 c7 49 71              ldi16	r7, 0x7149
 f0 06 ca f2           ldi16	r2, 0xf2ca
 f0 07 49 f1           ldi16	r3, 0xf149
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
<L5>:
 f0 69 80              cmp32	q2, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
<L6>:
 ff 2b                 fmul	q2, q3
<L7>:
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L8>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f2 68                 mov32	q2, q0
 d3 0f                 brslt8	0xf <L9>
 f0 04 7f 80           ldi16	r0, 0x807f
 f9 14                 and	r0, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 57                 lsl16i	r6, 0x7
 f9 c1                 or	r6, r0
 06                    mov	r5, r6
 d4 de                 jmp8	-0x22 <L7>
<L9>:
 f0 04 e9 ff           ldi16	r0, 0xffe9
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 d3 1a                 brslt8	0x1a <L10>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 f0 06 60 42           ldi16	r2, 0x4260
 f0 07 a2 8d           ldi16	r3, 0x8da2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 a8                 jmp8	-0x58 <L5>
<L10>:
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f2 42                 sub	r2, r2
 f0 07 80 0c           ldi16	r3, 0xc80
 f7 64                 add32	q1, q0
 f9 7d                 or	r3, r7
 f1 27                 mov	r5, r3
 aa                    xor	r6, r6
 c7 00 33              ldi16	r7, 0x3300
 d4 95                 jmp8	-0x6b <L6>

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_lshrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 c1 00                 ldi8	r5, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_ashrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1e                 breq8	0x1e <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 26                 asr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 10                 jmp8	0x10 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 01                    mov	r4, r5
 fa 22                 asr16v	r4, r6
 fa cf                 asr16i	r5, 0xf
 d4 03                 jmp8	0x3 <L2>
<L1>:
 fa cf                 asr16i	r5, 0xf
 01                    mov	r4, r5
<L2>:
 ef                    ret
