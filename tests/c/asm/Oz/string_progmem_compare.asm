
string_progmem_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_progmem_compare.c
000004fd l     O .rodata	00000005 p_equal
00000100 l     O .data	00000005 avm_test_main.equal
00000502 l     O .rodata	00000005 p_high
00000105 l     O .data	00000005 avm_test_main.low
00000507 l     O .rodata	00000005 p_low
0000010a l     O .data	00000005 avm_test_main.high
0000050c l     O .rodata	00000005 p_late
0000010f l     O .data	00000005 avm_test_main.late
00000511 l     O .rodata	00000006 p_alpha
00000114 l     O .data	00000006 avm_test_main.alpha
00000517 l     O .rodata	00000006 p_alphz
0000011a l     O .data	00000006 avm_test_main.alphz
0000051d l     O .rodata	00000008 p_catalog
00000120 l     O .data	00000004 avm_test_main.cat
00000525 l     O .rodata	00000004 p_cat
00000124 l     O .data	00000008 avm_test_main.catalog
00000529 l     O .rodata	00000002 p_unsigned_lo
0000012c l     O .data	00000002 avm_test_main.unsigned_hi
0000052b l     O .rodata	00000001 p_empty
0000052c l     O .rodata	00000008 p_short
00000534 l     O .rodata	00000105 p_long
0000012e l     O .data	00000003 .L.str
000004b1 l     F .text	00000026 test_line16
00000131 l     O .data	00000003 .L.str.1
00000134 l     O .data	00000003 .L.str.2
00000137 l     O .data	00000003 .L.str.3
0000013a l     O .data	00000003 .L.str.4
0000013d l     O .data	00000003 .L.str.5
00000140 l     O .data	00000003 .L.str.6
00000143 l     O .data	00000003 .L.str.7
00000146 l     O .data	00000003 .L.str.8
00000149 l     O .data	00000003 .L.str.9
0000014c l     O .data	00000003 .L.str.10
0000014f l     O .data	00000003 .L.str.11
00000152 l     O .data	00000003 .L.str.12
00000155 l     O .data	00000003 .L.str.13
000004d7 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00000639 l       .init_array	00000000 .hidden __init_array_end
00000639 l       .init_array	00000000 .hidden __init_array_start
00000639 l       .fini_array	00000000 .hidden __fini_array_start
00000639 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002e4 g     F .text	000001cd avm_test_main
000004fb g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d7 g     F .text	00000005 test_call_memcmp_P
000002dc g     F .text	00000003 test_call_strcmp_P
000002df g     F .text	00000005 test_call_strlen_P

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 de 00              call16	avm_test_main
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
 e1 dd 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 39 06              ldi16	r4, 0x639
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 39 06              ldi16	r6, 0x639
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 39 06           ldi16	r0, 0x639
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 39 06           ldi16	r2, 0x639
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
 c4 39 06              ldi16	r4, 0x639
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 39 06              ldi16	r6, 0x639
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 39 06           ldi16	r2, 0x639
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 39 06           ldi16	r0, 0x639
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

<test_call_memcmp_P>:
 f4 0d                 ldsp16	r5, [sp+0x3]
 d7 13                 sys	memcmp_p
 ef                    ret

<test_call_strcmp_P>:
 d7 14                 sys	strcmp_p
 ef                    ret

