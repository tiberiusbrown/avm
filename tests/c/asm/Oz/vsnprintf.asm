
vsnprintf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 vsnprintf.c
00000a00 l     O .rodata	00000006 .L.avm.flashstr.1
00000100 l     O .data	00000004 avm_test_main.ram_text
00000104 l     O .data	0000000e .L.str
00000866 l     F .text	00000016 call_vsnprintf
00000112 l     O .data	00000003 .L.str.1
0000087c l     F .text	00000026 report_text
00000115 l     O .data	00000010 .L.str.2
000008a2 l     F .text	0000001e text_equal
00000a22 l     O .rodata	00000015 program_long
00000a06 l     O .rodata	0000001c program_format
000008c0 l     F .text	0000001b call_vsnprintf_P
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
000008db l     F .text	00000015 test_line16
00000220 l     O .data	00000010 .L.str.19
00000230 l     O .data	00000003 .L.str.20
00000233 l     O .data	00000008 .L.str.21
0000023b l     O .data	00000008 .L.str.22
00000243 l     O .data	00000003 .L.str.23
00000246 l     O .data	00000003 .L.str.24
00000249 l     O .data	00000003 .L.str.25
0000024c l     O .data	00000003 .L.str.26
000009f8 l     O .rodata	00000008 .L.avm.flashstr.0
0000024f l     O .data	00000006 .L.str.27
000008f0 l     F .text	000000c4 program_pointer_prefix_matches
00000255 l     O .data	00000006 .L.str.28
0000025b l     O .data	00000003 .L.str.29
0000025e l     O .data	00000003 .L.str.30
00000a37 l     O .rodata	00000006 .L.avm.flashstr.2
00000261 l     O .data	00000003 .L.str.31
00000264 l     O .data	00000003 .L.str.32
00000267 l     O .data	00000003 .L.str.33
000009b4 l     F .text	0000000d test_puts
000009c1 l     F .text	00000011 test_hex16
0000026a l     O .data	00000003 .L.str.34
0000026d l     O .data	00000003 .L.str.35
000009d2 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00000a3d l       .init_array	00000000 .hidden __init_array_end
00000a3d l       .init_array	00000000 .hidden __init_array_start
00000a3d l       .fini_array	00000000 .hidden __fini_array_start
00000a3d l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003d7 g     F .text	0000048f avm_test_main
000009f6 g     F .text	00000002 avm_halt
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
 e1 d8 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 3d 0a              ldi16	r4, 0xa3d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 3d 0a              ldi16	r6, 0xa3d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 3d 0a           ldi16	r0, 0xa3d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 3d 0a           ldi16	r2, 0xa3d
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
 c4 3d 0a              ldi16	r4, 0xa3d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 3d 0a              ldi16	r6, 0xa3d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 3d 0a           ldi16	r2, 0xa3d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 3d 0a           ldi16	r0, 0xa3d
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 96                 adjsp	-0x6a
 d6 f3                 adjsp	-0xd
 c4 00 0a              ldi16	r4, 0xa00
 c1 00                 ldi8	r5, 0x0
 f4 68                 stsp16	[sp+0xa], r4
 f1 61                 stsp8	[sp+0xc], r5
 c4 00 01              ldi16	r4, 0x100
 f4 60                 stsp16	[sp+0x8], r4
 c0 5a                 ldi8	r4, 0x5a
 f4 58                 stsp16	[sp+0x6], r4
 c4 04 01              ldi16	r4, 0x104
 f4 50                 stsp16	[sp+0x4], r4
 f0 03 50              ldi8	r3, 0x50
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 10 27              leasp	r0, 0x27
 f0 38 00              stsp16	[sp+0x0], r0
 e1 61 04              call16	call_vsnprintf
 d6 0d                 adjsp	0xd
 f1 0c                 mov	r1, r4
 c4 12 01              ldi16	r4, 0x112
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 69 04              call16	report_text
 f0 0d 0f              cmpi.s8	r1, 0xf
 d1 11                 brne8	avm_test_main+82
 f0 14 1a              leasp	r4, 0x1a
 c5 15 01              ldi16	r5, 0x115
 e1 81 04              call16	text_equal
 f4 a4                 tst8	r4
 d0 04                 breq8	avm_test_main+82
 f2 42                 sub	r2, r2
 d4 03                 jmp8	avm_test_main+85
 f0 02 01              ldi8	r2, 0x1
 d6 ee                 adjsp	-0x12
 c4 15 cd              ldi16	r4, 0xcd15
 c5 5b 07              ldi16	r5, 0x75b
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 22 0a              ldi16	r4, 0xa22
 c1 00                 ldi8	r5, 0x0
 f4 6c                 stsp16	[sp+0xb], r4
 f1 65                 stsp8	[sp+0xd], r5
 c4 00 01              ldi16	r4, 0x100
 f4 64                 stsp16	[sp+0x9], r4
 c4 d6 ff              ldi16	r4, 0xffd6
 f4 5c                 stsp16	[sp+0x7], r4
 c4 06 0a              ldi16	r4, 0xa06
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 10 2c              leasp	r0, 0x2c
 f0 38 00              stsp16	[sp+0x0], r0
 e1 62 04              call16	call_vsnprintf_P
 d6 12                 adjsp	0x12
 f1 0c                 mov	r1, r4
 c4 25 01              ldi16	r4, 0x125
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 10 04              call16	report_text
 f0 0d 35              cmpi.s8	r1, 0x35
 d1 0d                 brne8	avm_test_main+167
 f0 14 1a              leasp	r4, 0x1a
 c5 28 01              ldi16	r5, 0x128
 e1 28 04              call16	text_equal
 f4 a4                 tst8	r4
 d1 04                 brne8	avm_test_main+171
 c0 02                 ldi8	r4, 0x2
 f9 51                 or	r2, r4
 d6 e4                 adjsp	-0x1c
 c4 fa ff              ldi16	r4, 0xfffa
 c5 bf fe              ldi16	r5, 0xfebf
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c4 eb 32              ldi16	r4, 0x32eb
 c5 a4 f8              ldi16	r5, 0xf8a4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 2e fb              ldi16	r4, 0xfb2e
 f0 3c 12              stsp16	[sp+0x12], r4
 a0                    xor	r4, r4
 c1 fe                 ldi8	r5, 0xfe
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 2a                 ldi8	r4, 0x2a
 c1 09                 ldi8	r5, 0x9
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 0c                 ldi8	r4, 0xc
 c1 07                 ldi8	r5, 0x7
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 5e 01              ldi16	r4, 0x15e
 f4 50                 stsp16	[sp+0x4], r4
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 10 36              leasp	r0, 0x36
 f0 38 00              stsp16	[sp+0x0], r0
 e1 9b 03              call16	call_vsnprintf
 d6 1c                 adjsp	0x1c
 f1 0c                 mov	r1, r4
 c4 8d 01              ldi16	r4, 0x18d
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 a3 03              call16	report_text
 f0 0d 37              cmpi.s8	r1, 0x37
 f0 00 04              ldi8	r0, 0x4
 d1 0d                 brne8	avm_test_main+279
 f0 14 1a              leasp	r4, 0x1a
 c5 90 01              ldi16	r5, 0x190
 e1 b8 03              call16	text_equal
 f4 a4                 tst8	r4
 d1 02                 brne8	avm_test_main+281
 f9 41                 or	r2, r0
 d6 eb                 adjsp	-0x15
 c4 22 0a              ldi16	r4, 0xa22
 c1 00                 ldi8	r5, 0x0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 2d 14              stsp8	[sp+0x14], r5
 f0 38 10              stsp16	[sp+0x10], r0
 c0 06                 ldi8	r4, 0x6
 c5 d6 ff              ldi16	r5, 0xffd6
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 d8 01              ldi16	r4, 0x1d8
 f4 68                 stsp16	[sp+0xa], r4
 c4 f8 ff              ldi16	r4, 0xfff8
 c1 03                 ldi8	r5, 0x3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 c8 01              ldi16	r4, 0x1c8
 f4 50                 stsp16	[sp+0x4], r4
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 10 2f              leasp	r0, 0x2f
 f0 38 00              stsp16	[sp+0x0], r0
 e1 3e 03              call16	call_vsnprintf
 d6 15                 adjsp	0x15
 f1 0c                 mov	r1, r4
 c4 df 01              ldi16	r4, 0x1df
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 46 03              call16	report_text
 f0 0d 14              cmpi.s8	r1, 0x14
 f0 00 08              ldi8	r0, 0x8
 d1 0d                 brne8	avm_test_main+372
 f0 14 1a              leasp	r4, 0x1a
 c5 e2 01              ldi16	r5, 0x1e2
 e1 5b 03              call16	text_equal
 f4 a4                 tst8	r4
 d1 02                 brne8	avm_test_main+374
 f9 41                 or	r2, r0
 a0                    xor	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 14 10              leasp	r4, 0x10
 c1 0a                 ldi8	r5, 0xa
 c2 a5                 ldi8	r6, 0xa5
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+396
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+388
 c0 69                 ldi8	r4, 0x69
 f0 2c 19              stsp8	[sp+0x19], r4
 c0 5a                 ldi8	r4, 0x5a
 f0 2c 10              stsp8	[sp+0x10], r4
 d6 f8                 adjsp	-0x8
 c4 39 30              ldi16	r4, 0x3039
 f4 58                 stsp16	[sp+0x6], r4
 c4 f7 01              ldi16	r4, 0x1f7
 f4 50                 stsp16	[sp+0x4], r4
 f0 38 02              stsp16	[sp+0x2], r0
 f0 10 19              leasp	r0, 0x19
 f0 38 00              stsp16	[sp+0x0], r0
 e1 e1 02              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f1 0c                 mov	r1, r4
 c4 01 02              ldi16	r4, 0x201
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 e9 02              call16	report_text
 f0 0d 0c              cmpi.s8	r1, 0xc
 d1 25                 brne8	avm_test_main+486
 c5 04 02              ldi16	r5, 0x204
 f1 20                 mov	r4, r0
 e1 02 03              call16	text_equal
 f0 1d 19              ldsp8u	r5, [sp+0x19]
 f0 1e 18              ldsp8u	r6, [sp+0x18]
 f0 1f 10              ldsp8u	r7, [sp+0x10]
 f4 a4                 tst8	r4
 d0 10                 breq8	avm_test_main+486
 f1 77                 zext8	r7
 cf 5a                 cmpi.s8	r7, 0x5a
 d1 0a                 brne8	avm_test_main+486
 f4 a6                 tst8	r6
 d1 06                 brne8	avm_test_main+486
 f1 75                 zext8	r5
 cd 69                 cmpi.s8	r5, 0x69
 d0 04                 breq8	avm_test_main+490
 c0 10                 ldi8	r4, 0x10
 f9 51                 or	r2, r4
 f0 3a 0c              stsp16	[sp+0xc], r2
 c4 78 79              ldi16	r4, 0x7978
 f4 78                 stsp16	[sp+0xe], r4
 d6 fa                 adjsp	-0x6
 c4 0c 02              ldi16	r4, 0x20c
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 f0 11 14              leasp	r1, 0x14
 f0 39 00              stsp16	[sp+0x0], r1
 e1 89 02              call16	call_vsnprintf
 d6 06                 adjsp	0x6
 04                    mov	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 12 02              ldi16	r4, 0x212
 f1 29                 mov	r6, r1
 e1 92 02              call16	report_text
 f3 78                 ldsp8u	r4, [sp+0xe]
 f4 58                 stsp16	[sp+0x6], r4
 f0 18 0f              ldsp8u	r0, [sp+0xf]
 d6 f8                 adjsp	-0x8
 c4 d2 04              ldi16	r4, 0x4d2
 f4 58                 stsp16	[sp+0x6], r4
 c4 15 02              ldi16	r4, 0x215
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e1 60 02              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f1 0c                 mov	r1, r4
 c4 1d 02              ldi16	r4, 0x21d
 f1 25                 mov	r5, r1
 e1 c9 02              call16	test_line16
 d6 f8                 adjsp	-0x8
 c0 7b                 ldi8	r4, 0x7b
 f4 58                 stsp16	[sp+0x6], r4
 c4 20 02              ldi16	r4, 0x220
 f4 50                 stsp16	[sp+0x4], r4
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 13 22              leasp	r3, 0x22
 f0 3b 00              stsp16	[sp+0x0], r3
 e1 3d 02              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f1 14                 mov	r2, r4
 c4 30 02              ldi16	r4, 0x230
 f1 26                 mov	r5, r2
 f1 2b                 mov	r6, r3
 e1 45 02              call16	report_text
 c0 20                 ldi8	r4, 0x20
 f4 32                 ldsp16	r6, [sp+0xc]
 92                    or	r4, r6
 f1 70                 zext8	r0
 f0 0c 79              cmpi.s8	r0, 0x79
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 fb 35                 cmov.eq	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 cd 05                 cmpi.s8	r5, 0x5
 fb 26                 cmov.eq	r4, r6
 f0 03 40              ldi8	r3, 0x40
 f9 71                 or	r3, r4
 f0 0d 09              cmpi.s8	r1, 0x9
 fb 1c                 cmov.eq	r3, r4
 f0 0e ff              cmpi.s8	r2, -0x1
 d0 08                 breq8	avm_test_main+657
 c0 80                 ldi8	r4, 0x80
 f9 71                 or	r3, r4
 f2 42                 sub	r2, r2
 d4 0f                 jmp8	avm_test_main+672
 f0 14 1a              leasp	r4, 0x1a
 c5 33 02              ldi16	r5, 0x233
 e1 31 02              call16	text_equal
 f4 a4                 tst8	r4
 d0 eb                 breq8	avm_test_main+649
 f2 42                 sub	r2, r2
 c4 78 79              ldi16	r4, 0x7978
 f4 78                 stsp16	[sp+0xe], r4
 d6 f8                 adjsp	-0x8
 c4 3b 02              ldi16	r4, 0x23b
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 58                 stsp16	[sp+0x6], r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 10 16              leasp	r0, 0x16
 f0 38 00              stsp16	[sp+0x0], r0
 e1 d4 01              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 c4 43 02              ldi16	r4, 0x243
 f4 61                 stsp16	[sp+0x8], r5
 f1 28                 mov	r6, r0
 e1 dd 01              call16	report_text
 f3 7c                 ldsp8u	r4, [sp+0xf]
 f4 50                 stsp16	[sp+0x4], r4
 f3 78                 ldsp8u	r4, [sp+0xe]
 f4 58                 stsp16	[sp+0x6], r4
 d6 f8                 adjsp	-0x8
 c4 00 01              ldi16	r4, 0x100
 f4 58                 stsp16	[sp+0x6], r4
 c4 46 02              ldi16	r4, 0x246
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 22              leasp	r4, 0x22
 f4 40                 stsp16	[sp+0x0], r4
 e1 a7 01              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f4 70                 stsp16	[sp+0xc], r4
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 f0 1d 1a              ldsp8u	r5, [sp+0x1a]
 cd 30                 cmpi.s8	r5, 0x30
 f1 26                 mov	r5, r2
 d1 72                 brne8	avm_test_main+874
 f1 74                 zext8	r4
 cc 78                 cmpi.s8	r4, 0x78
 f1 26                 mov	r5, r2
 d1 6a                 brne8	avm_test_main+874
 c6 00 01              ldi16	r6, 0x100
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 57                 addi.s8	r5, 0x57
 c4 00 a0              ldi16	r4, 0xa000
 38                    cmp	r6, r4
 fc 2f                 cmov.ult	r5, r7
 f0 1c 1c              ldsp8u	r4, [sp+0x1c]
 31                    cmp	r4, r5
 f1 26                 mov	r5, r2
 d1 4e                 brne8	avm_test_main+874
 fa 98                 lsr16i	r6, 0x8
 f0 01 0f              ldi8	r1, 0xf
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 57                 addi.s8	r6, 0x57
 fc 34                 cmov.ult	r6, r4
 f0 1c 1d              ldsp8u	r4, [sp+0x1d]
 32                    cmp	r4, r6
 f1 26                 mov	r5, r2
 d1 36                 brne8	avm_test_main+874
 c7 00 01              ldi16	r7, 0x100
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 57                 addi.s8	r6, 0x57
 c1 a0                 ldi8	r5, 0xa0
 3d                    cmp	r7, r5
 fc 34                 cmov.ult	r6, r4
 f0 1c 1e              ldsp8u	r4, [sp+0x1e]
 32                    cmp	r4, r6
 f1 26                 mov	r5, r2
 d1 1c                 brne8	avm_test_main+874
 c4 00 01              ldi16	r4, 0x100
 f9 84                 and	r4, r1
 f9 11                 or	r0, r4
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 20                 cmov.ult	r4, r0
 f0 1d 1f              ldsp8u	r5, [sp+0x1f]
 34                    cmp	r5, r4
 f1 26                 mov	r5, r2
 d1 07                 brne8	avm_test_main+874
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f4 a4                 tst8	r4
 f8 05                 cset.eq	r5
 c4 49 02              ldi16	r4, 0x249
 f1 05                 mov	r0, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 e1 90 01              call16	test_line16
 c4 4c 02              ldi16	r4, 0x24c
 f0 38 02              stsp16	[sp+0x2], r0
 f1 24                 mov	r5, r0
 e1 85 01              call16	test_line16
 d6 f5                 adjsp	-0xb
 c4 34 12              ldi16	r4, 0x1234
 f4 64                 stsp16	[sp+0x9], r4
 c4 f8 09              ldi16	r4, 0x9f8
 c1 00                 ldi8	r5, 0x0
 f4 58                 stsp16	[sp+0x6], r4
 f1 51                 stsp8	[sp+0x8], r5
 c4 4f 02              ldi16	r4, 0x24f
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 10 25              leasp	r0, 0x25
 f0 38 00              stsp16	[sp+0x0], r0
 e1 ee 00              call16	call_vsnprintf
 d6 0b                 adjsp	0xb
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 e1 6f 01              call16	program_pointer_prefix_matches
 f4 a4                 tst8	r4
 f1 02                 mov	r0, r2
 d0 0d                 breq8	avm_test_main+957
 f0 14 22              leasp	r4, 0x22
 c5 55 02              ldi16	r5, 0x255
 e1 12 01              call16	text_equal
 f6 2c                 tst16	r4
 f8 08                 cset.ne	r0
 c4 5b 02              ldi16	r4, 0x25b
 f0 39 00              stsp16	[sp+0x0], r1
 f1 25                 mov	r5, r1
 e1 3c 01              call16	test_line16
 c4 5e 02              ldi16	r4, 0x25e
 f1 24                 mov	r5, r0
 e1 34 01              call16	test_line16
 d6 f6                 adjsp	-0xa
 c4 f8 09              ldi16	r4, 0x9f8
 c1 00                 ldi8	r5, 0x0
 f4 5c                 stsp16	[sp+0x7], r4
 f1 55                 stsp8	[sp+0x9], r5
 c4 37 0a              ldi16	r4, 0xa37
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 11 24              leasp	r1, 0x24
 f0 39 00              stsp16	[sp+0x0], r1
 e1 fc 00              call16	call_vsnprintf_P
 d6 0a                 adjsp	0xa
 f1 14                 mov	r2, r4
 f1 21                 mov	r4, r1
 e1 23 01              call16	program_pointer_prefix_matches
 f0 1d 23              ldsp8u	r5, [sp+0x23]
 f0 1e 22              ldsp8u	r6, [sp+0x22]
 f4 a4                 tst8	r4
 d0 15                 breq8	avm_test_main+1045
 f1 76                 zext8	r6
 ce 20                 cmpi.s8	r6, 0x20
 d1 0f                 brne8	avm_test_main+1045
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 09                 brne8	avm_test_main+1045
 f0 1c 24              ldsp8u	r4, [sp+0x24]
 f4 a4                 tst8	r4
 f8 04                 cset.eq	r4
 f4 68                 stsp16	[sp+0xa], r4
 c4 61 02              ldi16	r4, 0x261
 f1 26                 mov	r5, r2
 e1 e7 00              call16	test_line16
 c4 64 02              ldi16	r4, 0x264
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 25                 mov	r5, r1
 e1 dc 00              call16	test_line16
 c4 00 01              ldi16	r4, 0x100
 f9 8d                 or	r4, r3
 f4 11                 ldsp16	r5, [sp+0x4]
 f1 75                 zext8	r5
 cd 79                 cmpi.s8	r5, 0x79
 04                    mov	r5, r4
 fb 2b                 cmov.eq	r5, r3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 fb 35                 cmov.eq	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 cd ff                 cmpi.s8	r5, -0x1
 fb 26                 cmov.eq	r4, r6
 c5 00 02              ldi16	r5, 0x200
 94                    or	r5, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 ce 06                 cmpi.s8	r6, 0x6
 fb 2c                 cmov.eq	r5, r4
 c4 00 04              ldi16	r4, 0x400
 91                    or	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 2e                 tst16	r6
 fb 2c                 cmov.eq	r5, r4
 c4 00 08              ldi16	r4, 0x800
 91                    or	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 0d                 cmpi.s8	r6, 0xd
 fb 25                 cmov.eq	r4, r5
 c5 00 10              ldi16	r5, 0x1000
 94                    or	r5, r4
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 c4 00 20              ldi16	r4, 0x2000
 91                    or	r4, r5
 f0 0e 0a              cmpi.s8	r2, 0xa
 fb 25                 cmov.eq	r4, r5
 f0 04 00 40           ldi16	r0, 0x4000
 f9 11                 or	r0, r4
 f4 a1                 tst8	r1
 fb 44                 cmov.ne	r0, r4
 c4 67 02              ldi16	r4, 0x267
 f1 24                 mov	r5, r0
 e1 80 00              call16	test_line16
 f6 28                 tst16	r0
 f8 0c                 cset.ne	r4
 d6 6a                 adjsp	0x6a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<call_vsnprintf>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 f4 2e                 ldsp16	r6, [sp+0xb]
 f4 25                 ldsp16	r5, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 17 0d              leasp	r7, 0xd
 f4 43                 stsp16	[sp+0x0], r7
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret

<report_text>:
 b1                    push16	r1
 b0                    push16	r0
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 e1 2f 01              call16	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 e1 33 01              call16	test_hex16
 c4 6a 02              ldi16	r4, 0x26a
 e1 20 01              call16	test_puts
 f1 20                 mov	r4, r0
 e1 1b 01              call16	test_puts
 c4 6d 02              ldi16	r4, 0x26d
 e1 15 01              call16	test_puts
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<text_equal>:
 b1                    push16	r1
 b0                    push16	r0
 f1 0c                 mov	r1, r4
 a0                    xor	r4, r4
 f0 00 01              ldi8	r0, 0x1
 ed e2 20              ld8u	r7, [r1+0]
 49                    ld8u	r6, [r5]
 3e                    cmp	r7, r6
 d1 0c                 brne8	text_equal+27
 f4 a7                 tst8	r7
 d0 06                 breq8	text_equal+25
 f4 ad                 inc16	r5
 f4 a9                 inc16	r1
 d4 ef                 jmp8	text_equal+8
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<call_vsnprintf_P>:
 b2                    push16	r2
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 36                 ldsp16	r6, [sp+0xd]
 f3 7f                 ldsp8u	r7, [sp+0xf]
 f4 24                 ldsp16	r4, [sp+0x9]
 f0 10 10              leasp	r0, 0x10
 f0 38 00              stsp16	[sp+0x0], r0
 c1 50                 ldi8	r5, 0x50
 f1 10                 mov	r2, r0
 d7 30                 sys	vsnprintf_p
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

