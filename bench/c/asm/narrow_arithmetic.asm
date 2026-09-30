
narrow_arithmetic.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 narrow_arithmetic.c
00000100 l     O .data	00000040 input
00000140 l     O .data	00000002 narrow_arithmetic_result
00000000 l    df *ABS*	00000000 runtime.c
00000497 l       .init_array	00000000 .hidden __init_array_end
00000497 l       .init_array	00000000 .hidden __init_array_start
00000497 l       .fini_array	00000000 .hidden __fini_array_start
00000497 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000001ce avm_test_main
00000495 g     F .text	00000002 avm_halt
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
 e1 77 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 97 04              ldi16	r4, 0x497
 c1 00                 ldi8	r5, 0x0
 c6 97 04              ldi16	r6, 0x497
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 97 04           ldi16	r0, 0x497
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 97 04           ldi16	r2, 0x497
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
 c4 97 04              ldi16	r4, 0x497
 c1 00                 ldi8	r5, 0x0
 c6 97 04              ldi16	r6, 0x497
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 97 04           ldi16	r2, 0x497
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 97 04           ldi16	r0, 0x497
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
 d6 fe                 adjsp	-0x2
 c0 0b                 ldi8	r4, 0xb
 f0 4c 00 01           stm8	[0x100], r4
 c0 28                 ldi8	r4, 0x28
 f0 4c 01 01           stm8	[0x101], r4
 c0 45                 ldi8	r4, 0x45
 f0 4c 02 01           stm8	[0x102], r4
 c0 62                 ldi8	r4, 0x62
 f0 4c 03 01           stm8	[0x103], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 4c 04 01           stm8	[0x104], r4
 c0 9c                 ldi8	r4, 0x9c
 f0 4c 05 01           stm8	[0x105], r4
 c0 b9                 ldi8	r4, 0xb9
 f0 4c 06 01           stm8	[0x106], r4
 c0 d6                 ldi8	r4, 0xd6
 f0 4c 07 01           stm8	[0x107], r4
 c0 f3                 ldi8	r4, 0xf3
 f0 4c 08 01           stm8	[0x108], r4
 c0 10                 ldi8	r4, 0x10
 f0 4c 09 01           stm8	[0x109], r4
 c0 2d                 ldi8	r4, 0x2d
 f0 4c 0a 01           stm8	[0x10a], r4
 c0 4a                 ldi8	r4, 0x4a
 f0 4c 0b 01           stm8	[0x10b], r4
 c0 67                 ldi8	r4, 0x67
 f0 4c 0c 01           stm8	[0x10c], r4
 c0 84                 ldi8	r4, 0x84
 f0 4c 0d 01           stm8	[0x10d], r4
 c0 a1                 ldi8	r4, 0xa1
 f0 4c 0e 01           stm8	[0x10e], r4
 c0 be                 ldi8	r4, 0xbe
 f0 4c 0f 01           stm8	[0x10f], r4
 c0 db                 ldi8	r4, 0xdb
 f0 4c 10 01           stm8	[0x110], r4
 c0 f8                 ldi8	r4, 0xf8
 f0 4c 11 01           stm8	[0x111], r4
 c0 15                 ldi8	r4, 0x15
 f0 4c 12 01           stm8	[0x112], r4
 c0 32                 ldi8	r4, 0x32
 f0 4c 13 01           stm8	[0x113], r4
 c0 4f                 ldi8	r4, 0x4f
 f0 4c 14 01           stm8	[0x114], r4
 c0 6c                 ldi8	r4, 0x6c
 f0 4c 15 01           stm8	[0x115], r4
 c0 89                 ldi8	r4, 0x89
 f0 4c 16 01           stm8	[0x116], r4
 c0 a6                 ldi8	r4, 0xa6
 f0 4c 17 01           stm8	[0x117], r4
 c0 c3                 ldi8	r4, 0xc3
 f0 4c 18 01           stm8	[0x118], r4
 c0 e0                 ldi8	r4, 0xe0
 f0 4c 19 01           stm8	[0x119], r4
 c0 fd                 ldi8	r4, 0xfd
 f0 4c 1a 01           stm8	[0x11a], r4
 c0 1a                 ldi8	r4, 0x1a
 f0 4c 1b 01           stm8	[0x11b], r4
 c0 37                 ldi8	r4, 0x37
 f0 4c 1c 01           stm8	[0x11c], r4
 c0 54                 ldi8	r4, 0x54
 f0 4c 1d 01           stm8	[0x11d], r4
 c0 71                 ldi8	r4, 0x71
 f0 4c 1e 01           stm8	[0x11e], r4
 c0 8e                 ldi8	r4, 0x8e
 f0 4c 1f 01           stm8	[0x11f], r4
 c0 ab                 ldi8	r4, 0xab
 f0 4c 20 01           stm8	[0x120], r4
 c0 c8                 ldi8	r4, 0xc8
 f0 4c 21 01           stm8	[0x121], r4
 c0 e5                 ldi8	r4, 0xe5
 f0 4c 22 01           stm8	[0x122], r4
 c0 02                 ldi8	r4, 0x2
 f0 4c 23 01           stm8	[0x123], r4
 c0 1f                 ldi8	r4, 0x1f
 f0 4c 24 01           stm8	[0x124], r4
 c0 3c                 ldi8	r4, 0x3c
 f0 4c 25 01           stm8	[0x125], r4
 c0 59                 ldi8	r4, 0x59
 f0 4c 26 01           stm8	[0x126], r4
 c0 76                 ldi8	r4, 0x76
 f0 4c 27 01           stm8	[0x127], r4
 c0 93                 ldi8	r4, 0x93
 f0 4c 28 01           stm8	[0x128], r4
 c0 b0                 ldi8	r4, 0xb0
 f0 4c 29 01           stm8	[0x129], r4
 c0 cd                 ldi8	r4, 0xcd
 f0 4c 2a 01           stm8	[0x12a], r4
 c0 ea                 ldi8	r4, 0xea
 f0 4c 2b 01           stm8	[0x12b], r4
 c0 07                 ldi8	r4, 0x7
 f0 4c 2c 01           stm8	[0x12c], r4
 c0 24                 ldi8	r4, 0x24
 f0 4c 2d 01           stm8	[0x12d], r4
 c0 41                 ldi8	r4, 0x41
 f0 4c 2e 01           stm8	[0x12e], r4
 c0 5e                 ldi8	r4, 0x5e
 f0 4c 2f 01           stm8	[0x12f], r4
 c0 7b                 ldi8	r4, 0x7b
 f0 4c 30 01           stm8	[0x130], r4
 c0 98                 ldi8	r4, 0x98
 f0 4c 31 01           stm8	[0x131], r4
 c0 b5                 ldi8	r4, 0xb5
 f0 4c 32 01           stm8	[0x132], r4
 c0 d2                 ldi8	r4, 0xd2
 f0 4c 33 01           stm8	[0x133], r4
 c0 ef                 ldi8	r4, 0xef
 f0 4c 34 01           stm8	[0x134], r4
 c0 0c                 ldi8	r4, 0xc
 f0 4c 35 01           stm8	[0x135], r4
 c0 29                 ldi8	r4, 0x29
 f0 4c 36 01           stm8	[0x136], r4
 c0 46                 ldi8	r4, 0x46
 f0 4c 37 01           stm8	[0x137], r4
 c0 63                 ldi8	r4, 0x63
 f0 4c 38 01           stm8	[0x138], r4
 c0 80                 ldi8	r4, 0x80
 f0 4c 39 01           stm8	[0x139], r4
 c0 9d                 ldi8	r4, 0x9d
 f0 4c 3a 01           stm8	[0x13a], r4
 c0 ba                 ldi8	r4, 0xba
 f0 4c 3b 01           stm8	[0x13b], r4
 c0 d7                 ldi8	r4, 0xd7
 f0 4c 3c 01           stm8	[0x13c], r4
 c0 f4                 ldi8	r4, 0xf4
 f0 4c 3d 01           stm8	[0x13d], r4
 c0 11                 ldi8	r4, 0x11
 f0 4c 3e 01           stm8	[0x13e], r4
 c0 2e                 ldi8	r4, 0x2e
 f0 4c 3f 01           stm8	[0x13f], r4
 f0 01 5a              ldi8	r1, 0x5a
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 f1 1a                 mov	r3, r2
 f4 03                 ldsp16	r7, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 f7 06                 ld8u	r6, [r4+]
 f2 0e                 add	r1, r6
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 f2 25                 add	r5, r1
 1a                    add	r6, r6
 1a                    add	r6, r6
 a9                    xor	r6, r5
 f1 06                 mov	r0, r6
 f1 70                 zext8	r0
 f2 18                 add	r3, r0
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 f1 0e                 mov	r1, r6
 d1 e6                 brne8	avm_test_main+408
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 f1 0e                 mov	r1, r6
 d1 d5                 brne8	avm_test_main+403
 f9 62                 xor	r3, r0
 f0 5b 40 01           stm16	[0x140], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
