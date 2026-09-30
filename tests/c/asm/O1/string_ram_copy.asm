
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
00000144 l     O .data	00000003 .L.str.9
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
0000016c l     O .data	00000007 avm_test_main.expect_trunc
00000173 l     O .data	00000006 avm_test_main.expect_exact
00000179 l     O .data	00000005 avm_test_main.expect_zero
0000017e l     O .data	00000008 .L.str.19
00000186 l     O .data	00000007 .L.str.20
0000018d l     O .data	00000004 .L.str.21
00000191 l     O .data	00000004 .L.str.22
00000000 l    df *ABS*	00000000 runtime.c
00000a9a l       .init_array	00000000 .hidden __init_array_end
00000a9a l       .init_array	00000000 .hidden __init_array_start
00000a9a l       .fini_array	00000000 .hidden __fini_array_start
00000a9a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002e1 g     F .text	000007b7 avm_test_main
00000a98 g     F .text	00000002 avm_halt
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
 e1 7a 08              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9a 0a              ldi16	r4, 0xa9a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9a 0a              ldi16	r6, 0xa9a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 9a 0a           ldi16	r0, 0xa9a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9a 0a           ldi16	r2, 0xa9a
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
 c4 9a 0a              ldi16	r4, 0xa9a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9a 0a              ldi16	r6, 0xa9a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 9a 0a           ldi16	r2, 0xa9a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9a 0a           ldi16	r0, 0xa9a
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
 d6 82                 adjsp	-0x7e
 c0 0a                 ldi8	r4, 0xa
 f0 15 74              leasp	r5, 0x74
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+13
 c0 07                 ldi8	r4, 0x7
 f0 15 6d              leasp	r5, 0x6d
 c2 cc                 ldi8	r6, 0xcc
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+28
 c0 06                 ldi8	r4, 0x6
 f0 15 67              leasp	r5, 0x67
 c2 7e                 ldi8	r6, 0x7e
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+43
 c0 05                 ldi8	r4, 0x5
 f0 15 62              leasp	r5, 0x62
 c2 3c                 ldi8	r6, 0x3c
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+58
 f0 12 74              leasp	r2, 0x74
 c5 00 01              ldi16	r5, 0x100
 c2 08                 ldi8	r6, 0x8
 f1 22                 mov	r4, r2
 d5 a8                 call8	test_call_strncpy
 f0 14 6d              leasp	r4, 0x6d
 c5 04 01              ldi16	r5, 0x104
 c2 03                 ldi8	r6, 0x3
 d5 9e                 call8	test_call_strncpy
 f0 14 67              leasp	r4, 0x67
 c5 0b 01              ldi16	r5, 0x10b
 c2 04                 ldi8	r6, 0x4
 d5 94                 call8	test_call_strncpy
 f0 14 62              leasp	r4, 0x62
 c5 0f 01              ldi16	r5, 0x10f
 aa                    xor	r6, r6
 d5 8b                 call8	test_call_strncpy
 c5 17 01              ldi16	r5, 0x117
 f0 17 56              leasp	r7, 0x56
 03                    mov	r4, r7
 c2 0c                 ldi8	r6, 0xc
 d7 0f                 sys	memcpy
 c5 23 01              ldi16	r5, 0x123
 f0 13 4a              leasp	r3, 0x4a
 f1 23                 mov	r4, r3
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3d 44              stsp16	[sp+0x44], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 04 6f 61           ldi16	r0, 0x616f
 f0 01 6b              ldi8	r1, 0x6b
 f0 38 3a              stsp16	[sp+0x3a], r0
 f0 39 3c              stsp16	[sp+0x3c], r1
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3d 34              stsp16	[sp+0x34], r5
 c5 2f 01              ldi16	r5, 0x12f
 03                    mov	r4, r7
 c2 08                 ldi8	r6, 0x8
 e1 40 ff              call16	test_call_strncat
 c5 34 01              ldi16	r5, 0x134
 f1 23                 mov	r4, r3
 c2 03                 ldi8	r6, 0x3
 e1 36 ff              call16	test_call_strncat
 f0 14 42              leasp	r4, 0x42
 c5 3b 01              ldi16	r5, 0x13b
 aa                    xor	r6, r6
 e1 2c ff              call16	test_call_strncat
 f0 14 3a              leasp	r4, 0x3a
 c5 40 01              ldi16	r5, 0x140
 c2 04                 ldi8	r6, 0x4
 e1 21 ff              call16	test_call_strncat
 f0 14 32              leasp	r4, 0x32
 c5 41 01              ldi16	r5, 0x141
 c2 02                 ldi8	r6, 0x2
 e1 16 ff              call16	test_call_strncat
 c4 2b 6d              ldi16	r4, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 c3 0e                 ldi8	r7, 0xe
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 6c 25              ld8u	r1, [r2+]
 f9 32                 xor	r1, r4
 cb ef                 addi.s8	r7, -0x11
 ca 11                 addi.s8	r6, 0x11
 02                    mov	r4, r6
 f2 21                 add	r4, r1
 c1 9c                 ldi8	r5, 0x9c
 39                    cmp	r6, r5
 d1 e9                 brne8	avm_test_main+237
 f4 43                 stsp16	[sp+0x0], r7
 f2 29                 add	r6, r1
 f4 52                 stsp16	[sp+0x4], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 6d              leasp	r4, 0x6d
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 02                 ld8u	r2, [r4+]
 f9 56                 xor	r2, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 f2 26                 add	r5, r2
 cf 69                 cmpi.s8	r7, 0x69
 d1 ea                 brne8	avm_test_main+278
 f0 38 02              stsp16	[sp+0x2], r0
 f2 2e                 add	r7, r2
 f4 63                 stsp16	[sp+0x8], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 67              leasp	r4, 0x67
 0d                    mov	r7, r5
 fa ab                 lsr16i	r7, 0xb
 fa 45                 lsl16i	r5, 0x5
 97                    or	r5, r7
 f7 07                 ld8u	r7, [r4+]
 ad                    xor	r7, r5
 f0 08 ef              addi.s8	r0, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 17                    add	r5, r7
 ce 58                 cmpi.s8	r6, 0x58
 d1 ec                 brne8	avm_test_main+319
 f0 38 06              stsp16	[sp+0x6], r0
 f4 6b                 stsp16	[sp+0xa], r7
 1b                    add	r6, r7
 f4 7a                 stsp16	[sp+0xe], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 62              leasp	r4, 0x62
 0d                    mov	r7, r5
 fa ab                 lsr16i	r7, 0xb
 fa 45                 lsl16i	r5, 0x5
 97                    or	r5, r7
 f7 07                 ld8u	r7, [r4+]
 ad                    xor	r7, r5
 f0 08 ef              addi.s8	r0, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 17                    add	r5, r7
 ce 47                 cmpi.s8	r6, 0x47
 d1 ec                 brne8	avm_test_main+359
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 3f 10              stsp16	[sp+0x10], r7
 1b                    add	r6, r7
 f0 3e 14              stsp16	[sp+0x14], r6
 c7 2b 6d              ldi16	r7, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 15 56              leasp	r5, 0x56
 f0 03 be              ldi8	r3, 0xbe
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f7 0c                 ld8u	r4, [r5+]
 a3                    xor	r4, r7
 f0 08 ef              addi.s8	r0, -0x11
 ca 11                 addi.s8	r6, 0x11
 0e                    mov	r7, r6
 1c                    add	r7, r4
 f5 2b                 cmp	r6, r3
 d1 ec                 brne8	avm_test_main+404
 f0 38 12              stsp16	[sp+0x12], r0
 f0 3c 16              stsp16	[sp+0x16], r4
 18                    add	r6, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
 c7 2b 6d              ldi16	r7, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 15 4a              leasp	r5, 0x4a
 02                    mov	r4, r6
 0b                    mov	r6, r7
 fa 9b                 lsr16i	r6, 0xb
 fa 65                 lsl16i	r7, 0x5
 9e                    or	r7, r6
 08                    mov	r6, r4
 f7 0c                 ld8u	r4, [r5+]
 a3                    xor	r4, r7
 f0 08 ef              addi.s8	r0, -0x11
 ca 11                 addi.s8	r6, 0x11
 0e                    mov	r7, r6
 1c                    add	r7, r4
 f5 2b                 cmp	r6, r3
 d1 ea                 brne8	avm_test_main+446
 f0 38 18              stsp16	[sp+0x18], r0
 f0 3c 1c              stsp16	[sp+0x1c], r4
 18                    add	r6, r4
 f0 3e 20              stsp16	[sp+0x20], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 14 42              leasp	r4, 0x42
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 0b ef              addi.s8	r3, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+490
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f0 3e 22              stsp16	[sp+0x22], r6
 1e                    add	r7, r6
 f0 3f 26              stsp16	[sp+0x26], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 14 3a              leasp	r4, 0x3a
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 0b ef              addi.s8	r3, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+532
 f0 3b 24              stsp16	[sp+0x24], r3
 f0 3e 28              stsp16	[sp+0x28], r6
 1e                    add	r7, r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 14 32              leasp	r4, 0x32
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 0b ef              addi.s8	r3, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+574
 f0 3b 2a              stsp16	[sp+0x2a], r3
 f0 3e 2e              stsp16	[sp+0x2e], r6
 1e                    add	r7, r6
 f0 3f 30              stsp16	[sp+0x30], r7
 c0 52                 ldi8	r4, 0x52
 c7 45 01              ldi16	r7, 0x145
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+609
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c1 4e                 ldi8	r5, 0x4e
 c7 48 01              ldi16	r7, 0x148
 f7 1e                 ld8u	r6, [r7+]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 06                    mov	r5, r6
 d1 f4                 brne8	avm_test_main+647
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 3c                 sub	r1, r4
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f0 03 30              ldi8	r3, 0x30
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 3d                 cmov.ult	r7, r5
 c0 0f                 ldi8	r4, 0xf
 f9 30                 and	r1, r4
 f1 21                 mov	r4, r1
 f9 8d                 or	r4, r3
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 24                 cmp	r5, r0
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 c0 0f                 ldi8	r4, 0xf
 84                    and	r5, r4
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
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 c7 4b 01              ldi16	r7, 0x14b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+757
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 44                 sub	r2, r4
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 c2 30                 ldi8	r6, 0x30
 f1 06                 mov	r0, r6
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 01 0f              ldi8	r1, 0xf
 f9 44                 and	r2, r1
 f1 22                 mov	r4, r2
 f9 81                 or	r4, r0
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 0a 37              addi.s8	r2, 0x37
 fc 14                 cmov.ult	r2, r4
 f4 23                 ldsp16	r7, [sp+0x8]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2f                 cmp	r7, r3
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
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
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c1 4e                 ldi8	r5, 0x4e
 c7 4e 01              ldi16	r7, 0x14e
 f7 1e                 ld8u	r6, [r7+]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 06                    mov	r5, r6
 d1 f4                 brne8	avm_test_main+866
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f4 18                 ldsp16	r4, [sp+0x6]
 f2 34                 sub	r0, r4
 f1 24                 mov	r5, r0
 f1 75                 zext8	r5
 f0 03 a0              ldi8	r3, 0xa0
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f0 02 30              ldi8	r2, 0x30
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 c3 0f                 ldi8	r7, 0xf
 f1 0f                 mov	r1, r7
 f9 04                 and	r0, r1
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 c7 51 01              ldi16	r7, 0x151
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+982
 f0 31 10              ldsp16	r1, [sp+0x10]
 f4 30                 ldsp16	r4, [sp+0xc]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c3 0f                 ldi8	r7, 0xf
 f1 07                 mov	r0, r7
 f9 20                 and	r1, r0
 f1 21                 mov	r4, r1
 f9 89                 or	r4, r2
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
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
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 c7 54 01              ldi16	r7, 0x154
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1094
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c3 0f                 ldi8	r7, 0xf
 f1 07                 mov	r0, r7
 f9 20                 and	r1, r0
 f1 21                 mov	r4, r1
 f9 89                 or	r4, r2
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 f0 3c 16              stsp16	[sp+0x16], r4
 cb 37                 addi.s8	r7, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 38                    cmp	r6, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
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
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 c7 57 01              ldi16	r7, 0x157
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1208
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 34 18              ldsp16	r4, [sp+0x18]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 00 0f              ldi8	r0, 0xf
 f9 20                 and	r1, r0
 f1 21                 mov	r4, r1
 f9 89                 or	r4, r2
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f0 37 20              ldsp16	r7, [sp+0x20]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 1c              stsp16	[sp+0x1c], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 3c                    cmp	r7, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 89                 or	r4, r2
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
 c0 43                 ldi8	r4, 0x43
 c7 5a 01              ldi16	r7, 0x15a
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1321
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f2 34                 sub	r0, r4
 f1 24                 mov	r5, r0
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 01 0f              ldi8	r1, 0xf
 f9 04                 and	r0, r1
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 37 26              ldsp16	r7, [sp+0x26]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 22              stsp16	[sp+0x22], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 3c                    cmp	r7, r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 89                 or	r4, r2
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
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 c7 5d 01              ldi16	r7, 0x15d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1434
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 00 0f              ldi8	r0, 0xf
 f9 20                 and	r1, r0
 f1 21                 mov	r4, r1
 f9 89                 or	r4, r2
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0c                 cmov.ult	r1, r4
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 28              stsp16	[sp+0x28], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 3c                    cmp	r7, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 89                 or	r4, r2
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
 c0 43                 ldi8	r4, 0x43
 c7 60 01              ldi16	r7, 0x160
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1547
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f2 34                 sub	r0, r4
 f1 24                 mov	r5, r0
 f1 75                 zext8	r5
 f5 27                 cmp	r5, r3
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 01 0f              ldi8	r1, 0xf
 f9 04                 and	r0, r1
 f1 20                 mov	r4, r0
 f9 89                 or	r4, r2
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
 f0 37 30              ldsp16	r7, [sp+0x30]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f0 3c 2e              stsp16	[sp+0x2e], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 3c                    cmp	r7, r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 f9 5d                 or	r2, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3a                 cmov.ult	r7, r2
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 09                 ldi8	r4, 0x9
 f0 06 62 01           ldi16	r2, 0x162
 f0 16 74              leasp	r6, 0x74
 c1 01                 ldi8	r5, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f7 11                 ld8u	r1, [r6+]
 f6 2c                 tst16	r4
 f8 0f                 cset.ne	r7
 f4 b4                 dec16	r4
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+1685
 8d                    and	r7, r5
 f4 a7                 tst8	r7
 d1 ec                 brne8	avm_test_main+1665
 c0 01                 ldi8	r4, 0x1
 f5 08                 cmp	r1, r0
 db 14 01              brne16	avm_test_main+1968
 c1 06                 ldi8	r5, 0x6
 f0 06 6c 01           ldi16	r2, 0x16c
 f0 13 6d              leasp	r3, 0x6d
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+1724
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+1703
 f5 08                 cmp	r1, r0
 db ef 00              brne16	avm_test_main+1968
 c1 05                 ldi8	r5, 0x5
 f0 06 73 01           ldi16	r2, 0x173
 f0 13 67              leasp	r3, 0x67
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+1761
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+1740
 f5 08                 cmp	r1, r0
 db ca 00              brne16	avm_test_main+1968
 f0 06 79 01           ldi16	r2, 0x179
 f0 13 62              leasp	r3, 0x62
 c2 04                 ldi8	r6, 0x4
 c1 01                 ldi8	r5, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2e                 tst16	r6
 f8 0f                 cset.ne	r7
 f4 b6                 dec16	r6
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+1798
 8d                    and	r7, r5
 f4 a7                 tst8	r7
 d1 eb                 brne8	avm_test_main+1777
 f0 1d 56              ldsp8u	r5, [sp+0x56]
 f5 08                 cmp	r1, r0
 db a2 00              brne16	avm_test_main+1968
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db 9b 00              brne16	avm_test_main+1968
 c3 72                 ldi8	r7, 0x72
 c5 7f 01              ldi16	r5, 0x17f
 f0 16 56              leasp	r6, 0x56
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+1839
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1821
 e0 81 00              jmp16	avm_test_main+1968
 f0 1d 4a              ldsp8u	r5, [sp+0x4a]
 cd 73                 cmpi.s8	r5, 0x73
 d1 7a                 brne8	avm_test_main+1968
 c3 73                 ldi8	r7, 0x73
 c5 87 01              ldi16	r5, 0x187
 f0 16 4a              leasp	r6, 0x4a
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+1871
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1854
 d4 61                 jmp8	avm_test_main+1968
 f0 1d 42              ldsp8u	r5, [sp+0x42]
 cd 69                 cmpi.s8	r5, 0x69
 d1 5a                 brne8	avm_test_main+1968
 c3 69                 ldi8	r7, 0x69
 c5 8e 01              ldi16	r5, 0x18e
 f0 16 42              leasp	r6, 0x42
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+1903
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1886
 d4 41                 jmp8	avm_test_main+1968
 f0 1d 3a              ldsp8u	r5, [sp+0x3a]
 cd 6f                 cmpi.s8	r5, 0x6f
 d1 3a                 brne8	avm_test_main+1968
 c3 6f                 ldi8	r7, 0x6f
 c5 92 01              ldi16	r5, 0x192
 f0 16 3a              leasp	r6, 0x3a
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+1935
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1918
 d4 21                 jmp8	avm_test_main+1968
 f0 1d 32              ldsp8u	r5, [sp+0x32]
 cd 67                 cmpi.s8	r5, 0x67
 d1 1a                 brne8	avm_test_main+1968
 c3 67                 ldi8	r7, 0x67
 c5 42 01              ldi16	r5, 0x142
 f0 16 32              leasp	r6, 0x32
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+1967
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1950
 d4 01                 jmp8	avm_test_main+1968
 a0                    xor	r4, r4
 d6 7e                 adjsp	0x7e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
