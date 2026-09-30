
vsnprintf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 vsnprintf.c
00000c5f l     O .rodata	00000008 .L.avm.flashstr.0
00000c67 l     O .rodata	00000006 .L.avm.flashstr.1
00000100 l     O .data	00000004 avm_test_main.ram_text
00000104 l     O .data	0000000e .L.str
0000092e l     F .text	00000022 call_vsnprintf
00000112 l     O .data	00000003 .L.str.1
00000950 l     F .text	0000002b report_text
00000115 l     O .data	00000010 .L.str.2
0000097b l     F .text	00000040 text_equal
00000c89 l     O .rodata	00000015 program_long
00000c6d l     O .rodata	0000001c program_format
000009bb l     F .text	0000002f call_vsnprintf_P
00000125 l     O .data	00000003 .L.str.3
00000128 l     O .data	00000036 .L.str.4
0000015e l     O .data	0000002f .L.str.5
0000018d l     O .data	00000003 .L.str.6
00000190 l     O .data	00000038 .L.str.7
000001d8 l     O .data	00000007 .L.str.9
000001c8 l     O .data	00000010 .L.str.8
000001df l     O .data	00000003 .L.str.10
000001e2 l     O .data	00000015 .L.str.11
000001f7 l     O .data	0000000a .L.str.12
00000201 l     O .data	00000003 .L.str.13
00000204 l     O .data	00000008 .L.str.14
0000020c l     O .data	00000006 .L.str.15
00000212 l     O .data	00000003 .L.str.16
00000215 l     O .data	00000008 .L.str.17
0000021d l     O .data	00000003 .L.str.18
000009ea l     F .text	0000001d test_line16
00000220 l     O .data	00000010 .L.str.19
00000230 l     O .data	00000003 .L.str.20
00000233 l     O .data	00000008 .L.str.21
0000023b l     O .data	00000008 .L.str.22
00000243 l     O .data	00000003 .L.str.23
00000246 l     O .data	00000003 .L.str.24
00000a07 l     F .text	000000b3 pointer_text_matches
00000249 l     O .data	00000003 .L.str.25
0000024c l     O .data	00000003 .L.str.26
0000024f l     O .data	00000006 .L.str.27
00000aba l     F .text	000000f6 program_pointer_prefix_matches
00000255 l     O .data	00000006 .L.str.28
0000025b l     O .data	00000003 .L.str.29
0000025e l     O .data	00000003 .L.str.30
00000c9e l     O .rodata	00000006 .L.avm.flashstr.2
00000261 l     O .data	00000003 .L.str.31
00000264 l     O .data	00000003 .L.str.32
00000267 l     O .data	00000003 .L.str.33
00000bb0 l     F .text	00000022 test_puts
00000bd2 l     F .text	0000000b test_putc
00000bdd l     F .text	0000000f test_hex16
0000026a l     O .data	00000003 .L.str.34
0000026d l     O .data	00000003 .L.str.35
00000c31 l     F .text	0000002c lower_hex_digit
00000bec l     F .text	00000019 test_hex8
00000c05 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000ca4 l       .init_array	00000000 .hidden __init_array_end
00000ca4 l       .init_array	00000000 .hidden __init_array_start
00000ca4 l       .fini_array	00000000 .hidden __fini_array_start
00000ca4 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003d7 g     F .text	00000557 avm_test_main
00000c5d g     F .text	00000002 avm_halt
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
 e1 3f 09              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a4 0c              ldi16	r4, 0xca4
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 a4 0c              ldi16	r6, 0xca4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 a4 0c           ldi16	r0, 0xca4
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a4 0c           ldi16	r2, 0xca4
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
 c4 a4 0c              ldi16	r4, 0xca4
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 a4 0c              ldi16	r6, 0xca4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 a4 0c           ldi16	r2, 0xca4
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a4 0c           ldi16	r0, 0xca4
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