<test_call_strlen_P>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d7 15                 sys	strlen_p
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 d6 fe                 adjsp	-0x2
 f0 03 05              ldi8	r3, 0x5
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 fd 04              ldi16	r6, 0x4fd
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 01              ldi16	r4, 0x100
 d5 d9                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 12              stsp16	[sp+0x12], r4
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 f0 04 02 05           ldi16	r0, 0x502
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f0 06 05 01           ldi16	r2, 0x105
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 d5 bc                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 10              stsp16	[sp+0x10], r4
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 07 05              ldi16	r6, 0x507
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0a 01              ldi16	r4, 0x10a
 d5 a6                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f4 78                 stsp16	[sp+0xe], r4
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 0c 05              ldi16	r6, 0x50c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0f 01              ldi16	r4, 0x10f
 d5 91                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f4 70                 stsp16	[sp+0xc], r4
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 d5 82                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f4 68                 stsp16	[sp+0xa], r4
 f0 04 11 05           ldi16	r0, 0x511
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f0 06 14 01           ldi16	r2, 0x114
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 e1 6f ff              call16	test_call_strcmp_P
 f4 60                 stsp16	[sp+0x8], r4
 c6 17 05              ldi16	r6, 0x517
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 e1 61 ff              call16	test_call_strcmp_P
 f4 58                 stsp16	[sp+0x6], r4
 c4 1a 01              ldi16	r4, 0x11a
 f2 6a                 mov32	q3, q0
 e1 57 ff              call16	test_call_strcmp_P
 f4 50                 stsp16	[sp+0x4], r4
 c6 1d 05              ldi16	r6, 0x51d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 20 01              ldi16	r4, 0x120
 e1 48 ff              call16	test_call_strcmp_P
 f4 48                 stsp16	[sp+0x2], r4
 c6 25 05              ldi16	r6, 0x525
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 24 01              ldi16	r4, 0x124
 e1 39 ff              call16	test_call_strcmp_P
 f4 40                 stsp16	[sp+0x0], r4
 c6 29 05              ldi16	r6, 0x529
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 2c 01              ldi16	r4, 0x12c
 e1 2a ff              call16	test_call_strcmp_P
 f1 04                 mov	r0, r4
 c4 2b 05              ldi16	r4, 0x52b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 21 ff              call16	test_call_strlen_P
 f1 0c                 mov	r1, r4
 c4 2c 05              ldi16	r4, 0x52c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 15 ff              call16	test_call_strlen_P
 f1 14                 mov	r2, r4
 c4 34 05              ldi16	r4, 0x534
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 09 ff              call16	test_call_strlen_P
 f1 1c                 mov	r3, r4
 c4 2e 01              ldi16	r4, 0x12e
 f0 35 12              ldsp16	r5, [sp+0x12]
 e1 d0 00              call16	test_line16
 c4 31 01              ldi16	r4, 0x131
 f0 35 10              ldsp16	r5, [sp+0x10]
 e1 c7 00              call16	test_line16
 c4 34 01              ldi16	r4, 0x134
 f4 39                 ldsp16	r5, [sp+0xe]
 e1 bf 00              call16	test_line16
 c4 37 01              ldi16	r4, 0x137
 f4 31                 ldsp16	r5, [sp+0xc]
 e1 b7 00              call16	test_line16
 c4 3a 01              ldi16	r4, 0x13a
 f4 29                 ldsp16	r5, [sp+0xa]
 e1 af 00              call16	test_line16
 c4 3d 01              ldi16	r4, 0x13d
 f4 21                 ldsp16	r5, [sp+0x8]
 e1 a7 00              call16	test_line16
 c4 40 01              ldi16	r4, 0x140
 f4 19                 ldsp16	r5, [sp+0x6]
 e1 9f 00              call16	test_line16
 c4 43 01              ldi16	r4, 0x143
 f4 11                 ldsp16	r5, [sp+0x4]
 e1 97 00              call16	test_line16
 c4 46 01              ldi16	r4, 0x146
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 8f 00              call16	test_line16
 c4 49 01              ldi16	r4, 0x149
 f4 01                 ldsp16	r5, [sp+0x0]
 e1 87 00              call16	test_line16
 c4 4c 01              ldi16	r4, 0x14c
 f1 24                 mov	r5, r0
 e1 7f 00              call16	test_line16
 c4 4f 01              ldi16	r4, 0x14f
 f1 25                 mov	r5, r1
 d5 78                 call8	test_line16
 c4 52 01              ldi16	r4, 0x152
 f1 26                 mov	r5, r2
 d5 71                 call8	test_line16
 c4 55 01              ldi16	r4, 0x155
 f1 27                 mov	r5, r3
 d5 6a                 call8	test_line16
 f0 34 12              ldsp16	r4, [sp+0x12]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f0 35 10              ldsp16	r5, [sp+0x10]
 cd ff                 cmpi.s8	r5, -0x1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 01                 cmpi.s8	r4, 0x1
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 cd ff                 cmpi.s8	r5, -0x1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f6 2d                 tst16	r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 cc ff                 cmpi.s8	r4, -0x1
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 cd 01                 cmpi.s8	r5, 0x1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 cc ff                 cmpi.s8	r4, -0x1
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 cd 01                 cmpi.s8	r5, 0x1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 0c 01              cmpi.s8	r0, 0x1
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f6 29                 tst16	r1
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 0e 07              cmpi.s8	r2, 0x7
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 c5 04 01              ldi16	r5, 0x104
 f5 1d                 cmp	r3, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 d6 14                 adjsp	0x14
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
