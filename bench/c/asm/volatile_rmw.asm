
volatile_rmw.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 volatile_rmw.c
00000100 l     O .data	00000010 device_bytes
00000110 l     O .data	00000020 device_words
00000130 l     O .data	00000002 volatile_rmw_result
00000000 l    df *ABS*	00000000 runtime.c
00000408 l       .init_array	00000000 .hidden __init_array_end
00000408 l       .init_array	00000000 .hidden __init_array_start
00000408 l       .fini_array	00000000 .hidden __fini_array_start
00000408 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000013f avm_test_main
00000406 g     F .text	00000002 avm_halt
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
 e1 e8 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 08 04              ldi16	r4, 0x408
 c1 00                 ldi8	r5, 0x0
 c6 08 04              ldi16	r6, 0x408
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 08 04           ldi16	r0, 0x408
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 08 04           ldi16	r2, 0x408
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
 c4 08 04              ldi16	r4, 0x408
 c1 00                 ldi8	r5, 0x0
 c6 08 04              ldi16	r6, 0x408
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 08 04           ldi16	r2, 0x408
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 08 04           ldi16	r0, 0x408
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
 c0 03                 ldi8	r4, 0x3
 f0 4c 00 01           stm8	[0x100], r4
 c4 34 12              ldi16	r4, 0x1234
 f0 5c 10 01           stm16	[0x110], r4
 c0 14                 ldi8	r4, 0x14
 f0 4c 01 01           stm8	[0x101], r4
 c4 35 13              ldi16	r4, 0x1335
 f0 5c 12 01           stm16	[0x112], r4
 c0 25                 ldi8	r4, 0x25
 f0 4c 02 01           stm8	[0x102], r4
 c4 36 14              ldi16	r4, 0x1436
 f0 5c 14 01           stm16	[0x114], r4
 c0 36                 ldi8	r4, 0x36
 f0 4c 03 01           stm8	[0x103], r4
 c4 37 15              ldi16	r4, 0x1537
 f0 5c 16 01           stm16	[0x116], r4
 c0 47                 ldi8	r4, 0x47
 f0 4c 04 01           stm8	[0x104], r4
 c4 38 16              ldi16	r4, 0x1638
 f0 5c 18 01           stm16	[0x118], r4
 c0 58                 ldi8	r4, 0x58
 f0 4c 05 01           stm8	[0x105], r4
 c4 39 17              ldi16	r4, 0x1739
 f0 5c 1a 01           stm16	[0x11a], r4
 c0 69                 ldi8	r4, 0x69
 f0 4c 06 01           stm8	[0x106], r4
 c4 3a 18              ldi16	r4, 0x183a
 f0 5c 1c 01           stm16	[0x11c], r4
 c0 7a                 ldi8	r4, 0x7a
 f0 4c 07 01           stm8	[0x107], r4
 c4 3b 19              ldi16	r4, 0x193b
 f0 5c 1e 01           stm16	[0x11e], r4
 c0 8b                 ldi8	r4, 0x8b
 f0 4c 08 01           stm8	[0x108], r4
 c4 3c 1a              ldi16	r4, 0x1a3c
 f0 5c 20 01           stm16	[0x120], r4
 c0 9c                 ldi8	r4, 0x9c
 f0 4c 09 01           stm8	[0x109], r4
 c4 3d 1b              ldi16	r4, 0x1b3d
 f0 5c 22 01           stm16	[0x122], r4
 c0 ad                 ldi8	r4, 0xad
 f0 4c 0a 01           stm8	[0x10a], r4
 c4 3e 1c              ldi16	r4, 0x1c3e
 f0 5c 24 01           stm16	[0x124], r4
 c0 be                 ldi8	r4, 0xbe
 f0 4c 0b 01           stm8	[0x10b], r4
 c4 3f 1d              ldi16	r4, 0x1d3f
 f0 5c 26 01           stm16	[0x126], r4
 c0 cf                 ldi8	r4, 0xcf
 f0 4c 0c 01           stm8	[0x10c], r4
 c4 40 1e              ldi16	r4, 0x1e40
 f0 5c 28 01           stm16	[0x128], r4
 c0 e0                 ldi8	r4, 0xe0
 f0 4c 0d 01           stm8	[0x10d], r4
 c4 41 1f              ldi16	r4, 0x1f41
 f0 5c 2a 01           stm16	[0x12a], r4
 c0 f1                 ldi8	r4, 0xf1
 f0 4c 0e 01           stm8	[0x10e], r4
 c4 42 20              ldi16	r4, 0x2042
 f0 5c 2c 01           stm16	[0x12c], r4
 c0 02                 ldi8	r4, 0x2
 f0 4c 0f 01           stm8	[0x10f], r4
 c4 43 21              ldi16	r4, 0x2143
 f0 5c 2e 01           stm16	[0x12e], r4
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 0e                    mov	r7, r6
 f2 42                 sub	r2, r2
 c5 10 01              ldi16	r5, 0x110
 f0 04 00 01           ldi16	r0, 0x100
 f0 33 00              ldsp16	r3, [sp+0x0]
 ed 80 20              ld8u	r4, [r0+0]
 f0 01 40              ldi8	r1, 0x40
 f9 31                 or	r1, r4
 ee 20 20              st8	[r0+0], r1
 ed 20 20              ld8u	r1, [r0+0]
 c0 f7                 ldi8	r4, 0xf7
 f9 84                 and	r4, r1
 ee 80 20              st8	[r0+0], r4
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 f1 0f                 mov	r1, r7
 ed e0 20              ld8u	r7, [r0+0]
 ac                    xor	r7, r4
 ee e0 20              st8	[r0+0], r7
 61                    ld16	r4, [r5]
 f2 23                 add	r4, r3
 74                    st16	[r5], r4
 c4 80 80              ldi16	r4, 0x8080
 6d                    ld16	r7, [r5]
 ac                    xor	r7, r4
 77                    st16	[r5], r7
 f1 2d                 mov	r7, r1
 f0 6c 81              ld8u	r4, [r0+]
 12                    add	r4, r6
 f7 2e                 ld16	r6, [r5+]
 18                    add	r6, r4
 f4 aa                 inc16	r2
 f0 0b 03              addi.s8	r3, 0x3
 f0 0f 31              cmpi.s8	r3, 0x31
 d1 c2                 brne8	avm_test_main+234
 f4 af                 inc16	r7
 07                    mov	r5, r7
 f1 75                 zext8	r5
 cd 18                 cmpi.s8	r5, 0x18
 d1 ad                 brne8	avm_test_main+222
 f0 5e 30 01           stm16	[0x130], r6
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
