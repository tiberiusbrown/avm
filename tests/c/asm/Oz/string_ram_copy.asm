
string_ram_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_ram_copy.c
00000100 l     O .data	00000004 .L.str
00000104 l     O .data	00000007 .L.str.1
0000010b l     O .data	00000004 .L.str.2
0000010f l     O .data	00000008 .L.str.3
00000117 l     O .data	0000000c .L__const.avm_test_main.full
00000123 l     O .data	0000000c .L__const.avm_test_main.cut
0000012f l     O .data	00000005 .L.str.4
00000134 l     O .data	00000007 .L.str.5
0000013b l     O .data	00000005 .L.str.6
00000140 l     O .data	00000001 .L.str.7
00000141 l     O .data	00000003 .L.str.8
0000051a l     F .text	0000002a hash_bytes
00000144 l     O .data	00000003 .L.str.9
00000544 l     F .text	00000026 test_line16
00000147 l     O .data	00000003 .L.str.10
0000014a l     O .data	00000003 .L.str.11
0000014d l     O .data	00000003 .L.str.12
00000150 l     O .data	00000003 .L.str.13
00000153 l     O .data	00000003 .L.str.14
00000156 l     O .data	00000003 .L.str.15
00000159 l     O .data	00000003 .L.str.16
0000015c l     O .data	00000003 .L.str.17
0000015f l     O .data	00000003 .L.str.18
00000162 l     O .data	0000000a avm_test_main.expect_pad
0000056a l     F .text	0000001e bytes_equal
0000016c l     O .data	00000007 avm_test_main.expect_trunc
00000173 l     O .data	00000006 avm_test_main.expect_exact
00000179 l     O .data	00000005 avm_test_main.expect_zero
0000017e l     O .data	00000008 .L.str.19
00000588 l     F .text	0000001e text_equal
00000186 l     O .data	00000007 .L.str.20
0000018d l     O .data	00000004 .L.str.21
00000191 l     O .data	00000004 .L.str.22
000005a6 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
000005cc l       .init_array	00000000 .hidden __init_array_end
000005cc l       .init_array	00000000 .hidden __init_array_start
000005cc l       .fini_array	00000000 .hidden __fini_array_start
000005cc l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002e1 g     F .text	00000239 avm_test_main
000005ca g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d7 g     F .text	00000005 test_call_strncpy
000002dc g     F .text	00000005 test_call_strncat

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 db 00              call16	avm_test_main
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
 e1 ac 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 cc 05              ldi16	r4, 0x5cc
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cc 05              ldi16	r6, 0x5cc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 cc 05           ldi16	r0, 0x5cc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 cc 05           ldi16	r2, 0x5cc
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
 c4 cc 05              ldi16	r4, 0x5cc
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cc 05              ldi16	r6, 0x5cc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 cc 05           ldi16	r2, 0x5cc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 cc 05           ldi16	r0, 0x5cc
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

<test_call_strncpy>:
 0c                    mov	r7, r4
 d7 1b                 sys	strncpy
 03                    mov	r4, r7
 ef                    ret

