
vsnprintf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 vsnprintf.c
00000cac l     O .rodata	00000006 .L.avm.flashstr.1
00000100 l     O .data	00000004 avm_test_main.ram_text
00000104 l     O .data	0000000e .L.str
00000b07 l     F .text	00000016 call_vsnprintf
00000112 l     O .data	00000003 .L.str.1
00000b1d l     F .text	000000a6 report_text
00000115 l     O .data	00000010 .L.str.2
00000cce l     O .rodata	00000015 program_long
00000cb2 l     O .rodata	0000001c program_format
00000bc3 l     F .text	0000001b call_vsnprintf_P
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
0000021d l     O .data	00000010 .L.str.19
0000022d l     O .data	00000003 .L.str.20
00000230 l     O .data	00000008 .L.str.21
00000238 l     O .data	00000008 .L.str.22
00000240 l     O .data	00000003 .L.str.23
00000243 l     O .data	00000003 .L.str.24
00000ca4 l     O .rodata	00000008 .L.avm.flashstr.0
00000246 l     O .data	00000006 .L.str.27
00000bde l     F .text	000000c4 program_pointer_prefix_matches
0000024c l     O .data	00000006 .L.str.28
00000ce3 l     O .rodata	00000006 .L.avm.flashstr.2
00000000 l    df *ABS*	00000000 runtime.c
00000ce9 l       .init_array	00000000 .hidden __init_array_end
00000ce9 l       .init_array	00000000 .hidden __init_array_start
00000ce9 l       .fini_array	00000000 .hidden __fini_array_start
00000ce9 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003d7 g     F .text	00000730 avm_test_main
00000ca2 g     F .text	00000002 avm_halt
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
 e1 84 09              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e9 0c              ldi16	r4, 0xce9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 e9 0c              ldi16	r6, 0xce9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 e9 0c           ldi16	r0, 0xce9
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e9 0c           ldi16	r2, 0xce9
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
 c4 e9 0c              ldi16	r4, 0xce9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 e9 0c              ldi16	r6, 0xce9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 e9 0c           ldi16	r2, 0xce9
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e9 0c           ldi16	r0, 0xce9
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
 d6 90                 adjsp	-0x70
 d6 f3                 adjsp	-0xd
 c4 ac 0c              ldi16	r4, 0xcac
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
 f0 10 2d              leasp	r0, 0x2d
 f0 38 00              stsp16	[sp+0x0], r0
 e1 02 07              call16	call_vsnprintf
 d6 0d                 adjsp	0xd
 f1 0c                 mov	r1, r4
 c4 12 01              ldi16	r4, 0x112
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 0a 07              call16	report_text
 f0 02 01              ldi8	r2, 0x1
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f0 0d 0f              cmpi.s8	r1, 0xf
 d1 22                 brne8	avm_test_main+105
 f1 74                 zext8	r4
 cc 41                 cmpi.s8	r4, 0x41
 d1 1c                 brne8	avm_test_main+105
 c3 41                 ldi8	r7, 0x41
 c4 16 01              ldi16	r4, 0x116
 f0 16 20              leasp	r6, 0x20
 f2 30                 sub	r0, r0
 f4 a7                 tst8	r7
 d0 0c                 breq8	avm_test_main+103
 f7 05                 ld8u	r5, [r4+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3d                    cmp	r7, r5
 d0 f2                 breq8	avm_test_main+87
 d4 02                 jmp8	avm_test_main+105
 f1 10                 mov	r2, r0
 d6 ee                 adjsp	-0x12
 c4 15 cd              ldi16	r4, 0xcd15
 c5 5b 07              ldi16	r5, 0x75b
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 ce 0c              ldi16	r4, 0xcce
 c1 00                 ldi8	r5, 0x0
 f4 6c                 stsp16	[sp+0xb], r4
 f1 65                 stsp8	[sp+0xd], r5
 c4 00 01              ldi16	r4, 0x100
 f4 64                 stsp16	[sp+0x9], r4
 c4 d6 ff              ldi16	r4, 0xffd6
 f4 5c                 stsp16	[sp+0x7], r4
 c4 b2 0c              ldi16	r4, 0xcb2
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 10 32              leasp	r0, 0x32
 f0 38 00              stsp16	[sp+0x0], r0
 e1 51 07              call16	call_vsnprintf_P
 d6 12                 adjsp	0x12
 f1 0c                 mov	r1, r4
 c4 25 01              ldi16	r4, 0x125
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 9d 06              call16	report_text
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f0 0d 35              cmpi.s8	r1, 0x35
 d1 1c                 brne8	avm_test_main+205
 f1 74                 zext8	r4
 cc 31                 cmpi.s8	r4, 0x31
 d1 16                 brne8	avm_test_main+205
 c2 31                 ldi8	r6, 0x31
 c4 29 01              ldi16	r4, 0x129
 f0 15 20              leasp	r5, 0x20
 f4 a6                 tst8	r6
 d0 0e                 breq8	avm_test_main+209
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+191
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
 f0 10 3c              leasp	r0, 0x3c
 f0 38 00              stsp16	[sp+0x0], r0
 e1 16 06              call16	call_vsnprintf
 d6 1c                 adjsp	0x1c
 f1 0c                 mov	r1, r4
 c4 8d 01              ldi16	r4, 0x18d
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 1e 06              call16	report_text
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 f0 0d 37              cmpi.s8	r1, 0x37
 f0 00 04              ldi8	r0, 0x4
 d1 1c                 brne8	avm_test_main+335
 f1 75                 zext8	r5
 cd 2b                 cmpi.s8	r5, 0x2b
 d1 16                 brne8	avm_test_main+335
 c3 2b                 ldi8	r7, 0x2b
 c5 91 01              ldi16	r5, 0x191
 f0 16 20              leasp	r6, 0x20
 f4 a7                 tst8	r7
 d0 0c                 breq8	avm_test_main+337
 f7 0c                 ld8u	r4, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3c                    cmp	r7, r4
 d0 f2                 breq8	avm_test_main+321
 f9 41                 or	r2, r0
 d6 eb                 adjsp	-0x15
 c4 ce 0c              ldi16	r4, 0xcce
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
 f0 10 35              leasp	r0, 0x35
 f0 38 00              stsp16	[sp+0x0], r0
 e1 a7 05              call16	call_vsnprintf
 d6 15                 adjsp	0x15
 f1 0c                 mov	r1, r4
 c4 df 01              ldi16	r4, 0x1df
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 af 05              call16	report_text
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 f0 0d 14              cmpi.s8	r1, 0x14
 f0 00 08              ldi8	r0, 0x8
 d1 1c                 brne8	avm_test_main+446
 f1 75                 zext8	r5
 cd 61                 cmpi.s8	r5, 0x61
 d1 16                 brne8	avm_test_main+446
 c3 61                 ldi8	r7, 0x61
 c5 e3 01              ldi16	r5, 0x1e3
 f0 16 20              leasp	r6, 0x20
 f4 a7                 tst8	r7
 d0 0c                 breq8	avm_test_main+448
 f7 0c                 ld8u	r4, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3c                    cmp	r7, r4
 d0 f2                 breq8	avm_test_main+432
 f9 41                 or	r2, r0
 c1 0a                 ldi8	r5, 0xa
 f0 16 16              leasp	r6, 0x16
 c3 a5                 ldi8	r7, 0xa5
 f6 17                 st8	[r6+], r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+455
 c0 69                 ldi8	r4, 0x69
 f0 2c 1f              stsp8	[sp+0x1f], r4
 c0 5a                 ldi8	r4, 0x5a
 f0 2c 16              stsp8	[sp+0x16], r4
 d6 f8                 adjsp	-0x8
 c4 39 30              ldi16	r4, 0x3039
 f4 58                 stsp16	[sp+0x6], r4
 c4 f7 01              ldi16	r4, 0x1f7
 f4 50                 stsp16	[sp+0x4], r4
 f0 38 02              stsp16	[sp+0x2], r0
 f0 10 1f              leasp	r0, 0x1f
 f0 38 00              stsp16	[sp+0x0], r0
 e1 3f 05              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f1 0c                 mov	r1, r4
 c4 01 02              ldi16	r4, 0x201
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 e1 47 05              call16	report_text
 f0 0d 0c              cmpi.s8	r1, 0xc
 d1 3d                 brne8	avm_test_main+577
 f0 1c 17              ldsp8u	r4, [sp+0x17]
 cc 61                 cmpi.s8	r4, 0x61
 d1 17                 brne8	avm_test_main+546
 c3 61                 ldi8	r7, 0x61
 c5 05 02              ldi16	r5, 0x205
 f0 16 18              leasp	r6, 0x18
 f4 a7                 tst8	r7
 f8 00                 cset.eq	r0
 d0 0b                 breq8	avm_test_main+548
 f7 0c                 ld8u	r4, [r5+]
 f7 17                 ld8u	r7, [r6+]
 3c                    cmp	r7, r4
 d0 f3                 breq8	avm_test_main+531
 d4 02                 jmp8	avm_test_main+548
 f2 30                 sub	r0, r0
 f0 1d 1f              ldsp8u	r5, [sp+0x1f]
 f0 1e 1e              ldsp8u	r6, [sp+0x1e]
 f0 1f 16              ldsp8u	r7, [sp+0x16]
 f4 a0                 tst8	r0
 d0 10                 breq8	avm_test_main+577
 f1 77                 zext8	r7
 cf 5a                 cmpi.s8	r7, 0x5a
 d1 0a                 brne8	avm_test_main+577
 f4 a6                 tst8	r6
 d1 06                 brne8	avm_test_main+577
 f1 75                 zext8	r5
 cd 69                 cmpi.s8	r5, 0x69
 d0 04                 breq8	avm_test_main+581
 c0 10                 ldi8	r4, 0x10
 f9 51                 or	r2, r4
 f0 3a 10              stsp16	[sp+0x10], r2
 c4 78 79              ldi16	r4, 0x7978
 f0 3c 14              stsp16	[sp+0x14], r4
 d6 fa                 adjsp	-0x6
 c4 0c 02              ldi16	r4, 0x20c
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 f0 11 1a              leasp	r1, 0x1a
 f0 39 00              stsp16	[sp+0x0], r1
 e1 ce 04              call16	call_vsnprintf
 d6 06                 adjsp	0x6
 f1 04                 mov	r0, r4
 c4 12 02              ldi16	r4, 0x212
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 e1 d6 04              call16	report_text
 f0 1c 14              ldsp8u	r4, [sp+0x14]
 f4 78                 stsp16	[sp+0xe], r4
 f0 1b 15              ldsp8u	r3, [sp+0x15]
 d6 f8                 adjsp	-0x8
 c4 d2 04              ldi16	r4, 0x4d2
 f4 58                 stsp16	[sp+0x6], r4
 c4 15 02              ldi16	r4, 0x215
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e1 a3 04              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f0 01 30              ldi8	r1, 0x30
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 2e                 cmp	r7, r2
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f0 02 0f              ldi8	r2, 0xf
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f0 3f 12              stsp16	[sp+0x12], r7
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 f4 68                 stsp16	[sp+0xa], r4
 c9 37                 addi.s8	r5, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 f5 21                 cmp	r4, r1
 f4 28                 ldsp16	r4, [sp+0xa]
 fc 2c                 cmov.ult	r5, r4
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f8                 adjsp	-0x8
 c0 7b                 ldi8	r4, 0x7b
 f4 58                 stsp16	[sp+0x6], r4
 c4 1d 02              ldi16	r4, 0x21d
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 12 28              leasp	r2, 0x28
 f0 3a 00              stsp16	[sp+0x0], r2
 e1 1c 04              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f1 0c                 mov	r1, r4
 c4 2d 02              ldi16	r4, 0x22d
 f1 25                 mov	r5, r1
 f1 2a                 mov	r6, r2
 e1 24 04              call16	report_text
 c0 20                 ldi8	r4, 0x20
 f0 36 10              ldsp16	r6, [sp+0x10]
 92                    or	r4, r6
 f1 73                 zext8	r3
 f0 0f 79              cmpi.s8	r3, 0x79
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 fb 35                 cmov.eq	r6, r5
 f0 0c 05              cmpi.s8	r0, 0x5
 fb 26                 cmov.eq	r4, r6
 f0 00 40              ldi8	r0, 0x40
 f9 11                 or	r0, r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 cd 09                 cmpi.s8	r5, 0x9
 fb 04                 cmov.eq	r0, r4
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f0 0d ff              cmpi.s8	r1, -0x1
 f2 4b                 sub	r3, r3
 d1 1c                 brne8	avm_test_main+878
 f1 74                 zext8	r4
 cc 62                 cmpi.s8	r4, 0x62
 d1 16                 brne8	avm_test_main+878
 c2 62                 ldi8	r6, 0x62
 c4 31 02              ldi16	r4, 0x231
 f0 15 20              leasp	r5, 0x20
 f4 a6                 tst8	r6
 d0 0e                 breq8	avm_test_main+882
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+864
 c0 80                 ldi8	r4, 0x80
 f9 11                 or	r0, r4
 f0 38 02              stsp16	[sp+0x2], r0
 c4 78 79              ldi16	r4, 0x7978
 f0 3c 14              stsp16	[sp+0x14], r4
 d6 f8                 adjsp	-0x8
 c4 38 02              ldi16	r4, 0x238
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 58                 stsp16	[sp+0x6], r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 11 1c              leasp	r1, 0x1c
 f0 39 00              stsp16	[sp+0x0], r1
 e1 9f 03              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 c4 40 02              ldi16	r4, 0x240
 f4 69                 stsp16	[sp+0xa], r5
 f1 29                 mov	r6, r1
 e1 a8 03              call16	report_text
 f0 1c 15              ldsp8u	r4, [sp+0x15]
 f4 58                 stsp16	[sp+0x6], r4
 f0 1c 14              ldsp8u	r4, [sp+0x14]
 f4 60                 stsp16	[sp+0x8], r4
 d6 f8                 adjsp	-0x8
 c4 00 01              ldi16	r4, 0x100
 f4 58                 stsp16	[sp+0x6], r4
 c4 43 02              ldi16	r4, 0x243
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 28              leasp	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 e1 70 03              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 1c 21              ldsp8u	r4, [sp+0x21]
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 cd 30                 cmpi.s8	r5, 0x30
 f1 13                 mov	r2, r3
 d1 6e                 brne8	avm_test_main+1087
 f1 74                 zext8	r4
 cc 78                 cmpi.s8	r4, 0x78
 f1 13                 mov	r2, r3
 d1 66                 brne8	avm_test_main+1087
 c4 00 01              ldi16	r4, 0x100
 c5 00 a0              ldi16	r5, 0xa000
 31                    cmp	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 c2 30                 ldi8	r6, 0x30
 96                    or	r5, r6
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 22              ldsp8u	r5, [sp+0x22]
 34                    cmp	r5, r4
 f1 13                 mov	r2, r3
 d1 4d                 brne8	avm_test_main+1087
 c4 00 01              ldi16	r4, 0x100
 fa 78                 lsr16i	r4, 0x8
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 04                    mov	r5, r4
 96                    or	r5, r6
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 23              ldsp8u	r5, [sp+0x23]
 34                    cmp	r5, r4
 f1 13                 mov	r2, r3
 d1 35                 brne8	avm_test_main+1087
 c4 00 01              ldi16	r4, 0x100
 f1 74                 zext8	r4
 c1 a0                 ldi8	r5, 0xa0
 31                    cmp	r4, r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 96                    or	r5, r6
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 24              ldsp8u	r5, [sp+0x24]
 34                    cmp	r5, r4
 f1 13                 mov	r2, r3
 d1 1d                 brne8	avm_test_main+1087
 c4 00 01              ldi16	r4, 0x100
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 04                    mov	r5, r4
 96                    or	r5, r6
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 25              ldsp8u	r5, [sp+0x25]
 34                    cmp	r5, r4
 f1 13                 mov	r2, r3
 d1 07                 brne8	avm_test_main+1087
 f0 1c 26              ldsp8u	r4, [sp+0x26]
 f4 a4                 tst8	r4
 f8 02                 cset.eq	r2
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f0 01 30              ldi8	r1, 0x30
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 00 0f              ldi8	r0, 0xf
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 f4 78                 stsp16	[sp+0xe], r4
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 f0 34 10              ldsp16	r4, [sp+0x10]
 32                    cmp	r4, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 fc 3c                 cmov.ult	r7, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 56                 ldi8	r4, 0x56
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 3a 04              stsp16	[sp+0x4], r2
 f9 45                 or	r2, r1
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f5                 adjsp	-0xb
 c4 34 12              ldi16	r4, 0x1234
 f4 64                 stsp16	[sp+0x9], r4
 c4 a4 0c              ldi16	r4, 0xca4
 c1 00                 ldi8	r5, 0x0
 f4 58                 stsp16	[sp+0x6], r4
 f1 51                 stsp8	[sp+0x8], r5
 c4 46 02              ldi16	r4, 0x246
 f4 50                 stsp16	[sp+0x4], r4
 c0 50                 ldi8	r4, 0x50
 f4 48                 stsp16	[sp+0x2], r4
 f0 11 2b              leasp	r1, 0x2b
 f0 39 00              stsp16	[sp+0x0], r1
 e1 40 02              call16	call_vsnprintf
 d6 0b                 adjsp	0xb
 f4 78                 stsp16	[sp+0xe], r4
 f1 21                 mov	r4, r1
 e1 0e 03              call16	program_pointer_prefix_matches
 f0 1d 28              ldsp8u	r5, [sp+0x28]
 f4 a4                 tst8	r4
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 32 02              ldsp16	r2, [sp+0x2]
 d0 1d                 breq8	avm_test_main+1315
 f1 75                 zext8	r5
 cd 7c                 cmpi.s8	r5, 0x7c
 f2 4b                 sub	r3, r3
 d1 15                 brne8	avm_test_main+1315
 c2 7c                 ldi8	r6, 0x7c
 c4 4d 02              ldi16	r4, 0x24d
 f0 15 29              leasp	r5, 0x29
 f4 a6                 tst8	r6
 f8 03                 cset.eq	r3
 d0 07                 breq8	avm_test_main+1315
 f7 07                 ld8u	r7, [r4+]
 f7 0e                 ld8u	r6, [r5+]
 3b                    cmp	r6, r7
 d0 f3                 breq8	avm_test_main+1302
 f4 38                 ldsp16	r4, [sp+0xe]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f0 01 30              ldi8	r1, 0x30
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 00 0f              ldi8	r0, 0xf
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 3b                 ldsp16	r7, [sp+0xe]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 f4 40                 stsp16	[sp+0x0], r4
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 f4 38                 ldsp16	r4, [sp+0xe]
 32                    cmp	r4, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 3c                 cmov.ult	r7, r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 58                 ldi8	r4, 0x58
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 27                 mov	r5, r3
 f9 a5                 or	r5, r1
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f6                 adjsp	-0xa
 c4 a4 0c              ldi16	r4, 0xca4
 c1 00                 ldi8	r5, 0x0
 f4 5c                 stsp16	[sp+0x7], r4
 f1 55                 stsp8	[sp+0x9], r5
 c4 e3 0c              ldi16	r4, 0xce3
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 11 2a              leasp	r1, 0x2a
 f0 39 00              stsp16	[sp+0x0], r1
 e1 27 02              call16	call_vsnprintf_P
 d6 0a                 adjsp	0xa
 f0 3c 12              stsp16	[sp+0x12], r4
 f1 21                 mov	r4, r1
 e1 38 02              call16	program_pointer_prefix_matches
 f0 1d 29              ldsp8u	r5, [sp+0x29]
 f0 1e 28              ldsp8u	r6, [sp+0x28]
 f4 a4                 tst8	r4
 d0 15                 breq8	avm_test_main+1518
 f1 76                 zext8	r6
 ce 20                 cmpi.s8	r6, 0x20
 d1 0f                 brne8	avm_test_main+1518
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 09                 brne8	avm_test_main+1518
 f0 1c 2a              ldsp8u	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 f8 04                 cset.eq	r4
 f4 70                 stsp16	[sp+0xc], r4
 c4 00 01              ldi16	r4, 0x100
 f9 89                 or	r4, r2
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 75                 zext8	r5
 cd 79                 cmpi.s8	r5, 0x79
 04                    mov	r5, r4
 fb 2a                 cmov.eq	r5, r2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 fb 35                 cmov.eq	r6, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 cd ff                 cmpi.s8	r5, -0x1
 fb 26                 cmov.eq	r4, r6
 c5 00 02              ldi16	r5, 0x200
 94                    or	r5, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 ce 06                 cmpi.s8	r6, 0x6
 fb 2c                 cmov.eq	r5, r4
 c4 00 04              ldi16	r4, 0x400
 91                    or	r4, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 fb 2c                 cmov.eq	r5, r4
 c4 00 08              ldi16	r4, 0x800
 91                    or	r4, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 ce 0d                 cmpi.s8	r6, 0xd
 fb 25                 cmov.eq	r4, r5
 f0 37 12              ldsp16	r7, [sp+0x12]
 f1 77                 zext8	r7
 c2 a0                 ldi8	r6, 0xa0
 3e                    cmp	r7, r6
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f0 01 30              ldi8	r1, 0x30
 f9 a5                 or	r5, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 6b                 stsp16	[sp+0xa], r7
 c5 00 10              ldi16	r5, 0x1000
 94                    or	r5, r4
 f4 a3                 tst8	r3
 fb 6c                 cmov.ne	r5, r4
 c4 00 20              ldi16	r4, 0x2000
 91                    or	r4, r5
 f0 37 12              ldsp16	r7, [sp+0x12]
 cf 0a                 cmpi.s8	r7, 0xa
 fb 25                 cmov.eq	r4, r5
 c5 00 40              ldi16	r5, 0x4000
 94                    or	r5, r4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 07                    mov	r5, r7
 f0 02 0f              ldi8	r2, 0xf
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 36 12              ldsp16	r6, [sp+0x12]
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 63                 stsp16	[sp+0x8], r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 59                 ldi8	r4, 0x59
 d7 00                 sys	debug_putc
 f9 05                 or	r0, r1
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 35 10              ldsp16	r5, [sp+0x10]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 f9 85                 or	r4, r1
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f6 2d                 tst16	r5
 f8 0c                 cset.ne	r4
 d6 70                 adjsp	0x70
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
 d6 f8                 adjsp	-0x8
 f4 49                 stsp16	[sp+0x2], r5
 0c                    mov	r7, r4
 43                    ld8u	r4, [r7]
 f4 a4                 tst8	r4
 d0 0d                 breq8	report_text+25
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8e 21              ld8u	r4, [r7+1]
 f4 af                 inc16	r7
 f4 a4                 tst8	r4
 d1 f3                 brne8	report_text+12
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 fa 74                 lsr16i	r4, 0x4
 f0 01 30              ldi8	r1, 0x30
 f4 50                 stsp16	[sp+0x4], r4
 f4 13                 ldsp16	r7, [sp+0x4]
 f9 e5                 or	r7, r1
 f4 53                 stsp16	[sp+0x4], r7
 c8 37                 addi.s8	r4, 0x37
 f4 58                 stsp16	[sp+0x6], r4
 c0 a0                 ldi8	r4, 0xa0
 f4 03                 ldsp16	r7, [sp+0x0]
 3c                    cmp	r7, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 fc 27                 cmov.ult	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 f0 00 0f              ldi8	r0, 0xf
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 53                 stsp16	[sp+0x4], r7
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 f4 43                 stsp16	[sp+0x0], r7
 c7 00 a0              ldi16	r7, 0xa000
 37                    cmp	r5, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 fc 3c                 cmov.ult	r7, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 f9 35                 or	r1, r5
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 29                 cmov.ult	r5, r1
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 d7 00                 sys	debug_putc
 c0 5b                 ldi8	r4, 0x5b
 d7 00                 sys	debug_putc
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 0d                 breq8	report_text+153
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	report_text+140
 c0 5d                 ldi8	r4, 0x5d
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 08                 adjsp	0x8
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
 c6 a4 0c              ldi16	r6, 0xca4
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
 c6 a4 0c              ldi16	r6, 0xca4
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
 c6 a4 0c              ldi16	r6, 0xca4
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

<avm_halt>:
 d4 fe                 jmp8	avm_halt
