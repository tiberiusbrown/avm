
string_ram_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_ram_compare.c
00000144 l     O .data	00000105 avm_test_main.long_text
00000100 l     O .data	00000005 avm_test_main.eq_a
00000105 l     O .data	00000005 avm_test_main.eq_b
0000010a l     O .data	00000005 avm_test_main.low
0000010f l     O .data	00000005 avm_test_main.high
00000114 l     O .data	00000005 avm_test_main.high2
00000119 l     O .data	00000005 avm_test_main.low2
0000011e l     O .data	00000005 avm_test_main.late_a
00000123 l     O .data	00000005 avm_test_main.late_b
00000128 l     O .data	00000006 avm_test_main.alpha
0000012e l     O .data	00000006 avm_test_main.alphz
00000134 l     O .data	00000004 avm_test_main.cat
00000138 l     O .data	00000008 avm_test_main.catalog
00000140 l     O .data	00000002 avm_test_main.unsigned_hi
00000142 l     O .data	00000002 avm_test_main.unsigned_lo
00000249 l     O .data	00000001 .L.str
0000024a l     O .data	00000005 .L.str.1
0000024f l     O .data	00000003 .L.str.2
000005a6 l     F .text	00000026 test_line16
00000252 l     O .data	00000003 .L.str.3
00000255 l     O .data	00000003 .L.str.4
00000258 l     O .data	00000003 .L.str.5
0000025b l     O .data	00000003 .L.str.6
0000025e l     O .data	00000003 .L.str.7
00000261 l     O .data	00000003 .L.str.8
00000264 l     O .data	00000003 .L.str.9
00000267 l     O .data	00000003 .L.str.10
0000026a l     O .data	00000003 .L.str.11
0000026d l     O .data	00000003 .L.str.12
00000270 l     O .data	00000003 .L.str.13
00000273 l     O .data	00000003 .L.str.14
00000276 l     O .data	00000003 .L.str.15
00000279 l     O .data	00000003 .L.str.16
000005cc l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
000005f2 l       .init_array	00000000 .hidden __init_array_end
000005f2 l       .init_array	00000000 .hidden __init_array_start
000005f2 l       .fini_array	00000000 .hidden __fini_array_start
000005f2 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003e0 g     F .text	000001c6 avm_test_main
000005f0 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000003d7 g     F .text	00000003 test_call_memcmp
000003da g     F .text	00000003 test_call_strcmp
000003dd g     F .text	00000003 test_call_strlen

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 da 00              call16	avm_test_main
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
 e1 d2 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f2 05              ldi16	r4, 0x5f2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f2 05              ldi16	r6, 0x5f2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 f2 05           ldi16	r0, 0x5f2
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f2 05           ldi16	r2, 0x5f2
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
 e1 81 fc              call16	-895
 c4 f2 05              ldi16	r4, 0x5f2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f2 05              ldi16	r6, 0x5f2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 f2 05           ldi16	r2, 0x5f2
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f2 05           ldi16	r0, 0x5f2
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
 e1 30 fc              call16	-976
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_call_memcmp>:
 d7 18                 sys	memcmp
 ef                    ret

<test_call_strcmp>:
 d7 19                 sys	strcmp
 ef                    ret

