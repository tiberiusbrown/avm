
codegen_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_float.c
000004ff l     F .text	0000002a arithmetic
000004e8 l     F .text	00000017 float_bits
00000529 l     F .text	00000017 divide_exact
00000540 l     F .text	00000010 sqrt_exact
00000550 l     F .text	00000036 select_min
00000586 l     F .text	00000036 select_max
000005bc l     F .text	00000010 convert_signed
000005cc l     F .text	00000010 convert_unsigned
000005dc l     F .text	00000021 from_integers
00000100 l     O .data	00000003 .L.str
000005fd l     F .text	0000001d test_line32
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
0000010c l     O .data	00000003 .L.str.4
0000010f l     O .data	00000003 .L.str.5
00000112 l     O .data	00000003 .L.str.6
0000061a l     F .text	00000022 test_puts
0000063c l     F .text	0000000b test_putc
00000647 l     F .text	00000011 test_hex32
00000658 l     F .text	0000000f test_hex16
00000667 l     F .text	00000019 test_hex8
00000680 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 math.c
00000000 l    df *ABS*	00000000 runtime.c
000006b1 l       .init_array	00000000 .hidden __init_array_end
000006b1 l       .init_array	00000000 .hidden __init_array_start
000006b1 l       .fini_array	00000000 .hidden __fini_array_start
000006b1 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000211 avm_test_main
000006af g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000006ac g     F .text	00000003 sqrtf

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
 e1 91 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b1 06              ldi16	r4, 0x6b1
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 b1 06              ldi16	r6, 0x6b1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 b1 06           ldi16	r0, 0x6b1
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b1 06           ldi16	r2, 0x6b1
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
 c4 b1 06              ldi16	r4, 0x6b1
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 b1 06              ldi16	r6, 0x6b1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 b1 06           ldi16	r2, 0x6b1
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b1 06           ldi16	r0, 0x6b1
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

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 b6                 adjsp	-0x4a
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3d 44              stsp16	[sp+0x44], r5
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 a0                    xor	r4, r4
 c5 f0 40              ldi16	r5, 0x40f0
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 a0                    xor	r4, r4
 c5 20 40              ldi16	r5, 0x4020
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 a0                    xor	r4, r4
 c5 a2 42              ldi16	r5, 0x42a2
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3d 34              stsp16	[sp+0x34], r5
 a0                    xor	r4, r4
 c5 60 c0              ldi16	r5, 0xc060
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 a0                    xor	r4, r4
 c5 10 40              ldi16	r5, 0x4010
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 a0                    xor	r4, r4
 c5 4c c1              ldi16	r5, 0xc14c
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 c4 00 80              ldi16	r4, 0x8000
 c5 7a 43              ldi16	r5, 0x437a
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 34 46              ldsp16	r4, [sp+0x46]
 f0 35 48              ldsp16	r5, [sp+0x48]
 f0 36 42              ldsp16	r6, [sp+0x42]
 f0 37 44              ldsp16	r7, [sp+0x44]
 f0 30 3e              ldsp16	r0, [sp+0x3e]
 f0 31 40              ldsp16	r1, [sp+0x40]
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 a1 01              call16	arithmetic
 d6 04                 adjsp	0x4
 e1 85 01              call16	float_bits
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 e1 b1 01              call16	divide_exact
 e1 6d 01              call16	float_bits
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 34 32              ldsp16	r4, [sp+0x32]
 f0 35 34              ldsp16	r5, [sp+0x34]
 e1 b6 01              call16	sqrt_exact
 e1 5b 01              call16	float_bits
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 e1 ae 01              call16	select_min
 e1 43 01              call16	float_bits
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 e1 cc 01              call16	select_max
 e1 2b 01              call16	float_bits
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 e1 f1 01              call16	convert_signed
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 e1 f2 01              call16	convert_unsigned
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 af                    xor	r7, r7
 92                    or	r4, r6
 97                    or	r5, r7
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c4 f4 ff              ldi16	r4, 0xfff4
 c1 32                 ldi8	r5, 0x32
 e1 ee 01              call16	from_integers
 e1 f7 00              call16	float_bits
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 c4 00 01              ldi16	r4, 0x100
 e1 fc 01              call16	test_line32
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 c4 03 01              ldi16	r4, 0x103
 e1 f0 01              call16	test_line32
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 c4 06 01              ldi16	r4, 0x106
 e1 e4 01              call16	test_line32
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 c4 09 01              ldi16	r4, 0x109
 e1 d8 01              call16	test_line32
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 c4 0c 01              ldi16	r4, 0x10c
 e1 cd 01              call16	test_line32
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 c4 0f 01              ldi16	r4, 0x10f
 e1 c3 01              call16	test_line32
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 c4 12 01              ldi16	r4, 0x112
 e1 b9 01              call16	test_line32
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 c0 01                 ldi8	r4, 0x1
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f0 69 c0              cmp32	q3, q0
 f4 50                 stsp16	[sp+0x4], r4
 db 84 00              brne16	avm_test_main+519
 d4 00                 jmp8	avm_test_main+389
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 c0 01                 ldi8	r4, 0x1
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 f0 69 c0              cmp32	q3, q0
 f4 50                 stsp16	[sp+0x4], r4
 d1 6d                 brne8	avm_test_main+519
 d4 00                 jmp8	avm_test_main+412
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 c0 01                 ldi8	r4, 0x1
 f2 30                 sub	r0, r0
 f0 05 10 41           ldi16	r1, 0x4110
 f0 69 c0              cmp32	q3, q0
 f4 50                 stsp16	[sp+0x4], r4
 d1 56                 brne8	avm_test_main+519
 d4 00                 jmp8	avm_test_main+435
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 c0 01                 ldi8	r4, 0x1
 f2 30                 sub	r0, r0
 f0 05 60 c0           ldi16	r1, 0xc060
 f0 69 c0              cmp32	q3, q0
 f4 50                 stsp16	[sp+0x4], r4
 d1 3f                 brne8	avm_test_main+519
 d4 00                 jmp8	avm_test_main+458
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 c0 01                 ldi8	r4, 0x1
 f2 30                 sub	r0, r0
 f0 05 10 40           ldi16	r1, 0x4010
 f0 69 c0              cmp32	q3, q0
 f4 50                 stsp16	[sp+0x4], r4
 d1 29                 brne8	avm_test_main+519
 d4 00                 jmp8	avm_test_main+480
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 c0 01                 ldi8	r4, 0x1
 f0 00 fa              ldi8	r0, 0xfa
 f0 05 f4 ff           ldi16	r1, 0xfff4
 f0 69 c0              cmp32	q3, q0
 f4 50                 stsp16	[sp+0x4], r4
 d1 13                 brne8	avm_test_main+519
 d4 00                 jmp8	avm_test_main+502
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 aa                    xor	r6, r6
 c7 50 41              ldi16	r7, 0x4150
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	avm_test_main+519
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 4a                 adjsp	0x4a
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<float_bits>:
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 04                 ldi8	r6, 0x4
 f0 15 04              leasp	r5, 0x4
 f0 14 00              leasp	r4, 0x0
 d7 0f                 sys	memcpy
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 08                 adjsp	0x8
 ef                    ret

