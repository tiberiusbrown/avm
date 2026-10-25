
math_log2_near_one.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_log2_near_one.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 math.c
00000000 l    df *ABS*	00000000 runtime.c
00000494 l       .init_array	00000000 .hidden __init_array_end
00000494 l       .init_array	00000000 .hidden __init_array_start
00000494 l       .fini_array	00000000 .hidden __fini_array_start
00000494 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000031 avm_test_main
00000492 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002f8 g     F .text	0000019a log2f

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
 e1 74 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 94 04              ldi16	r4, 0x494
 c1 00                 ldi8	r5, 0x0
 c6 94 04              ldi16	r6, 0x494
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 94 04           ldi16	r0, 0x494
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 94 04           ldi16	r2, 0x494
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
 c4 94 04              ldi16	r4, 0x494
 c1 00                 ldi8	r5, 0x0
 c6 94 04              ldi16	r6, 0x494
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 94 04           ldi16	r2, 0x494
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 94 04           ldi16	r0, 0x494
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
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 03 80              ldi8	r3, 0x80
<L0>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 d5 17                 call8	log2f
 ff 02                 fadd	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 f5 13                 cmp	r2, r3
 d1 ec                 brne8	-0x14 <L0>
 c4 80 01              ldi16	r4, 0x180
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<log2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d2 13                 brult8	0x13 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 68              fcmp	r6, q2, q0
 f6 2e                 tst16	r6
 db 66 01              brne16	0x166 <L6>
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e0 58 01              jmp16	344 <L5>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d2 0d                 brult8	0xd <L1>
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 ff 28                 fmul	q2, q0
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
<L2>:
 f4 72                 stsp16	[sp+0xc], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6d                 add32	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c2 80                 ldi8	r6, 0x80
 8b                    and	r6, r7
 f9 79                 or	r3, r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 c7 80 3d              ldi16	r7, 0x3d80
 f2 64                 mov32	q1, q0
 ff 65                 fabs	q1
 ff c8 57              fcmp	r5, q1, q3
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 ff c0 61              s16tof	q1, r6
 cd 01                 cmpi.s8	r5, 0x1
 de ae 00              brslt16	0xae <L3>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 64                 mov32	q1, q0
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 39                 fdiv	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ff 2a                 fmul	q2, q2
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c6 97 88              ldi16	r6, 0x8897
 c7 17 3e              ldi16	r7, 0x3e17
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 c6 25 33              ldi16	r6, 0x3325
 c7 3a 3e              ldi16	r7, 0x3e3a
 ff 07                 fadd	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 25 49           ldi16	r2, 0x4925
 f0 07 92 3e           ldi16	r3, 0x3e92
 ff 0d                 fadd	q3, q1
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a 3f              ldi16	r7, 0x3f2a
 ff 07                 fadd	q1, q3
 c6 4f d0              ldi16	r6, 0xd04f
 c7 1c 3e              ldi16	r7, 0x3e1c
 ff 2b                 fmul	q2, q3
 c6 29 8e              ldi16	r6, 0x8e29
 c7 63 3e              ldi16	r7, 0x3e63
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2d                 fmul	q3, q1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 cc 3e              ldi16	r5, 0x3ecc
 ff 0e                 fadd	q3, q2
 ff 27                 fmul	q1, q3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0b                 fadd	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2e                 fmul	q3, q2
 ff 1d                 fsub	q3, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 03                 fadd	q0, q3
 d4 3a                 jmp8	0x3a <L4>
<L3>:
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3e              ldi16	r5, 0x3e2a
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 ff 2e                 fmul	q3, q2
 ff 13                 fsub	q0, q3
<L4>:
 f2 68                 mov32	q2, q0
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 ff 2b                 fmul	q2, q3
 ff 09                 fadd	q2, q1
<L5>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L7>
 ff 0a                 fadd	q2, q2
 d4 ea                 jmp8	-0x16 <L5>
<L7>:
 ff 1a                 fsub	q2, q2
 ff 38                 fdiv	q2, q0
 d4 e4                 jmp8	-0x1c <L5>

<avm_halt>:
 d4 fe                 jmp8	avm_halt
