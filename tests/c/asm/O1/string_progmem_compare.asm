
string_progmem_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_progmem_compare.c
0000097b l     O .rodata	00000005 p_equal
00000100 l     O .data	00000005 avm_test_main.equal
00000980 l     O .rodata	00000005 p_high
00000105 l     O .data	00000005 avm_test_main.low
00000985 l     O .rodata	00000005 p_low
0000010a l     O .data	00000005 avm_test_main.high
0000098a l     O .rodata	00000005 p_late
0000010f l     O .data	00000005 avm_test_main.late
0000098f l     O .rodata	00000006 p_alpha
00000114 l     O .data	00000006 avm_test_main.alpha
00000995 l     O .rodata	00000006 p_alphz
0000011a l     O .data	00000006 avm_test_main.alphz
0000099b l     O .rodata	00000008 p_catalog
00000120 l     O .data	00000004 avm_test_main.cat
000009a3 l     O .rodata	00000004 p_cat
00000124 l     O .data	00000008 avm_test_main.catalog
000009a7 l     O .rodata	00000002 p_unsigned_lo
0000012c l     O .data	00000002 avm_test_main.unsigned_hi
000009a9 l     O .rodata	00000001 p_empty
000009aa l     O .rodata	00000008 p_short
000009b2 l     O .rodata	00000105 p_long
0000012e l     O .data	00000003 .L.str
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
00000000 l    df *ABS*	00000000 runtime.c
00000ab7 l       .init_array	00000000 .hidden __init_array_end
00000ab7 l       .init_array	00000000 .hidden __init_array_start
00000ab7 l       .fini_array	00000000 .hidden __fini_array_start
00000ab7 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002e4 g     F .text	00000695 avm_test_main
00000979 g     F .text	00000002 avm_halt
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
 e1 5b 07              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b7 0a              ldi16	r4, 0xab7
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 b7 0a              ldi16	r6, 0xab7
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b7 0a           ldi16	r2, 0xab7
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
 c4 b7 0a              ldi16	r4, 0xab7
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 b7 0a              ldi16	r6, 0xab7
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 b7 0a           ldi16	r2, 0xab7
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b7 0a           ldi16	r0, 0xab7
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
 d6 e2                 adjsp	-0x1e
 d6 fe                 adjsp	-0x2
 f0 03 05              ldi8	r3, 0x5
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 7b 09              ldi16	r6, 0x97b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 01              ldi16	r4, 0x100
 d5 d9                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 1a              stsp16	[sp+0x1a], r4
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 f0 04 80 09           ldi16	r0, 0x980
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f0 06 05 01           ldi16	r2, 0x105
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 d5 bc                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 18              stsp16	[sp+0x18], r4
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 85 09              ldi16	r6, 0x985
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0a 01              ldi16	r4, 0x10a
 d5 a6                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 16              stsp16	[sp+0x16], r4
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 8a 09              ldi16	r6, 0x98a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0f 01              ldi16	r4, 0x10f
 d5 90                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 14              stsp16	[sp+0x14], r4
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 d5 80                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 04 8f 09           ldi16	r0, 0x98f
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f0 06 14 01           ldi16	r2, 0x114
 f1 22                 mov	r4, r2
 f2 6a                 mov32	q3, q0
 e1 6c ff              call16	test_call_strcmp_P
 f0 3c 10              stsp16	[sp+0x10], r4
 c6 95 09              ldi16	r6, 0x995
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 e1 5d ff              call16	test_call_strcmp_P
 f4 70                 stsp16	[sp+0xc], r4
 c4 1a 01              ldi16	r4, 0x11a
 f2 6a                 mov32	q3, q0
 e1 53 ff              call16	test_call_strcmp_P
 f4 78                 stsp16	[sp+0xe], r4
 c6 9b 09              ldi16	r6, 0x99b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 20 01              ldi16	r4, 0x120
 e1 44 ff              call16	test_call_strcmp_P
 f4 68                 stsp16	[sp+0xa], r4
 c6 a3 09              ldi16	r6, 0x9a3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 24 01              ldi16	r4, 0x124
 e1 35 ff              call16	test_call_strcmp_P
 f4 60                 stsp16	[sp+0x8], r4
 c6 a7 09              ldi16	r6, 0x9a7
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 2c 01              ldi16	r4, 0x12c
 e1 26 ff              call16	test_call_strcmp_P
 f4 58                 stsp16	[sp+0x6], r4
 c4 a9 09              ldi16	r4, 0x9a9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 1d ff              call16	test_call_strlen_P
 f4 50                 stsp16	[sp+0x4], r4
 c4 aa 09              ldi16	r4, 0x9aa
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 11 ff              call16	test_call_strlen_P
 f4 48                 stsp16	[sp+0x2], r4
 c4 b2 09              ldi16	r4, 0x9b2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 05 ff              call16	test_call_strlen_P
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c0 4d                 ldi8	r4, 0x4d
 c7 2f 01              ldi16	r7, 0x12f
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+254
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 03                    mov	r4, r7
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 f0 03 30              ldi8	r3, 0x30
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 02 0f              ldi8	r2, 0xf
 07                    mov	r5, r7
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 c7 32 01              ldi16	r7, 0x132
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+361
 f0 36 18              ldsp16	r6, [sp+0x18]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 c7 35 01              ldi16	r7, 0x135
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+454
 f0 36 16              ldsp16	r6, [sp+0x16]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 c7 38 01              ldi16	r7, 0x138
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+547
 f0 36 14              ldsp16	r6, [sp+0x14]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 c7 3b 01              ldi16	r7, 0x13b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+640
 f0 36 12              ldsp16	r6, [sp+0x12]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 c7 3e 01              ldi16	r7, 0x13e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+733
 f0 36 10              ldsp16	r6, [sp+0x10]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 c7 41 01              ldi16	r7, 0x141
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+826
 f4 32                 ldsp16	r6, [sp+0xc]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 c7 44 01              ldi16	r7, 0x144
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+918
 f4 3a                 ldsp16	r6, [sp+0xe]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 c7 47 01              ldi16	r7, 0x147
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1010
 f4 2a                 ldsp16	r6, [sp+0xa]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 c7 4a 01              ldi16	r7, 0x14a
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1102
 f4 22                 ldsp16	r6, [sp+0x8]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 c7 4d 01              ldi16	r7, 0x14d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1194
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 c7 50 01              ldi16	r7, 0x150
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1286
 f4 12                 ldsp16	r6, [sp+0x4]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 c7 53 01              ldi16	r7, 0x153
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1378
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 28                 cmp	r6, r0
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 c7 56 01              ldi16	r7, 0x156
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1470
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 f4 40                 stsp16	[sp+0x0], r4
 cb 37                 addi.s8	r7, 0x37
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f5 20                 cmp	r4, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 3c                 cmov.ult	r7, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f9 50                 and	r2, r4
 f9 69                 or	r3, r2
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 0a 37              addi.s8	r2, 0x37
 fc 13                 cmov.ult	r2, r3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 cc ff                 cmpi.s8	r4, -0x1
 f8 0c                 cset.ne	r4
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 2e                 tst16	r6
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 cc 01                 cmpi.s8	r4, 0x1
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 ce ff                 cmpi.s8	r6, -0x1
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 35 10              ldsp16	r5, [sp+0x10]
 f6 2d                 tst16	r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 cc ff                 cmpi.s8	r4, -0x1
 f8 0e                 cset.ne	r6
 99                    or	r6, r5
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c4 04 01              ldi16	r4, 0x104
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 01                 cmpi.s8	r4, 0x1
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 ce ff                 cmpi.s8	r6, -0x1
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 01                 cmpi.s8	r4, 0x1
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 ce 01                 cmpi.s8	r6, 0x1
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 ce 07                 cmpi.s8	r6, 0x7
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 99                    or	r6, r5
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