<avm_test_main>:
 d6 80                 adjsp	-0x80
 d6 f9                 adjsp	-0x7
 c4 5f 0c              ldi16	r4, 0xc5f
 c1 00                 ldi8	r5, 0x0
 f0 3c 84              stsp16	[sp+0x84], r4
 f0 2d 86              stsp8	[sp+0x86], r5
 a0                    xor	r4, r4
 f0 3c 26              stsp16	[sp+0x26], r4
 d6 f3                 adjsp	-0xd
 c4 67 0c              ldi16	r4, 0xc67
 c1 00                 ldi8	r5, 0x0
 f4 68                 stsp16	[sp+0xa], r4
 f1 61                 stsp8	[sp+0xc], r5
 c4 00 01              ldi16	r4, 0x100
 f4 60                 stsp16	[sp+0x8], r4
 c0 5a                 ldi8	r4, 0x5a
 f4 58                 stsp16	[sp+0x6], r4
 c4 04 01              ldi16	r4, 0x104
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 41              leasp	r4, 0x41
 f0 3c 27              stsp16	[sp+0x27], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 1c 05              call16	call_vsnprintf
 f0 36 27              ldsp16	r6, [sp+0x27]
 d6 0d                 adjsp	0xd
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 12 01              ldi16	r4, 0x112
 e1 2d 05              call16	report_text
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 0f                 cmpi.s8	r4, 0xf
 d1 11                 brne8	avm_test_main+100
 d4 00                 jmp8	avm_test_main+85
 c5 15 01              ldi16	r5, 0x115
 f0 14 34              leasp	r4, 0x34
 e1 46 05              call16	text_equal
 f6 2c                 tst16	r4
 d1 0d                 brne8	avm_test_main+111
 d4 00                 jmp8	avm_test_main+100
 f0 34 26              ldsp16	r4, [sp+0x26]
 c1 01                 ldi8	r5, 0x1
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+111
 d6 ee                 adjsp	-0x12
 c4 15 cd              ldi16	r4, 0xcd15
 c5 5b 07              ldi16	r5, 0x75b
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 89 0c              ldi16	r4, 0xc89
 c1 00                 ldi8	r5, 0x0
 f4 6c                 stsp16	[sp+0xb], r4
 f1 65                 stsp8	[sp+0xd], r5
 c4 00 01              ldi16	r4, 0x100
 f4 64                 stsp16	[sp+0x9], r4
 c4 d6 ff              ldi16	r4, 0xffd6
 f4 5c                 stsp16	[sp+0x7], r4
 c4 6d 0c              ldi16	r4, 0xc6d
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 46              leasp	r4, 0x46
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 3d 05              call16	call_vsnprintf_P
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 d6 12                 adjsp	0x12
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 25 01              ldi16	r4, 0x125
 e1 c1 04              call16	report_text
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 35                 cmpi.s8	r4, 0x35
 d1 11                 brne8	avm_test_main+208
 d4 00                 jmp8	avm_test_main+193
 c5 28 01              ldi16	r5, 0x128
 f0 14 34              leasp	r4, 0x34
 e1 da 04              call16	text_equal
 f6 2c                 tst16	r4
 d1 0d                 brne8	avm_test_main+219
 d4 00                 jmp8	avm_test_main+208
 f0 34 26              ldsp16	r4, [sp+0x26]
 c1 02                 ldi8	r5, 0x2
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+219
 d6 e4                 adjsp	-0x1c
 c4 bf fe              ldi16	r4, 0xfebf
 f0 3c 1a              stsp16	[sp+0x1a], r4
 c4 fa ff              ldi16	r4, 0xfffa
 f0 3c 18              stsp16	[sp+0x18], r4
 c4 eb 32              ldi16	r4, 0x32eb
 c5 a4 f8              ldi16	r5, 0xf8a4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 2e fb              ldi16	r4, 0xfb2e
 f0 3c 12              stsp16	[sp+0x12], r4
 c0 fe                 ldi8	r4, 0xfe
 f0 3c 10              stsp16	[sp+0x10], r4
 a0                    xor	r4, r4
 f4 78                 stsp16	[sp+0xe], r4
 c0 09                 ldi8	r4, 0x9
 f4 70                 stsp16	[sp+0xc], r4
 c0 2a                 ldi8	r4, 0x2a
 f4 68                 stsp16	[sp+0xa], r4
 c0 07                 ldi8	r4, 0x7
 f4 60                 stsp16	[sp+0x8], r4
 c0 0c                 ldi8	r4, 0xc
 f4 58                 stsp16	[sp+0x6], r4
 c4 5e 01              ldi16	r4, 0x15e
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 50              leasp	r4, 0x50
 f0 3c 32              stsp16	[sp+0x32], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 30 04              call16	call_vsnprintf
 f0 36 32              ldsp16	r6, [sp+0x32]
 d6 1c                 adjsp	0x1c
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 8d 01              ldi16	r4, 0x18d
 e1 41 04              call16	report_text
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 37                 cmpi.s8	r4, 0x37
 d1 11                 brne8	avm_test_main+336
 d4 00                 jmp8	avm_test_main+321
 c5 90 01              ldi16	r5, 0x190
 f0 14 34              leasp	r4, 0x34
 e1 5a 04              call16	text_equal
 f6 2c                 tst16	r4
 d1 0d                 brne8	avm_test_main+347
 d4 00                 jmp8	avm_test_main+336
 f0 34 26              ldsp16	r4, [sp+0x26]
 c1 04                 ldi8	r5, 0x4
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+347
 d6 eb                 adjsp	-0x15
 c4 89 0c              ldi16	r4, 0xc89
 c1 00                 ldi8	r5, 0x0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 2d 14              stsp8	[sp+0x14], r5
 c0 04                 ldi8	r4, 0x4
 f0 3c 10              stsp16	[sp+0x10], r4
 c4 d6 ff              ldi16	r4, 0xffd6
 f4 78                 stsp16	[sp+0xe], r4
 c0 06                 ldi8	r4, 0x6
 f4 70                 stsp16	[sp+0xc], r4
 c4 d8 01              ldi16	r4, 0x1d8
 f4 68                 stsp16	[sp+0xa], r4
 c0 03                 ldi8	r4, 0x3
 f4 60                 stsp16	[sp+0x8], r4
 c4 f8 ff              ldi16	r4, 0xfff8
 f4 58                 stsp16	[sp+0x6], r4
 c4 c8 01              ldi16	r4, 0x1c8
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 49              leasp	r4, 0x49
 f0 3c 29              stsp16	[sp+0x29], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 bf 03              call16	call_vsnprintf
 f0 36 29              ldsp16	r6, [sp+0x29]
 d6 15                 adjsp	0x15
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 df 01              ldi16	r4, 0x1df
 e1 d0 03              call16	report_text
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 14                 cmpi.s8	r4, 0x14
 d1 11                 brne8	avm_test_main+449
 d4 00                 jmp8	avm_test_main+434
 c5 e2 01              ldi16	r5, 0x1e2
 f0 14 34              leasp	r4, 0x34
 e1 e9 03              call16	text_equal
 f6 2c                 tst16	r4
 d1 0d                 brne8	avm_test_main+460
 d4 00                 jmp8	avm_test_main+449
 f0 34 26              ldsp16	r4, [sp+0x26]
 c1 08                 ldi8	r5, 0x8
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+460
 a0                    xor	r4, r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 d4 00                 jmp8	avm_test_main+466
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 cc 0a                 cmpi.s8	r4, 0xa
 d8 18                 bruge8	avm_test_main+497
 d4 00                 jmp8	avm_test_main+475
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 14 2a              leasp	r4, 0x2a
 11                    add	r4, r5
 c1 a5                 ldi8	r5, 0xa5
 51                    st8	[r4], r5
 d4 00                 jmp8	avm_test_main+487
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f4 ac                 inc16	r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 d4 e1                 jmp8	avm_test_main+466
 c0 5a                 ldi8	r4, 0x5a
 f0 2c 2a              stsp8	[sp+0x2a], r4
 c0 69                 ldi8	r4, 0x69
 f0 2c 33              stsp8	[sp+0x33], r4
 f0 14 2b              leasp	r4, 0x2b
 f0 3c 12              stsp16	[sp+0x12], r4
 d6 f8                 adjsp	-0x8
 c5 39 30              ldi16	r5, 0x3039
 f4 59                 stsp16	[sp+0x6], r5
 c5 f7 01              ldi16	r5, 0x1f7
 f4 51                 stsp16	[sp+0x4], r5
 c1 08                 ldi8	r5, 0x8
 f4 49                 stsp16	[sp+0x2], r5
 f4 40                 stsp16	[sp+0x0], r4
 e1 41 03              call16	call_vsnprintf
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 d6 08                 adjsp	0x8
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 01 02              ldi16	r4, 0x201
 e1 52 03              call16	report_text
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 0c                 cmpi.s8	r4, 0xc
 d1 2c                 brne8	avm_test_main+602
 d4 00                 jmp8	avm_test_main+560
 f0 14 2b              leasp	r4, 0x2b
 c5 04 02              ldi16	r5, 0x204
 e1 6b 03              call16	text_equal
 f6 2c                 tst16	r4
 d0 1d                 breq8	avm_test_main+602
 d4 00                 jmp8	avm_test_main+575
 f0 1c 2a              ldsp8u	r4, [sp+0x2a]
 cc 5a                 cmpi.s8	r4, 0x5a
 d1 14                 brne8	avm_test_main+602
 d4 00                 jmp8	avm_test_main+584
 f0 1c 32              ldsp8u	r4, [sp+0x32]
 f4 a4                 tst8	r4
 d1 0b                 brne8	avm_test_main+602
 d4 00                 jmp8	avm_test_main+593
 f0 1c 33              ldsp8u	r4, [sp+0x33]
 cc 69                 cmpi.s8	r4, 0x69
 d0 0d                 breq8	avm_test_main+613
 d4 00                 jmp8	avm_test_main+602
 f0 34 26              ldsp16	r4, [sp+0x26]
 c1 10                 ldi8	r5, 0x10
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+613
 c0 78                 ldi8	r4, 0x78
 f0 2c 28              stsp8	[sp+0x28], r4
 c0 79                 ldi8	r4, 0x79
 f0 2c 29              stsp8	[sp+0x29], r4
 d6 fa                 adjsp	-0x6
 c4 0c 02              ldi16	r4, 0x20c
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 2e              leasp	r4, 0x2e
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 d2 02              call16	call_vsnprintf
 f0 36 16              ldsp16	r6, [sp+0x16]
 d6 06                 adjsp	0x6
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 12 02              ldi16	r4, 0x212
 e1 e3 02              call16	report_text
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 05                 cmpi.s8	r4, 0x5
 d1 14                 brne8	avm_test_main+689
 d4 00                 jmp8	avm_test_main+671
 f0 24 28              ldsp8s	r4, [sp+0x28]
 f4 a4                 tst8	r4
 d1 0b                 brne8	avm_test_main+689
 d4 00                 jmp8	avm_test_main+680
 f0 24 29              ldsp8s	r4, [sp+0x29]
 cc 79                 cmpi.s8	r4, 0x79
 d0 0d                 breq8	avm_test_main+700
 d4 00                 jmp8	avm_test_main+689
 f0 34 26              ldsp16	r4, [sp+0x26]
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+700
 d6 f8                 adjsp	-0x8
 c4 d2 04              ldi16	r4, 0x4d2
 f4 58                 stsp16	[sp+0x6], r4
 c4 15 02              ldi16	r4, 0x215
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 87 02              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 1d 02              ldi16	r4, 0x21d
 e1 35 03              call16	test_line16
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 09                 cmpi.s8	r4, 0x9
 d0 0d                 breq8	avm_test_main+754
 d4 00                 jmp8	avm_test_main+743
 f0 34 26              ldsp16	r4, [sp+0x26]
 c1 40                 ldi8	r5, 0x40
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+754
 d6 f8                 adjsp	-0x8
 c0 7b                 ldi8	r4, 0x7b
 f4 58                 stsp16	[sp+0x6], r4
 c4 20 02              ldi16	r4, 0x220
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 3c              leasp	r4, 0x3c
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 4b 02              call16	call_vsnprintf
 f0 36 16              ldsp16	r6, [sp+0x16]
 d6 08                 adjsp	0x8
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 30 02              ldi16	r4, 0x230
 e1 5c 02              call16	report_text
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc ff                 cmpi.s8	r4, -0x1
 d1 11                 brne8	avm_test_main+821
 d4 00                 jmp8	avm_test_main+806
 c5 33 02              ldi16	r5, 0x233
 f0 14 34              leasp	r4, 0x34
 e1 75 02              call16	text_equal
 f6 2c                 tst16	r4
 d1 0d                 brne8	avm_test_main+832
 d4 00                 jmp8	avm_test_main+821
 f0 34 26              ldsp16	r4, [sp+0x26]
 c1 80                 ldi8	r5, 0x80
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+832
 c0 78                 ldi8	r4, 0x78
 f0 2c 28              stsp8	[sp+0x28], r4
 c0 79                 ldi8	r4, 0x79
 f0 2c 29              stsp8	[sp+0x29], r4
 d6 f8                 adjsp	-0x8
 c0 01                 ldi8	r4, 0x1
 f4 58                 stsp16	[sp+0x6], r4
 c5 3b 02              ldi16	r5, 0x23b
 f4 51                 stsp16	[sp+0x4], r5
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 30              leasp	r4, 0x30
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 f5 01              call16	call_vsnprintf
 f0 36 14              ldsp16	r6, [sp+0x14]
 d6 08                 adjsp	0x8
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 43 02              ldi16	r4, 0x243
 e1 06 02              call16	report_text
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc ff                 cmpi.s8	r4, -0x1
 d1 14                 brne8	avm_test_main+910
 d4 00                 jmp8	avm_test_main+892
 f0 24 28              ldsp8s	r4, [sp+0x28]
 f4 a4                 tst8	r4
 d1 0b                 brne8	avm_test_main+910
 d4 00                 jmp8	avm_test_main+901
 f0 24 29              ldsp8s	r4, [sp+0x29]
 cc 79                 cmpi.s8	r4, 0x79
 d0 0e                 breq8	avm_test_main+922
 d4 00                 jmp8	avm_test_main+910
 f0 34 26              ldsp16	r4, [sp+0x26]
 c5 00 01              ldi16	r5, 0x100
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+922
 d6 f8                 adjsp	-0x8
 c4 00 01              ldi16	r4, 0x100
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 58                 stsp16	[sp+0x6], r4
 c4 46 02              ldi16	r4, 0x246
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 3c              leasp	r4, 0x3c
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 9f 01              call16	call_vsnprintf
 f0 35 10              ldsp16	r5, [sp+0x10]
 d6 08                 adjsp	0x8
 08                    mov	r6, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3e 24              stsp16	[sp+0x24], r6
 e1 6a 02              call16	pointer_text_matches
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 49 02              ldi16	r4, 0x249
 e1 41 02              call16	test_line16
 f0 35 22              ldsp16	r5, [sp+0x22]
 c4 4c 02              ldi16	r4, 0x24c
 e1 38 02              call16	test_line16
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 06                 cmpi.s8	r4, 0x6
 d0 0e                 breq8	avm_test_main+1008
 d4 00                 jmp8	avm_test_main+996
 f0 34 26              ldsp16	r4, [sp+0x26]
 c5 00 02              ldi16	r5, 0x200
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+1008
 f0 34 22              ldsp16	r4, [sp+0x22]
 f6 2c                 tst16	r4
 d1 0e                 brne8	avm_test_main+1029
 d4 00                 jmp8	avm_test_main+1017
 f0 34 26              ldsp16	r4, [sp+0x26]
 c5 00 04              ldi16	r5, 0x400
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+1029
 f0 34 84              ldsp16	r4, [sp+0x84]
 f0 1d 86              ldsp8u	r5, [sp+0x86]
 d6 f5                 adjsp	-0xb
 c6 34 12              ldi16	r6, 0x1234
 f4 66                 stsp16	[sp+0x9], r6
 f4 58                 stsp16	[sp+0x6], r4
 f1 51                 stsp8	[sp+0x8], r5
 c4 4f 02              ldi16	r4, 0x24f
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 3f              leasp	r4, 0x3f
 f4 7c                 stsp16	[sp+0xf], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 2e 01              call16	call_vsnprintf
 d6 0b                 adjsp	0xb
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 36 84              ldsp16	r6, [sp+0x84]
 f0 1f 86              ldsp8u	r7, [sp+0x86]
 f1 77                 zext8	r7
 e1 a7 02              call16	program_pointer_prefix_matches
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 f4 58                 stsp16	[sp+0x6], r4
 d0 13                 breq8	avm_test_main+1111
 d4 00                 jmp8	avm_test_main+1094
 f0 14 3c              leasp	r4, 0x3c
 c5 55 02              ldi16	r5, 0x255
 e1 55 01              call16	text_equal
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f4 58                 stsp16	[sp+0x6], r4
 d4 00                 jmp8	avm_test_main+1111
 f4 18                 ldsp16	r4, [sp+0x6]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 5b 02              ldi16	r4, 0x25b
 e1 ab 01              call16	test_line16
 f0 35 20              ldsp16	r5, [sp+0x20]
 c4 5e 02              ldi16	r4, 0x25e
 e1 a2 01              call16	test_line16
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 0d                 cmpi.s8	r4, 0xd
 d0 0e                 breq8	avm_test_main+1158
 d4 00                 jmp8	avm_test_main+1146
 f0 34 26              ldsp16	r4, [sp+0x26]
 c5 00 08              ldi16	r5, 0x800
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+1158
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 d1 0e                 brne8	avm_test_main+1179
 d4 00                 jmp8	avm_test_main+1167
 f0 34 26              ldsp16	r4, [sp+0x26]
 c5 00 10              ldi16	r5, 0x1000
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+1179
 f0 34 84              ldsp16	r4, [sp+0x84]
 f0 1d 86              ldsp8u	r5, [sp+0x86]
 d6 f6                 adjsp	-0xa
 f4 5c                 stsp16	[sp+0x7], r4
 f1 55                 stsp8	[sp+0x9], r5
 c4 9e 0c              ldi16	r4, 0xc9e
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 3e              leasp	r4, 0x3e
 f4 68                 stsp16	[sp+0xa], r4
 f4 40                 stsp16	[sp+0x0], r4
 e1 26 01              call16	call_vsnprintf_P
 d6 0a                 adjsp	0xa
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 36 84              ldsp16	r6, [sp+0x84]
 f0 1f 86              ldsp8u	r7, [sp+0x86]
 f1 77                 zext8	r7
 e1 12 02              call16	program_pointer_prefix_matches
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 f4 48                 stsp16	[sp+0x2], r4
 d0 25                 breq8	avm_test_main+1278
 d4 00                 jmp8	avm_test_main+1243
 f0 25 3c              ldsp8s	r5, [sp+0x3c]
 a0                    xor	r4, r4
 cd 20                 cmpi.s8	r5, 0x20
 f4 48                 stsp16	[sp+0x2], r4
 d1 19                 brne8	avm_test_main+1278
 d4 00                 jmp8	avm_test_main+1255
 f0 25 3d              ldsp8s	r5, [sp+0x3d]
 a0                    xor	r4, r4
 cd 20                 cmpi.s8	r5, 0x20
 f4 48                 stsp16	[sp+0x2], r4
 d1 0d                 brne8	avm_test_main+1278
 d4 00                 jmp8	avm_test_main+1267
 f0 24 3e              ldsp8s	r4, [sp+0x3e]
 f4 a4                 tst8	r4
 f8 04                 cset.eq	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	avm_test_main+1278
 f4 08                 ldsp16	r4, [sp+0x2]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 61 02              ldi16	r4, 0x261
 e1 04 01              call16	test_line16
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c4 64 02              ldi16	r4, 0x264
 e1 fb 00              call16	test_line16
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 0a                 cmpi.s8	r4, 0xa
 d0 0e                 breq8	avm_test_main+1325
 d4 00                 jmp8	avm_test_main+1313
 f0 34 26              ldsp16	r4, [sp+0x26]
 c5 00 20              ldi16	r5, 0x2000
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+1325
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 2c                 tst16	r4
 d1 0e                 brne8	avm_test_main+1346
 d4 00                 jmp8	avm_test_main+1334
 f0 34 26              ldsp16	r4, [sp+0x26]
 c5 00 40              ldi16	r5, 0x4000
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 00                 jmp8	avm_test_main+1346
 f0 35 26              ldsp16	r5, [sp+0x26]
 c4 67 02              ldi16	r4, 0x267
 e1 c8 00              call16	test_line16
 f0 34 26              ldsp16	r4, [sp+0x26]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 d6 7f                 adjsp	0x7f
 d6 08                 adjsp	0x8
 ef                    ret

