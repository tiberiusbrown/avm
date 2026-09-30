
progmem_widen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 progmem_widen.c
000004c3 l     O .rodata	00000060 program_bytes
000003e0 l     F .text	00000016 sum_bytes
000003f6 l     F .text	0000001e sum_signed_bytes
00000414 l     F .text	00000031 mix_bytes
00000445 l     F .text	0000001c sum_byte_pairs
00000523 l     O .rodata	00000050 program_words
00000461 l     F .text	00000016 sum_words
00000100 l     O .data	00000003 .L.str
00000477 l     F .text	00000026 test_line16
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
0000010c l     O .data	00000003 .L.str.4
0000010f l     O .data	00000003 .L.str.5
00000112 l     O .data	00000003 .L.str.6
0000049d l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00000573 l       .init_array	00000000 .hidden __init_array_end
00000573 l       .init_array	00000000 .hidden __init_array_start
00000573 l       .fini_array	00000000 .hidden __fini_array_start
00000573 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000109 avm_test_main
000004c1 g     F .text	00000002 avm_halt
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
 e1 a3 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 73 05              ldi16	r4, 0x573
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 73 05              ldi16	r6, 0x573
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 73 05           ldi16	r0, 0x573
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 73 05           ldi16	r2, 0x573
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
 c4 73 05              ldi16	r4, 0x573
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 73 05              ldi16	r6, 0x573
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 73 05           ldi16	r2, 0x573
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 73 05           ldi16	r0, 0x573
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 c0 41                 ldi8	r4, 0x41
 f0 3c 18              stsp16	[sp+0x18], r4
 c0 3e                 ldi8	r4, 0x3e
 f0 3c 16              stsp16	[sp+0x16], r4
 c0 25                 ldi8	r4, 0x25
 f0 3c 14              stsp16	[sp+0x14], r4
 c0 29                 ldi8	r4, 0x29
 f0 3c 12              stsp16	[sp+0x12], r4
 c0 17                 ldi8	r4, 0x17
 f0 3c 10              stsp16	[sp+0x10], r4
 c0 21                 ldi8	r4, 0x21
 f4 78                 stsp16	[sp+0xe], r4
 c0 11                 ldi8	r4, 0x11
 f4 70                 stsp16	[sp+0xc], r4
 c4 c3 04              ldi16	r4, 0x4c3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 18              ldsp16	r6, [sp+0x18]
 e1 d5 00              call16	sum_bytes
 f1 04                 mov	r0, r4
 f0 38 06              stsp16	[sp+0x6], r0
 c4 c4 04              ldi16	r4, 0x4c4
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 16              ldsp16	r6, [sp+0x16]
 e1 c3 00              call16	sum_bytes
 f1 0c                 mov	r1, r4
 f0 39 02              stsp16	[sp+0x2], r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 e1 ce 00              call16	sum_signed_bytes
 f1 14                 mov	r2, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 e1 e4 00              call16	mix_bytes
 f4 68                 stsp16	[sp+0xa], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 e1 0d 01              call16	sum_byte_pairs
 f4 60                 stsp16	[sp+0x8], r4
 c4 23 05              ldi16	r4, 0x523
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 e1 1b 01              call16	sum_words
 f1 1c                 mov	r3, r4
 f0 3b 00              stsp16	[sp+0x0], r3
 c4 25 05              ldi16	r4, 0x525
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f4 32                 ldsp16	r6, [sp+0xc]
 e1 0a 01              call16	sum_words
 f4 50                 stsp16	[sp+0x4], r4
 c4 00 01              ldi16	r4, 0x100
 f1 24                 mov	r5, r0
 e1 16 01              call16	test_line16
 c4 03 01              ldi16	r4, 0x103
 f1 25                 mov	r5, r1
 e1 0e 01              call16	test_line16
 c4 06 01              ldi16	r4, 0x106
 f1 02                 mov	r0, r2
 f1 24                 mov	r5, r0
 e1 04 01              call16	test_line16
 c4 09 01              ldi16	r4, 0x109
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f1 26                 mov	r5, r2
 e1 f9 00              call16	test_line16
 c4 0c 01              ldi16	r4, 0x10c
 f0 31 08              ldsp16	r1, [sp+0x8]
 f1 25                 mov	r5, r1
 e1 ee 00              call16	test_line16
 c4 0f 01              ldi16	r4, 0x10f
 f1 27                 mov	r5, r3
 e1 e6 00              call16	test_line16
 c4 12 01              ldi16	r4, 0x112
 f0 33 04              ldsp16	r3, [sp+0x4]
 f1 27                 mov	r5, r3
 e1 db 00              call16	test_line16
 c4 ab 20              ldi16	r4, 0x20ab
 f4 19                 ldsp16	r5, [sp+0x6]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 c5 1e 1f              ldi16	r5, 0x1f1e
 f4 0a                 ldsp16	r6, [sp+0x2]
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 63 ff              ldi16	r4, 0xff63
 f5 04                 cmp	r0, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 c5 d2 59              ldi16	r5, 0x59d2
 f5 15                 cmp	r2, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 31 4a              ldi16	r4, 0x4a31
 f5 0c                 cmp	r1, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 c5 6d d4              ldi16	r5, 0xd46d
 f4 02                 ldsp16	r6, [sp+0x0]
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 65 58              ldi16	r4, 0x5865
 f5 1c                 cmp	r3, r4
 f8 0e                 cset.ne	r6
 99                    or	r6, r5
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sum_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 0a                 breq8	sum_bytes+19
 f0 65 a0              ldp8u	r5, [q0+]
 11                    add	r4, r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	sum_bytes+9
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_signed_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 f0 04 c6 04           ldi16	r0, 0x4c6
 f0 01 00              ldi8	r1, 0x0
 a5                    xor	r5, r5
 f6 2c                 tst16	r4
 d0 0c                 breq8	sum_signed_bytes+26
 f0 65 c0              ldp8u	r6, [q0+]
 f6 46                 sext8	r6
 16                    add	r5, r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f4                 brne8	sum_signed_bytes+14
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<mix_bytes>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 14                 mov	r2, r4
 c4 2b 6d              ldi16	r4, 0x6d2b
 f0 04 c5 04           ldi16	r0, 0x4c5
 f0 01 00              ldi8	r1, 0x0
 c2 03                 ldi8	r6, 0x3
 f6 2a                 tst16	r2
 d0 18                 breq8	mix_bytes+45
 f0 65 e0              ldp8u	r7, [q0+]
 c5 01 01              ldi16	r5, 0x101
 fe 3d                 mul16	r7, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 fa 31                 lsl16i	r4, 0x1
 91                    or	r4, r5
 a3                    xor	r4, r7
 f4 b2                 dec16	r2
 12                    add	r4, r6
 ca 11                 addi.s8	r6, 0x11
 f6 2a                 tst16	r2
 d1 e8                 brne8	mix_bytes+21
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<sum_byte_pairs>:
 b1                    push16	r1
 b0                    push16	r0
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 04 c4 04           ldi16	r0, 0x4c4
 f0 01 00              ldi8	r1, 0x0
 f6 2d                 tst16	r5
 d0 0a                 breq8	sum_byte_pairs+25
 f0 66 c0              ldp16	r6, [q0+]
 12                    add	r4, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f6                 brne8	sum_byte_pairs+15
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_words>:
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 0a                 breq8	sum_words+19
 f0 66 a0              ldp16	r5, [q0+]
 11                    add	r4, r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	sum_words+9
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<test_line16>:
 d6 fe                 adjsp	-0x2
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_line16+14
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_line16+3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 d5 0d                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 07                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 b0                    push16	r0
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 c2 0f                 ldi8	r6, 0xf
 88                    and	r6, r4
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 30                 cmov.ult	r6, r0
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
