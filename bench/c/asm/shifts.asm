
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/shifts.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 shifts.c
00000100 l     O .data	00000020 values16
00000120 l     O .data	00000020 signed_values16
00000140 l     O .data	00000010 counts
00000150 l     O .data	00000020 values32
00000170 l     O .data	00000004 shift_result
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000264 avm_test_main
000004c2 g     F .text	00000002 avm_halt
0000047a g     F .text	00000024 __avm_ashlsi3
0000049e g     F .text	00000024 __avm_lshrsi3

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ac 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c4 34 12              ldi16	r4, 0x1234
 f0 5c 00 01           stm16	[0x100], r4
 c4 d0 8a              ldi16	r4, 0x8ad0
 f0 5c 20 01           stm16	[0x120], r4
 c0 01                 ldi8	r4, 0x1
 f0 4c 40 01           stm8	[0x140], r4
 c5 45 13              ldi16	r5, 0x1345
 f0 5d 02 01           stm16	[0x102], r5
 c5 ab 8d              ldi16	r5, 0x8dab
 f0 5d 22 01           stm16	[0x122], r5
 c1 02                 ldi8	r5, 0x2
 f0 4d 41 01           stm8	[0x141], r5
 c5 56 14              ldi16	r5, 0x1456
 f0 5d 04 01           stm16	[0x104], r5
 c5 86 90              ldi16	r5, 0x9086
 f0 5d 24 01           stm16	[0x124], r5
 c1 03                 ldi8	r5, 0x3
 f0 4d 42 01           stm8	[0x142], r5
 c5 67 15              ldi16	r5, 0x1567
 f0 5d 06 01           stm16	[0x106], r5
 c5 61 93              ldi16	r5, 0x9361
 f0 5d 26 01           stm16	[0x126], r5
 c1 04                 ldi8	r5, 0x4
 f0 4d 43 01           stm8	[0x143], r5
 c5 78 16              ldi16	r5, 0x1678
 f0 5d 08 01           stm16	[0x108], r5
 c5 3c 96              ldi16	r5, 0x963c
 f0 5d 28 01           stm16	[0x128], r5
 c1 05                 ldi8	r5, 0x5
 f0 4d 44 01           stm8	[0x144], r5
 c5 89 17              ldi16	r5, 0x1789
 f0 5d 0a 01           stm16	[0x10a], r5
 c5 17 99              ldi16	r5, 0x9917
 f0 5d 2a 01           stm16	[0x12a], r5
 c1 06                 ldi8	r5, 0x6
 f0 4d 45 01           stm8	[0x145], r5
 c5 9a 18              ldi16	r5, 0x189a
 f0 5d 0c 01           stm16	[0x10c], r5
 c5 f2 9b              ldi16	r5, 0x9bf2
 f0 5d 2c 01           stm16	[0x12c], r5
 c1 07                 ldi8	r5, 0x7
 f0 4d 46 01           stm8	[0x146], r5
 c5 ab 19              ldi16	r5, 0x19ab
 f0 5d 0e 01           stm16	[0x10e], r5
 c5 cd 9e              ldi16	r5, 0x9ecd
 f0 5d 2e 01           stm16	[0x12e], r5
 c1 08                 ldi8	r5, 0x8
 f0 4d 47 01           stm8	[0x147], r5
 c5 bc 1a              ldi16	r5, 0x1abc
 f0 5d 10 01           stm16	[0x110], r5
 c5 a8 a1              ldi16	r5, 0xa1a8
 f0 5d 30 01           stm16	[0x130], r5
 c1 09                 ldi8	r5, 0x9
 f0 4d 48 01           stm8	[0x148], r5
 c5 cd 1b              ldi16	r5, 0x1bcd
 f0 5d 12 01           stm16	[0x112], r5
 c5 83 a4              ldi16	r5, 0xa483
 f0 5d 32 01           stm16	[0x132], r5
 c1 0a                 ldi8	r5, 0xa
 f0 4d 49 01           stm8	[0x149], r5
 c5 de 1c              ldi16	r5, 0x1cde
 f0 5d 14 01           stm16	[0x114], r5
 c5 5e a7              ldi16	r5, 0xa75e
 f0 5d 34 01           stm16	[0x134], r5
 c1 0b                 ldi8	r5, 0xb
 f0 4d 4a 01           stm8	[0x14a], r5
 c5 ef 1d              ldi16	r5, 0x1def
 f0 5d 16 01           stm16	[0x116], r5
 c5 39 aa              ldi16	r5, 0xaa39
 f0 5d 36 01           stm16	[0x136], r5
 c1 0c                 ldi8	r5, 0xc
 f0 4d 4b 01           stm8	[0x14b], r5
 c5 00 1f              ldi16	r5, 0x1f00
 f0 5d 18 01           stm16	[0x118], r5
 c5 14 ad              ldi16	r5, 0xad14
 f0 5d 38 01           stm16	[0x138], r5
 c1 0d                 ldi8	r5, 0xd
 f0 4d 4c 01           stm8	[0x14c], r5
 c5 11 20              ldi16	r5, 0x2011
 f0 5d 1a 01           stm16	[0x11a], r5
 c5 ef af              ldi16	r5, 0xafef
 f0 5d 3a 01           stm16	[0x13a], r5
 c1 0e                 ldi8	r5, 0xe
 f0 4d 4d 01           stm8	[0x14d], r5
 c5 22 21              ldi16	r5, 0x2122
 f0 5d 1c 01           stm16	[0x11c], r5
 c5 ca b2              ldi16	r5, 0xb2ca
 f0 5d 3c 01           stm16	[0x13c], r5
 c1 0f                 ldi8	r5, 0xf
 f0 4d 4e 01           stm8	[0x14e], r5
 c5 33 22              ldi16	r5, 0x2233
 f0 5d 1e 01           stm16	[0x11e], r5
 c5 a5 b5              ldi16	r5, 0xb5a5
 f0 5d 3e 01           stm16	[0x13e], r5
 f0 4c 4f 01           stm8	[0x14f], r4
 c4 67 45              ldi16	r4, 0x4567
 c5 23 81              ldi16	r5, 0x8123
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c4 76 54              ldi16	r4, 0x5476
 c5 32 90              ldi16	r5, 0x9032
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 45 67              ldi16	r4, 0x6745
 c5 01 a3              ldi16	r5, 0xa301
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 54 76              ldi16	r4, 0x7654
 c5 10 b2              ldi16	r5, 0xb210
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 23 01              ldi16	r4, 0x123
 c5 67 c5              ldi16	r5, 0xc567
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c4 32 10              ldi16	r4, 0x1032
 c5 76 d4              ldi16	r5, 0xd476
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 01 23              ldi16	r4, 0x2301
 c5 45 e7              ldi16	r5, 0xe745
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 10 32              ldi16	r4, 0x3210
 c5 54 f6              ldi16	r5, 0xf654
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 c0 10                 ldi8	r4, 0x10
 04                    mov	r5, r4
 c4 20 01              ldi16	r4, 0x120
 08                    mov	r6, r4
 c4 40 01              ldi16	r4, 0x140
 f1 14                 mov	r2, r4
 c4 00 01              ldi16	r4, 0x100
 0c                    mov	r7, r4
 f4 79                 stsp16	[sp+0xe], r5
 f7 3c                 ld16	r4, [r7+]
 f4 6b                 stsp16	[sp+0xa], r7
 f0 6c e5              ld8u	r7, [r2+]
 f7 35                 ld16	r5, [r6+]
 f4 72                 stsp16	[sp+0xc], r6
 fa 27                 asr16v	r5, r7
 f4 59                 stsp16	[sp+0x6], r5
 c1 10                 ldi8	r5, 0x10
 27                    sub	r5, r7
 08                    mov	r6, r4
 fa 0b                 shl16v	r6, r7
 0c                    mov	r7, r4
 fa 1d                 lsr16v	r7, r5
 9e                    or	r7, r6
 04                    mov	r5, r4
 15                    add	r5, r5
 f1 2a                 mov	r6, r2
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 fa 73                 lsr16i	r4, 0x3
 a5                    xor	r5, r5
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f1 16                 mov	r2, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 18                 ldsp16	r4, [sp+0x6]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 b8                 brne8	avm_test_main+445
 c0 08                 ldi8	r4, 0x8
 04                    mov	r5, r4
 c4 40 01              ldi16	r4, 0x140
 08                    mov	r6, r4
 c4 50 01              ldi16	r4, 0x150
 f4 68                 stsp16	[sp+0xa], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 6a 88              ld32	q2, [r4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 17                 ld8u	r7, [r6+]
 f4 72                 stsp16	[sp+0xc], r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 d5 3e                 call8	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 d5 54                 call8	__avm_lshrsi3
 f4 32                 ldsp16	r6, [sp+0xc]
 f2 62                 mov32	q0, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c8 04                 addi.s8	r4, 0x4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 c7                 brne8	avm_test_main+527
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 db 57 ff              brne16	avm_test_main+427
 c4 70 01              ldi16	r4, 0x170
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashlsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_ashlsi3+16
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	__avm_ashlsi3+33
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_ashlsi3+33
 f7 6a                 add32	q2, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_ashlsi3+25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_lshrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_lshrsi3+16
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	__avm_lshrsi3+33
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_lshrsi3+33
 f7 82                 lsr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_lshrsi3+25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