<call_vsnprintf>:
 d6 fc                 adjsp	-0x4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 24                 ldsp16	r4, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 14 0d              leasp	r4, 0xd
 f4 48                 stsp16	[sp+0x2], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 25                 ldsp16	r5, [sp+0x9]
 f4 2e                 ldsp16	r6, [sp+0xb]
 f4 0b                 ldsp16	r7, [sp+0x2]
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 ba                    pop16	r2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 04                 adjsp	0x4
 ef                    ret

<report_text>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 e1 53 02              call16	test_puts
 c0 3d                 ldi8	r4, 0x3d
 e1 70 02              call16	test_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 e1 76 02              call16	test_hex16
 c4 6a 02              ldi16	r4, 0x26a
 e1 43 02              call16	test_puts
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 3e 02              call16	test_puts
 c4 6d 02              ldi16	r4, 0x26d
 e1 38 02              call16	test_puts
 d6 06                 adjsp	0x6
 ef                    ret

<text_equal>:
 d6 fa                 adjsp	-0x6
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 d4 00                 jmp8	text_equal+8
 f4 08                 ldsp16	r4, [sp+0x2]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 01                 ldsp16	r5, [sp+0x0]
 45                    ld8u	r5, [r5]
 f6 45                 sext8	r5
 31                    cmp	r4, r5
 d1 21                 brne8	text_equal+54
 d4 00                 jmp8	text_equal+23
 f4 08                 ldsp16	r4, [sp+0x2]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d1 08                 brne8	text_equal+40
 d4 00                 jmp8	text_equal+34
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 d4 13                 jmp8	text_equal+59
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 d2                 jmp8	text_equal+8
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	text_equal+59
 f4 10                 ldsp16	r4, [sp+0x4]
 d6 06                 adjsp	0x6
 ef                    ret

