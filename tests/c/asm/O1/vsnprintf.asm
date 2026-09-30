
vsnprintf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 vsnprintf.c
000011b1 l     O .rodata	00000006 .L.avm.flashstr.1
00000100 l     O .data	00000004 avm_test_main.ram_text
00000104 l     O .data	0000000e .L.str
00000112 l     O .data	00000003 .L.str.1
00001176 l     F .text	00000016 call_vsnprintf
0000026a l     O .data	00000003 .L.str.34
0000026d l     O .data	00000003 .L.str.35
00000115 l     O .data	00000010 .L.str.2
000011d3 l     O .rodata	00000015 program_long
000011b7 l     O .rodata	0000001c program_format
00000125 l     O .data	00000003 .L.str.3
0000118c l     F .text	0000001b call_vsnprintf_P
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
00000220 l     O .data	00000010 .L.str.19
00000230 l     O .data	00000003 .L.str.20
00000233 l     O .data	00000008 .L.str.21
0000023b l     O .data	00000008 .L.str.22
00000243 l     O .data	00000003 .L.str.23
00000246 l     O .data	00000003 .L.str.24
00000249 l     O .data	00000003 .L.str.25
0000024c l     O .data	00000003 .L.str.26
000011a9 l     O .rodata	00000008 .L.avm.flashstr.0
0000024f l     O .data	00000006 .L.str.27
00000255 l     O .data	00000006 .L.str.28
0000025b l     O .data	00000003 .L.str.29
0000025e l     O .data	00000003 .L.str.30
000011e8 l     O .rodata	00000006 .L.avm.flashstr.2
00000261 l     O .data	00000003 .L.str.31
00000264 l     O .data	00000003 .L.str.32
00000267 l     O .data	00000003 .L.str.33
00000000 l    df *ABS*	00000000 runtime.c
000011ee l       .init_array	00000000 .hidden __init_array_end
000011ee l       .init_array	00000000 .hidden __init_array_start
000011ee l       .fini_array	00000000 .hidden __fini_array_start
000011ee l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003d7 g     F .text	00000d9f avm_test_main
000011a7 g     F .text	00000002 avm_halt
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
 e1 89 0e              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ee 11              ldi16	r4, 0x11ee
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ee 11              ldi16	r6, 0x11ee
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 ee 11           ldi16	r0, 0x11ee
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ee 11           ldi16	r2, 0x11ee
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
 c4 ee 11              ldi16	r4, 0x11ee
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ee 11              ldi16	r6, 0x11ee
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 ee 11           ldi16	r2, 0x11ee
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ee 11           ldi16	r0, 0x11ee
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
 c4 b1 11              ldi16	r4, 0x11b1
 c1 00                 ldi8	r5, 0x0
 f4 68                 stsp16	[sp+0xa], r4
 f1 61                 stsp8	[sp+0xc], r5
 c4 00 01              ldi16	r4, 0x100
 f4 60                 stsp16	[sp+0x8], r4
 c0 5a                 ldi8	r4, 0x5a
 f4 58                 stsp16	[sp+0x6], r4
 c4 04 01              ldi16	r4, 0x104
 f4 50                 stsp16	[sp+0x4], r4
 f0 01 50              ldi8	r1, 0x50
 f0 39 02              stsp16	[sp+0x2], r1
 f0 14 2d              leasp	r4, 0x2d
 f4 40                 stsp16	[sp+0x0], r4
 f0 02 52              ldi8	r2, 0x52
 f0 04 13 01           ldi16	r0, 0x113
 e1 6b 0d              call16	call_vsnprintf
 d6 0d                 adjsp	0xd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 6c a1              ld8u	r5, [r0+]
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 15                 mov	r2, r5
 d1 f1                 brne8	avm_test_main+57
 f0 36 12              ldsp16	r6, [sp+0x12]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 f0 00 30              ldi8	r0, 0x30
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 22                 cmp	r4, r2
 fc 3d                 cmov.ult	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 02 0f              ldi8	r2, 0xf
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2b                 cmp	r6, r3
 fc 2c                 cmov.ult	r5, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 c7 6b 02              ldi16	r7, 0x26b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+166
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f4 a4                 tst8	r4
 d0 10                 breq8	avm_test_main+200
 f0 15 20              leasp	r5, 0x20
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8a 21              ld8u	r4, [r5+1]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+187
 c0 5d                 ldi8	r4, 0x5d
 c7 6e 02              ldi16	r7, 0x26e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+205
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f0 03 01              ldi8	r3, 0x1
 f0 35 12              ldsp16	r5, [sp+0x12]
 cd 0f                 cmpi.s8	r5, 0xf
 d1 28                 brne8	avm_test_main+269
 f1 74                 zext8	r4
 cc 41                 cmpi.s8	r4, 0x41
 d1 22                 brne8	avm_test_main+269
 c3 41                 ldi8	r7, 0x41
 c4 16 01              ldi16	r4, 0x116
 f0 16 20              leasp	r6, 0x20
 f2 30                 sub	r0, r0
 f4 a7                 tst8	r7
 d0 0f                 breq8	avm_test_main+264
 f7 05                 ld8u	r5, [r4+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3d                    cmp	r7, r5
 d0 f2                 breq8	avm_test_main+245
 f0 00 30              ldi8	r0, 0x30
 d4 05                 jmp8	avm_test_main+269
 f1 18                 mov	r3, r0
 f0 00 30              ldi8	r0, 0x30
 a0                    xor	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 d6 ee                 adjsp	-0x12
 c4 15 cd              ldi16	r4, 0xcd15
 c5 5b 07              ldi16	r5, 0x75b
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 d3 11              ldi16	r4, 0x11d3
 c1 00                 ldi8	r5, 0x0
 f4 6c                 stsp16	[sp+0xb], r4
 f1 65                 stsp8	[sp+0xd], r5
 c4 00 01              ldi16	r4, 0x100
 f4 64                 stsp16	[sp+0x9], r4
 c4 d6 ff              ldi16	r4, 0xffd6
 f4 5c                 stsp16	[sp+0x7], r4
 c4 b7 11              ldi16	r4, 0x11b7
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 14 32              leasp	r4, 0x32
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 26 01           ldi16	r2, 0x126
 e1 70 0c              call16	call_vsnprintf_P
 d6 12                 adjsp	0x12
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 6c a5              ld8u	r5, [r2+]
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 0d                 mov	r1, r5
 d1 f1                 brne8	avm_test_main+330
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f0 01 0f              ldi8	r1, 0xf
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 f4 78                 stsp16	[sp+0xe], r4
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 33                    cmp	r4, r7
 f4 38                 ldsp16	r4, [sp+0xe]
 fc 2c                 cmov.ult	r5, r4
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 c7 6b 02              ldi16	r7, 0x26b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+442
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f4 a4                 tst8	r4
 d0 10                 breq8	avm_test_main+476
 f0 15 20              leasp	r5, 0x20
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8a 21              ld8u	r4, [r5+1]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+463
 c0 5d                 ldi8	r4, 0x5d
 c7 6e 02              ldi16	r7, 0x26e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+481
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f0 35 12              ldsp16	r5, [sp+0x12]
 cd 35                 cmpi.s8	r5, 0x35
 d1 1c                 brne8	avm_test_main+530
 f1 74                 zext8	r4
 cc 31                 cmpi.s8	r4, 0x31
 d1 16                 brne8	avm_test_main+530
 c2 31                 ldi8	r6, 0x31
 c4 29 01              ldi16	r4, 0x129
 f0 15 20              leasp	r5, 0x20
 f4 a6                 tst8	r6
 d0 0e                 breq8	avm_test_main+534
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+516
 c0 02                 ldi8	r4, 0x2
 f9 71                 or	r3, r4
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
 f0 02 50              ldi8	r2, 0x50
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 14 3c              leasp	r4, 0x3c
 f4 40                 stsp16	[sp+0x0], r4
 f0 00 49              ldi8	r0, 0x49
 f0 05 8e 01           ldi16	r1, 0x18e
 e1 37 0b              call16	call_vsnprintf
 d6 1c                 adjsp	0x1c
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 6c a3              ld8u	r5, [r1+]
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 05                 mov	r0, r5
 d1 f1                 brne8	avm_test_main+621
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 00 30              ldi8	r0, 0x30
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f0 01 0f              ldi8	r1, 0xf
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 f4 78                 stsp16	[sp+0xe], r4
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 33                    cmp	r4, r7
 f4 38                 ldsp16	r4, [sp+0xe]
 fc 2c                 cmov.ult	r5, r4
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 c7 6b 02              ldi16	r7, 0x26b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+736
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f4 a4                 tst8	r4
 d0 10                 breq8	avm_test_main+770
 f0 15 20              leasp	r5, 0x20
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8a 21              ld8u	r4, [r5+1]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+757
 c0 5d                 ldi8	r4, 0x5d
 c7 6e 02              ldi16	r7, 0x26e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+775
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc 37                 cmpi.s8	r4, 0x37
 f0 00 04              ldi8	r0, 0x4
 d1 1c                 brne8	avm_test_main+827
 f1 75                 zext8	r5
 cd 2b                 cmpi.s8	r5, 0x2b
 d1 16                 brne8	avm_test_main+827
 c3 2b                 ldi8	r7, 0x2b
 c5 91 01              ldi16	r5, 0x191
 f0 16 20              leasp	r6, 0x20
 f4 a7                 tst8	r7
 d0 0c                 breq8	avm_test_main+829
 f7 0c                 ld8u	r4, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3c                    cmp	r7, r4
 d0 f2                 breq8	avm_test_main+813
 f9 61                 or	r3, r0
 d6 eb                 adjsp	-0x15
 c4 d3 11              ldi16	r4, 0x11d3
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
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 14 35              leasp	r4, 0x35
 f4 40                 stsp16	[sp+0x0], r4
 f0 00 44              ldi8	r0, 0x44
 f0 05 e0 01           ldi16	r1, 0x1e0
 e1 24 0a              call16	call_vsnprintf
 d6 15                 adjsp	0x15
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 6c a3              ld8u	r5, [r1+]
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 05                 mov	r0, r5
 d1 f1                 brne8	avm_test_main+896
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 00 30              ldi8	r0, 0x30
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f0 01 0f              ldi8	r1, 0xf
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 f4 78                 stsp16	[sp+0xe], r4
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 33                    cmp	r4, r7
 f4 38                 ldsp16	r4, [sp+0xe]
 fc 2c                 cmov.ult	r5, r4
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 c7 6b 02              ldi16	r7, 0x26b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1011
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f4 a4                 tst8	r4
 d0 10                 breq8	avm_test_main+1045
 f0 15 20              leasp	r5, 0x20
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8a 21              ld8u	r4, [r5+1]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1032
 c0 5d                 ldi8	r4, 0x5d
 c7 6e 02              ldi16	r7, 0x26e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1050
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc 14                 cmpi.s8	r4, 0x14
 f0 00 08              ldi8	r0, 0x8
 d1 1c                 brne8	avm_test_main+1102
 f1 75                 zext8	r5
 cd 61                 cmpi.s8	r5, 0x61
 d1 16                 brne8	avm_test_main+1102
 c3 61                 ldi8	r7, 0x61
 c5 e3 01              ldi16	r5, 0x1e3
 f0 16 20              leasp	r6, 0x20
 f4 a7                 tst8	r7
 d0 0c                 breq8	avm_test_main+1104
 f7 0c                 ld8u	r4, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 3c                    cmp	r7, r4
 d0 f2                 breq8	avm_test_main+1088
 f9 61                 or	r3, r0
 c1 0a                 ldi8	r5, 0xa
 f0 16 16              leasp	r6, 0x16
 c3 a5                 ldi8	r7, 0xa5
 f6 17                 st8	[r6+], r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+1111
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
 f0 14 1f              leasp	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 f0 00 54              ldi8	r0, 0x54
 f0 05 02 02           ldi16	r1, 0x202
 e1 18 09              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 6c a3              ld8u	r5, [r1+]
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 05                 mov	r0, r5
 d1 f1                 brne8	avm_test_main+1164
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 00 30              ldi8	r0, 0x30
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f0 01 0f              ldi8	r1, 0xf
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 f4 78                 stsp16	[sp+0xe], r4
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 33                    cmp	r4, r7
 f4 38                 ldsp16	r4, [sp+0xe]
 fc 2c                 cmov.ult	r5, r4
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 c7 6b 02              ldi16	r7, 0x26b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1279
 f0 18 17              ldsp8u	r0, [sp+0x17]
 f4 a0                 tst8	r0
 d0 0f                 breq8	avm_test_main+1312
 f0 15 18              leasp	r5, 0x18
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f7 0c                 ld8u	r4, [r5+]
 f4 a4                 tst8	r4
 d1 f6                 brne8	avm_test_main+1302
 c0 5d                 ldi8	r4, 0x5d
 c5 6e 02              ldi16	r5, 0x26e
 f7 0f                 ld8u	r7, [r5+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a7                 tst8	r7
 03                    mov	r4, r7
 d1 f5                 brne8	avm_test_main+1317
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc 0c                 cmpi.s8	r4, 0xc
 d1 3b                 brne8	avm_test_main+1394
 f0 0c 61              cmpi.s8	r0, 0x61
 d1 17                 brne8	avm_test_main+1363
 c3 61                 ldi8	r7, 0x61
 c5 05 02              ldi16	r5, 0x205
 f0 16 18              leasp	r6, 0x18
 f4 a7                 tst8	r7
 f8 00                 cset.eq	r0
 d0 0b                 breq8	avm_test_main+1365
 f7 0c                 ld8u	r4, [r5+]
 f7 17                 ld8u	r7, [r6+]
 3c                    cmp	r7, r4
 d0 f3                 breq8	avm_test_main+1348
 d4 02                 jmp8	avm_test_main+1365
 f2 30                 sub	r0, r0
 f0 1d 1f              ldsp8u	r5, [sp+0x1f]
 f0 1e 1e              ldsp8u	r6, [sp+0x1e]
 f0 1f 16              ldsp8u	r7, [sp+0x16]
 f4 a0                 tst8	r0
 d0 10                 breq8	avm_test_main+1394
 f1 77                 zext8	r7
 cf 5a                 cmpi.s8	r7, 0x5a
 d1 0a                 brne8	avm_test_main+1394
 f4 a6                 tst8	r6
 d1 06                 brne8	avm_test_main+1394
 f1 75                 zext8	r5
 cd 69                 cmpi.s8	r5, 0x69
 d0 04                 breq8	avm_test_main+1398
 c0 10                 ldi8	r4, 0x10
 f9 71                 or	r3, r4
 c4 78 79              ldi16	r4, 0x7978
 f0 3c 14              stsp16	[sp+0x14], r4
 d6 fa                 adjsp	-0x6
 c4 0c 02              ldi16	r4, 0x20c
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 1a              leasp	r4, 0x1a
 f4 40                 stsp16	[sp+0x0], r4
 f0 00 4e              ldi8	r0, 0x4e
 f0 05 13 02           ldi16	r1, 0x213
 e1 09 08              call16	call_vsnprintf
 d6 06                 adjsp	0x6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 6c a3              ld8u	r5, [r1+]
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 05                 mov	r0, r5
 d1 f1                 brne8	avm_test_main+1435
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f0 00 30              ldi8	r0, 0x30
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 01 0f              ldi8	r1, 0xf
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 78                 stsp16	[sp+0xe], r4
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 32                    cmp	r4, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 fc 3c                 cmov.ult	r7, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
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
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 c7 6b 02              ldi16	r7, 0x26b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1551
 f0 1f 14              ldsp8u	r7, [sp+0x14]
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+1586
 f0 16 14              leasp	r6, 0x14
 03                    mov	r4, r7
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1573
 f4 63                 stsp16	[sp+0x8], r7
 f0 3b 0c              stsp16	[sp+0xc], r3
 c0 5d                 ldi8	r4, 0x5d
 c7 6e 02              ldi16	r7, 0x26e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1596
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
 f0 01 4e              ldi8	r1, 0x4e
 f0 04 1e 02           ldi16	r0, 0x21e
 e1 39 07              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 6c a1              ld8u	r5, [r0+]
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 0d                 mov	r1, r5
 d1 f1                 brne8	avm_test_main+1643
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f0 00 30              ldi8	r0, 0x30
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 01 0f              ldi8	r1, 0xf
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 58                 stsp16	[sp+0x6], r4
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 f0 34 10              ldsp16	r4, [sp+0x10]
 32                    cmp	r4, r6
 f4 18                 ldsp16	r4, [sp+0x6]
 fc 3c                 cmov.ult	r7, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
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
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f8                 adjsp	-0x8
 c0 7b                 ldi8	r4, 0x7b
 f4 58                 stsp16	[sp+0x6], r4
 c4 20 02              ldi16	r4, 0x220
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 14 28              leasp	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 f0 01 45              ldi8	r1, 0x45
 f0 04 31 02           ldi16	r0, 0x231
 e1 a6 06              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f4 78                 stsp16	[sp+0xe], r4
 f0 6c a1              ld8u	r5, [r0+]
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 0d                 mov	r1, r5
 d1 f1                 brne8	avm_test_main+1789
 f4 38                 ldsp16	r4, [sp+0xe]
 08                    mov	r6, r4
 0c                    mov	r7, r4
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f0 00 30              ldi8	r0, 0x30
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f0 01 0f              ldi8	r1, 0xf
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 f4 38                 ldsp16	r4, [sp+0xe]
 33                    cmp	r4, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 2c                 cmov.ult	r5, r4
 f4 3b                 ldsp16	r7, [sp+0xe]
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 c7 6b 02              ldi16	r7, 0x26b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1899
 c0 20                 ldi8	r4, 0x20
 f4 32                 ldsp16	r6, [sp+0xc]
 92                    or	r4, r6
 f1 73                 zext8	r3
 f0 0f 79              cmpi.s8	r3, 0x79
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 fb 35                 cmov.eq	r6, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 cd 05                 cmpi.s8	r5, 0x5
 fb 26                 cmov.eq	r4, r6
 f0 00 40              ldi8	r0, 0x40
 f9 11                 or	r0, r4
 f0 35 10              ldsp16	r5, [sp+0x10]
 cd 09                 cmpi.s8	r5, 0x9
 fb 04                 cmov.eq	r0, r4
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f4 a4                 tst8	r4
 d0 10                 breq8	avm_test_main+1972
 f0 15 20              leasp	r5, 0x20
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8a 21              ld8u	r4, [r5+1]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+1959
 c0 5d                 ldi8	r4, 0x5d
 c7 6e 02              ldi16	r7, 0x26e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1977
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 f4 39                 ldsp16	r5, [sp+0xe]
 cd ff                 cmpi.s8	r5, -0x1
 d1 1c                 brne8	avm_test_main+2025
 f1 74                 zext8	r4
 cc 62                 cmpi.s8	r4, 0x62
 d1 16                 brne8	avm_test_main+2025
 c2 62                 ldi8	r6, 0x62
 c4 34 02              ldi16	r4, 0x234
 f0 15 20              leasp	r5, 0x20
 f4 a6                 tst8	r6
 d0 0e                 breq8	avm_test_main+2029
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+2011
 c0 80                 ldi8	r4, 0x80
 f9 11                 or	r0, r4
 f0 38 04              stsp16	[sp+0x4], r0
 c4 78 79              ldi16	r4, 0x7978
 f0 3c 14              stsp16	[sp+0x14], r4
 d6 f8                 adjsp	-0x8
 c4 3b 02              ldi16	r4, 0x23b
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f4 58                 stsp16	[sp+0x6], r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 1c              leasp	r4, 0x1c
 f4 40                 stsp16	[sp+0x0], r4
 f0 01 4f              ldi8	r1, 0x4f
 f0 04 44 02           ldi16	r0, 0x244
 e1 8d 05              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 6c a1              ld8u	r5, [r0+]
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 0d                 mov	r1, r5
 d1 f1                 brne8	avm_test_main+2071
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f0 00 30              ldi8	r0, 0x30
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 01 0f              ldi8	r1, 0xf
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 37 12              ldsp16	r7, [sp+0x12]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 78                 stsp16	[sp+0xe], r4
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 f0 34 12              ldsp16	r4, [sp+0x12]
 32                    cmp	r4, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 fc 3c                 cmov.ult	r7, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
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
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c0 3a                 ldi8	r4, 0x3a
 c7 6b 02              ldi16	r7, 0x26b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+2187
 f0 1f 14              ldsp8u	r7, [sp+0x14]
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2222
 f0 16 14              leasp	r6, 0x14
 03                    mov	r4, r7
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d1 f3                 brne8	avm_test_main+2209
 f4 63                 stsp16	[sp+0x8], r7
 c0 5d                 ldi8	r4, 0x5d
 c7 6e 02              ldi16	r7, 0x26e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+2229
 f0 1c 15              ldsp8u	r4, [sp+0x15]
 f4 58                 stsp16	[sp+0x6], r4
 d6 f8                 adjsp	-0x8
 c4 00 01              ldi16	r4, 0x100
 f4 58                 stsp16	[sp+0x6], r4
 c4 46 02              ldi16	r4, 0x246
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 14 28              leasp	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 e1 c3 04              call16	call_vsnprintf
 d6 08                 adjsp	0x8
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 1c 21              ldsp8u	r4, [sp+0x21]
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 cd 30                 cmpi.s8	r5, 0x30
 d1 62                 brne8	avm_test_main+2381
 f1 74                 zext8	r4
 cc 78                 cmpi.s8	r4, 0x78
 d1 5c                 brne8	avm_test_main+2381
 c7 00 01              ldi16	r7, 0x100
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 57                 addi.s8	r4, 0x57
 c6 00 a0              ldi16	r6, 0xa000
 3e                    cmp	r7, r6
 fc 25                 cmov.ult	r4, r5
 f0 1d 22              ldsp8u	r5, [sp+0x22]
 34                    cmp	r5, r4
 d1 45                 brne8	avm_test_main+2381
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 23              ldsp8u	r5, [sp+0x23]
 34                    cmp	r5, r4
 d1 30                 brne8	avm_test_main+2381
 03                    mov	r4, r7
 f1 74                 zext8	r4
 c1 a0                 ldi8	r5, 0xa0
 31                    cmp	r4, r5
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 57                 addi.s8	r4, 0x57
 fc 25                 cmov.ult	r4, r5
 f0 1d 24              ldsp8u	r5, [sp+0x24]
 34                    cmp	r5, r4
 d1 1b                 brne8	avm_test_main+2381
 c0 0f                 ldi8	r4, 0xf
 8c                    and	r7, r4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 57                 addi.s8	r7, 0x57
 fc 3c                 cmov.ult	r7, r4
 f0 1c 25              ldsp8u	r4, [sp+0x25]
 33                    cmp	r4, r7
 d1 09                 brne8	avm_test_main+2381
 f0 1c 26              ldsp8u	r4, [sp+0x26]
 f4 a4                 tst8	r4
 f8 04                 cset.eq	r4
 f4 68                 stsp16	[sp+0xa], r4
 c6 4a 02              ldi16	r6, 0x24a
 f7 15                 ld8u	r5, [r6+]
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 15                 mov	r2, r5
 d1 f2                 brne8	avm_test_main+2384
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 01 0f              ldi8	r1, 0xf
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 f0 34 10              ldsp16	r4, [sp+0x10]
 32                    cmp	r4, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 fc 3c                 cmov.ult	r7, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
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
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 c7 4d 02              ldi16	r7, 0x24d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+2498
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 f9 81                 or	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f5                 adjsp	-0xb
 c4 34 12              ldi16	r4, 0x1234
 f4 64                 stsp16	[sp+0x9], r4
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 f4 58                 stsp16	[sp+0x6], r4
 f1 51                 stsp8	[sp+0x8], r5
 c4 4f 02              ldi16	r4, 0x24f
 f4 50                 stsp16	[sp+0x4], r4
 f0 01 50              ldi8	r1, 0x50
 f0 39 02              stsp16	[sp+0x2], r1
 f0 14 2b              leasp	r4, 0x2b
 f4 40                 stsp16	[sp+0x0], r4
 e1 97 03              call16	call_vsnprintf
 d6 0b                 adjsp	0xb
 f4 78                 stsp16	[sp+0xe], r4
 f2 4b                 sub	r3, r3
 f0 1c 21              ldsp8u	r4, [sp+0x21]
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 cd 30                 cmpi.s8	r5, 0x30
 db b5 00              brne16	avm_test_main+2766
 f1 74                 zext8	r4
 cc 78                 cmpi.s8	r4, 0x78
 db ae 00              brne16	avm_test_main+2766
 c1 f0                 ldi8	r5, 0xf0
 c3 00                 ldi8	r7, 0x0
 8d                    and	r7, r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 22              ldsp8u	r6, [sp+0x22]
 38                    cmp	r6, r4
 db 95 00              brne16	avm_test_main+2766
 c1 00                 ldi8	r5, 0x0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 23              ldsp8u	r6, [sp+0x23]
 38                    cmp	r6, r4
 d1 7f                 brne8	avm_test_main+2766
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 c6 00 a0              ldi16	r6, 0xa000
 32                    cmp	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 24              ldsp8u	r6, [sp+0x24]
 38                    cmp	r6, r4
 d1 67                 brne8	avm_test_main+2766
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 fa 78                 lsr16i	r4, 0x8
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 25              ldsp8u	r6, [sp+0x25]
 38                    cmp	r6, r4
 d1 4e                 brne8	avm_test_main+2766
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 f1 74                 zext8	r4
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 26              ldsp8u	r6, [sp+0x26]
 38                    cmp	r6, r4
 d1 35                 brne8	avm_test_main+2766
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 28              ldsp8u	r6, [sp+0x28]
 f0 1f 27              ldsp8u	r7, [sp+0x27]
 3c                    cmp	r7, r4
 d1 1b                 brne8	avm_test_main+2766
 f1 76                 zext8	r6
 ce 7c                 cmpi.s8	r6, 0x7c
 d1 15                 brne8	avm_test_main+2766
 c2 7c                 ldi8	r6, 0x7c
 c4 56 02              ldi16	r4, 0x256
 f0 15 29              leasp	r5, 0x29
 f4 a6                 tst8	r6
 f8 03                 cset.eq	r3
 d0 07                 breq8	avm_test_main+2766
 f7 07                 ld8u	r7, [r4+]
 f7 0e                 ld8u	r6, [r5+]
 3b                    cmp	r6, r7
 d0 f3                 breq8	avm_test_main+2753
 c6 5c 02              ldi16	r6, 0x25c
 f7 15                 ld8u	r5, [r6+]
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 f1 0d                 mov	r1, r5
 d1 f2                 brne8	avm_test_main+2769
 f4 38                 ldsp16	r4, [sp+0xe]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 01 0f              ldi8	r1, 0xf
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 3b                 ldsp16	r7, [sp+0xe]
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 f4 48                 stsp16	[sp+0x2], r4
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 f4 38                 ldsp16	r4, [sp+0xe]
 32                    cmp	r4, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 fc 3c                 cmov.ult	r7, r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
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
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 c7 5f 02              ldi16	r7, 0x25f
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+2879
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 f6                 adjsp	-0xa
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 f4 5c                 stsp16	[sp+0x7], r4
 f1 55                 stsp8	[sp+0x9], r5
 c4 e8 11              ldi16	r4, 0x11e8
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 e1 39 02              call16	call_vsnprintf_P
 d6 0a                 adjsp	0xa
 f4 70                 stsp16	[sp+0xc], r4
 f2 39                 sub	r1, r1
 f0 1d 21              ldsp8u	r5, [sp+0x21]
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 cc 30                 cmpi.s8	r4, 0x30
 f1 21                 mov	r4, r1
 db a2 00              brne16	avm_test_main+3121
 f1 75                 zext8	r5
 cd 78                 cmpi.s8	r5, 0x78
 f1 21                 mov	r4, r1
 db 99 00              brne16	avm_test_main+3121
 c1 f0                 ldi8	r5, 0xf0
 c3 00                 ldi8	r7, 0x0
 8d                    and	r7, r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 22              ldsp8u	r6, [sp+0x22]
 38                    cmp	r6, r4
 f1 21                 mov	r4, r1
 d1 7f                 brne8	avm_test_main+3121
 c1 00                 ldi8	r5, 0x0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 23              ldsp8u	r6, [sp+0x23]
 38                    cmp	r6, r4
 f1 21                 mov	r4, r1
 d1 67                 brne8	avm_test_main+3121
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 c6 00 a0              ldi16	r6, 0xa000
 32                    cmp	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 24              ldsp8u	r6, [sp+0x24]
 38                    cmp	r6, r4
 f1 21                 mov	r4, r1
 d1 4d                 brne8	avm_test_main+3121
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 fa 78                 lsr16i	r4, 0x8
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 25              ldsp8u	r6, [sp+0x25]
 38                    cmp	r6, r4
 f1 21                 mov	r4, r1
 d1 32                 brne8	avm_test_main+3121
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 f1 74                 zext8	r4
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 26              ldsp8u	r6, [sp+0x26]
 38                    cmp	r6, r4
 f1 21                 mov	r4, r1
 d1 17                 brne8	avm_test_main+3121
 c4 a9 11              ldi16	r4, 0x11a9
 c1 00                 ldi8	r5, 0x0
 c2 0f                 ldi8	r6, 0xf
 82                    and	r4, r6
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 57                 addi.s8	r4, 0x57
 fc 26                 cmov.ult	r4, r6
 f0 1e 27              ldsp8u	r6, [sp+0x27]
 38                    cmp	r6, r4
 f8 04                 cset.eq	r4
 f0 1d 29              ldsp8u	r5, [sp+0x29]
 f0 1e 28              ldsp8u	r6, [sp+0x28]
 f4 a4                 tst8	r4
 d0 13                 breq8	avm_test_main+3150
 f1 76                 zext8	r6
 ce 20                 cmpi.s8	r6, 0x20
 d1 0d                 brne8	avm_test_main+3150
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 07                 brne8	avm_test_main+3150
 f0 1c 2a              ldsp8u	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 f8 01                 cset.eq	r1
 c0 50                 ldi8	r4, 0x50
 c7 62 02              ldi16	r7, 0x262
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+3155
 f4 30                 ldsp16	r4, [sp+0xc]
 0c                    mov	r7, r4
 04                    mov	r5, r4
 f1 77                 zext8	r7
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 02 0f              ldi8	r2, 0xf
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 ca 37                 addi.s8	r6, 0x37
 c5 00 a0              ldi16	r5, 0xa000
 f4 30                 ldsp16	r4, [sp+0xc]
 31                    cmp	r4, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 fc 34                 cmov.ult	r6, r4
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 c7 65 02              ldi16	r7, 0x265
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+3262
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 c7 68 02              ldi16	r7, 0x268
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+3300
 c4 00 01              ldi16	r4, 0x100
 f4 12                 ldsp16	r6, [sp+0x4]
 92                    or	r4, r6
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 75                 zext8	r5
 cd 79                 cmpi.s8	r5, 0x79
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 fb 35                 cmov.eq	r6, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 cd ff                 cmpi.s8	r5, -0x1
 fb 26                 cmov.eq	r4, r6
 c5 00 02              ldi16	r5, 0x200
 94                    or	r5, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 ce 06                 cmpi.s8	r6, 0x6
 fb 2c                 cmov.eq	r5, r4
 c4 00 04              ldi16	r4, 0x400
 91                    or	r4, r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 2e                 tst16	r6
 fb 2c                 cmov.eq	r5, r4
 c4 00 08              ldi16	r4, 0x800
 91                    or	r4, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 ce 0d                 cmpi.s8	r6, 0xd
 fb 25                 cmov.eq	r4, r5
 c5 00 10              ldi16	r5, 0x1000
 94                    or	r5, r4
 f4 a3                 tst8	r3
 fb 6c                 cmov.ne	r5, r4
 c4 00 20              ldi16	r4, 0x2000
 91                    or	r4, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 ce 0a                 cmpi.s8	r6, 0xa
 fb 25                 cmov.eq	r4, r5
 c5 00 40              ldi16	r5, 0x4000
 94                    or	r5, r4
 f4 a1                 tst8	r1
 fb 6c                 cmov.ne	r5, r4
 09                    mov	r6, r5
 0d                    mov	r7, r5
 f0 3f 12              stsp16	[sp+0x12], r7
 f1 76                 zext8	r6
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 0f                 ldi8	r4, 0xf
 f1 0c                 mov	r1, r4
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 fa 7c                 lsr16i	r4, 0xc
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f6 2c                 tst16	r4
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

<avm_halt>:
 d4 fe                 jmp8	avm_halt
