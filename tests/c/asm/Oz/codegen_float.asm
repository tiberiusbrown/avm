
codegen_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_float.c
00000515 l     F .text	00000009 arithmetic
0000051e l     F .text	00000003 divide_exact
00000521 l     F .text	00000003 sqrt_exact
00000524 l     F .text	00000012 select_min
00000536 l     F .text	00000012 select_max
00000548 l     F .text	00000004 convert_signed
0000054c l     F .text	00000004 convert_unsigned
00000100 l     O .data	00000003 .L.str
00000550 l     F .text	00000024 test_line32
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
0000010c l     O .data	00000003 .L.str.4
0000010f l     O .data	00000003 .L.str.5
00000112 l     O .data	00000003 .L.str.6
00000574 l     F .text	00000011 test_hex16
00000585 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 math.c
00000000 l    df *ABS*	00000000 runtime.c
000005ae l       .init_array	00000000 .hidden __init_array_end
000005ae l       .init_array	00000000 .hidden __init_array_start
000005ae l       .fini_array	00000000 .hidden __fini_array_start
000005ae l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000023e avm_test_main
000005ac g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000005a9 g     F .text	00000003 sqrtf

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
 e1 8e 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ae 05              ldi16	r4, 0x5ae
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ae 05              ldi16	r6, 0x5ae
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 ae 05           ldi16	r0, 0x5ae
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ae 05           ldi16	r2, 0x5ae
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
 c4 ae 05              ldi16	r4, 0x5ae
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ae 05              ldi16	r6, 0x5ae
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 ae 05           ldi16	r2, 0x5ae
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ae 05           ldi16	r0, 0x5ae
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b6                 adjsp	-0x4a
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 a0                    xor	r4, r4
 c5 f0 40              ldi16	r5, 0x40f0
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3d 34              stsp16	[sp+0x34], r5
 a0                    xor	r4, r4
 c5 20 40              ldi16	r5, 0x4020
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 a0                    xor	r4, r4
 c5 a2 42              ldi16	r5, 0x42a2
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 a0                    xor	r4, r4
 c5 60 c0              ldi16	r5, 0xc060
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 a0                    xor	r4, r4
 c5 10 40              ldi16	r5, 0x4010
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 a0                    xor	r4, r4
 c5 4c c1              ldi16	r5, 0xc14c
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 c4 00 80              ldi16	r4, 0x8000
 c5 7a 43              ldi16	r5, 0x437a
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 f0 35 40              ldsp16	r5, [sp+0x40]
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f0 37 3c              ldsp16	r7, [sp+0x3c]
 f0 30 36              ldsp16	r0, [sp+0x36]
 f0 31 38              ldsp16	r1, [sp+0x38]
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 b5 01              call16	arithmetic
 d6 04                 adjsp	0x4
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 15 46              leasp	r5, 0x46
 f0 14 42              leasp	r4, 0x42
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 42              ldsp16	r4, [sp+0x42]
 f0 35 44              ldsp16	r5, [sp+0x44]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 32              ldsp16	r4, [sp+0x32]
 f0 35 34              ldsp16	r5, [sp+0x34]
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 e1 91 01              call16	divide_exact
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 15 46              leasp	r5, 0x46
 f0 14 42              leasp	r4, 0x42
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 42              ldsp16	r4, [sp+0x42]
 f0 35 44              ldsp16	r5, [sp+0x44]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 e1 6f 01              call16	sqrt_exact
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 15 46              leasp	r5, 0x46
 f0 14 42              leasp	r4, 0x42
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 42              ldsp16	r4, [sp+0x42]
 f0 35 44              ldsp16	r5, [sp+0x44]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 e1 48 01              call16	select_min
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 15 46              leasp	r5, 0x46
 f0 14 42              leasp	r4, 0x42
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 34 42              ldsp16	r4, [sp+0x42]
 f0 35 44              ldsp16	r5, [sp+0x44]
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 e1 31 01              call16	select_max
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 15 46              leasp	r5, 0x46
 f0 14 42              leasp	r4, 0x42
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 32 42              ldsp16	r2, [sp+0x42]
 f0 33 44              ldsp16	r3, [sp+0x44]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 e1 24 01              call16	convert_signed
 f4 58                 stsp16	[sp+0x6], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 e1 1d 01              call16	convert_unsigned
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 15 46              leasp	r5, 0x46
 f0 14 42              leasp	r4, 0x42
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 f0 30 42              ldsp16	r0, [sp+0x42]
 f0 31 44              ldsp16	r1, [sp+0x44]
 c4 00 01              ldi16	r4, 0x100
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 e1 f9 00              call16	test_line32
 c4 03 01              ldi16	r4, 0x103
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e1 ed 00              call16	test_line32
 c4 06 01              ldi16	r4, 0x106
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e1 e2 00              call16	test_line32
 c4 09 01              ldi16	r4, 0x109
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e1 d8 00              call16	test_line32
 c4 0c 01              ldi16	r4, 0x10c
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 6b                 mov32	q3, q1
 e1 ca 00              call16	test_line32
 f4 18                 ldsp16	r4, [sp+0x6]
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 c4 0f 01              ldi16	r4, 0x10f
 f2 6b                 mov32	q3, q1
 e1 b4 00              call16	test_line32
 c4 12 01              ldi16	r4, 0x112
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 6a                 mov32	q3, q0
 e1 a6 00              call16	test_line32
 c0 01                 ldi8	r4, 0x1
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 69 0c              cmp32	q0, q3
 d1 53                 brne8	avm_test_main+567
 aa                    xor	r6, r6
 c7 40 40              ldi16	r7, 0x4040
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 69 0c              cmp32	q0, q3
 d1 44                 brne8	avm_test_main+567
 aa                    xor	r6, r6
 c7 10 41              ldi16	r7, 0x4110
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 0c              cmp32	q0, q3
 d1 35                 brne8	avm_test_main+567
 aa                    xor	r6, r6
 c7 60 c0              ldi16	r7, 0xc060
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 69 0c              cmp32	q0, q3
 d1 26                 brne8	avm_test_main+567
 aa                    xor	r6, r6
 c7 10 40              ldi16	r7, 0x4010
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 d1 17                 brne8	avm_test_main+567
 c2 fa                 ldi8	r6, 0xfa
 c7 f4 ff              ldi16	r7, 0xfff4
 f0 69 4c              cmp32	q1, q3
 d1 0d                 brne8	avm_test_main+567
 a0                    xor	r4, r4
 c5 50 41              ldi16	r5, 0x4150
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 c8              cmp32	q3, q2
 f8 0c                 cset.ne	r4
 d6 4a                 adjsp	0x4a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<arithmetic>:
 ff 2b                 fmul	q2, q3
 f4 0e                 ldsp16	r6, [sp+0x3]
 f4 17                 ldsp16	r7, [sp+0x5]
 ff 0b                 fadd	q2, q3
 ef                    ret

<divide_exact>:
 ff 3b                 fdiv	q2, q3
 ef                    ret

<sqrt_exact>:
 e0 85 00              jmp16	sqrtf

<select_min>:
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 ff c8 68              fcmp	r6, q2, q0
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<select_max>:
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 ff c8 68              fcmp	r6, q2, q0
 ce 01                 cmpi.s8	r6, 0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<convert_signed>:
 ff c2 42              ftos16	r4, q2
 ef                    ret

<convert_unsigned>:
 ff c3 42              ftou16	r4, q2
 ef                    ret

<test_line32>:
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_line32+16
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_line32+5
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 d5 0b                 call8	test_hex16
 f1 20                 mov	r4, r0
 d5 07                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 b9                    pop16	r1
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

<sqrtf>:
 ff 6a                 fsqrt	q2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