<call_vsnprintf_P>:
 b0                    push16	r0
 d6 f9                 adjsp	-0x7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 1d 12              ldsp8u	r5, [sp+0x12]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 14 13              leasp	r4, 0x13
 f4 48                 stsp16	[sp+0x2], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 5b                 ldsp8u	r7, [sp+0x6]
 f0 30 02              ldsp16	r0, [sp+0x2]
 b2                    push16	r2
 f1 10                 mov	r2, r0
 d7 30                 sys	vsnprintf_p
 ba                    pop16	r2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 07                 adjsp	0x7
 b8                    pop16	r0
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 e1 bb 01              call16	test_puts
 c0 3d                 ldi8	r4, 0x3d
 e1 d8 01              call16	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 de 01              call16	test_hex16
 c0 0a                 ldi8	r4, 0xa
 e1 ce 01              call16	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<pointer_text_matches>:
 d6 f0                 adjsp	-0x10
 f4 78                 stsp16	[sp+0xe], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 68                 stsp16	[sp+0xa], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 44                    ld8u	r5, [r4]
 f6 45                 sext8	r5
 a0                    xor	r4, r4
 cd 30                 cmpi.s8	r5, 0x30
 f4 60                 stsp16	[sp+0x8], r4
 db 94 00              brne16	pointer_text_matches+171
 d4 00                 jmp8	pointer_text_matches+25
 f4 38                 ldsp16	r4, [sp+0xe]
 ed a8 21              ld8u	r5, [r4+1]
 f6 45                 sext8	r5
 a0                    xor	r4, r4
 cd 78                 cmpi.s8	r5, 0x78
 f4 60                 stsp16	[sp+0x8], r4
 db 83 00              brne16	pointer_text_matches+171
 d4 00                 jmp8	pointer_text_matches+42
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 22              ld8u	r4, [r4+2]
 f6 44                 sext8	r4
 f4 58                 stsp16	[sp+0x6], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 fa 7c                 lsr16i	r4, 0xc
 e1 f0 01              call16	lower_hex_digit
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 60                 stsp16	[sp+0x8], r4
 d1 66                 brne8	pointer_text_matches+171
 d4 00                 jmp8	pointer_text_matches+71
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 23              ld8u	r4, [r4+3]
 f6 44                 sext8	r4
 f4 50                 stsp16	[sp+0x4], r4
 f3 6c                 ldsp8u	r4, [sp+0xb]
 e1 d5 01              call16	lower_hex_digit
 f4 11                 ldsp16	r5, [sp+0x4]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 60                 stsp16	[sp+0x8], r4
 d1 4b                 brne8	pointer_text_matches+171
 d4 00                 jmp8	pointer_text_matches+98
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 24              ld8u	r4, [r4+4]
 f6 44                 sext8	r4
 f4 48                 stsp16	[sp+0x2], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 fa 74                 lsr16i	r4, 0x4
 f1 74                 zext8	r4
 e1 b6 01              call16	lower_hex_digit
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 60                 stsp16	[sp+0x8], r4
 d1 2c                 brne8	pointer_text_matches+171
 d4 00                 jmp8	pointer_text_matches+129
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 25              ld8u	r4, [r4+5]
 f6 44                 sext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 f3 68                 ldsp8u	r4, [sp+0xa]
 e1 9b 01              call16	lower_hex_digit
 f4 01                 ldsp16	r5, [sp+0x0]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 60                 stsp16	[sp+0x8], r4
 d1 11                 brne8	pointer_text_matches+171
 d4 00                 jmp8	pointer_text_matches+156
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 26              ld8u	r4, [r4+6]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 f8 04                 cset.eq	r4
 f4 60                 stsp16	[sp+0x8], r4
 d4 00                 jmp8	pointer_text_matches+171
 f4 20                 ldsp16	r4, [sp+0x8]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 10                 adjsp	0x10
 ef                    ret