<test_call_strlen>:
 d7 1a                 sys	strlen
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 c4 44 01              ldi16	r4, 0x144
 c5 04 01              ldi16	r5, 0x104
 c2 78                 ldi8	r6, 0x78
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+26
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+18
 f2 30                 sub	r0, r0
 f0 48 48 02           stm8	[0x248], r0
 c4 00 01              ldi16	r4, 0x100
 c5 05 01              ldi16	r5, 0x105
 f0 01 05              ldi8	r1, 0x5
 f1 29                 mov	r6, r1
 d5 ca                 call8	test_call_memcmp
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 06 0a 01           ldi16	r2, 0x10a
 f0 07 0f 01           ldi16	r3, 0x10f
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 f1 29                 mov	r6, r1
 d5 b7                 call8	test_call_memcmp
 f0 3c 10              stsp16	[sp+0x10], r4
 c4 14 01              ldi16	r4, 0x114
 c5 19 01              ldi16	r5, 0x119
 f1 29                 mov	r6, r1
 d5 aa                 call8	test_call_memcmp
 f0 3c 12              stsp16	[sp+0x12], r4
 c4 1e 01              ldi16	r4, 0x11e
 c5 23 01              ldi16	r5, 0x123
 f1 29                 mov	r6, r1
 d5 9d                 call8	test_call_memcmp
 f4 78                 stsp16	[sp+0xe], r4
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 f1 28                 mov	r6, r0
 d5 93                 call8	test_call_memcmp
 f4 70                 stsp16	[sp+0xc], r4
 f0 04 28 01           ldi16	r0, 0x128
 f1 20                 mov	r4, r0
 f1 24                 mov	r5, r0
 d5 8a                 call8	test_call_strcmp
 f4 68                 stsp16	[sp+0xa], r4
 f0 05 2e 01           ldi16	r1, 0x12e
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 7d ff              call16	test_call_strcmp
 f4 60                 stsp16	[sp+0x8], r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 74 ff              call16	test_call_strcmp
 f4 58                 stsp16	[sp+0x6], r4
 f0 04 34 01           ldi16	r0, 0x134
 f0 05 38 01           ldi16	r1, 0x138
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 63 ff              call16	test_call_strcmp
 f4 50                 stsp16	[sp+0x4], r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 5a ff              call16	test_call_strcmp
 f4 48                 stsp16	[sp+0x2], r4
 f0 04 40 01           ldi16	r0, 0x140
 f0 05 42 01           ldi16	r1, 0x142
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 49 ff              call16	test_call_strcmp
 f4 40                 stsp16	[sp+0x0], r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 e1 40 ff              call16	test_call_strcmp
 f1 14                 mov	r2, r4
 c4 49 02              ldi16	r4, 0x249
 e1 3b ff              call16	test_call_strlen
 f1 1c                 mov	r3, r4
 c4 4a 02              ldi16	r4, 0x24a
 e1 33 ff              call16	test_call_strlen
 f1 0c                 mov	r1, r4
 c4 44 01              ldi16	r4, 0x144
 e1 2b ff              call16	test_call_strlen
 f1 04                 mov	r0, r4
 c4 4f 02              ldi16	r4, 0x24f
 f0 35 14              ldsp16	r5, [sp+0x14]
 e1 e9 00              call16	test_line16
 c4 52 02              ldi16	r4, 0x252
 f0 35 10              ldsp16	r5, [sp+0x10]
 e1 e0 00              call16	test_line16
 c4 55 02              ldi16	r4, 0x255
 f0 35 12              ldsp16	r5, [sp+0x12]
 e1 d7 00              call16	test_line16
 c4 58 02              ldi16	r4, 0x258
 f4 39                 ldsp16	r5, [sp+0xe]
 e1 cf 00              call16	test_line16
 c4 5b 02              ldi16	r4, 0x25b
 f4 31                 ldsp16	r5, [sp+0xc]
 e1 c7 00              call16	test_line16
 c4 5e 02              ldi16	r4, 0x25e
 f4 29                 ldsp16	r5, [sp+0xa]
 e1 bf 00              call16	test_line16
 c4 61 02              ldi16	r4, 0x261
 f4 21                 ldsp16	r5, [sp+0x8]
 e1 b7 00              call16	test_line16
 c4 64 02              ldi16	r4, 0x264
 f4 19                 ldsp16	r5, [sp+0x6]
 e1 af 00              call16	test_line16
 c4 67 02              ldi16	r4, 0x267
 f4 11                 ldsp16	r5, [sp+0x4]
 e1 a7 00              call16	test_line16
 c4 6a 02              ldi16	r4, 0x26a
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 9f 00              call16	test_line16
 c4 6d 02              ldi16	r4, 0x26d
 f4 01                 ldsp16	r5, [sp+0x0]
 e1 97 00              call16	test_line16
 c4 70 02              ldi16	r4, 0x270
 f1 26                 mov	r5, r2
 e1 8f 00              call16	test_line16
 c4 73 02              ldi16	r4, 0x273
 f1 27                 mov	r5, r3
 e1 87 00              call16	test_line16
 c4 76 02              ldi16	r4, 0x276
 f1 25                 mov	r5, r1
 e1 7f 00              call16	test_line16
 c4 79 02              ldi16	r4, 0x279
 f1 24                 mov	r5, r0
 d5 78                 call8	test_line16
 c4 02 ff              ldi16	r4, 0xff02
 f0 35 10              ldsp16	r5, [sp+0x10]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 f0 35 14              ldsp16	r5, [sp+0x14]
 f6 2d                 tst16	r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c0 fc                 ldi8	r4, 0xfc
 f0 36 12              ldsp16	r6, [sp+0x12]
 38                    cmp	r6, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 cd 05                 cmpi.s8	r5, 0x5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 2d                 tst16	r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 cc e7                 cmpi.s8	r4, -0x19
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 cd 19                 cmpi.s8	r5, 0x19
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 cc 9f                 cmpi.s8	r4, -0x61
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 cd 61                 cmpi.s8	r5, 0x61
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c0 e0                 ldi8	r4, 0xe0
 f4 02                 ldsp16	r6, [sp+0x0]
 38                    cmp	r6, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 c5 20 ff              ldi16	r5, 0xff20
 f5 15                 cmp	r2, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f6 2b                 tst16	r3
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 0d 04              cmpi.s8	r1, 0x4
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 04 01              ldi16	r4, 0x104
 f5 04                 cmp	r0, r4
 f8 0e                 cset.ne	r6
 99                    or	r6, r5
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
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
