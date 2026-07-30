
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strcmp_p.c
00000100 l     O .data	00000041 lhs
000002f4 l     O .rodata	00000001 p_empty
00000141 l     O .data	00000001 .L.str.1
00000377 l     O .rodata	00000041 p_last_diff
00000336 l     O .rodata	00000041 p_first_diff
000002f5 l     O .rodata	00000041 p_equal
000003b8 l     O .rodata	00000011 p_prefix
00000142 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000dc avm_test_main
000002f2 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 dc 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 6d 6e              ldi16	r4, 0x6e6d
 c5 6f 70              ldi16	r5, 0x706f
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 69 6a              ldi16	r4, 0x6a69
 c5 6b 6c              ldi16	r5, 0x6c6b
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 65 66              ldi16	r4, 0x6665
 c5 67 68              ldi16	r5, 0x6867
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c6 61 62              ldi16	r6, 0x6261
 c7 63 64              ldi16	r7, 0x6463
 c4 30 01              ldi16	r4, 0x130
 f0 6b c8              st32	[r4], q3
 c4 20 01              ldi16	r4, 0x120
 f0 6b c8              st32	[r4], q3
 c4 10 01              ldi16	r4, 0x110
 f0 6b c8              st32	[r4], q3
 f0 04 00 01           ldi16	r0, 0x100
 f0 6b c0              st32	[r0], q3
 a0                    xor	r4, r4
 f0 4c 40 01           stm8	[0x140], r4
 d7 01                 sys	debug_break
 c6 f4 02              ldi16	r6, 0x2f4
 c3 00                 ldi8	r7, 0x0
 c4 41 01              ldi16	r4, 0x141
 d7 14                 sys	strcmp_p
 f1 0c                 mov	r1, r4
 c6 77 03              ldi16	r6, 0x377
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 f1 14                 mov	r2, r4
 c6 36 03              ldi16	r6, 0x336
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 f1 1c                 mov	r3, r4
 c6 f5 02              ldi16	r6, 0x2f5
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 4c 10 01           stm8	[0x110], r4
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 c3 61                 ldi8	r7, 0x61
 f0 4f 10 01           stm8	[0x110], r7
 f2 25                 add	r5, r1
 f2 27                 add	r5, r3
 f2 26                 add	r5, r2
 14                    add	r5, r4
 c6 b8 03              ldi16	r6, 0x3b8
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 11                    add	r4, r5
 f0 5c 42 01           stm16	[0x142], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
