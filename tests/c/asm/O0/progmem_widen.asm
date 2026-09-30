
progmem_widen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 progmem_widen.c
0000068b l     O .rodata	00000060 program_bytes
0000040d l     F .text	00000052 sum_bytes
0000045f l     F .text	00000052 sum_signed_bytes
000004b1 l     F .text	0000006e mix_bytes
0000051f l     F .text	00000066 sum_byte_pairs
000006eb l     O .rodata	00000050 program_words
00000585 l     F .text	00000052 sum_words
00000100 l     O .data	00000003 .L.str
000005d7 l     F .text	00000019 test_line16
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
0000010c l     O .data	00000003 .L.str.4
0000010f l     O .data	00000003 .L.str.5
00000112 l     O .data	00000003 .L.str.6
000005f0 l     F .text	00000018 rotate_left
00000608 l     F .text	00000022 test_puts
0000062a l     F .text	0000000b test_putc
00000635 l     F .text	0000000f test_hex16
00000644 l     F .text	00000019 test_hex8
0000065d l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
0000073b l       .init_array	00000000 .hidden __init_array_end
0000073b l       .init_array	00000000 .hidden __init_array_start
0000073b l       .fini_array	00000000 .hidden __fini_array_start
0000073b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000136 avm_test_main
00000689 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 6b 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 3b 07              ldi16	r4, 0x73b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 3b 07              ldi16	r6, 0x73b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 3b 07           ldi16	r0, 0x73b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 3b 07           ldi16	r2, 0x73b
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
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
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 3b 07              ldi16	r4, 0x73b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 3b 07              ldi16	r6, 0x73b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 3b 07           ldi16	r2, 0x73b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 3b 07           ldi16	r0, 0x73b
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 d6 de                 adjsp	-0x22
 c0 41                 ldi8	r4, 0x41
 f0 3c 20              stsp16	[sp+0x20], r4
 c0 3e                 ldi8	r4, 0x3e
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c0 25                 ldi8	r4, 0x25
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c0 29                 ldi8	r4, 0x29
 f0 3c 1a              stsp16	[sp+0x1a], r4
 c0 17                 ldi8	r4, 0x17
 f0 3c 18              stsp16	[sp+0x18], r4
 c0 21                 ldi8	r4, 0x21
 f0 3c 16              stsp16	[sp+0x16], r4
 c0 11                 ldi8	r4, 0x11
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 36 20              ldsp16	r6, [sp+0x20]
 c4 8b 06              ldi16	r4, 0x68b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 04 01              call16	sum_bytes
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 c4 8c 06              ldi16	r4, 0x68c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e1 f0 00              call16	sum_bytes
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 c4 8e 06              ldi16	r4, 0x68e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 32 01              call16	sum_signed_bytes
 f4 78                 stsp16	[sp+0xe], r4
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 c4 8d 06              ldi16	r4, 0x68d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 75 01              call16	mix_bytes
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 72                 stsp16	[sp+0xc], r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 e1 d6 01              call16	sum_byte_pairs
 f4 68                 stsp16	[sp+0xa], r4
 f0 36 16              ldsp16	r6, [sp+0x16]
 c4 eb 06              ldi16	r4, 0x6eb
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 2d 02              call16	sum_words
 f4 60                 stsp16	[sp+0x8], r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 c4 ed 06              ldi16	r4, 0x6ed
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 1e 02              call16	sum_words
 f4 58                 stsp16	[sp+0x6], r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 c4 00 01              ldi16	r4, 0x100
 e1 65 02              call16	test_line16
 f0 35 10              ldsp16	r5, [sp+0x10]
 c4 03 01              ldi16	r4, 0x103
 e1 5c 02              call16	test_line16
 f4 39                 ldsp16	r5, [sp+0xe]
 c4 06 01              ldi16	r4, 0x106
 e1 54 02              call16	test_line16
 f4 31                 ldsp16	r5, [sp+0xc]
 c4 09 01              ldi16	r4, 0x109
 e1 4c 02              call16	test_line16
 f4 29                 ldsp16	r5, [sp+0xa]
 c4 0c 01              ldi16	r4, 0x10c
 e1 44 02              call16	test_line16
 f4 21                 ldsp16	r5, [sp+0x8]
 c4 0f 01              ldi16	r4, 0x10f
 e1 3c 02              call16	test_line16
 f4 19                 ldsp16	r5, [sp+0x6]
 c4 12 01              ldi16	r4, 0x112
 e1 34 02              call16	test_line16
 f0 35 12              ldsp16	r5, [sp+0x12]
 c0 01                 ldi8	r4, 0x1
 c6 ab 20              ldi16	r6, 0x20ab
 36                    cmp	r5, r6
 f4 50                 stsp16	[sp+0x4], r4
 d1 55                 brne8	avm_test_main+302
 d4 00                 jmp8	avm_test_main+219
 f0 35 10              ldsp16	r5, [sp+0x10]
 c0 01                 ldi8	r4, 0x1
 c6 1e 1f              ldi16	r6, 0x1f1e
 36                    cmp	r5, r6
 f4 50                 stsp16	[sp+0x4], r4
 d1 46                 brne8	avm_test_main+302
 d4 00                 jmp8	avm_test_main+234
 f4 39                 ldsp16	r5, [sp+0xe]
 c0 01                 ldi8	r4, 0x1
 c6 63 ff              ldi16	r6, 0xff63
 36                    cmp	r5, r6
 f4 50                 stsp16	[sp+0x4], r4
 d1 38                 brne8	avm_test_main+302
 d4 00                 jmp8	avm_test_main+248
 f4 31                 ldsp16	r5, [sp+0xc]
 c0 01                 ldi8	r4, 0x1
 c6 d2 59              ldi16	r6, 0x59d2
 36                    cmp	r5, r6
 f4 50                 stsp16	[sp+0x4], r4
 d1 2a                 brne8	avm_test_main+302
 d4 00                 jmp8	avm_test_main+262
 f4 29                 ldsp16	r5, [sp+0xa]
 c0 01                 ldi8	r4, 0x1
 c6 31 4a              ldi16	r6, 0x4a31
 36                    cmp	r5, r6
 f4 50                 stsp16	[sp+0x4], r4
 d1 1c                 brne8	avm_test_main+302
 d4 00                 jmp8	avm_test_main+276
 f4 21                 ldsp16	r5, [sp+0x8]
 c0 01                 ldi8	r4, 0x1
 c6 6d d4              ldi16	r6, 0xd46d
 36                    cmp	r5, r6
 f4 50                 stsp16	[sp+0x4], r4
 d1 0e                 brne8	avm_test_main+302
 d4 00                 jmp8	avm_test_main+290
 f4 18                 ldsp16	r4, [sp+0x6]
 c5 65 58              ldi16	r5, 0x5865
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	avm_test_main+302
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 22                 adjsp	0x22
 ef                    ret