<arithmetic>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 30 0f              ldsp16	r0, [sp+0xf]
 f0 31 11              ldsp16	r1, [sp+0x11]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 3e                 ldsp16	r6, [sp+0xf]
 f0 37 11              ldsp16	r7, [sp+0x11]
 ff 28                 fmul	q2, q0
 ff 0b                 fadd	q2, q3
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<divide_exact>:
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 3b                 fdiv	q2, q3
 d6 08                 adjsp	0x8
 ef                    ret

<sqrt_exact>:
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 5f 01              call16	sqrtf
 d6 04                 adjsp	0x4
 ef                    ret

<select_min>:
 d6 f4                 adjsp	-0xc
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff c8 4b              fcmp	r4, q2, q3
 cc ff                 cmpi.s8	r4, -0x1
 d1 0c                 brne8	select_min+37
 d4 00                 jmp8	select_min+27
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 0a                 jmp8	select_min+47
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 00                 jmp8	select_min+47
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 0c                 adjsp	0xc
 ef                    ret

<select_max>:
 d6 f4                 adjsp	-0xc
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff c8 4b              fcmp	r4, q2, q3
 cc 01                 cmpi.s8	r4, 0x1
 d1 0c                 brne8	select_max+37
 d4 00                 jmp8	select_max+27
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 0a                 jmp8	select_max+47
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 00                 jmp8	select_max+47
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 0c                 adjsp	0xc
 ef                    ret

<convert_signed>:
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff c2 42              ftos16	r4, q2
 d6 04                 adjsp	0x4
 ef                    ret

<convert_unsigned>:
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff c3 42              ftou16	r4, q2
 d6 04                 adjsp	0x4
 ef                    ret

<from_integers>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 ff c0 43              s16tof	q3, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 ff c1 42              u16tof	q2, r4
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 ff 28                 fmul	q2, q0
 ff 0b                 fadd	q2, q3
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<test_line32>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d5 11                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 2f                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d5 34                 call8	test_hex32
 c0 0a                 ldi8	r4, 0xa
 d5 25                 call8	test_putc
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

<test_hex32>:
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 07                 call8	test_hex16
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 03                 call8	test_hex16
 d6 04                 adjsp	0x4
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
 d5 c7                 call8	test_putc
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 07                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 bf                 call8	test_putc
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

<sqrtf>:
 ff 6a                 fsqrt	q2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
