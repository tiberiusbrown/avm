
count_trailing_zeros.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 count_trailing_zeros.c
00000100 l     O .data	00000030 words
00000130 l     O .data	00000002 result
00000000 l    df *ABS*	00000000 runtime.c
000003dc l       .init_array	00000000 .hidden __init_array_end
000003dc l       .init_array	00000000 .hidden __init_array_start
000003dc l       .fini_array	00000000 .hidden __fini_array_start
000003dc l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000113 avm_test_main
000003da g     F .text	00000002 avm_halt
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
 e1 bc 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 dc 03              ldi16	r4, 0x3dc
 c1 00                 ldi8	r5, 0x0
 c6 dc 03              ldi16	r6, 0x3dc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 dc 03           ldi16	r0, 0x3dc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 dc 03           ldi16	r2, 0x3dc
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
 c4 dc 03              ldi16	r4, 0x3dc
 c1 00                 ldi8	r5, 0x0
 c6 dc 03              ldi16	r6, 0x3dc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 dc 03           ldi16	r2, 0x3dc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 dc 03           ldi16	r0, 0x3dc
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
 c4 00 18              ldi16	r4, 0x1800
 f0 5c 00 01           stm16	[0x100], r4
 c4 0d 11              ldi16	r4, 0x110d
 f0 5c 02 01           stm16	[0x102], r4
 c4 1a 0a              ldi16	r4, 0xa1a
 f0 5c 04 01           stm16	[0x104], r4
 c4 27 03              ldi16	r4, 0x327
 f0 5c 06 01           stm16	[0x106], r4
 c4 34 3c              ldi16	r4, 0x3c34
 f0 5c 08 01           stm16	[0x108], r4
 c4 41 35              ldi16	r4, 0x3541
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 4e 2e              ldi16	r4, 0x2e4e
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 5b 27              ldi16	r4, 0x275b
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 68 50              ldi16	r4, 0x5068
 f0 5c 10 01           stm16	[0x110], r4
 c4 75 49              ldi16	r4, 0x4975
 f0 5c 12 01           stm16	[0x112], r4
 c4 82 42              ldi16	r4, 0x4282
 f0 5c 14 01           stm16	[0x114], r4
 c4 8f 7b              ldi16	r4, 0x7b8f
 f0 5c 16 01           stm16	[0x116], r4
 c4 9c 74              ldi16	r4, 0x749c
 f0 5c 18 01           stm16	[0x118], r4
 c4 a9 6d              ldi16	r4, 0x6da9
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 b6 66              ldi16	r4, 0x66b6
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 c3 9f              ldi16	r4, 0x9fc3
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 d0 88              ldi16	r4, 0x88d0
 f0 5c 20 01           stm16	[0x120], r4
 c4 dd 81              ldi16	r4, 0x81dd
 f0 5c 22 01           stm16	[0x122], r4
 c4 ea ba              ldi16	r4, 0xbaea
 f0 5c 24 01           stm16	[0x124], r4
 c4 f7 b3              ldi16	r4, 0xb3f7
 f0 5c 26 01           stm16	[0x126], r4
 c4 04 ad              ldi16	r4, 0xad04
 f0 5c 28 01           stm16	[0x128], r4
 c4 11 a6              ldi16	r4, 0xa611
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 1e df              ldi16	r4, 0xdf1e
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 2b c8              ldi16	r4, 0xc82b
 f0 5c 2e 01           stm16	[0x12e], r4
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c1 18                 ldi8	r5, 0x18
 f4 41                 stsp16	[sp+0x0], r5
 f0 07 00 80           ldi16	r3, 0x8000
 f1 14                 mov	r2, r4
 f4 48                 stsp16	[sp+0x2], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 05 00 01           ldi16	r1, 0x100
 f0 6c f3              ld16	r7, [r1+]
 f9 ed                 or	r7, r3
 f0 04 ff ff           ldi16	r0, 0xffff
 f9 1e                 xor	r0, r7
 f4 b7                 dec16	r7
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 c5 55 15              ldi16	r5, 0x1555
 84                    and	r5, r4
 2d                    sub	r7, r5
 c4 33 33              ldi16	r4, 0x3333
 07                    mov	r5, r7
 84                    and	r5, r4
 fa a2                 lsr16i	r7, 0x2
 8c                    and	r7, r4
 1d                    add	r7, r5
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 c5 0f 0f              ldi16	r5, 0xf0f
 84                    and	r5, r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 c1 1f                 ldi8	r5, 0x1f
 84                    and	r5, r4
 f2 15                 add	r2, r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 c9                 brne8	avm_test_main+195
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 14                 cmpi.s8	r5, 0x14
 d1 b6                 brne8	avm_test_main+187
 f0 5a 30 01           stm16	[0x130], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
