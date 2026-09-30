
bit_count.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 bit_count.c
00000100 l     O .data	00000030 words
000003c8 l     F .text	00000011 count_set_bits
000003d9 l     F .text	00000019 count_trailing_zeroes
00000130 l     O .data	00000002 bit_count_result
00000000 l    df *ABS*	00000000 runtime.c
000003f4 l       .init_array	00000000 .hidden __init_array_end
000003f4 l       .init_array	00000000 .hidden __init_array_start
000003f4 l       .fini_array	00000000 .hidden __fini_array_start
000003f4 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000101 avm_test_main
000003f2 g     F .text	00000002 avm_halt
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
 e1 d4 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f4 03              ldi16	r4, 0x3f4
 c1 00                 ldi8	r5, 0x0
 c6 f4 03              ldi16	r6, 0x3f4
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 f4 03           ldi16	r0, 0x3f4
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f4 03           ldi16	r2, 0x3f4
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
 c4 f4 03              ldi16	r4, 0x3f4
 c1 00                 ldi8	r5, 0x0
 c6 f4 03              ldi16	r6, 0x3f4
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 f4 03           ldi16	r2, 0x3f4
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f4 03           ldi16	r0, 0x3f4
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
 d6 f8                 adjsp	-0x8
 c4 01 80              ldi16	r4, 0x8001
 f0 5c 00 01           stm16	[0x100], r4
 c4 0c 89              ldi16	r4, 0x890c
 f0 5c 02 01           stm16	[0x102], r4
 c4 1b 92              ldi16	r4, 0x921b
 f0 5c 04 01           stm16	[0x104], r4
 c4 26 9b              ldi16	r4, 0x9b26
 f0 5c 06 01           stm16	[0x106], r4
 c4 35 a4              ldi16	r4, 0xa435
 f0 5c 08 01           stm16	[0x108], r4
 c4 40 ad              ldi16	r4, 0xad40
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 4f b6              ldi16	r4, 0xb64f
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 5a bf              ldi16	r4, 0xbf5a
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 69 c8              ldi16	r4, 0xc869
 f0 5c 10 01           stm16	[0x110], r4
 c4 74 d1              ldi16	r4, 0xd174
 f0 5c 12 01           stm16	[0x112], r4
 c4 83 da              ldi16	r4, 0xda83
 f0 5c 14 01           stm16	[0x114], r4
 c4 8e e3              ldi16	r4, 0xe38e
 f0 5c 16 01           stm16	[0x116], r4
 c4 9d ec              ldi16	r4, 0xec9d
 f0 5c 18 01           stm16	[0x118], r4
 c4 a8 f5              ldi16	r4, 0xf5a8
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 b7 fe              ldi16	r4, 0xfeb7
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 c2 07              ldi16	r4, 0x7c2
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 d1 10              ldi16	r4, 0x10d1
 f0 5c 20 01           stm16	[0x120], r4
 c4 dc 19              ldi16	r4, 0x19dc
 f0 5c 22 01           stm16	[0x122], r4
 c4 eb 22              ldi16	r4, 0x22eb
 f0 5c 24 01           stm16	[0x124], r4
 c4 f6 2b              ldi16	r4, 0x2bf6
 f0 5c 26 01           stm16	[0x126], r4
 c4 05 35              ldi16	r4, 0x3505
 f0 5c 28 01           stm16	[0x128], r4
 c4 10 3e              ldi16	r4, 0x3e10
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 1f 47              ldi16	r4, 0x471f
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 2a 50              ldi16	r4, 0x502a
 f0 5c 2e 01           stm16	[0x12e], r4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 18                 ldi8	r4, 0x18
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 80              ldi16	r4, 0x8000
 f4 50                 stsp16	[sp+0x4], r4
 f1 05                 mov	r0, r5
 f4 49                 stsp16	[sp+0x2], r5
 f0 33 00              ldsp16	r3, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 f7 21                 ld16	r1, [r4+]
 f4 58                 stsp16	[sp+0x6], r4
 f1 21                 mov	r4, r1
 d5 35                 call8	count_set_bits
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f9 31                 or	r1, r4
 f1 72                 zext8	r2
 f2 10                 add	r2, r0
 f1 21                 mov	r4, r1
 d5 38                 call8	count_trailing_zeroes
 f1 04                 mov	r0, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f1 70                 zext8	r0
 f9 0a                 xor	r0, r2
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 dc                 brne8	avm_test_main+196
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 14                 cmpi.s8	r4, 0x14
 d1 c9                 brne8	avm_test_main+188
 f0 58 30 01           stm16	[0x130], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<count_set_bits>:
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 d0 0a                 breq8	count_set_bits+16
 09                    mov	r6, r5
 f4 b6                 dec16	r6
 86                    and	r5, r6
 f4 ac                 inc16	r4
 f6 2d                 tst16	r5
 d1 f6                 brne8	count_set_bits+6
 ef                    ret

<count_trailing_zeroes>:
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d1 0f                 brne8	count_trailing_zeroes+22
 a5                    xor	r5, r5
 c2 02                 ldi8	r6, 0x2
 f4 ad                 inc16	r5
 0c                    mov	r7, r4
 8e                    and	r7, r6
 f4 8c                 lsr16.1	r4
 f4 a7                 tst8	r7
 d0 f6                 breq8	count_trailing_zeroes+10
 01                    mov	r4, r5
 ef                    ret
 a5                    xor	r5, r5
 01                    mov	r4, r5
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
