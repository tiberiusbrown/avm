
lambda_capture.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 lambda_capture.cpp
00000100 l     O .data	00000040 inputs
000003f4 l     F .text	00000007 unsigned int apply<avm_test_main::$_0>(avm_test_main::$_0, unsigned int)
000003fb l     F .text	00000008 unsigned int apply<avm_test_main::$_1>(avm_test_main::$_1, unsigned int)
00000140 l     O .data	00000002 lambda_capture_result
00000000 l    df *ABS*	00000000 runtime.c
00000405 l       .init_array	00000000 .hidden __init_array_end
00000405 l       .init_array	00000000 .hidden __init_array_start
00000405 l       .fini_array	00000000 .hidden __fini_array_start
00000405 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000012d avm_test_main
00000403 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 e5 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 05 04              ldi16	r4, 0x405
 c1 00                 ldi8	r5, 0x0
 c6 05 04              ldi16	r6, 0x405
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 05 04           ldi16	r0, 0x405
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 05 04           ldi16	r2, 0x405
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 05 04              ldi16	r4, 0x405
 c1 00                 ldi8	r5, 0x0
 c6 05 04              ldi16	r6, 0x405
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 05 04           ldi16	r2, 0x405
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 05 04           ldi16	r0, 0x405
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
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
 d6 fc                 adjsp	-0x4
 c0 0b                 ldi8	r4, 0xb
 f0 5c 00 01           stm16	[0x100], r4
 c0 6c                 ldi8	r4, 0x6c
 f0 5c 02 01           stm16	[0x102], r4
 c0 cd                 ldi8	r4, 0xcd
 f0 5c 04 01           stm16	[0x104], r4
 c4 2e 01              ldi16	r4, 0x12e
 f0 5c 06 01           stm16	[0x106], r4
 c4 8f 01              ldi16	r4, 0x18f
 f0 5c 08 01           stm16	[0x108], r4
 c4 f0 01              ldi16	r4, 0x1f0
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 51 02              ldi16	r4, 0x251
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 b2 02              ldi16	r4, 0x2b2
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 13 03              ldi16	r4, 0x313
 f0 5c 10 01           stm16	[0x110], r4
 c4 74 03              ldi16	r4, 0x374
 f0 5c 12 01           stm16	[0x112], r4
 c4 d5 03              ldi16	r4, 0x3d5
 f0 5c 14 01           stm16	[0x114], r4
 c4 36 04              ldi16	r4, 0x436
 f0 5c 16 01           stm16	[0x116], r4
 c4 97 04              ldi16	r4, 0x497
 f0 5c 18 01           stm16	[0x118], r4
 c4 f8 04              ldi16	r4, 0x4f8
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 59 05              ldi16	r4, 0x559
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 ba 05              ldi16	r4, 0x5ba
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 1b 06              ldi16	r4, 0x61b
 f0 5c 20 01           stm16	[0x120], r4
 c4 7c 06              ldi16	r4, 0x67c
 f0 5c 22 01           stm16	[0x122], r4
 c4 dd 06              ldi16	r4, 0x6dd
 f0 5c 24 01           stm16	[0x124], r4
 c4 3e 07              ldi16	r4, 0x73e
 f0 5c 26 01           stm16	[0x126], r4
 c4 9f 07              ldi16	r4, 0x79f
 f0 5c 28 01           stm16	[0x128], r4
 c4 00 08              ldi16	r4, 0x800
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 61 08              ldi16	r4, 0x861
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 c2 08              ldi16	r4, 0x8c2
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 23 09              ldi16	r4, 0x923
 f0 5c 30 01           stm16	[0x130], r4
 c4 84 09              ldi16	r4, 0x984
 f0 5c 32 01           stm16	[0x132], r4
 c4 e5 09              ldi16	r4, 0x9e5
 f0 5c 34 01           stm16	[0x134], r4
 c4 46 0a              ldi16	r4, 0xa46
 f0 5c 36 01           stm16	[0x136], r4
 c4 a7 0a              ldi16	r4, 0xaa7
 f0 5c 38 01           stm16	[0x138], r4
 c4 08 0b              ldi16	r4, 0xb08
 f0 5c 3a 01           stm16	[0x13a], r4
 c4 69 0b              ldi16	r4, 0xb69
 f0 5c 3c 01           stm16	[0x13c], r4
 c4 ca 0b              ldi16	r4, 0xbca
 f0 5c 3e 01           stm16	[0x13e], r4
 f2 30                 sub	r0, r0
 f0 07 34 12           ldi16	r3, 0x1234
 d7 01                 sys	debug_break
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 05 00 01           ldi16	r1, 0x100
 ed 92 20              ld16	r4, [r1+0]
 d5 32                 call8	_ZL5applyIZ13avm_test_mainE3$_0EjT_j
 f2 23                 add	r4, r3
 f4 48                 stsp16	[sp+0x2], r4
 f0 6c b3              ld16	r5, [r1+]
 f0 14 02              leasp	r4, 0x2
 d5 2d                 call8	_ZL5applyIZ13avm_test_mainE3$_1EjT_j
 f0 33 02              ldsp16	r3, [sp+0x2]
 f9 72                 xor	r3, r4
 f0 3b 02              stsp16	[sp+0x2], r3
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 e1                 brne8	avm_test_main+246
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 18                 cmpi.s8	r4, 0x18
 d1 d0                 brne8	avm_test_main+239
 f0 5b 40 01           stm16	[0x140], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<unsigned int apply<avm_test_main::$_0>(avm_test_main::$_0, unsigned int)>:
 c1 07                 ldi8	r5, 0x7
 fe 25                 mul16	r4, r5
 c8 03                 addi.s8	r4, 0x3
 ef                    ret

<unsigned int apply<avm_test_main::$_1>(avm_test_main::$_1, unsigned int)>:
 68                    ld16	r6, [r4]
 a9                    xor	r6, r5
 72                    st16	[r4], r6
 fa 82                 lsr16i	r5, 0x2
 19                    add	r6, r5
 02                    mov	r4, r6
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
