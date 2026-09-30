
string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000041e l     F .text	0000004a avm_run_constructors
00000468 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_progmem_copy.c
00000abf l     F .text	0000002f fill_bytes
00000c63 l     O .rodata	00000004 p_cat
00000c67 l     O .rodata	00000007 p_abcdef
00000c6e l     O .rodata	00000004 p_dog
00000c72 l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
00000118 l     O .data	00000008 .L__const.avm_test_main.nochange
00000120 l     O .data	00000008 .L__const.avm_test_main.empty_source
00000c7a l     O .rodata	00000005 p_wood
00000c7f l     O .rodata	00000007 p_flower
00000c86 l     O .rodata	00000005 p_berg
00000c8b l     O .rodata	00000001 p_empty
00000c8c l     O .rodata	00000003 p_go
00000128 l     O .data	00000107 avm_test_main.long_pad
00000c8f l     O .rodata	00000002 p_z
0000022f l     O .data	0000010e avm_test_main.long_cat
00000aee l     F .text	0000004e hash_bytes
0000033d l     O .data	00000003 .L.str
00000b3c l     F .text	0000001d test_line16
00000340 l     O .data	00000003 .L.str.1
00000343 l     O .data	00000003 .L.str.2
00000346 l     O .data	00000003 .L.str.3
00000349 l     O .data	00000003 .L.str.4
0000034c l     O .data	00000003 .L.str.5
0000034f l     O .data	00000003 .L.str.6
00000352 l     O .data	00000003 .L.str.7
00000355 l     O .data	00000003 .L.str.8
00000358 l     O .data	00000003 .L.str.9
0000035b l     O .data	00000003 .L.str.10
0000035e l     O .data	00000003 .L.str.11
00000361 l     O .data	0000000a avm_test_main.expect_pad
00000b59 l     F .text	00000047 bytes_equal
0000036b l     O .data	00000007 avm_test_main.expect_trunc
00000372 l     O .data	00000006 avm_test_main.expect_exact
00000378 l     O .data	00000005 avm_test_main.expect_zero
0000037d l     O .data	00000008 .L.str.12
00000ba0 l     F .text	00000040 text_equal
00000385 l     O .data	00000007 .L.str.13
0000038c l     O .data	00000004 .L.str.14
00000390 l     O .data	00000004 .L.str.15
00000394 l     O .data	00000003 .L.str.16
00000be0 l     F .text	00000022 test_puts
00000c02 l     F .text	0000000b test_putc
00000c0d l     F .text	0000000f test_hex16
00000c1c l     F .text	00000019 test_hex8
00000c35 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000c91 l       .init_array	00000000 .hidden __init_array_end
00000c91 l       .init_array	00000000 .hidden __init_array_start
00000c91 l       .fini_array	00000000 .hidden __fini_array_start
00000c91 l       .fini_array	00000000 .hidden __fini_array_end
00000400 g     F .text	0000001e _start
00000505 g     F .text	000005ba avm_test_main
00000c61 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000004d7 g     F .text	00000017 test_call_strncpy_P
000004ee g     F .text	00000017 test_call_strncat_P

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 ff 00              call16	avm_test_main
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
 e1 43 08              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 91 0c              ldi16	r4, 0xc91
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 91 0c              ldi16	r6, 0xc91
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 91 0c           ldi16	r0, 0xc91
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 91 0c           ldi16	r2, 0xc91
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
 c4 91 0c              ldi16	r4, 0xc91
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 91 0c              ldi16	r6, 0xc91
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 91 0c           ldi16	r2, 0xc91
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 91 0c           ldi16	r0, 0xc91
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
 d6 fb                 adjsp	-0x5
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 4c                 stsp16	[sp+0x3], r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 f4 0c                 ldsp16	r4, [sp+0x3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 f4 21                 ldsp16	r5, [sp+0x8]
 d7 16                 sys	strncpy_p
 d6 05                 adjsp	0x5
 ef                    ret

<test_call_strncat_P>:
 d6 fb                 adjsp	-0x5
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 4c                 stsp16	[sp+0x3], r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 f4 0c                 ldsp16	r4, [sp+0x3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 f4 21                 ldsp16	r5, [sp+0x8]
 d7 17                 sys	strncat_p
 d6 05                 adjsp	0x5
 ef                    ret

<avm_test_main>:
 d6 80                 adjsp	-0x80
 d6 e2                 adjsp	-0x1e
 f0 14 94              leasp	r4, 0x94
 f0 3c 18              stsp16	[sp+0x18], r4
 c1 a5                 ldi8	r5, 0xa5
 c2 0a                 ldi8	r6, 0xa
 e1 a9 05              call16	fill_bytes
 f0 14 8d              leasp	r4, 0x8d
 f0 3c 12              stsp16	[sp+0x12], r4
 c1 cc                 ldi8	r5, 0xcc
 c2 07                 ldi8	r6, 0x7
 e1 9c 05              call16	fill_bytes
 f0 14 87              leasp	r4, 0x87
 f0 3c 14              stsp16	[sp+0x14], r4
 c1 7e                 ldi8	r5, 0x7e
 c2 06                 ldi8	r6, 0x6
 e1 8f 05              call16	fill_bytes
 f0 14 82              leasp	r4, 0x82
 f0 3c 16              stsp16	[sp+0x16], r4
 c1 3c                 ldi8	r5, 0x3c
 c2 05                 ldi8	r6, 0x5
 e1 82 05              call16	fill_bytes
 f0 34 18              ldsp16	r4, [sp+0x18]
 d6 fe                 adjsp	-0x2
 c1 08                 ldi8	r5, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 c6 63 0c              ldi16	r6, 0xc63
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d5 88                 call8	test_call_strncpy_P
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 3d 80              stsp16	[sp+0x80], r5
 d6 fe                 adjsp	-0x2
 c1 03                 ldi8	r5, 0x3
 f4 41                 stsp16	[sp+0x0], r5
 c6 67 0c              ldi16	r6, 0xc67
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 6f ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3d 7e              stsp16	[sp+0x7e], r5
 d6 fe                 adjsp	-0x2
 c1 04                 ldi8	r5, 0x4
 f4 41                 stsp16	[sp+0x0], r5
 c6 6e 0c              ldi16	r6, 0xc6e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 56 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 3d 7c              stsp16	[sp+0x7c], r5
 d6 fe                 adjsp	-0x2
 a5                    xor	r5, r5
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f4 41                 stsp16	[sp+0x0], r5
 c6 72 0c              ldi16	r6, 0xc72
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 3b ff              call16	test_call_strncpy_P
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 d6 02                 adjsp	0x2
 08                    mov	r6, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 3e 7a              stsp16	[sp+0x7a], r6
 f0 3c 78              stsp16	[sp+0x78], r4
 f0 34 80              ldsp16	r4, [sp+0x80]
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+185
 d4 00                 jmp8	avm_test_main+174
 f0 34 78              ldsp16	r4, [sp+0x78]
 c1 01                 ldi8	r5, 0x1
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+185
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 f0 15 8d              leasp	r5, 0x8d
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+207
 d4 00                 jmp8	avm_test_main+196
 f0 34 78              ldsp16	r4, [sp+0x78]
 c1 02                 ldi8	r5, 0x2
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+207
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 f0 15 87              leasp	r5, 0x87
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+229
 d4 00                 jmp8	avm_test_main+218
 f0 34 78              ldsp16	r4, [sp+0x78]
 c1 04                 ldi8	r5, 0x4
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+229
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 f0 15 82              leasp	r5, 0x82
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+251
 d4 00                 jmp8	avm_test_main+240
 f0 34 78              ldsp16	r4, [sp+0x78]
 c1 08                 ldi8	r5, 0x8
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+251
 c6 00 01              ldi16	r6, 0x100
 c3 0c                 ldi8	r7, 0xc
 f0 14 6c              leasp	r4, 0x6c
 f0 3c 10              stsp16	[sp+0x10], r4
 04                    mov	r5, r4
 b4                    push16	r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 0b                    mov	r6, r7
 d7 0f                 sys	memcpy
 04                    mov	r5, r4
 c6 0c 01              ldi16	r6, 0x10c
 bc                    pop16	r4
 f0 15 60              leasp	r5, 0x60
 f4 71                 stsp16	[sp+0xc], r5
 b4                    push16	r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 0b                    mov	r6, r7
 d7 0f                 sys	memcpy
 04                    mov	r5, r4
 f0 45 1f 01           ldm8u	r5, [0x11f]
 bc                    pop16	r4
 f0 2d 5f              stsp8	[sp+0x5f], r5
 f0 45 1e 01           ldm8u	r5, [0x11e]
 f0 2d 5e              stsp8	[sp+0x5e], r5
 f0 45 1d 01           ldm8u	r5, [0x11d]
 f0 2d 5d              stsp8	[sp+0x5d], r5
 f0 45 1c 01           ldm8u	r5, [0x11c]
 f0 2d 5c              stsp8	[sp+0x5c], r5
 f0 45 1b 01           ldm8u	r5, [0x11b]
 f0 2d 5b              stsp8	[sp+0x5b], r5
 f0 45 1a 01           ldm8u	r5, [0x11a]
 f0 2d 5a              stsp8	[sp+0x5a], r5
 f0 45 19 01           ldm8u	r5, [0x119]
 f0 2d 59              stsp8	[sp+0x59], r5
 f0 45 18 01           ldm8u	r5, [0x118]
 f0 2d 58              stsp8	[sp+0x58], r5
 f0 45 27 01           ldm8u	r5, [0x127]
 f0 2d 57              stsp8	[sp+0x57], r5
 f0 45 26 01           ldm8u	r5, [0x126]
 f0 2d 56              stsp8	[sp+0x56], r5
 f0 45 25 01           ldm8u	r5, [0x125]
 f0 2d 55              stsp8	[sp+0x55], r5
 f0 45 24 01           ldm8u	r5, [0x124]
 f0 2d 54              stsp8	[sp+0x54], r5
 f0 45 23 01           ldm8u	r5, [0x123]
 f0 2d 53              stsp8	[sp+0x53], r5
 f0 45 22 01           ldm8u	r5, [0x122]
 f0 2d 52              stsp8	[sp+0x52], r5
 f0 45 21 01           ldm8u	r5, [0x121]
 f0 2d 51              stsp8	[sp+0x51], r5
 f0 45 20 01           ldm8u	r5, [0x120]
 f0 2d 50              stsp8	[sp+0x50], r5
 a5                    xor	r5, r5
 f4 79                 stsp16	[sp+0xe], r5
 f0 2d 4f              stsp8	[sp+0x4f], r5
 f0 2d 4e              stsp8	[sp+0x4e], r5
 f0 2d 4d              stsp8	[sp+0x4d], r5
 f0 2d 4c              stsp8	[sp+0x4c], r5
 f0 2d 4b              stsp8	[sp+0x4b], r5
 f0 2d 4a              stsp8	[sp+0x4a], r5
 f0 2d 49              stsp8	[sp+0x49], r5
 f0 2d 48              stsp8	[sp+0x48], r5
 d6 fe                 adjsp	-0x2
 c1 08                 ldi8	r5, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 c6 7a 0c              ldi16	r6, 0xc7a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 2f fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 3d 46              stsp16	[sp+0x46], r5
 d6 fe                 adjsp	-0x2
 c1 03                 ldi8	r5, 0x3
 f4 41                 stsp16	[sp+0x0], r5
 c6 7f 0c              ldi16	r6, 0xc7f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 17 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 3d 44              stsp16	[sp+0x44], r5
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c6 86 0c              ldi16	r6, 0xc86
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 5a              leasp	r4, 0x5a
 e1 fe fd              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 f0 3c 42              stsp16	[sp+0x42], r4
 d6 fe                 adjsp	-0x2
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 c6 8b 0c              ldi16	r6, 0xc8b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 52              leasp	r4, 0x52
 e1 e6 fd              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 f0 3c 40              stsp16	[sp+0x40], r4
 d6 fe                 adjsp	-0x2
 c0 02                 ldi8	r4, 0x2
 f4 40                 stsp16	[sp+0x0], r4
 c6 8c 0c              ldi16	r6, 0xc8c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 4a              leasp	r4, 0x4a
 e1 ce fd              call16	test_call_strncat_P
 f0 35 12              ldsp16	r5, [sp+0x12]
 d6 02                 adjsp	0x2
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 34 46              ldsp16	r4, [sp+0x46]
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+566
 d4 00                 jmp8	avm_test_main+555
 f0 34 78              ldsp16	r4, [sp+0x78]
 c1 10                 ldi8	r5, 0x10
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+566
 f0 34 44              ldsp16	r4, [sp+0x44]
 f0 15 60              leasp	r5, 0x60
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+588
 d4 00                 jmp8	avm_test_main+577
 f0 34 78              ldsp16	r4, [sp+0x78]
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+588
 f0 34 42              ldsp16	r4, [sp+0x42]
 f0 15 58              leasp	r5, 0x58
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+610
 d4 00                 jmp8	avm_test_main+599
 f0 34 78              ldsp16	r4, [sp+0x78]
 c1 40                 ldi8	r5, 0x40
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+610
 f0 34 40              ldsp16	r4, [sp+0x40]
 f0 15 50              leasp	r5, 0x50
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+632
 d4 00                 jmp8	avm_test_main+621
 f0 34 78              ldsp16	r4, [sp+0x78]
 c1 80                 ldi8	r5, 0x80
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+632
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 f0 15 48              leasp	r5, 0x48
 31                    cmp	r4, r5
 d1 0e                 brne8	avm_test_main+655
 d4 00                 jmp8	avm_test_main+643
 f0 34 78              ldsp16	r4, [sp+0x78]
 c5 00 01              ldi16	r5, 0x100
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+655
 c4 28 01              ldi16	r4, 0x128
 f4 68                 stsp16	[sp+0xa], r4
 c1 a5                 ldi8	r5, 0xa5
 c6 07 01              ldi16	r6, 0x107
 e1 1e 03              call16	fill_bytes
 f4 28                 ldsp16	r4, [sp+0xa]
 d6 fe                 adjsp	-0x2
 c5 04 01              ldi16	r5, 0x104
 f4 41                 stsp16	[sp+0x0], r5
 c6 8f 0c              ldi16	r6, 0xc8f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 23 fd              call16	test_call_strncpy_P
 f4 31                 ldsp16	r5, [sp+0xc]
 d6 02                 adjsp	0x2
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 31                    cmp	r4, r5
 d1 0e                 brne8	avm_test_main+714
 d4 00                 jmp8	avm_test_main+702
 f0 34 78              ldsp16	r4, [sp+0x78]
 c5 00 02              ldi16	r5, 0x200
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+714
 a0                    xor	r4, r4
 f0 3c 3a              stsp16	[sp+0x3a], r4
 d4 00                 jmp8	avm_test_main+720
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 c4 00 01              ldi16	r4, 0x100
 31                    cmp	r4, r5
 d2 18                 brult8	avm_test_main+753
 d4 00                 jmp8	avm_test_main+731
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 c5 2f 02              ldi16	r5, 0x22f
 11                    add	r4, r5
 c1 64                 ldi8	r5, 0x64
 51                    st8	[r4], r5
 d4 00                 jmp8	avm_test_main+743
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f4 ac                 inc16	r4
 f0 3c 3a              stsp16	[sp+0x3a], r4
 d4 df                 jmp8	avm_test_main+720
 a0                    xor	r4, r4
 f0 4c 30 03           stm8	[0x330], r4
 c4 2f 02              ldi16	r4, 0x22f
 f4 60                 stsp16	[sp+0x8], r4
 c4 31 03              ldi16	r4, 0x331
 c1 b6                 ldi8	r5, 0xb6
 c2 0c                 ldi8	r6, 0xc
 e1 b5 02              call16	fill_bytes
 f4 20                 ldsp16	r4, [sp+0x8]
 d6 fe                 adjsp	-0x2
 c1 02                 ldi8	r5, 0x2
 f4 41                 stsp16	[sp+0x0], r5
 c6 8c 0c              ldi16	r6, 0xc8c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 d2 fc              call16	test_call_strncat_P
 f4 29                 ldsp16	r5, [sp+0xa]
 d6 02                 adjsp	0x2
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 31                    cmp	r4, r5
 d1 0e                 brne8	avm_test_main+818
 d4 00                 jmp8	avm_test_main+806
 f0 34 78              ldsp16	r4, [sp+0x78]
 c5 00 04              ldi16	r5, 0x400
 91                    or	r4, r5
 f0 3c 78              stsp16	[sp+0x78], r4
 d4 00                 jmp8	avm_test_main+818
 f0 14 94              leasp	r4, 0x94
 c1 0a                 ldi8	r5, 0xa
 e1 af 02              call16	hash_bytes
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 14 8d              leasp	r4, 0x8d
 c1 07                 ldi8	r5, 0x7
 e1 a4 02              call16	hash_bytes
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 14 87              leasp	r4, 0x87
 c1 06                 ldi8	r5, 0x6
 e1 99 02              call16	hash_bytes
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 14 82              leasp	r4, 0x82
 c1 05                 ldi8	r5, 0x5
 e1 8e 02              call16	hash_bytes
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 14 6c              leasp	r4, 0x6c
 c1 0c                 ldi8	r5, 0xc
 f4 51                 stsp16	[sp+0x4], r5
 e1 81 02              call16	hash_bytes
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 14 60              leasp	r4, 0x60
 e1 76 02              call16	hash_bytes
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 14 58              leasp	r4, 0x58
 c1 08                 ldi8	r5, 0x8
 f4 59                 stsp16	[sp+0x6], r5
 e1 69 02              call16	hash_bytes
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 14 50              leasp	r4, 0x50
 e1 5e 02              call16	hash_bytes
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 14 48              leasp	r4, 0x48
 e1 53 02              call16	hash_bytes
 f0 3c 26              stsp16	[sp+0x26], r4
 c4 28 01              ldi16	r4, 0x128
 c5 07 01              ldi16	r5, 0x107
 e1 47 02              call16	hash_bytes
 f0 3c 24              stsp16	[sp+0x24], r4
 c4 2f 02              ldi16	r4, 0x22f
 c5 0e 01              ldi16	r5, 0x10e
 e1 3b 02              call16	hash_bytes
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 35 78              ldsp16	r5, [sp+0x78]
 c4 3d 03              ldi16	r4, 0x33d
 e1 7d 02              call16	test_line16
 f0 35 36              ldsp16	r5, [sp+0x36]
 c4 40 03              ldi16	r4, 0x340
 e1 74 02              call16	test_line16
 f0 35 34              ldsp16	r5, [sp+0x34]
 c4 43 03              ldi16	r4, 0x343
 e1 6b 02              call16	test_line16
 f0 35 32              ldsp16	r5, [sp+0x32]
 c4 46 03              ldi16	r4, 0x346
 e1 62 02              call16	test_line16
 f0 35 30              ldsp16	r5, [sp+0x30]
 c4 49 03              ldi16	r4, 0x349
 e1 59 02              call16	test_line16
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 c4 4c 03              ldi16	r4, 0x34c
 e1 50 02              call16	test_line16
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 c4 4f 03              ldi16	r4, 0x34f
 e1 47 02              call16	test_line16
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 c4 52 03              ldi16	r4, 0x352
 e1 3e 02              call16	test_line16
 f0 35 28              ldsp16	r5, [sp+0x28]
 c4 55 03              ldi16	r4, 0x355
 e1 35 02              call16	test_line16
 f0 35 26              ldsp16	r5, [sp+0x26]
 c4 58 03              ldi16	r4, 0x358
 e1 2c 02              call16	test_line16
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 5b 03              ldi16	r4, 0x35b
 e1 23 02              call16	test_line16
 f0 35 22              ldsp16	r5, [sp+0x22]
 c4 5e 03              ldi16	r4, 0x35e
 e1 1a 02              call16	test_line16
 f0 44 28 01           ldm8u	r4, [0x128]
 f6 44                 sext8	r4
 cc 5a                 cmpi.s8	r4, 0x5a
 f8 04                 cset.eq	r4
 f0 3c 20              stsp16	[sp+0x20], r4
 c0 01                 ldi8	r4, 0x1
 f0 3c 1e              stsp16	[sp+0x1e], r4
 d4 00                 jmp8	avm_test_main+1073
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c4 03 01              ldi16	r4, 0x103
 31                    cmp	r4, r5
 d2 23                 brult8	avm_test_main+1117
 d4 00                 jmp8	avm_test_main+1084
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 c5 28 01              ldi16	r5, 0x128
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 f8 05                 cset.eq	r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 81                    and	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 d4 00                 jmp8	avm_test_main+1107
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f4 ac                 inc16	r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 d4 d4                 jmp8	avm_test_main+1073
 f0 44 2c 02           ldm8u	r4, [0x22c]
 c1 a5                 ldi8	r5, 0xa5
 31                    cmp	r4, r5
 f8 06                 cset.eq	r6
 f0 34 20              ldsp16	r4, [sp+0x20]
 82                    and	r4, r6
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 44 2d 02           ldm8u	r4, [0x22d]
 31                    cmp	r4, r5
 f8 06                 cset.eq	r6
 f0 34 20              ldsp16	r4, [sp+0x20]
 82                    and	r4, r6
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 44 2e 02           ldm8u	r4, [0x22e]
 31                    cmp	r4, r5
 f8 05                 cset.eq	r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 81                    and	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 45 30 03           ldm8u	r5, [0x330]
 f6 45                 sext8	r5
 a0                    xor	r4, r4
 cd 67                 cmpi.s8	r5, 0x67
 f4 48                 stsp16	[sp+0x2], r4
 d1 2d                 brne8	avm_test_main+1219
 d4 00                 jmp8	avm_test_main+1176
 f0 45 31 03           ldm8u	r5, [0x331]
 f6 45                 sext8	r5
 a0                    xor	r4, r4
 cd 6f                 cmpi.s8	r5, 0x6f
 f4 48                 stsp16	[sp+0x2], r4
 d1 1e                 brne8	avm_test_main+1219
 d4 00                 jmp8	avm_test_main+1191
 f0 45 32 03           ldm8u	r5, [0x332]
 f6 45                 sext8	r5
 a0                    xor	r4, r4
 f4 a5                 tst8	r5
 f4 48                 stsp16	[sp+0x2], r4
 d1 0f                 brne8	avm_test_main+1219
 d4 00                 jmp8	avm_test_main+1206
 f0 44 33 03           ldm8u	r4, [0x333]
 c1 b6                 ldi8	r5, 0xb6
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	avm_test_main+1219
 f4 09                 ldsp16	r5, [sp+0x2]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 35 78              ldsp16	r5, [sp+0x78]
 c6 ff 07              ldi16	r6, 0x7ff
 36                    cmp	r5, r6
 f4 40                 stsp16	[sp+0x0], r4
 db d9 00              brne16	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1241
 c5 61 03              ldi16	r5, 0x361
 f0 14 94              leasp	r4, 0x94
 c2 0a                 ldi8	r6, 0xa
 e1 70 01              call16	bytes_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 da c2 00              breq16	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1264
 c5 6b 03              ldi16	r5, 0x36b
 f0 14 8d              leasp	r4, 0x8d
 c2 07                 ldi8	r6, 0x7
 e1 59 01              call16	bytes_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 da ab 00              breq16	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1287
 c5 72 03              ldi16	r5, 0x372
 f0 14 87              leasp	r4, 0x87
 c2 06                 ldi8	r6, 0x6
 e1 42 01              call16	bytes_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 da 94 00              breq16	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1310
 c5 78 03              ldi16	r5, 0x378
 f0 14 82              leasp	r4, 0x82
 c2 05                 ldi8	r6, 0x5
 e1 2b 01              call16	bytes_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 d0 7e                 breq8	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1332
 c5 7d 03              ldi16	r5, 0x37d
 f0 14 6c              leasp	r4, 0x6c
 e1 5e 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 d0 6a                 breq8	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1352
 c5 85 03              ldi16	r5, 0x385
 f0 14 60              leasp	r4, 0x60
 e1 4a 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 d0 56                 breq8	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1372
 c5 8c 03              ldi16	r5, 0x38c
 f0 14 58              leasp	r4, 0x58
 e1 36 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 d0 42                 breq8	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1392
 c5 90 03              ldi16	r5, 0x390
 f0 14 50              leasp	r4, 0x50
 e1 22 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 d0 2e                 breq8	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1412
 c5 94 03              ldi16	r5, 0x394
 f0 14 48              leasp	r4, 0x48
 e1 0e 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 d0 1a                 breq8	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1432
 f0 35 20              ldsp16	r5, [sp+0x20]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 40                 stsp16	[sp+0x0], r4
 d0 0d                 breq8	avm_test_main+1456
 d4 00                 jmp8	avm_test_main+1445
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+1456
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 7f                 adjsp	0x7f
 d6 1f                 adjsp	0x1f
 ef                    ret

<fill_bytes>:
 d6 f7                 adjsp	-0x9
 f4 5c                 stsp16	[sp+0x7], r4
 f1 49                 stsp8	[sp+0x6], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	fill_bytes+17
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 31                    cmp	r4, r5
 d8 14                 bruge8	fill_bytes+44
 d4 00                 jmp8	fill_bytes+26
 f3 59                 ldsp8u	r5, [sp+0x6]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 12                    add	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	fill_bytes+36
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 e5                 jmp8	fill_bytes+17
 d6 09                 adjsp	0x9
 ef                    ret

<hash_bytes>:
 d6 f6                 adjsp	-0xa
 f4 60                 stsp16	[sp+0x8], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 50                 stsp16	[sp+0x4], r4
 c4 2b 6d              ldi16	r4, 0x6d2b
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	hash_bytes+20
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 19                 ldsp16	r5, [sp+0x6]
 31                    cmp	r4, r5
 d8 2e                 bruge8	hash_bytes+73
 d4 00                 jmp8	hash_bytes+29
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 44                    ld8u	r5, [r4]
 f4 08                 ldsp16	r4, [sp+0x2]
 a1                    xor	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 00                 ldsp16	r4, [sp+0x0]
 c2 11                 ldi8	r6, 0x11
 fe 26                 mul16	r4, r6
 11                    add	r4, r5
 c8 03                 addi.s8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	hash_bytes+65
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 cb                 jmp8	hash_bytes+20
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 0a                 adjsp	0xa
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 e1 99 00              call16	test_puts
 c0 3d                 ldi8	r4, 0x3d
 e1 b6 00              call16	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 bc 00              call16	test_hex16
 c0 0a                 ldi8	r4, 0xa
 e1 ac 00              call16	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<bytes_equal>:
 d6 f2                 adjsp	-0xe
 f4 68                 stsp16	[sp+0xa], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	bytes_equal+21
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 19                 ldsp16	r5, [sp+0x6]
 31                    cmp	r4, r5
 d8 20                 bruge8	bytes_equal+60
 d4 00                 jmp8	bytes_equal+30
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 02                 ldsp16	r6, [sp+0x0]
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f4 09                 ldsp16	r5, [sp+0x2]
 16                    add	r5, r6
 45                    ld8u	r5, [r5]
 31                    cmp	r4, r5
 d0 07                 breq8	bytes_equal+50
 d4 00                 jmp8	bytes_equal+45
 a0                    xor	r4, r4
 f4 70                 stsp16	[sp+0xc], r4
 d4 10                 jmp8	bytes_equal+66
 d4 00                 jmp8	bytes_equal+52
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 d9                 jmp8	bytes_equal+21
 c0 01                 ldi8	r4, 0x1
 f4 70                 stsp16	[sp+0xc], r4
 d4 00                 jmp8	bytes_equal+66
 f4 30                 ldsp16	r4, [sp+0xc]
 d6 0e                 adjsp	0xe
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