<test_call_strncat>:
 0c                    mov	r7, r4
 d7 1c                 sys	strncat
 03                    mov	r4, r7
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a6                 adjsp	-0x5a
 f0 14 50              leasp	r4, 0x50
 c1 0a                 ldi8	r5, 0xa
 c2 a5                 ldi8	r6, 0xa5
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+25
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+17
 f0 14 49              leasp	r4, 0x49
 c1 07                 ldi8	r5, 0x7
 c2 cc                 ldi8	r6, 0xcc
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+44
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+36
 f0 14 43              leasp	r4, 0x43
 c1 06                 ldi8	r5, 0x6
 c2 7e                 ldi8	r6, 0x7e
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+63
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+55
 f0 14 3e              leasp	r4, 0x3e
 c1 05                 ldi8	r5, 0x5
 c2 3c                 ldi8	r6, 0x3c
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+82
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+74
 f0 14 50              leasp	r4, 0x50
 f4 70                 stsp16	[sp+0xc], r4
 c5 00 01              ldi16	r5, 0x100
 f0 00 08              ldi8	r0, 0x8
 f1 28                 mov	r6, r0
 d5 95                 call8	test_call_strncpy
 f0 14 49              leasp	r4, 0x49
 f4 68                 stsp16	[sp+0xa], r4
 c5 04 01              ldi16	r5, 0x104
 c2 03                 ldi8	r6, 0x3
 d5 89                 call8	test_call_strncpy
 f0 14 43              leasp	r4, 0x43
 f4 60                 stsp16	[sp+0x8], r4
 c5 0b 01              ldi16	r5, 0x10b
 c2 04                 ldi8	r6, 0x4
 e1 7c ff              call16	test_call_strncpy
 f0 14 3e              leasp	r4, 0x3e
 f4 58                 stsp16	[sp+0x6], r4
 c5 0f 01              ldi16	r5, 0x10f
 f2 4b                 sub	r3, r3
 f1 2b                 mov	r6, r3
 e1 6d ff              call16	test_call_strncpy
 c5 17 01              ldi16	r5, 0x117
 f0 11 32              leasp	r1, 0x32
 f1 21                 mov	r4, r1
 c2 0c                 ldi8	r6, 0xc
 d7 0f                 sys	memcpy
 c5 23 01              ldi16	r5, 0x123
 f0 12 26              leasp	r2, 0x26
 f1 22                 mov	r4, r2
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c5 2f 01              ldi16	r5, 0x12f
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 e1 23 ff              call16	test_call_strncat
 c5 34 01              ldi16	r5, 0x134
 f1 22                 mov	r4, r2
 c2 03                 ldi8	r6, 0x3
 e1 19 ff              call16	test_call_strncat
 f0 14 1e              leasp	r4, 0x1e
 f4 50                 stsp16	[sp+0x4], r4
 c5 3b 01              ldi16	r5, 0x13b
 f1 2b                 mov	r6, r3
 e1 0c ff              call16	test_call_strncat
 f0 10 16              leasp	r0, 0x16
 c5 40 01              ldi16	r5, 0x140
 f1 20                 mov	r4, r0
 c2 04                 ldi8	r6, 0x4
 e1 ff fe              call16	test_call_strncat
 f0 13 0e              leasp	r3, 0xe
 c5 41 01              ldi16	r5, 0x141
 c2 02                 ldi8	r6, 0x2
 f1 23                 mov	r4, r3
 e1 f2 fe              call16	test_call_strncat
 c1 0a                 ldi8	r5, 0xa
 f4 30                 ldsp16	r4, [sp+0xc]
 e1 29 01              call16	hash_bytes
 f4 48                 stsp16	[sp+0x2], r4
 c1 07                 ldi8	r5, 0x7
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 20 01              call16	hash_bytes
 f4 68                 stsp16	[sp+0xa], r4
 c1 06                 ldi8	r5, 0x6
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 17 01              call16	hash_bytes
 f4 60                 stsp16	[sp+0x8], r4
 c1 05                 ldi8	r5, 0x5
 f4 18                 ldsp16	r4, [sp+0x6]
 e1 0e 01              call16	hash_bytes
 f4 58                 stsp16	[sp+0x6], r4
 f1 21                 mov	r4, r1
 f0 01 0c              ldi8	r1, 0xc
 f1 25                 mov	r5, r1
 e1 02 01              call16	hash_bytes
 f4 40                 stsp16	[sp+0x0], r4
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 e1 f9 00              call16	hash_bytes
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 01 08              ldi8	r1, 0x8
 f1 25                 mov	r5, r1
 e1 ed 00              call16	hash_bytes
 f4 50                 stsp16	[sp+0x4], r4
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 e1 e4 00              call16	hash_bytes
 f1 04                 mov	r0, r4
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 e1 db 00              call16	hash_bytes
 f1 1c                 mov	r3, r4
 c4 44 01              ldi16	r4, 0x144
 c5 ff 01              ldi16	r5, 0x1ff
 e1 fa 00              call16	test_line16
 c4 47 01              ldi16	r4, 0x147
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 f2 00              call16	test_line16
 c4 4a 01              ldi16	r4, 0x14a
 f4 29                 ldsp16	r5, [sp+0xa]
 e1 ea 00              call16	test_line16
 c4 4d 01              ldi16	r4, 0x14d
 f4 21                 ldsp16	r5, [sp+0x8]
 e1 e2 00              call16	test_line16
 c4 50 01              ldi16	r4, 0x150
 f4 19                 ldsp16	r5, [sp+0x6]
 e1 da 00              call16	test_line16
 c4 53 01              ldi16	r4, 0x153
 f4 01                 ldsp16	r5, [sp+0x0]
 e1 d2 00              call16	test_line16
 c4 56 01              ldi16	r4, 0x156
 f1 26                 mov	r5, r2
 e1 ca 00              call16	test_line16
 c4 59 01              ldi16	r4, 0x159
 f4 11                 ldsp16	r5, [sp+0x4]
 e1 c2 00              call16	test_line16
 c4 5c 01              ldi16	r4, 0x15c
 f1 24                 mov	r5, r0
 e1 ba 00              call16	test_line16
 c4 5f 01              ldi16	r4, 0x15f
 f1 27                 mov	r5, r3
 e1 b2 00              call16	test_line16
 c5 62 01              ldi16	r5, 0x162
 f4 30                 ldsp16	r4, [sp+0xc]
 c2 0a                 ldi8	r6, 0xa
 e1 ce 00              call16	bytes_equal
 f0 00 01              ldi8	r0, 0x1
 f4 a4                 tst8	r4
 d0 6e                 breq8	avm_test_main+560
 f0 14 49              leasp	r4, 0x49
 c5 6c 01              ldi16	r5, 0x16c
 c2 07                 ldi8	r6, 0x7
 e1 bc 00              call16	bytes_equal
 f4 a4                 tst8	r4
 d0 5f                 breq8	avm_test_main+560
 f0 14 43              leasp	r4, 0x43
 c5 73 01              ldi16	r5, 0x173
 c2 06                 ldi8	r6, 0x6
 e1 ad 00              call16	bytes_equal
 f4 a4                 tst8	r4
 d0 50                 breq8	avm_test_main+560
 f0 14 3e              leasp	r4, 0x3e
 c5 79 01              ldi16	r5, 0x179
 c2 05                 ldi8	r6, 0x5
 e1 9e 00              call16	bytes_equal
 f4 a4                 tst8	r4
 d0 41                 breq8	avm_test_main+560
 f0 14 32              leasp	r4, 0x32
 c5 7e 01              ldi16	r5, 0x17e
 e1 af 00              call16	text_equal
 f4 a4                 tst8	r4
 d0 34                 breq8	avm_test_main+560
 f0 14 26              leasp	r4, 0x26
 c5 86 01              ldi16	r5, 0x186
 e1 a2 00              call16	text_equal
 f4 a4                 tst8	r4
 d0 27                 breq8	avm_test_main+560
 f0 14 1e              leasp	r4, 0x1e
 c5 8d 01              ldi16	r5, 0x18d
 e1 95 00              call16	text_equal
 f4 a4                 tst8	r4
 d0 1a                 breq8	avm_test_main+560
 f0 14 16              leasp	r4, 0x16
 c5 91 01              ldi16	r5, 0x191
 e1 88 00              call16	text_equal
 f4 a4                 tst8	r4
 d0 0d                 breq8	avm_test_main+560
 f0 14 0e              leasp	r4, 0xe
 c5 41 01              ldi16	r5, 0x141
 d5 7c                 call8	text_equal
 f0 00 01              ldi8	r0, 0x1
 f9 12                 xor	r0, r4
 f1 20                 mov	r4, r0
 d6 5a                 adjsp	0x5a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<hash_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 c6 2b 6d              ldi16	r6, 0x6d2b
 f0 01 11              ldi8	r1, 0x11
 f6 2d                 tst16	r5
 d0 18                 breq8	hash_bytes+38
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 f7 07                 ld8u	r7, [r4+]
 ae                    xor	r7, r6
 f1 28                 mov	r6, r0
 fe 31                 mul16	r6, r1
 1b                    add	r6, r7
 f4 b5                 dec16	r5
 f4 a8                 inc16	r0
 ca 03                 addi.s8	r6, 0x3
 f6 2d                 tst16	r5
 d1 e8                 brne8	hash_bytes+14
 02                    mov	r4, r6
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
 d5 49                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 43                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 02                 adjsp	0x2
 ef                    ret

<bytes_equal>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 af                    xor	r7, r7
 f1 07                 mov	r0, r7
 f5 28                 cmp	r6, r0
 d0 0c                 breq8	bytes_equal+22
 f7 09                 ld8u	r1, [r5+]
 f7 02                 ld8u	r2, [r4+]
 f1 2c                 mov	r7, r0
 f4 af                 inc16	r7
 f5 11                 cmp	r2, r1
 d0 ee                 breq8	bytes_equal+4
 f5 06                 cmp	r0, r6
 f8 1c                 cset.uge	r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
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
