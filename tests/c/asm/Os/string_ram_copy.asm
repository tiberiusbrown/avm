
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
00000144 l     O .data	0000000a avm_test_main.expect_pad
0000014e l     O .data	00000007 avm_test_main.expect_trunc
00000155 l     O .data	00000006 avm_test_main.expect_exact
0000015b l     O .data	00000008 .L.str.19
00000163 l     O .data	00000007 .L.str.20
0000016a l     O .data	00000004 .L.str.21
0000016e l     O .data	00000004 .L.str.22
00000000 l    df *ABS*	00000000 runtime.c
00000ae9 l       .init_array	00000000 .hidden __init_array_end
00000ae9 l       .init_array	00000000 .hidden __init_array_start
00000ae9 l       .fini_array	00000000 .hidden __fini_array_start
00000ae9 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002e1 g     F .text	00000806 avm_test_main
00000ae7 g     F .text	00000002 avm_halt
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
 e1 c9 08              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e9 0a              ldi16	r4, 0xae9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 e9 0a              ldi16	r6, 0xae9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 e9 0a           ldi16	r0, 0xae9
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e9 0a           ldi16	r2, 0xae9
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
 c4 e9 0a              ldi16	r4, 0xae9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 e9 0a              ldi16	r6, 0xae9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 e9 0a           ldi16	r2, 0xae9
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e9 0a           ldi16	r0, 0xae9
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
 d6 80                 adjsp	-0x80
 d6 ee                 adjsp	-0x12
 c0 0a                 ldi8	r4, 0xa
 f0 15 88              leasp	r5, 0x88
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+15
 c0 07                 ldi8	r4, 0x7
 f0 15 81              leasp	r5, 0x81
 c2 cc                 ldi8	r6, 0xcc
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+30
 c0 06                 ldi8	r4, 0x6
 f0 15 7b              leasp	r5, 0x7b
 c2 7e                 ldi8	r6, 0x7e
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+45
 c0 3c                 ldi8	r4, 0x3c
 f0 2c 7a              stsp8	[sp+0x7a], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c 76              stsp16	[sp+0x76], r4
 f0 3d 78              stsp16	[sp+0x78], r5
 f0 12 88              leasp	r2, 0x88
 c5 00 01              ldi16	r5, 0x100
 c2 08                 ldi8	r6, 0x8
 f1 22                 mov	r4, r2
 d5 a4                 call8	test_call_strncpy
 f0 14 81              leasp	r4, 0x81
 c5 04 01              ldi16	r5, 0x104
 c2 03                 ldi8	r6, 0x3
 d5 9a                 call8	test_call_strncpy
 f0 14 7b              leasp	r4, 0x7b
 c5 0b 01              ldi16	r5, 0x10b
 c2 04                 ldi8	r6, 0x4
 d5 90                 call8	test_call_strncpy
 f0 14 76              leasp	r4, 0x76
 c5 0f 01              ldi16	r5, 0x10f
 aa                    xor	r6, r6
 d5 87                 call8	test_call_strncpy
 c5 17 01              ldi16	r5, 0x117
 f0 17 6a              leasp	r7, 0x6a
 03                    mov	r4, r7
 c2 0c                 ldi8	r6, 0xc
 d7 0f                 sys	memcpy
 c5 23 01              ldi16	r5, 0x123
 f0 13 5e              leasp	r3, 0x5e
 f1 23                 mov	r4, r3
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 56              stsp16	[sp+0x56], r4
 f0 3d 58              stsp16	[sp+0x58], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 04 6f 61           ldi16	r0, 0x616f
 f0 01 6b              ldi8	r1, 0x6b
 f0 38 4e              stsp16	[sp+0x4e], r0
 f0 39 50              stsp16	[sp+0x50], r1
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 3d 54              stsp16	[sp+0x54], r5
 f0 3c 4a              stsp16	[sp+0x4a], r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 c5 2f 01              ldi16	r5, 0x12f
 03                    mov	r4, r7
 c2 08                 ldi8	r6, 0x8
 e1 3c ff              call16	test_call_strncat
 c5 34 01              ldi16	r5, 0x134
 f1 23                 mov	r4, r3
 c2 03                 ldi8	r6, 0x3
 e1 32 ff              call16	test_call_strncat
 f0 14 56              leasp	r4, 0x56
 c5 3b 01              ldi16	r5, 0x13b
 aa                    xor	r6, r6
 e1 28 ff              call16	test_call_strncat
 f0 14 4e              leasp	r4, 0x4e
 c5 40 01              ldi16	r5, 0x140
 c2 04                 ldi8	r6, 0x4
 e1 1d ff              call16	test_call_strncat
 f0 14 46              leasp	r4, 0x46
 c5 41 01              ldi16	r5, 0x141
 c2 02                 ldi8	r6, 0x2
 e1 12 ff              call16	test_call_strncat
 c4 2b 6d              ldi16	r4, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 c3 0e                 ldi8	r7, 0xe
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 6c 05              ld8u	r0, [r2+]
 f9 12                 xor	r0, r4
 cb ef                 addi.s8	r7, -0x11
 ca 11                 addi.s8	r6, 0x11
 02                    mov	r4, r6
 f2 20                 add	r4, r0
 c1 9c                 ldi8	r5, 0x9c
 39                    cmp	r6, r5
 d1 e9                 brne8	avm_test_main+241
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f2 28                 add	r6, r0
 f0 3e 28              stsp16	[sp+0x28], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 14 81              leasp	r4, 0x81
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 09 ef              addi.s8	r1, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 69                 cmpi.s8	r7, 0x69
 d1 ec                 brne8	avm_test_main+284
 f0 3e 40              stsp16	[sp+0x40], r6
 1e                    add	r7, r6
 f0 3f 26              stsp16	[sp+0x26], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 7b              leasp	r4, 0x7b
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
 cf 58                 cmpi.s8	r7, 0x58
 d1 ec                 brne8	avm_test_main+323
 f0 39 22              stsp16	[sp+0x22], r1
 f0 3e 3e              stsp16	[sp+0x3e], r6
 1e                    add	r7, r6
 f0 3f 24              stsp16	[sp+0x24], r7
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 14 76              leasp	r4, 0x76
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f7 05                 ld8u	r5, [r4+]
 a6                    xor	r5, r6
 f0 09 ef              addi.s8	r1, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 19                    add	r6, r5
 cf 47                 cmpi.s8	r7, 0x47
 d1 ec                 brne8	avm_test_main+365
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 3d 3c              stsp16	[sp+0x3c], r5
 1d                    add	r7, r5
 f0 3f 32              stsp16	[sp+0x32], r7
 c7 2b 6d              ldi16	r7, 0x6d2b
 c5 f2 ff              ldi16	r5, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 16 6a              leasp	r6, 0x6a
 f0 01 be              ldi8	r1, 0xbe
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f7 14                 ld8u	r4, [r6+]
 a3                    xor	r4, r7
 f0 0b ef              addi.s8	r3, -0x11
 c9 11                 addi.s8	r5, 0x11
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 25                 cmp	r5, r1
 d1 ec                 brne8	avm_test_main+413
 f0 3c 3a              stsp16	[sp+0x3a], r4
 14                    add	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c5 2b 6d              ldi16	r5, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 17 5e              leasp	r7, 0x5e
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 1e                 ld8u	r6, [r7+]
 a9                    xor	r6, r5
 f0 0a ef              addi.s8	r2, -0x11
 c8 11                 addi.s8	r4, 0x11
 04                    mov	r5, r4
 16                    add	r5, r6
 f5 21                 cmp	r4, r1
 d1 ec                 brne8	avm_test_main+452
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 3e 38              stsp16	[sp+0x38], r6
 12                    add	r4, r6
 f0 3c 30              stsp16	[sp+0x30], r4
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 14 56              leasp	r4, 0x56
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 09 ef              addi.s8	r1, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+497
 f0 38 42              stsp16	[sp+0x42], r0
 f0 3e 36              stsp16	[sp+0x36], r6
 1e                    add	r7, r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 17 4e              leasp	r7, 0x4e
 02                    mov	r4, r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 08                    mov	r6, r4
 f7 1c                 ld8u	r4, [r7+]
 a1                    xor	r4, r5
 f0 0b ef              addi.s8	r3, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 14                    add	r5, r4
 ce 7a                 cmpi.s8	r6, 0x7a
 d1 ea                 brne8	avm_test_main+539
 18                    add	r6, r4
 f0 3e 34              stsp16	[sp+0x34], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 3e 44              stsp16	[sp+0x44], r6
 f0 00 0e              ldi8	r0, 0xe
 f0 17 46              leasp	r7, 0x46
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 1a                 ld8u	r2, [r7+]
 f9 56                 xor	r2, r5
 f0 08 ef              addi.s8	r0, -0x11
 f0 36 44              ldsp16	r6, [sp+0x44]
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 f2 26                 add	r5, r2
 f0 3e 44              stsp16	[sp+0x44], r6
 ce 7a                 cmpi.s8	r6, 0x7a
 d1 e4                 brne8	avm_test_main+580
 f0 36 42              ldsp16	r6, [sp+0x42]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 29                    sub	r6, r5
 f0 3e 42              stsp16	[sp+0x42], r6
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f0 3f 1a              stsp16	[sp+0x1a], r7
 fa a4                 lsr16i	r7, 0x4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 30                 ldi8	r6, 0x30
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 96                    or	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 36                    cmp	r5, r6
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 fc 3d                 cmov.ult	r7, r5
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 36 40              ldsp16	r6, [sp+0x40]
 f0 35 22              ldsp16	r5, [sp+0x22]
 29                    sub	r6, r5
 f0 3e 40              stsp16	[sp+0x40], r6
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f0 3f 22              stsp16	[sp+0x22], r7
 fa a4                 lsr16i	r7, 0x4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 30                 ldi8	r6, 0x30
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 96                    or	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 f0 35 22              ldsp16	r5, [sp+0x22]
 36                    cmp	r5, r6
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 fc 3d                 cmov.ult	r7, r5
 f0 3f 14              stsp16	[sp+0x14], r7
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 29                    sub	r6, r5
 f0 3e 3e              stsp16	[sp+0x3e], r6
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f0 3f 22              stsp16	[sp+0x22], r7
 fa a4                 lsr16i	r7, 0x4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 30                 ldi8	r6, 0x30
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 96                    or	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 f0 35 22              ldsp16	r5, [sp+0x22]
 36                    cmp	r5, r6
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 fc 3d                 cmov.ult	r7, r5
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 29                    sub	r6, r5
 f0 3e 3c              stsp16	[sp+0x3c], r6
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f0 3f 22              stsp16	[sp+0x22], r7
 fa a4                 lsr16i	r7, 0x4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 30                 ldi8	r6, 0x30
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 96                    or	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 f0 35 22              ldsp16	r5, [sp+0x22]
 36                    cmp	r5, r6
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 fc 3d                 cmov.ult	r7, r5
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 29                    sub	r6, r5
 f0 3e 3a              stsp16	[sp+0x3a], r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f0 3d 22              stsp16	[sp+0x22], r5
 fa 84                 lsr16i	r5, 0x4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 c3 30                 ldi8	r7, 0x30
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 9b                    or	r6, r7
 f0 3e 2c              stsp16	[sp+0x2c], r6
 c9 37                 addi.s8	r5, 0x37
 c3 a0                 ldi8	r7, 0xa0
 f0 36 22              ldsp16	r6, [sp+0x22]
 3b                    cmp	r6, r7
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 fc 2e                 cmov.ult	r5, r6
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 35 10              ldsp16	r5, [sp+0x10]
 29                    sub	r6, r5
 f0 3e 38              stsp16	[sp+0x38], r6
 f1 76                 zext8	r6
 3b                    cmp	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 c3 30                 ldi8	r7, 0x30
 97                    or	r5, r7
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 36 36              ldsp16	r6, [sp+0x36]
 f2 59                 sub	r6, r1
 f0 3e 36              stsp16	[sp+0x36], r6
 f1 76                 zext8	r6
 f0 01 a0              ldi8	r1, 0xa0
 f5 29                 cmp	r6, r1
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 97                    or	r5, r7
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f2 53                 sub	r4, r3
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 f1 29                 mov	r6, r1
 fa 84                 lsr16i	r5, 0x4
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 93                    or	r4, r7
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f1 26                 mov	r5, r2
 f2 54                 sub	r5, r0
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f1 07                 mov	r0, r7
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 03 0f              ldi8	r3, 0xf
 f0 36 42              ldsp16	r6, [sp+0x42]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 42              stsp16	[sp+0x42], r6
 f0 36 28              ldsp16	r6, [sp+0x28]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 38                    cmp	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f4 7b                 stsp16	[sp+0xe], r7
 f0 36 40              ldsp16	r6, [sp+0x40]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 40              stsp16	[sp+0x40], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 38                    cmp	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f0 36 24              ldsp16	r6, [sp+0x24]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 6b                 stsp16	[sp+0xa], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 38                    cmp	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f0 37 32              ldsp16	r7, [sp+0x32]
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 3c                    cmp	r7, r4
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 32              stsp16	[sp+0x32], r7
 f9 2c                 and	r1, r3
 f1 25                 mov	r5, r1
 f9 a1                 or	r5, r0
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0d                 cmov.ult	r1, r5
 f0 39 04              stsp16	[sp+0x4], r1
 f0 36 34              ldsp16	r6, [sp+0x34]
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 36 36              ldsp16	r6, [sp+0x36]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f0 36 38              ldsp16	r6, [sp+0x38]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 38              stsp16	[sp+0x38], r6
 f0 34 30              ldsp16	r4, [sp+0x30]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 21                 cmp	r4, r1
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f5 2d                 cmp	r7, r1
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 34 34              ldsp16	r4, [sp+0x34]
 f5 21                 cmp	r4, r1
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 37 44              ldsp16	r7, [sp+0x44]
 f2 2e                 add	r7, r2
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 2d                 cmp	r7, r1
 fc 25                 cmov.ult	r4, r5
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 f9 1d                 or	r0, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 38                 cmov.ult	r7, r0
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
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
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 09                 ldi8	r4, 0x9
 f0 06 44 01           ldi16	r2, 0x144
 f0 16 88              leasp	r6, 0x88
 c1 01                 ldi8	r5, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f7 11                 ld8u	r1, [r6+]
 f6 2c                 tst16	r4
 f8 0f                 cset.ne	r7
 f4 b4                 dec16	r4
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+1767
 8d                    and	r7, r5
 f4 a7                 tst8	r7
 d1 ec                 brne8	avm_test_main+1747
 c0 01                 ldi8	r4, 0x1
 f5 08                 cmp	r1, r0
 db 0f 01              brne16	avm_test_main+2045
 c1 06                 ldi8	r5, 0x6
 f0 06 4e 01           ldi16	r2, 0x14e
 f0 13 81              leasp	r3, 0x81
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+1806
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+1785
 f5 08                 cmp	r1, r0
 db ea 00              brne16	avm_test_main+2045
 c1 05                 ldi8	r5, 0x5
 f0 06 55 01           ldi16	r2, 0x155
 f0 13 7b              leasp	r3, 0x7b
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+1843
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+1822
 f5 08                 cmp	r1, r0
 db c5 00              brne16	avm_test_main+2045
 f0 11 76              leasp	r1, 0x76
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f4 b5                 dec16	r5
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+1874
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+1855
 f0 1d 6a              ldsp8u	r5, [sp+0x6a]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 db a2 00              brne16	avm_test_main+2045
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db 9b 00              brne16	avm_test_main+2045
 c3 72                 ldi8	r7, 0x72
 c5 5c 01              ldi16	r5, 0x15c
 f0 16 6a              leasp	r6, 0x6a
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+1916
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1898
 e0 81 00              jmp16	avm_test_main+2045
 f0 1d 5e              ldsp8u	r5, [sp+0x5e]
 cd 73                 cmpi.s8	r5, 0x73
 d1 7a                 brne8	avm_test_main+2045
 c3 73                 ldi8	r7, 0x73
 c5 64 01              ldi16	r5, 0x164
 f0 16 5e              leasp	r6, 0x5e
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+1948
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1931
 d4 61                 jmp8	avm_test_main+2045
 f0 1d 56              ldsp8u	r5, [sp+0x56]
 cd 69                 cmpi.s8	r5, 0x69
 d1 5a                 brne8	avm_test_main+2045
 c3 69                 ldi8	r7, 0x69
 c5 6b 01              ldi16	r5, 0x16b
 f0 16 56              leasp	r6, 0x56
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+1980
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1963
 d4 41                 jmp8	avm_test_main+2045
 f0 1d 4e              ldsp8u	r5, [sp+0x4e]
 cd 6f                 cmpi.s8	r5, 0x6f
 d1 3a                 brne8	avm_test_main+2045
 c3 6f                 ldi8	r7, 0x6f
 c5 6f 01              ldi16	r5, 0x16f
 f0 16 4e              leasp	r6, 0x4e
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2012
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+1995
 d4 21                 jmp8	avm_test_main+2045
 f0 1d 46              ldsp8u	r5, [sp+0x46]
 cd 67                 cmpi.s8	r5, 0x67
 d1 1a                 brne8	avm_test_main+2045
 c3 67                 ldi8	r7, 0x67
 c5 42 01              ldi16	r5, 0x142
 f0 16 46              leasp	r6, 0x46
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2044
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2027
 d4 01                 jmp8	avm_test_main+2045
 a0                    xor	r4, r4
 d6 7f                 adjsp	0x7f
 d6 13                 adjsp	0x13
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