<program_pointer_prefix_matches>:
 d6 eb                 adjsp	-0x15
 f0 3c 13              stsp16	[sp+0x13], r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 2f 12              stsp8	[sp+0x12], r7
 f0 14 10              leasp	r4, 0x10
 f4 78                 stsp16	[sp+0xe], r4
 f0 34 13              ldsp16	r4, [sp+0x13]
 44                    ld8u	r5, [r4]
 f6 45                 sext8	r5
 a0                    xor	r4, r4
 cd 30                 cmpi.s8	r5, 0x30
 f4 70                 stsp16	[sp+0xc], r4
 db d0 00              brne16	program_pointer_prefix_matches+238
 d4 00                 jmp8	program_pointer_prefix_matches+32
 f0 34 13              ldsp16	r4, [sp+0x13]
 ed a8 21              ld8u	r5, [r4+1]
 f6 45                 sext8	r5
 a0                    xor	r4, r4
 cd 78                 cmpi.s8	r5, 0x78
 f4 70                 stsp16	[sp+0xc], r4
 db be 00              brne16	program_pointer_prefix_matches+238
 d4 00                 jmp8	program_pointer_prefix_matches+50
 f0 34 13              ldsp16	r4, [sp+0x13]
 ed 88 22              ld8u	r4, [r4+2]
 f6 44                 sext8	r4
 f4 68                 stsp16	[sp+0xa], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 22              ld8u	r4, [r4+2]
 fa 74                 lsr16i	r4, 0x4
 e1 31 01              call16	lower_hex_digit
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 70                 stsp16	[sp+0xc], r4
 db 9c 00              brne16	program_pointer_prefix_matches+238
 d4 00                 jmp8	program_pointer_prefix_matches+84
 f0 34 13              ldsp16	r4, [sp+0x13]
 ed 88 23              ld8u	r4, [r4+3]
 f6 44                 sext8	r4
 f4 60                 stsp16	[sp+0x8], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 22              ld8u	r4, [r4+2]
 e1 11 01              call16	lower_hex_digit
 f4 21                 ldsp16	r5, [sp+0x8]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 70                 stsp16	[sp+0xc], r4
 d1 7d                 brne8	program_pointer_prefix_matches+238
 d4 00                 jmp8	program_pointer_prefix_matches+115
 f0 34 13              ldsp16	r4, [sp+0x13]
 ed 88 24              ld8u	r4, [r4+4]
 f6 44                 sext8	r4
 f4 58                 stsp16	[sp+0x6], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 21              ld8u	r4, [r4+1]
 fa 74                 lsr16i	r4, 0x4
 e1 f0 00              call16	lower_hex_digit
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 70                 stsp16	[sp+0xc], r4
 d1 5c                 brne8	program_pointer_prefix_matches+238
 d4 00                 jmp8	program_pointer_prefix_matches+148
 f0 34 13              ldsp16	r4, [sp+0x13]
 ed 88 25              ld8u	r4, [r4+5]
 f6 44                 sext8	r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 ed 88 21              ld8u	r4, [r4+1]
 e1 d1 00              call16	lower_hex_digit
 f4 11                 ldsp16	r5, [sp+0x4]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 70                 stsp16	[sp+0xc], r4
 d1 3d                 brne8	program_pointer_prefix_matches+238
 d4 00                 jmp8	program_pointer_prefix_matches+179
 f0 34 13              ldsp16	r4, [sp+0x13]
 ed 88 26              ld8u	r4, [r4+6]
 f6 44                 sext8	r4
 f4 48                 stsp16	[sp+0x2], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 40                    ld8u	r4, [r4]
 fa 74                 lsr16i	r4, 0x4
 e1 b2 00              call16	lower_hex_digit
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 f6 46                 sext8	r6
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 70                 stsp16	[sp+0xc], r4
 d1 1e                 brne8	program_pointer_prefix_matches+238
 d4 00                 jmp8	program_pointer_prefix_matches+210
 f0 34 13              ldsp16	r4, [sp+0x13]
 ed 88 27              ld8u	r4, [r4+7]
 f6 44                 sext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 40                    ld8u	r4, [r4]
 e1 95 00              call16	lower_hex_digit
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 45                 sext8	r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f4 70                 stsp16	[sp+0xc], r4
 d4 00                 jmp8	program_pointer_prefix_matches+238
 f4 30                 ldsp16	r4, [sp+0xc]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 15                 adjsp	0x15
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

<lower_hex_digit>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 0a                 cmpi.s8	r4, 0xa
 d9 0c                 brsge8	lower_hex_digit+29
 d4 00                 jmp8	lower_hex_digit+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 30                 addi.s8	r4, 0x30
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0a                 jmp8	lower_hex_digit+39
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 57                 addi.s8	r4, 0x57
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	lower_hex_digit+39
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 03                 adjsp	0x3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