<test_line16>:
 b0                    push16	r0
 f1 05                 mov	r0, r5
 e1 d3 00              call16	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 e1 d7 00              call16	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<program_pointer_prefix_matches>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 ed c4 20              ld8u	r6, [r2+0]
 ce 30                 cmpi.s8	r6, 0x30
 db a9 00              brne16	program_pointer_prefix_matches+187
 ed c4 21              ld8u	r6, [r2+1]
 ce 78                 cmpi.s8	r6, 0x78
 db a1 00              brne16	program_pointer_prefix_matches+187
 c3 f0                 ldi8	r7, 0xf0
 f0 01 00              ldi8	r1, 0x0
 f9 3c                 and	r1, r7
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 94                 lsr16i	r6, 0x4
 f0 00 30              ldi8	r0, 0x30
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 57                 addi.s8	r6, 0x57
 fc 35                 cmov.ult	r6, r5
 ed a4 22              ld8u	r5, [r2+2]
 36                    cmp	r5, r6
 db 82 00              brne16	program_pointer_prefix_matches+187
 c3 00                 ldi8	r7, 0x0
 0b                    mov	r6, r7
 af                    xor	r7, r7
 c0 0f                 ldi8	r4, 0xf
 88                    and	r6, r4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 57                 addi.s8	r6, 0x57
 fc 35                 cmov.ult	r6, r5
 ed a4 23              ld8u	r5, [r2+3]
 36                    cmp	r5, r6
 d1 6c                 brne8	program_pointer_prefix_matches+187
 c6 f8 09              ldi16	r6, 0x9f8
 c3 00                 ldi8	r7, 0x0
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 57                 addi.s8	r4, 0x57
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 ed a4 24              ld8u	r5, [r2+4]
 34                    cmp	r5, r4
 d1 51                 brne8	program_pointer_prefix_matches+187
 fa 98                 lsr16i	r6, 0x8
 c0 0f                 ldi8	r4, 0xf
 f1 0c                 mov	r1, r4
 f9 c4                 and	r6, r1
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 57                 addi.s8	r6, 0x57
 fc 35                 cmov.ult	r6, r5
 ed a4 25              ld8u	r5, [r2+5]
 36                    cmp	r5, r6
 d1 3a                 brne8	program_pointer_prefix_matches+187
 c6 f8 09              ldi16	r6, 0x9f8
 c3 00                 ldi8	r7, 0x0
 f1 76                 zext8	r6
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 ca 57                 addi.s8	r6, 0x57
 c3 a0                 ldi8	r7, 0xa0
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 33                    cmp	r4, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 34                 cmov.ult	r6, r4
 ed a4 26              ld8u	r5, [r2+6]
 36                    cmp	r5, r6
 d1 15                 brne8	program_pointer_prefix_matches+187
 c6 f8 09              ldi16	r6, 0x9f8
 c3 00                 ldi8	r7, 0x0
 f9 c4                 and	r6, r1
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 57                 addi.s8	r6, 0x57
 fc 30                 cmov.ult	r6, r0
 ed 84 27              ld8u	r4, [r2+7]
 32                    cmp	r4, r6
 f8 03                 cset.eq	r3
 f1 23                 mov	r4, r3
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_puts>:
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_puts+12
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_puts+1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 fa 78                 lsr16i	r4, 0x8
 d5 09                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 03                 call8	test_hex8
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
