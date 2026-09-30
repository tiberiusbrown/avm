
string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000041e l     F .text	0000004a avm_run_constructors
00000468 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_progmem_copy.c
00000f61 l     O .rodata	00000004 p_cat
00000f65 l     O .rodata	00000007 p_abcdef
00000f6c l     O .rodata	00000004 p_dog
00000f70 l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
00000f78 l     O .rodata	00000005 p_wood
00000f7d l     O .rodata	00000007 p_flower
00000f84 l     O .rodata	00000005 p_berg
00000f89 l     O .rodata	00000001 p_empty
00000f8a l     O .rodata	00000003 p_go
00000118 l     O .data	00000107 avm_test_main.long_pad
00000f8d l     O .rodata	00000002 p_z
0000021f l     O .data	0000010e avm_test_main.long_cat
0000032d l     O .data	0000000a avm_test_main.expect_pad
00000337 l     O .data	00000007 avm_test_main.expect_trunc
0000033e l     O .data	00000006 avm_test_main.expect_exact
00000344 l     O .data	00000008 .L.str.12
0000034c l     O .data	00000007 .L.str.13
00000353 l     O .data	00000004 .L.str.14
00000357 l     O .data	00000004 .L.str.15
0000035b l     O .data	00000003 .L.str.16
00000000 l    df *ABS*	00000000 runtime.c
00000f8f l       .init_array	00000000 .hidden __init_array_end
00000f8f l       .init_array	00000000 .hidden __init_array_start
00000f8f l       .fini_array	00000000 .hidden __fini_array_start
00000f8f l       .fini_array	00000000 .hidden __fini_array_end
00000400 g     F .text	0000001e _start
000004ed g     F .text	00000a72 avm_test_main
00000f5f g     F .text	00000002 avm_halt
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
 e1 41 0b              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 8f 0f              ldi16	r4, 0xf8f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 8f 0f              ldi16	r6, 0xf8f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 8f 0f           ldi16	r0, 0xf8f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 8f 0f           ldi16	r2, 0xf8f
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
 c4 8f 0f              ldi16	r4, 0xf8f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 8f 0f              ldi16	r6, 0xf8f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 8f 0f           ldi16	r2, 0xf8f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 8f 0f           ldi16	r0, 0xf8f
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
 d6 e0                 adjsp	-0x20
 c0 0a                 ldi8	r4, 0xa
 f0 15 96              leasp	r5, 0x96
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+15
 c0 07                 ldi8	r4, 0x7
 f0 15 8f              leasp	r5, 0x8f
 c2 cc                 ldi8	r6, 0xcc
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+30
 c0 06                 ldi8	r4, 0x6
 f0 15 89              leasp	r5, 0x89
 c2 7e                 ldi8	r6, 0x7e
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+45
 c0 3c                 ldi8	r4, 0x3c
 f0 2c 88              stsp8	[sp+0x88], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c 84              stsp16	[sp+0x84], r4
 f0 3d 86              stsp16	[sp+0x86], r5
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 61 0f              ldi16	r6, 0xf61
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 98              leasp	r4, 0x98
 d5 92                 call8	test_call_strncpy_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 65 0f              ldi16	r6, 0xf65
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 91              leasp	r4, 0x91
 e1 7d ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 6c 0f              ldi16	r6, 0xf6c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 8b              leasp	r4, 0x8b
 e1 68 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 70 0f              ldi16	r6, 0xf70
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 f2 4b                 sub	r3, r3
 f0 3b 00              stsp16	[sp+0x0], r3
 f0 14 86              leasp	r4, 0x86
 e1 52 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 f0 01 0c              ldi8	r1, 0xc
 c5 00 01              ldi16	r5, 0x100
 f0 10 78              leasp	r0, 0x78
 f1 20                 mov	r4, r0
 c2 0c                 ldi8	r6, 0xc
 d7 0f                 sys	memcpy
 c5 0c 01              ldi16	r5, 0x10c
 f0 12 6c              leasp	r2, 0x6c
 f1 22                 mov	r4, r2
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 64              stsp16	[sp+0x64], r4
 f0 3d 66              stsp16	[sp+0x66], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 68              stsp16	[sp+0x68], r4
 f0 3d 6a              stsp16	[sp+0x6a], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e 5c              stsp16	[sp+0x5c], r6
 f0 3f 5e              stsp16	[sp+0x5e], r7
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 3d 62              stsp16	[sp+0x62], r5
 f0 3c 58              stsp16	[sp+0x58], r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 f0 3c 54              stsp16	[sp+0x54], r4
 f0 3d 56              stsp16	[sp+0x56], r5
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 78 0f              ldi16	r6, 0xf78
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e1 00 ff              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 7d 0f              ldi16	r6, 0xf7d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 e1 ec fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 84 0f              ldi16	r6, 0xf84
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 66              leasp	r4, 0x66
 e1 d8 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 c6 89 0f              ldi16	r6, 0xf89
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 5e              leasp	r4, 0x5e
 e1 c3 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 00 02              ldi8	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 06 8a 0f           ldi16	r2, 0xf8a
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 14 56              leasp	r4, 0x56
 f2 6b                 mov32	q3, q1
 e1 a8 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c4 07 01              ldi16	r4, 0x107
 c5 18 01              ldi16	r5, 0x118
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+343
 d6 fe                 adjsp	-0x2
 c4 04 01              ldi16	r4, 0x104
 f4 40                 stsp16	[sp+0x0], r4
 c6 8d 0f              ldi16	r6, 0xf8d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 18 01              ldi16	r4, 0x118
 e1 77 fe              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c4 01 01              ldi16	r4, 0x101
 c5 1f 02              ldi16	r5, 0x21f
 c2 64                 ldi8	r6, 0x64
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+381
 a0                    xor	r4, r4
 f0 4c 20 03           stm8	[0x320], r4
 c4 21 03              ldi16	r4, 0x321
 c1 b6                 ldi8	r5, 0xb6
 f6 05                 st8	[r4+], r5
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f8                 brne8	avm_test_main+399
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 c4 1f 02              ldi16	r4, 0x21f
 f2 6b                 mov32	q3, q1
 e1 51 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 96              leasp	r4, 0x96
 f0 00 9c              ldi8	r0, 0x9c
 07                    mov	r5, r7
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 0d                    mov	r7, r5
 f7 05                 ld8u	r5, [r4+]
 a6                    xor	r5, r6
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 19                    add	r6, r5
 f5 2c                 cmp	r7, r0
 d1 ea                 brne8	avm_test_main+437
 f0 3d 4c              stsp16	[sp+0x4c], r5
 1d                    add	r7, r5
 c5 2b 6d              ldi16	r5, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 10 8f              leasp	r0, 0x8f
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f0 6c c1              ld8u	r6, [r0+]
 a9                    xor	r6, r5
 f0 0b ef              addi.s8	r3, -0x11
 c8 11                 addi.s8	r4, 0x11
 04                    mov	r5, r4
 16                    add	r5, r6
 cc 69                 cmpi.s8	r4, 0x69
 d1 eb                 brne8	avm_test_main+475
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 3e 4a              stsp16	[sp+0x4a], r6
 12                    add	r4, r6
 f0 3c 2a              stsp16	[sp+0x2a], r4
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 89              leasp	r4, 0x89
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
 d1 ec                 brne8	avm_test_main+518
 f0 38 24              stsp16	[sp+0x24], r0
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 3e 48              stsp16	[sp+0x48], r6
 1e                    add	r7, r6
 f0 3f 28              stsp16	[sp+0x28], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 84              leasp	r4, 0x84
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
 cf 47                 cmpi.s8	r7, 0x47
 d1 ec                 brne8	avm_test_main+566
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3e 46              stsp16	[sp+0x46], r6
 1e                    add	r7, r6
 f0 3f 3a              stsp16	[sp+0x3a], r7
 c4 2b 6d              ldi16	r4, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 16 78              leasp	r6, 0x78
 f0 03 be              ldi8	r3, 0xbe
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f7 12                 ld8u	r2, [r6+]
 f9 52                 xor	r2, r4
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 03                    mov	r4, r7
 f2 22                 add	r4, r2
 f5 2f                 cmp	r7, r3
 d1 ea                 brne8	avm_test_main+611
 f0 38 20              stsp16	[sp+0x20], r0
 f2 2e                 add	r7, r2
 f0 3f 38              stsp16	[sp+0x38], r7
 c4 2b 6d              ldi16	r4, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 16 6c              leasp	r6, 0x6c
 07                    mov	r5, r7
 0c                    mov	r7, r4
 fa ab                 lsr16i	r7, 0xb
 fa 35                 lsl16i	r4, 0x5
 93                    or	r4, r7
 0d                    mov	r7, r5
 f7 15                 ld8u	r5, [r6+]
 a4                    xor	r5, r4
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 03                    mov	r4, r7
 11                    add	r4, r5
 f5 2f                 cmp	r7, r3
 d1 ea                 brne8	avm_test_main+653
 1d                    add	r7, r5
 f0 3f 36              stsp16	[sp+0x36], r7
 c4 2b 6d              ldi16	r4, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 13 64              leasp	r3, 0x64
 f0 3f 52              stsp16	[sp+0x52], r7
 0c                    mov	r7, r4
 fa ab                 lsr16i	r7, 0xb
 fa 35                 lsl16i	r4, 0x5
 93                    or	r4, r7
 f0 37 52              ldsp16	r7, [sp+0x52]
 f0 6c c7              ld8u	r6, [r3+]
 a8                    xor	r6, r4
 f0 09 ef              addi.s8	r1, -0x11
 cb 11                 addi.s8	r7, 0x11
 03                    mov	r4, r7
 12                    add	r4, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 e5                 brne8	avm_test_main+691
 f0 39 10              stsp16	[sp+0x10], r1
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 3e 40              stsp16	[sp+0x40], r6
 1e                    add	r7, r6
 f0 3f 52              stsp16	[sp+0x52], r7
 c4 2b 6d              ldi16	r4, 0x6d2b
 c5 f2 ff              ldi16	r5, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 16 5c              leasp	r6, 0x5c
 0c                    mov	r7, r4
 fa ab                 lsr16i	r7, 0xb
 fa 35                 lsl16i	r4, 0x5
 93                    or	r4, r7
 f7 17                 ld8u	r7, [r6+]
 ac                    xor	r7, r4
 f0 08 ef              addi.s8	r0, -0x11
 c9 11                 addi.s8	r5, 0x11
 01                    mov	r4, r5
 13                    add	r4, r7
 cd 7a                 cmpi.s8	r5, 0x7a
 d1 ec                 brne8	avm_test_main+746
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 3f 3e              stsp16	[sp+0x3e], r7
 17                    add	r5, r7
 f0 3d 3c              stsp16	[sp+0x3c], r5
 c7 2b 6d              ldi16	r7, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 54              leasp	r4, 0x54
 07                    mov	r5, r7
 fa 8b                 lsr16i	r5, 0xb
 fa 65                 lsl16i	r7, 0x5
 9d                    or	r7, r5
 f7 03                 ld8u	r3, [r4+]
 f9 7e                 xor	r3, r7
 f0 08 ef              addi.s8	r0, -0x11
 ca 11                 addi.s8	r6, 0x11
 0e                    mov	r7, r6
 f2 2f                 add	r7, r3
 ce 7a                 cmpi.s8	r6, 0x7a
 d1 ea                 brne8	avm_test_main+788
 f0 3a 44              stsp16	[sp+0x44], r2
 f2 2b                 add	r6, r3
 f0 3e 34              stsp16	[sp+0x34], r6
 c4 2b 6d              ldi16	r4, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 06 18 01           ldi16	r2, 0x118
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 6c c5              ld8u	r6, [r2+]
 a8                    xor	r6, r4
 f0 09 ef              addi.s8	r1, -0x11
 cb 11                 addi.s8	r7, 0x11
 03                    mov	r4, r7
 12                    add	r4, r6
 c5 69 11              ldi16	r5, 0x1169
 3d                    cmp	r7, r5
 d1 e9                 brne8	avm_test_main+831
 f0 3e 32              stsp16	[sp+0x32], r6
 1e                    add	r7, r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 c4 2b 6d              ldi16	r4, 0x6d2b
 c5 f2 ff              ldi16	r5, 0xfff2
 f0 3d 50              stsp16	[sp+0x50], r5
 f0 02 0e              ldi8	r2, 0xe
 c6 1f 02              ldi16	r6, 0x21f
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f7 15                 ld8u	r5, [r6+]
 a4                    xor	r5, r4
 f0 0a ef              addi.s8	r2, -0x11
 f0 37 50              ldsp16	r7, [sp+0x50]
 cb 11                 addi.s8	r7, 0x11
 03                    mov	r4, r7
 f0 3d 4e              stsp16	[sp+0x4e], r5
 11                    add	r4, r5
 c5 e0 11              ldi16	r5, 0x11e0
 f0 3f 50              stsp16	[sp+0x50], r7
 3d                    cmp	r7, r5
 d1 e1                 brne8	avm_test_main+876
 f0 35 4c              ldsp16	r5, [sp+0x4c]
 f0 34 30              ldsp16	r4, [sp+0x30]
 24                    sub	r5, r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 c2 30                 ldi8	r6, 0x30
 0d                    mov	r7, r5
 9e                    or	r7, r6
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 36 4a              ldsp16	r6, [sp+0x4a]
 f0 34 26              ldsp16	r4, [sp+0x26]
 28                    sub	r6, r4
 f0 3e 4a              stsp16	[sp+0x4a], r6
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 c3 30                 ldi8	r7, 0x30
 93                    or	r4, r7
 c9 37                 addi.s8	r5, 0x37
 c3 a0                 ldi8	r7, 0xa0
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 35 48              ldsp16	r5, [sp+0x48]
 f0 34 24              ldsp16	r4, [sp+0x24]
 24                    sub	r5, r4
 f0 3d 48              stsp16	[sp+0x48], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 c3 30                 ldi8	r7, 0x30
 9b                    or	r6, r7
 0e                    mov	r7, r6
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 35 46              ldsp16	r5, [sp+0x46]
 f0 34 22              ldsp16	r4, [sp+0x22]
 24                    sub	r5, r4
 f0 3d 46              stsp16	[sp+0x46], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 c3 30                 ldi8	r7, 0x30
 9b                    or	r6, r7
 c9 37                 addi.s8	r5, 0x37
 c3 a0                 ldi8	r7, 0xa0
 33                    cmp	r4, r7
 fc 2e                 cmov.ult	r5, r6
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 35 44              ldsp16	r5, [sp+0x44]
 f0 34 20              ldsp16	r4, [sp+0x20]
 24                    sub	r5, r4
 f0 3d 44              stsp16	[sp+0x44], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 c3 30                 ldi8	r7, 0x30
 9b                    or	r6, r7
 0e                    mov	r7, r6
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 35 42              ldsp16	r5, [sp+0x42]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 24                    sub	r5, r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 c3 30                 ldi8	r7, 0x30
 93                    or	r4, r7
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 35 40              ldsp16	r5, [sp+0x40]
 f0 34 10              ldsp16	r4, [sp+0x10]
 24                    sub	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 93                    or	r4, r7
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f4 38                 ldsp16	r4, [sp+0xe]
 24                    sub	r5, r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 93                    or	r4, r7
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f2 48                 sub	r3, r0
 f1 27                 mov	r5, r3
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f1 07                 mov	r0, r7
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 35 32              ldsp16	r5, [sp+0x32]
 f2 55                 sub	r5, r1
 f0 3d 32              stsp16	[sp+0x32], r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 04                    mov	r5, r4
 f2 56                 sub	r5, r2
 f0 3d 30              stsp16	[sp+0x30], r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 02 0f              ldi8	r2, 0xf
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 4a              stsp16	[sp+0x4a], r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 34 48              ldsp16	r4, [sp+0x48]
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 34 46              ldsp16	r4, [sp+0x46]
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 3b                    cmp	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 34 40              ldsp16	r4, [sp+0x40]
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 34 52              ldsp16	r4, [sp+0x52]
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f0 34 42              ldsp16	r4, [sp+0x42]
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 37 36              ldsp16	r7, [sp+0x36]
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 44              ldsp16	r4, [sp+0x44]
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 35 38              ldsp16	r5, [sp+0x38]
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 f1 0b                 mov	r1, r3
 08                    mov	r6, r4
 f1 18                 mov	r3, r0
 f9 cd                 or	r6, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 24                 cmp	r5, r0
 fa 8c                 lsr16i	r5, 0xc
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 38              stsp16	[sp+0x38], r5
 f5 2c                 cmp	r7, r0
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 f9 cd                 or	r6, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f0 3f 36              stsp16	[sp+0x36], r7
 f0 34 52              ldsp16	r4, [sp+0x52]
 f5 20                 cmp	r4, r0
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f5 24                 cmp	r5, r0
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f9 28                 and	r1, r2
 f1 29                 mov	r6, r1
 f9 cd                 or	r6, r3
 f1 27                 mov	r5, r3
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0e                 cmov.ult	r1, r6
 f0 37 34              ldsp16	r7, [sp+0x34]
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 08                    mov	r6, r4
 99                    or	r6, r5
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 f5 2c                 cmp	r7, r0
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 99                    or	r6, r5
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f0 3f 34              stsp16	[sp+0x34], r7
 f0 37 30              ldsp16	r7, [sp+0x30]
 f9 e8                 and	r7, r2
 0b                    mov	r6, r7
 99                    or	r6, r5
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f0 3f 30              stsp16	[sp+0x30], r7
 f0 37 50              ldsp16	r7, [sp+0x50]
 f0 36 4e              ldsp16	r6, [sp+0x4e]
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 91                    or	r4, r5
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 4e              stsp16	[sp+0x4e], r6
 f5 2c                 cmp	r7, r0
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 99                    or	r6, r5
 cb 37                 addi.s8	r7, 0x37
 fc 3e                 cmov.ult	r7, r6
 f0 3f 50              stsp16	[sp+0x50], r7
 f0 33 32              ldsp16	r3, [sp+0x32]
 f9 68                 and	r3, r2
 f1 2b                 mov	r6, r3
 99                    or	r6, r5
 f0 0f 0a              cmpi.s8	r3, 0xa
 f0 0b 37              addi.s8	r3, 0x37
 fc 1e                 cmov.ult	r3, r6
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 99                    or	r6, r5
 c8 37                 addi.s8	r4, 0x37
 f5 2c                 cmp	r7, r0
 fc 26                 cmov.ult	r4, r6
 08                    mov	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 97                    or	r5, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
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
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
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
 d1 f0                 brne8	avm_test_main+2186
 c0 09                 ldi8	r4, 0x9
 f0 05 2d 03           ldi16	r1, 0x32d
 f0 17 96              leasp	r7, 0x96
 f0 45 23 03           ldm8u	r5, [0x323]
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f0 45 22 03           ldm8u	r5, [0x322]
 f0 3d 50              stsp16	[sp+0x50], r5
 f0 45 21 03           ldm8u	r5, [0x321]
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f0 45 20 03           ldm8u	r5, [0x320]
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f0 45 1e 02           ldm8u	r5, [0x21e]
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 45 1d 02           ldm8u	r5, [0x21d]
 f0 3d 46              stsp16	[sp+0x46], r5
 f0 45 1c 02           ldm8u	r5, [0x21c]
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 00 01              ldi8	r0, 0x1
 f0 6c 63              ld8u	r3, [r1+]
 f7 1a                 ld8u	r2, [r7+]
 f6 2c                 tst16	r4
 f8 0d                 cset.ne	r5
 f4 b4                 dec16	r4
 f5 13                 cmp	r2, r3
 d1 06                 brne8	avm_test_main+2284
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+2263
 c0 01                 ldi8	r4, 0x1
 f0 37 52              ldsp16	r7, [sp+0x52]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 3d                    cmp	r7, r5
 f8 05                 cset.eq	r5
 f5 13                 cmp	r2, r3
 db 6c 01              brne16	avm_test_main+2665
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 3e 52              stsp16	[sp+0x52], r6
 c2 06                 ldi8	r6, 0x6
 c7 37 03              ldi16	r7, 0x337
 f0 13 8f              leasp	r3, 0x8f
 f0 01 01              ldi8	r1, 0x1
 f7 1d                 ld8u	r5, [r7+]
 f0 6c 47              ld8u	r2, [r3+]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 f4 b6                 dec16	r6
 f5 15                 cmp	r2, r5
 d1 06                 brne8	avm_test_main+2339
 f9 04                 and	r0, r1
 f4 a0                 tst8	r0
 d1 eb                 brne8	avm_test_main+2318
 f5 15                 cmp	r2, r5
 db 41 01              brne16	avm_test_main+2665
 c2 05                 ldi8	r6, 0x5
 f0 07 3e 03           ldi16	r3, 0x33e
 f0 11 89              leasp	r1, 0x89
 c3 01                 ldi8	r7, 0x1
 f0 6c 47              ld8u	r2, [r3+]
 f0 6c 03              ld8u	r0, [r1+]
 f6 2e                 tst16	r6
 f8 0d                 cset.ne	r5
 f4 b6                 dec16	r6
 f5 02                 cmp	r0, r2
 d1 05                 brne8	avm_test_main+2376
 87                    and	r5, r7
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+2355
 f5 02                 cmp	r0, r2
 db 1c 01              brne16	avm_test_main+2665
 f0 11 84              leasp	r1, 0x84
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f4 b5                 dec16	r5
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+2407
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+2388
 f0 1d 78              ldsp8u	r5, [sp+0x78]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 f2 39                 sub	r1, r1
 db f7 00              brne16	avm_test_main+2665
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db f0 00              brne16	avm_test_main+2665
 c3 72                 ldi8	r7, 0x72
 c5 45 03              ldi16	r5, 0x345
 f0 16 78              leasp	r6, 0x78
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+2451
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2433
 e0 d6 00              jmp16	avm_test_main+2665
 f0 1d 6c              ldsp8u	r5, [sp+0x6c]
 cd 73                 cmpi.s8	r5, 0x73
 db ce 00              brne16	avm_test_main+2665
 c3 73                 ldi8	r7, 0x73
 c5 4d 03              ldi16	r5, 0x34d
 f0 16 6c              leasp	r6, 0x6c
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+2485
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2467
 e0 b4 00              jmp16	avm_test_main+2665
 f0 1d 64              ldsp8u	r5, [sp+0x64]
 cd 69                 cmpi.s8	r5, 0x69
 db ac 00              brne16	avm_test_main+2665
 c3 69                 ldi8	r7, 0x69
 c5 54 03              ldi16	r5, 0x354
 f0 16 64              leasp	r6, 0x64
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+2519
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2501
 e0 92 00              jmp16	avm_test_main+2665
 f0 1d 5c              ldsp8u	r5, [sp+0x5c]
 cd 6f                 cmpi.s8	r5, 0x6f
 db 8a 00              brne16	avm_test_main+2665
 c3 6f                 ldi8	r7, 0x6f
 c5 58 03              ldi16	r5, 0x358
 f0 16 5c              leasp	r6, 0x5c
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2552
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2535
 d4 71                 jmp8	avm_test_main+2665
 f0 00 01              ldi8	r0, 0x1
 f0 1c 54              ldsp8u	r4, [sp+0x54]
 cc 67                 cmpi.s8	r4, 0x67
 f1 20                 mov	r4, r0
 d1 34                 brne8	avm_test_main+2616
 c2 67                 ldi8	r6, 0x67
 c4 5c 03              ldi16	r4, 0x35c
 f0 15 54              leasp	r5, 0x54
 f4 a6                 tst8	r6
 d0 0c                 breq8	avm_test_main+2588
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+2572
 d4 03                 jmp8	avm_test_main+2591
 f0 31 44              ldsp16	r1, [sp+0x44]
 c0 01                 ldi8	r4, 0x1
 f9 86                 xor	r4, r1
 f0 37 46              ldsp16	r7, [sp+0x46]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 09                    mov	r6, r5
 3e                    cmp	r7, r6
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 48              ldsp16	r4, [sp+0x48]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 35 52              ldsp16	r5, [sp+0x52]
 f6 2d                 tst16	r5
 f8 06                 cset.eq	r6
 98                    or	r6, r4
 f0 35 4a              ldsp16	r5, [sp+0x4a]
 f1 75                 zext8	r5
 c0 b6                 ldi8	r4, 0xb6
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 f1 74                 zext8	r4
 cc 67                 cmpi.s8	r4, 0x67
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 4e              ldsp16	r6, [sp+0x4e]
 f1 76                 zext8	r6
 ce 6f                 cmpi.s8	r6, 0x6f
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 91                    or	r4, r5
 f9 80                 and	r4, r0
 d6 7f                 adjsp	0x7f
 d6 21                 adjsp	0x21
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