<sum_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 64                 stsp16	[sp+0x9], r4
 f1 5d                 stsp8	[sp+0xb], r5
 f4 5e                 stsp16	[sp+0x7], r6
 a0                    xor	r4, r4
 f4 54                 stsp16	[sp+0x5], r4
 f4 26                 ldsp16	r6, [sp+0x9]
 f3 6f                 ldsp8u	r7, [sp+0xb]
 f4 4a                 stsp16	[sp+0x2], r6
 f1 43                 stsp8	[sp+0x4], r7
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	sum_bytes+27
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 1d                 ldsp16	r5, [sp+0x7]
 31                    cmp	r4, r5
 d8 27                 bruge8	sum_bytes+73
 d4 00                 jmp8	sum_bytes+36
 f4 14                 ldsp16	r4, [sp+0x5]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 38 02              stsp16	[sp+0x2], r0
 f0 29 04              stsp8	[sp+0x4], r1
 f0 60 ac              ldp8u	r5, [q3]
 11                    add	r4, r5
 f4 54                 stsp16	[sp+0x5], r4
 d4 00                 jmp8	sum_bytes+65
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 d2                 jmp8	sum_bytes+27
 f4 14                 ldsp16	r4, [sp+0x5]
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sum_signed_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 64                 stsp16	[sp+0x9], r4
 f1 5d                 stsp8	[sp+0xb], r5
 f4 5e                 stsp16	[sp+0x7], r6
 a0                    xor	r4, r4
 f4 54                 stsp16	[sp+0x5], r4
 f4 26                 ldsp16	r6, [sp+0x9]
 f3 6f                 ldsp8u	r7, [sp+0xb]
 f4 4a                 stsp16	[sp+0x2], r6
 f1 43                 stsp8	[sp+0x4], r7
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	sum_signed_bytes+27
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 1d                 ldsp16	r5, [sp+0x7]
 31                    cmp	r4, r5
 d8 27                 bruge8	sum_signed_bytes+73
 d4 00                 jmp8	sum_signed_bytes+36
 f4 14                 ldsp16	r4, [sp+0x5]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 38 02              stsp16	[sp+0x2], r0
 f0 29 04              stsp8	[sp+0x4], r1
 f0 61 ac              ldp8s	r5, [q3]
 11                    add	r4, r5
 f4 54                 stsp16	[sp+0x5], r4
 d4 00                 jmp8	sum_signed_bytes+65
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 d2                 jmp8	sum_signed_bytes+27
 f4 14                 ldsp16	r4, [sp+0x5]
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 6c                 stsp16	[sp+0xb], r4
 f1 65                 stsp8	[sp+0xd], r5
 f4 66                 stsp16	[sp+0x9], r6
 c4 2b 6d              ldi16	r4, 0x6d2b
 f4 5c                 stsp16	[sp+0x7], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f3 75                 ldsp8u	r5, [sp+0xd]
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	mix_bytes+28
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 25                 ldsp16	r5, [sp+0x9]
 31                    cmp	r4, r5
 d8 44                 bruge8	mix_bytes+103
 d4 00                 jmp8	mix_bytes+37
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 59                 ldsp8u	r5, [sp+0x6]
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6c                 add32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f1 4b                 stsp8	[sp+0x6], r7
 f0 60 88              ldp8u	r4, [q2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 c1 01                 ldi8	r5, 0x1
 e1 fd 00              call16	rotate_left
 f4 5c                 stsp16	[sp+0x7], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 c4 01 01              ldi16	r4, 0x101
 fe 2c                 mul16	r5, r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 a1                    xor	r4, r5
 f4 5c                 stsp16	[sp+0x7], r4
 f4 1d                 ldsp16	r5, [sp+0x7]
 f4 08                 ldsp16	r4, [sp+0x2]
 c2 11                 ldi8	r6, 0x11
 fe 26                 mul16	r4, r6
 11                    add	r4, r5
 c8 03                 addi.s8	r4, 0x3
 f4 5c                 stsp16	[sp+0x7], r4
 d4 00                 jmp8	mix_bytes+95
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 b5                 jmp8	mix_bytes+28
 f4 1c                 ldsp16	r4, [sp+0x7]
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_byte_pairs>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 74                 stsp16	[sp+0xd], r4
 f1 6d                 stsp8	[sp+0xf], r5
 f4 6e                 stsp16	[sp+0xb], r6
 a0                    xor	r4, r4
 f4 64                 stsp16	[sp+0x9], r4
 f4 36                 ldsp16	r6, [sp+0xd]
 f3 7f                 ldsp8u	r7, [sp+0xf]
 f4 5a                 stsp16	[sp+0x6], r6
 f1 53                 stsp8	[sp+0x8], r7
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	sum_byte_pairs+25
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 2d                 ldsp16	r5, [sp+0xb]
 31                    cmp	r4, r5
 d8 3f                 bruge8	sum_byte_pairs+95
 d4 00                 jmp8	sum_byte_pairs+34
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 61                 ldsp8u	r5, [sp+0x8]
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6c                 add32	q3, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f1 53                 stsp8	[sp+0x8], r7
 f0 60 88              ldp8u	r4, [q2]
 f4 48                 stsp16	[sp+0x2], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 61                 ldsp8u	r5, [sp+0x8]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6c                 add32	q3, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f1 53                 stsp8	[sp+0x8], r7
 f0 60 88              ldp8u	r4, [q2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 24                 ldsp16	r4, [sp+0x9]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 58                 lsl16i	r6, 0x8
 96                    or	r5, r6
 11                    add	r4, r5
 f4 64                 stsp16	[sp+0x9], r4
 d4 00                 jmp8	sum_byte_pairs+87
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f4 50                 stsp16	[sp+0x4], r4
 d4 ba                 jmp8	sum_byte_pairs+25
 f4 24                 ldsp16	r4, [sp+0x9]
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_words>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 64                 stsp16	[sp+0x9], r4
 f1 5d                 stsp8	[sp+0xb], r5
 f4 5e                 stsp16	[sp+0x7], r6
 a0                    xor	r4, r4
 f4 54                 stsp16	[sp+0x5], r4
 f4 26                 ldsp16	r6, [sp+0x9]
 f3 6f                 ldsp8u	r7, [sp+0xb]
 f4 4a                 stsp16	[sp+0x2], r6
 f1 43                 stsp8	[sp+0x4], r7
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	sum_words+27
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 1d                 ldsp16	r5, [sp+0x7]
 31                    cmp	r4, r5
 d8 27                 bruge8	sum_words+73
 d4 00                 jmp8	sum_words+36
 f4 14                 ldsp16	r4, [sp+0x5]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 38 02              stsp16	[sp+0x2], r0
 f0 29 04              stsp8	[sp+0x4], r1
 f0 62 ac              ldp16	r5, [q3]
 11                    add	r4, r5
 f4 54                 stsp16	[sp+0x5], r4
 d4 00                 jmp8	sum_words+65
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 d2                 jmp8	sum_words+27
 f4 14                 ldsp16	r4, [sp+0x5]
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 27                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 45                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 4c                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 3d                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<rotate_left>:
 d6 fd                 adjsp	-0x3
 f4 44                 stsp16	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f4 05                 ldsp16	r5, [sp+0x1]
 f3 43                 ldsp8u	r7, [sp+0x0]
 01                    mov	r4, r5
 fa 03                 shl16v	r4, r7
 c2 10                 ldi8	r6, 0x10
 2b                    sub	r6, r7
 f1 76                 zext8	r6
 fa 16                 lsr16v	r5, r6
 91                    or	r4, r5
 d6 03                 adjsp	0x3
 ef                    ret

<test_puts>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_puts+6
 f4 00                 ldsp16	r4, [sp+0x0]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 10                 breq8	test_puts+31
 d4 00                 jmp8	test_puts+17
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f4 41                 stsp16	[sp+0x0], r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 d5 05                 call8	test_putc
 d4 e7                 jmp8	test_puts+6
 d6 02                 adjsp	0x2
 ef                    ret

<test_putc>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 d5 07                 call8	test_hex8
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 fa 74                 lsr16i	r4, 0x4
 d5 0f                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d8                 call8	test_putc
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 07                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d0                 call8	test_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex_digit>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 0a                 cmpi.s8	r4, 0xa
 d9 0c                 brsge8	test_hex_digit+29
 d4 00                 jmp8	test_hex_digit+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 30                 addi.s8	r4, 0x30
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0a                 jmp8	test_hex_digit+39
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 37                 addi.s8	r4, 0x37
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_hex_digit+39
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 03                 adjsp	0x3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
