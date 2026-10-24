
fir8.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 fir8.c
00000100 l     O .data	00000060 samples
00000160 l     O .data	00000010 coefficients
00000170 l     O .data	00000002 fir_result
00000000 l    df *ABS*	00000000 runtime.c
000004b5 l       .init_array	00000000 .hidden __init_array_end
000004b5 l       .init_array	00000000 .hidden __init_array_start
000004b5 l       .fini_array	00000000 .hidden __fini_array_start
000004b5 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000001dc avm_test_main
000004a3 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 85 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b5 04              ldi16	r4, 0x4b5
 c1 00                 ldi8	r5, 0x0
 c6 b5 04              ldi16	r6, 0x4b5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 b5 04           ldi16	r0, 0x4b5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b5 04           ldi16	r2, 0x4b5
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
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
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 b5 04              ldi16	r4, 0x4b5
 c1 00                 ldi8	r5, 0x0
 c6 b5 04              ldi16	r6, 0x4b5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 b5 04           ldi16	r2, 0x4b5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b5 04           ldi16	r0, 0x4b5
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 d6 d0                 adjsp	-0x30
 c4 00 01              ldi16	r4, 0x100
 c3 07                 ldi8	r7, 0x7
 c2 60                 ldi8	r6, 0x60
 f0 00 7f              ldi8	r0, 0x7f
<L0>:
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 c9 c0                 addi.s8	r5, -0x40
 f6 05                 st8	[r4+], r5
 cb 13                 addi.s8	r7, 0x13
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f1                 brne8	-0xf <L0>
 c4 60 01              ldi16	r4, 0x160
 c6 a5 04              ldi16	r6, 0x4a5
 c3 00                 ldi8	r7, 0x0
 c1 10                 ldi8	r5, 0x10
 d7 10                 sys	memcpy_p
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 47 6f 01           ldm8u	r7, [0x16f]
 f6 47                 sext8	r7
 f0 44 6e 01           ldm8u	r4, [0x16e]
 f6 44                 sext8	r4
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 44 6d 01           ldm8u	r4, [0x16d]
 f6 44                 sext8	r4
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 44 6c 01           ldm8u	r4, [0x16c]
 f6 44                 sext8	r4
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 44 6b 01           ldm8u	r4, [0x16b]
 f6 44                 sext8	r4
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 44 6a 01           ldm8u	r4, [0x16a]
 f6 44                 sext8	r4
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 44 69 01           ldm8u	r4, [0x169]
 f6 44                 sext8	r4
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 44 68 01           ldm8u	r4, [0x168]
 f6 44                 sext8	r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 44 67 01           ldm8u	r4, [0x167]
 f6 44                 sext8	r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 44 66 01           ldm8u	r4, [0x166]
 f6 44                 sext8	r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 44 65 01           ldm8u	r4, [0x165]
 f6 44                 sext8	r4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 44 64 01           ldm8u	r4, [0x164]
 f6 44                 sext8	r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 44 63 01           ldm8u	r4, [0x163]
 f6 44                 sext8	r4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 44 62 01           ldm8u	r4, [0x162]
 f6 44                 sext8	r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 44 61 01           ldm8u	r4, [0x161]
 f6 44                 sext8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 45 60 01           ldm8u	r5, [0x160]
 f6 45                 sext8	r5
 c6 00 01              ldi16	r6, 0x100
 f0 07 01 01           ldi16	r3, 0x101
 f1 10                 mov	r2, r0
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f4 79                 stsp16	[sp+0xe], r5
 f0 05 07 01           ldi16	r1, 0x107
<L1>:
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f2 42                 sub	r2, r2
<L2>:
 f1 22                 mov	r4, r2
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f3 24                 muls8.w	r5, r4
 f1 22                 mov	r4, r2
 f2 23                 add	r4, r3
 48                    ld8u	r6, [r4]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f3 22                 muls8.w	r4, r6
 11                    add	r4, r5
 f1 26                 mov	r5, r2
 c6 02 01              ldi16	r6, 0x102
 16                    add	r5, r6
 49                    ld8u	r6, [r5]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f3 26                 muls8.w	r5, r6
 14                    add	r5, r4
 f1 22                 mov	r4, r2
 c6 03 01              ldi16	r6, 0x103
 12                    add	r4, r6
 48                    ld8u	r6, [r4]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f3 22                 muls8.w	r4, r6
 11                    add	r4, r5
 f1 26                 mov	r5, r2
 c6 04 01              ldi16	r6, 0x104
 16                    add	r5, r6
 49                    ld8u	r6, [r5]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f3 26                 muls8.w	r5, r6
 14                    add	r5, r4
 f1 22                 mov	r4, r2
 c6 05 01              ldi16	r6, 0x105
 12                    add	r4, r6
 48                    ld8u	r6, [r4]
 f0 34 18              ldsp16	r4, [sp+0x18]
 f3 22                 muls8.w	r4, r6
 11                    add	r4, r5
 f1 26                 mov	r5, r2
 c6 06 01              ldi16	r6, 0x106
 16                    add	r5, r6
 45                    ld8u	r5, [r5]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 29                 muls8.w	r6, r5
 18                    add	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f1 22                 mov	r4, r2
 c5 0f 01              ldi16	r5, 0x10f
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f3 2c                 muls8.w	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 f1 22                 mov	r4, r2
 c5 0e 01              ldi16	r5, 0x10e
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f3 24                 muls8.w	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 22                 mov	r4, r2
 c5 0d 01              ldi16	r5, 0x10d
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f3 24                 muls8.w	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f1 22                 mov	r4, r2
 c5 0c 01              ldi16	r5, 0x10c
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f3 24                 muls8.w	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f1 22                 mov	r4, r2
 c5 0b 01              ldi16	r5, 0x10b
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f3 24                 muls8.w	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 22                 mov	r4, r2
 c5 0a 01              ldi16	r5, 0x10a
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f3 24                 muls8.w	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f1 22                 mov	r4, r2
 c5 09 01              ldi16	r5, 0x109
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f3 24                 muls8.w	r5, r4
 f1 22                 mov	r4, r2
 c6 08 01              ldi16	r6, 0x108
 12                    add	r4, r6
 48                    ld8u	r6, [r4]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f3 22                 muls8.w	r4, r6
 f1 2a                 mov	r6, r2
 f2 29                 add	r6, r1
 4e                    ld8u	r7, [r6]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f3 2b                 muls8.w	r6, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 1b                    add	r6, r7
 18                    add	r6, r4
 19                    add	r6, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 18                    add	r6, r4
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f4 08                 ldsp16	r4, [sp+0x2]
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 18                    add	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 18                    add	r6, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 18                    add	r6, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 18                    add	r6, r4
 f2 06                 add	r0, r6
 c6 00 01              ldi16	r6, 0x100
 f4 aa                 inc16	r2
 f0 0e 40              cmpi.s8	r2, 0x40
 db 10 ff              brne16	-0xf0 <L2>
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db fd fe              brne16	-0x103 <L1>
 f0 58 70 01           stm16	[0x170], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
