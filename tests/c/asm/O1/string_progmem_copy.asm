
string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000041e l     F .text	0000004a avm_run_constructors
00000468 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_progmem_copy.c
00000f51 l     O .rodata	00000004 p_cat
00000f55 l     O .rodata	00000007 p_abcdef
00000f5c l     O .rodata	00000004 p_dog
00000f60 l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
00000f68 l     O .rodata	00000005 p_wood
00000f6d l     O .rodata	00000007 p_flower
00000f74 l     O .rodata	00000005 p_berg
00000f79 l     O .rodata	00000001 p_empty
00000f7a l     O .rodata	00000003 p_go
00000118 l     O .data	00000107 avm_test_main.long_pad
00000f7d l     O .rodata	00000002 p_z
0000021f l     O .data	0000010e avm_test_main.long_cat
0000032d l     O .data	00000003 .L.str
00000330 l     O .data	00000003 .L.str.1
00000333 l     O .data	00000003 .L.str.2
00000336 l     O .data	00000003 .L.str.3
00000339 l     O .data	00000003 .L.str.4
0000033c l     O .data	00000003 .L.str.5
0000033f l     O .data	00000003 .L.str.6
00000342 l     O .data	00000003 .L.str.7
00000345 l     O .data	00000003 .L.str.8
00000348 l     O .data	00000003 .L.str.9
0000034b l     O .data	00000003 .L.str.10
0000034e l     O .data	00000003 .L.str.11
00000351 l     O .data	0000000a avm_test_main.expect_pad
0000035b l     O .data	00000007 avm_test_main.expect_trunc
00000362 l     O .data	00000006 avm_test_main.expect_exact
00000368 l     O .data	00000005 avm_test_main.expect_zero
0000036d l     O .data	00000008 .L.str.12
00000375 l     O .data	00000007 .L.str.13
0000037c l     O .data	00000004 .L.str.14
00000380 l     O .data	00000004 .L.str.15
00000384 l     O .data	00000003 .L.str.16
00000000 l    df *ABS*	00000000 runtime.c
00000f7f l       .init_array	00000000 .hidden __init_array_end
00000f7f l       .init_array	00000000 .hidden __init_array_start
00000f7f l       .fini_array	00000000 .hidden __fini_array_start
00000f7f l       .fini_array	00000000 .hidden __fini_array_end
00000400 g     F .text	0000001e _start
000004ed g     F .text	00000a62 avm_test_main
00000f4f g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000004d7 g     F .text	0000000b test_call_strncpy_P
000004e2 g     F .text	0000000b test_call_strncat_P

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 e7 00              call16	avm_test_main
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
 e1 31 0b              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7f 0f              ldi16	r4, 0xf7f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 7f 0f              ldi16	r6, 0xf7f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 7f 0f           ldi16	r0, 0xf7f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7f 0f           ldi16	r2, 0xf7f
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
 e1 81 fb              call16	-1151
 c4 7f 0f              ldi16	r4, 0xf7f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 7f 0f              ldi16	r6, 0xf7f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 7f 0f           ldi16	r2, 0xf7f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7f 0f           ldi16	r0, 0xf7f
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
 e1 30 fb              call16	-1232
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_call_strncpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 16                 sys	strncpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<test_call_strncat_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 17                 sys	strncat_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 f6                 adjsp	-0xa
 c0 0a                 ldi8	r4, 0xa
 f0 15 80              leasp	r5, 0x80
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+15
 c0 07                 ldi8	r4, 0x7
 f0 15 79              leasp	r5, 0x79
 c2 cc                 ldi8	r6, 0xcc
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+30
 c0 06                 ldi8	r4, 0x6
 f0 15 73              leasp	r5, 0x73
 c2 7e                 ldi8	r6, 0x7e
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+45
 c0 05                 ldi8	r4, 0x5
 f0 15 6e              leasp	r5, 0x6e
 c2 3c                 ldi8	r6, 0x3c
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+60
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 51 0f              ldi16	r6, 0xf51
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 82              leasp	r4, 0x82
 d5 94                 call8	test_call_strncpy_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 55 0f              ldi16	r6, 0xf55
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 7b              leasp	r4, 0x7b
 d5 80                 call8	test_call_strncpy_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 c6 5c 0f              ldi16	r6, 0xf5c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 75              leasp	r4, 0x75
 e1 6b ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 60 0f              ldi16	r6, 0xf60
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 f2 4b                 sub	r3, r3
 f0 3b 00              stsp16	[sp+0x0], r3
 f0 14 70              leasp	r4, 0x70
 e1 55 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 f0 01 0c              ldi8	r1, 0xc
 c5 00 01              ldi16	r5, 0x100
 f0 10 62              leasp	r0, 0x62
 f1 20                 mov	r4, r0
 c2 0c                 ldi8	r6, 0xc
 d7 0f                 sys	memcpy
 c5 0c 01              ldi16	r5, 0x10c
 f0 12 56              leasp	r2, 0x56
 f1 22                 mov	r4, r2
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 4e              stsp16	[sp+0x4e], r4
 f0 3d 50              stsp16	[sp+0x50], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 3d 54              stsp16	[sp+0x54], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e 46              stsp16	[sp+0x46], r6
 f0 3f 48              stsp16	[sp+0x48], r7
 f0 3c 4a              stsp16	[sp+0x4a], r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 68 0f              ldi16	r6, 0xf68
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e1 03 ff              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 6d 0f              ldi16	r6, 0xf6d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 e1 ef fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 74 0f              ldi16	r6, 0xf74
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 50              leasp	r4, 0x50
 e1 db fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 c6 79 0f              ldi16	r6, 0xf79
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 48              leasp	r4, 0x48
 e1 c6 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 00 02              ldi8	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 06 7a 0f           ldi16	r2, 0xf7a
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 14 40              leasp	r4, 0x40
 f2 6b                 mov32	q3, q1
 e1 ab fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c4 07 01              ldi16	r4, 0x107
 c5 18 01              ldi16	r5, 0x118
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+340
 d6 fe                 adjsp	-0x2
 c4 04 01              ldi16	r4, 0x104
 f4 40                 stsp16	[sp+0x0], r4
 c6 7d 0f              ldi16	r6, 0xf7d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 18 01              ldi16	r4, 0x118
 e1 7a fe              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c4 01 01              ldi16	r4, 0x101
 c5 1f 02              ldi16	r5, 0x21f
 c2 64                 ldi8	r6, 0x64
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+378
 a0                    xor	r4, r4
 f0 4c 20 03           stm8	[0x320], r4
 c4 21 03              ldi16	r4, 0x321
 c1 b6                 ldi8	r5, 0xb6
 f6 05                 st8	[r4+], r5
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f8                 brne8	avm_test_main+396
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 c4 1f 02              ldi16	r4, 0x21f
 f2 6b                 mov32	q3, q1
 e1 54 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 c1 0e                 ldi8	r5, 0xe
 f0 14 80              leasp	r4, 0x80
 f0 00 9c              ldi8	r0, 0x9c
 f0 3f 3c              stsp16	[sp+0x3c], r7
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 f0 37 3c              ldsp16	r7, [sp+0x3c]
 f7 03                 ld8u	r3, [r4+]
 f9 7a                 xor	r3, r6
 c9 ef                 addi.s8	r5, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 f2 2b                 add	r6, r3
 f5 2c                 cmp	r7, r0
 d1 e5                 brne8	avm_test_main+433
 f4 41                 stsp16	[sp+0x0], r5
 f2 2f                 add	r7, r3
 f0 3f 3c              stsp16	[sp+0x3c], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 79              leasp	r4, 0x79
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 01                 ld8u	r1, [r4+]
 f9 36                 xor	r1, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 f2 25                 add	r5, r1
 cf 69                 cmpi.s8	r7, 0x69
 d1 ea                 brne8	avm_test_main+479
 f0 38 02              stsp16	[sp+0x2], r0
 f2 2d                 add	r7, r1
 f4 5b                 stsp16	[sp+0x6], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 73              leasp	r4, 0x73
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 58                 cmpi.s8	r7, 0x58
 d1 ec                 brne8	avm_test_main+520
 f0 38 04              stsp16	[sp+0x4], r0
 f4 62                 stsp16	[sp+0x8], r6
 1e                    add	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 6e              leasp	r4, 0x6e
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 47                 cmpi.s8	r7, 0x47
 d1 ec                 brne8	avm_test_main+560
 f0 38 0a              stsp16	[sp+0xa], r0
 f4 7a                 stsp16	[sp+0xe], r6
 1e                    add	r7, r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 16 62              leasp	r6, 0x62
 f0 02 be              ldi8	r2, 0xbe
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f7 14                 ld8u	r4, [r6+]
 a1                    xor	r4, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 14                    add	r5, r4
 f5 2e                 cmp	r7, r2
 d1 ec                 brne8	avm_test_main+604
 f0 38 10              stsp16	[sp+0x10], r0
 f0 3c 14              stsp16	[sp+0x14], r4
 1c                    add	r7, r4
 f0 3f 18              stsp16	[sp+0x18], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 16 56              leasp	r6, 0x56
 03                    mov	r4, r7
 0d                    mov	r7, r5
 fa ab                 lsr16i	r7, 0xb
 fa 45                 lsl16i	r5, 0x5
 97                    or	r5, r7
 0c                    mov	r7, r4
 f7 14                 ld8u	r4, [r6+]
 a1                    xor	r4, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 14                    add	r5, r4
 f5 2e                 cmp	r7, r2
 d1 ea                 brne8	avm_test_main+646
 f0 38 16              stsp16	[sp+0x16], r0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 1c                    add	r7, r4
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 4e              leasp	r4, 0x4e
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+690
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3e 20              stsp16	[sp+0x20], r6
 1e                    add	r7, r6
 f0 3f 24              stsp16	[sp+0x24], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 46              leasp	r4, 0x46
 f0 04 18 01           ldi16	r0, 0x118
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+736
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3e 26              stsp16	[sp+0x26], r6
 1e                    add	r7, r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 3e              leasp	r4, 0x3e
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+778
 f0 3a 28              stsp16	[sp+0x28], r2
 f0 3e 2c              stsp16	[sp+0x2c], r6
 1e                    add	r7, r6
 f0 3f 30              stsp16	[sp+0x30], r7
 c4 2b 6d              ldi16	r4, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 6c e1              ld8u	r7, [r0+]
 ac                    xor	r7, r4
 f0 0a ef              addi.s8	r2, -0x11
 ca 11                 addi.s8	r6, 0x11
 02                    mov	r4, r6
 13                    add	r4, r7
 c5 69 11              ldi16	r5, 0x1169
 39                    cmp	r6, r5
 d1 e9                 brne8	avm_test_main+817
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3f 32              stsp16	[sp+0x32], r7
 1b                    add	r6, r7
 f0 3e 36              stsp16	[sp+0x36], r6
 c4 2b 6d              ldi16	r4, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 04 1f 02           ldi16	r0, 0x21f
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 6c e1              ld8u	r7, [r0+]
 ac                    xor	r7, r4
 f0 0a ef              addi.s8	r2, -0x11
 ca 11                 addi.s8	r6, 0x11
 02                    mov	r4, r6
 13                    add	r4, r7
 c5 e0 11              ldi16	r5, 0x11e0
 39                    cmp	r6, r5
 d1 e9                 brne8	avm_test_main+863
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3f 38              stsp16	[sp+0x38], r7
 1b                    add	r6, r7
 f0 3e 3a              stsp16	[sp+0x3a], r6
 c0 52                 ldi8	r4, 0x52
 c7 2e 03              ldi16	r7, 0x32e
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+901
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 c7 31 03              ldi16	r7, 0x331
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+939
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 4c                 sub	r3, r4
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f0 00 30              ldi8	r0, 0x30
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 3d                 cmov.ult	r7, r5
 c0 0f                 ldi8	r4, 0xf
 f9 70                 and	r3, r4
 f1 23                 mov	r4, r3
 f9 81                 or	r4, r0
 f0 0f 0a              cmpi.s8	r3, 0xa
 f0 0b 37              addi.s8	r3, 0x37
 fc 1c                 cmov.ult	r3, r4
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f0 06 00 a0           ldi16	r2, 0xa000
 f5 26                 cmp	r5, r2
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 c0 0f                 ldi8	r4, 0xf
 84                    and	r5, r4
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
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 c7 34 03              ldi16	r7, 0x334
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1049
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f0 03 30              ldi8	r3, 0x30
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 c3 0f                 ldi8	r7, 0xf
 f1 17                 mov	r2, r7
 f9 28                 and	r1, r2
 f1 21                 mov	r4, r1
 f9 8d                 or	r4, r3
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 37                    cmp	r5, r7
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 c7 37 03              ldi16	r7, 0x337
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1161
 f0 32 08              ldsp16	r2, [sp+0x8]
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 44                 sub	r2, r4
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 01 0f              ldi8	r1, 0xf
 f9 44                 and	r2, r1
 f1 22                 mov	r4, r2
 f9 8d                 or	r4, r3
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 0a 37              addi.s8	r2, 0x37
 fc 14                 cmov.ult	r2, r4
 f4 31                 ldsp16	r5, [sp+0xc]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 37                    cmp	r5, r7
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c1 4e                 ldi8	r5, 0x4e
 c7 3a 03              ldi16	r7, 0x33a
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f7 1e                 ld8u	r6, [r7+]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 06                    mov	r5, r6
 d1 f4                 brne8	avm_test_main+1275
 f4 28                 ldsp16	r4, [sp+0xa]
 f2 44                 sub	r2, r4
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f0 00 a0              ldi8	r0, 0xa0
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f9 44                 and	r2, r1
 f1 22                 mov	r4, r2
 f9 8d                 or	r4, r3
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 0a 37              addi.s8	r2, 0x37
 fc 14                 cmov.ult	r2, r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 37                    cmp	r5, r7
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 c7 3d 03              ldi16	r7, 0x33d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1384
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f2 44                 sub	r2, r4
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f9 44                 and	r2, r1
 f1 22                 mov	r4, r2
 f9 8d                 or	r4, r3
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 0a 37              addi.s8	r2, 0x37
 fc 14                 cmov.ult	r2, r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 37                    cmp	r5, r7
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c1 43                 ldi8	r5, 0x43
 c7 40 03              ldi16	r7, 0x340
 f7 1e                 ld8u	r6, [r7+]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 06                    mov	r5, r6
 d1 f4                 brne8	avm_test_main+1493
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 34 16              ldsp16	r4, [sp+0x16]
 f2 44                 sub	r2, r4
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f9 44                 and	r2, r1
 f1 22                 mov	r4, r2
 f9 8d                 or	r4, r3
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 0a 37              addi.s8	r2, 0x37
 fc 14                 cmov.ult	r2, r4
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 37                    cmp	r5, r7
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 c7 43 03              ldi16	r7, 0x343
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1603
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 24                    sub	r5, r4
 09                    mov	r6, r5
 f1 76                 zext8	r6
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 37 24              ldsp16	r7, [sp+0x24]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f0 06 00 a0           ldi16	r2, 0xa000
 f5 2e                 cmp	r7, r2
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 c7 46 03              ldi16	r7, 0x346
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1708
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 34 22              ldsp16	r4, [sp+0x22]
 24                    sub	r5, r4
 09                    mov	r6, r5
 f1 76                 zext8	r6
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 f0 3c 26              stsp16	[sp+0x26], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 3c                    cmp	r7, r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 c7 49 03              ldi16	r7, 0x349
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1817
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f0 34 28              ldsp16	r4, [sp+0x28]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 02 0f              ldi8	r2, 0xf
 f9 28                 and	r1, r2
 f1 21                 mov	r4, r1
 f9 8d                 or	r4, r3
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f0 37 30              ldsp16	r7, [sp+0x30]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 2c                 cmp	r7, r0
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 c7 4c 03              ldi16	r7, 0x34c
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1926
 f0 31 32              ldsp16	r1, [sp+0x32]
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f0 00 a0              ldi8	r0, 0xa0
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 02 0f              ldi8	r2, 0xf
 f9 28                 and	r1, r2
 f1 21                 mov	r4, r1
 f9 8d                 or	r4, r3
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f0 37 36              ldsp16	r7, [sp+0x36]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 f0 3c 3c              stsp16	[sp+0x3c], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 3c                    cmp	r7, r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 c7 4f 03              ldi16	r7, 0x34f
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+2042
 f0 31 38              ldsp16	r1, [sp+0x38]
 f0 34 34              ldsp16	r4, [sp+0x34]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 02 0f              ldi8	r2, 0xf
 f9 28                 and	r1, r2
 f1 21                 mov	r4, r1
 f9 8d                 or	r4, r3
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 f0 3c 3c              stsp16	[sp+0x3c], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 3c                    cmp	r7, r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 f9 7d                 or	r3, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3b                 cmov.ult	r7, r3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c4 03 01              ldi16	r4, 0x103
 c5 19 01              ldi16	r5, 0x119
 f0 46 18 01           ldm8u	r6, [0x118]
 ce 5a                 cmpi.s8	r6, 0x5a
 f8 06                 cset.eq	r6
 f2 30                 sub	r0, r0
 f1 0e                 mov	r1, r6
 f7 0f                 ld8u	r7, [r5+]
 f4 a7                 tst8	r7
 f1 28                 mov	r6, r0
 fb 31                 cmov.eq	r6, r1
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f0                 brne8	avm_test_main+2165
 c0 09                 ldi8	r4, 0x9
 f0 05 51 03           ldi16	r1, 0x351
 f0 17 80              leasp	r7, 0x80
 f0 45 23 03           ldm8u	r5, [0x323]
 f0 3d 34              stsp16	[sp+0x34], r5
 f0 45 22 03           ldm8u	r5, [0x322]
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 45 21 03           ldm8u	r5, [0x321]
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 45 20 03           ldm8u	r5, [0x320]
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 45 1e 02           ldm8u	r5, [0x21e]
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 45 1d 02           ldm8u	r5, [0x21d]
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 45 1c 02           ldm8u	r5, [0x21c]
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 00 01              ldi8	r0, 0x1
 f0 6c 63              ld8u	r3, [r1+]
 f7 1a                 ld8u	r2, [r7+]
 f6 2c                 tst16	r4
 f8 0d                 cset.ne	r5
 f4 b4                 dec16	r4
 f5 13                 cmp	r2, r3
 d1 06                 brne8	avm_test_main+2263
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+2242
 c0 01                 ldi8	r4, 0x1
 f0 37 3c              ldsp16	r7, [sp+0x3c]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 3d                    cmp	r7, r5
 f8 05                 cset.eq	r5
 f5 13                 cmp	r2, r3
 db 71 01              brne16	avm_test_main+2649
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 3e 3c              stsp16	[sp+0x3c], r6
 c2 06                 ldi8	r6, 0x6
 c7 5b 03              ldi16	r7, 0x35b
 f0 13 79              leasp	r3, 0x79
 f0 01 01              ldi8	r1, 0x1
 f7 1d                 ld8u	r5, [r7+]
 f0 6c 47              ld8u	r2, [r3+]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 f4 b6                 dec16	r6
 f5 15                 cmp	r2, r5
 d1 06                 brne8	avm_test_main+2318
 f9 04                 and	r0, r1
 f4 a0                 tst8	r0
 d1 eb                 brne8	avm_test_main+2297
 f5 15                 cmp	r2, r5
 db 46 01              brne16	avm_test_main+2649
 c2 05                 ldi8	r6, 0x5
 f0 07 62 03           ldi16	r3, 0x362
 f0 11 73              leasp	r1, 0x73
 c3 01                 ldi8	r7, 0x1
 f0 6c 47              ld8u	r2, [r3+]
 f0 6c 03              ld8u	r0, [r1+]
 f6 2e                 tst16	r6
 f8 0d                 cset.ne	r5
 f4 b6                 dec16	r6
 f5 02                 cmp	r0, r2
 d1 05                 brne8	avm_test_main+2355
 87                    and	r5, r7
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+2334
 f5 02                 cmp	r0, r2
 db 21 01              brne16	avm_test_main+2649
 f0 05 68 03           ldi16	r1, 0x368
 f0 12 6e              leasp	r2, 0x6e
 c3 04                 ldi8	r7, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 63              ld8u	r3, [r1+]
 f0 6c 05              ld8u	r0, [r2+]
 f6 2f                 tst16	r7
 f8 0d                 cset.ne	r5
 f4 b7                 dec16	r7
 f5 03                 cmp	r0, r3
 d1 05                 brne8	avm_test_main+2392
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+2371
 f0 1d 62              ldsp8u	r5, [sp+0x62]
 f5 03                 cmp	r0, r3
 db f9 00              brne16	avm_test_main+2649
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db f2 00              brne16	avm_test_main+2649
 c3 72                 ldi8	r7, 0x72
 c5 6e 03              ldi16	r5, 0x36e
 f0 16 62              leasp	r6, 0x62
 f2 39                 sub	r1, r1
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+2435
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2417
 e0 d6 00              jmp16	avm_test_main+2649
 f0 1d 56              ldsp8u	r5, [sp+0x56]
 cd 73                 cmpi.s8	r5, 0x73
 db ce 00              brne16	avm_test_main+2649
 c3 73                 ldi8	r7, 0x73
 c5 76 03              ldi16	r5, 0x376
 f0 16 56              leasp	r6, 0x56
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+2469
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2451
 e0 b4 00              jmp16	avm_test_main+2649
 f0 1d 4e              ldsp8u	r5, [sp+0x4e]
 cd 69                 cmpi.s8	r5, 0x69
 db ac 00              brne16	avm_test_main+2649
 c3 69                 ldi8	r7, 0x69
 c5 7d 03              ldi16	r5, 0x37d
 f0 16 4e              leasp	r6, 0x4e
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+2503
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2485
 e0 92 00              jmp16	avm_test_main+2649
 f0 1d 46              ldsp8u	r5, [sp+0x46]
 cd 6f                 cmpi.s8	r5, 0x6f
 db 8a 00              brne16	avm_test_main+2649
 c3 6f                 ldi8	r7, 0x6f
 c5 81 03              ldi16	r5, 0x381
 f0 16 46              leasp	r6, 0x46
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2536
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2519
 d4 71                 jmp8	avm_test_main+2649
 f0 00 01              ldi8	r0, 0x1
 f0 1c 3e              ldsp8u	r4, [sp+0x3e]
 cc 67                 cmpi.s8	r4, 0x67
 f1 20                 mov	r4, r0
 d1 34                 brne8	avm_test_main+2600
 c2 67                 ldi8	r6, 0x67
 c4 85 03              ldi16	r4, 0x385
 f0 15 3e              leasp	r5, 0x3e
 f4 a6                 tst8	r6
 d0 0c                 breq8	avm_test_main+2572
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+2556
 d4 03                 jmp8	avm_test_main+2575
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 c0 01                 ldi8	r4, 0x1
 f9 86                 xor	r4, r1
 f0 37 30              ldsp16	r7, [sp+0x30]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 09                    mov	r6, r5
 3e                    cmp	r7, r6
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 32              ldsp16	r4, [sp+0x32]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f6 2d                 tst16	r5
 f8 06                 cset.eq	r6
 98                    or	r6, r4
 f0 35 34              ldsp16	r5, [sp+0x34]
 f1 75                 zext8	r5
 c0 b6                 ldi8	r4, 0xb6
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f0 34 36              ldsp16	r4, [sp+0x36]
 f1 74                 zext8	r4
 cc 67                 cmpi.s8	r4, 0x67
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 38              ldsp16	r6, [sp+0x38]
 f1 76                 zext8	r6
 ce 6f                 cmpi.s8	r6, 0x6f
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 91                    or	r4, r5
 f9 80                 and	r4, r0
 d6 7f                 adjsp	0x7f
 d6 0b                 adjsp	0xb
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
