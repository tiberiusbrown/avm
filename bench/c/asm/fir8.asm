
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
000004dd l       .init_array	00000000 .hidden __init_array_end
000004dd l       .init_array	00000000 .hidden __init_array_start
000004dd l       .fini_array	00000000 .hidden __fini_array_start
000004dd l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000204 avm_test_main
000004cb g     F .text	00000002 avm_halt
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
 e1 ad 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 dd 04              ldi16	r4, 0x4dd
 c1 00                 ldi8	r5, 0x0
 c6 dd 04              ldi16	r6, 0x4dd
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 dd 04           ldi16	r0, 0x4dd
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 dd 04           ldi16	r2, 0x4dd
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
 c4 dd 04              ldi16	r4, 0x4dd
 c1 00                 ldi8	r5, 0x0
 c6 dd 04              ldi16	r6, 0x4dd
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 dd 04           ldi16	r2, 0x4dd
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 dd 04           ldi16	r0, 0x4dd
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
 d6 d2                 adjsp	-0x2e
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
 c6 cd 04              ldi16	r6, 0x4cd
 c3 00                 ldi8	r7, 0x0
 c1 10                 ldi8	r5, 0x10
 d7 10                 sys	memcpy_p
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 45 6f 01           ldm8u	r5, [0x16f]
 f6 45                 sext8	r5
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 41 6e 01           ldm8u	r1, [0x16e]
 f6 41                 sext8	r1
 f0 46 6d 01           ldm8u	r6, [0x16d]
 f6 46                 sext8	r6
 f0 45 6c 01           ldm8u	r5, [0x16c]
 f6 45                 sext8	r5
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 45 6b 01           ldm8u	r5, [0x16b]
 f6 45                 sext8	r5
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 45 6a 01           ldm8u	r5, [0x16a]
 f6 45                 sext8	r5
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 45 69 01           ldm8u	r5, [0x169]
 f6 45                 sext8	r5
 f4 79                 stsp16	[sp+0xe], r5
 f0 45 68 01           ldm8u	r5, [0x168]
 f6 45                 sext8	r5
 f4 71                 stsp16	[sp+0xc], r5
 f0 45 67 01           ldm8u	r5, [0x167]
 f6 45                 sext8	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 47 66 01           ldm8u	r7, [0x166]
 f6 47                 sext8	r7
 f0 40 65 01           ldm8u	r0, [0x165]
 f6 40                 sext8	r0
 f0 45 64 01           ldm8u	r5, [0x164]
 f6 45                 sext8	r5
 f4 69                 stsp16	[sp+0xa], r5
 f0 45 63 01           ldm8u	r5, [0x163]
 f6 45                 sext8	r5
 f4 61                 stsp16	[sp+0x8], r5
 f0 45 62 01           ldm8u	r5, [0x162]
 f6 45                 sext8	r5
 f4 59                 stsp16	[sp+0x6], r5
 f0 45 61 01           ldm8u	r5, [0x161]
 f6 45                 sext8	r5
 f4 51                 stsp16	[sp+0x4], r5
 f0 45 60 01           ldm8u	r5, [0x160]
 f6 45                 sext8	r5
 f1 14                 mov	r2, r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 39 2c              stsp16	[sp+0x2c], r1
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 38 2a              stsp16	[sp+0x2a], r0
 f4 49                 stsp16	[sp+0x2], r5
<L1>:
 f0 3a 28              stsp16	[sp+0x28], r2
 f2 42                 sub	r2, r2
 f4 00                 ldsp16	r4, [sp+0x0]
<L2>:
 f4 40                 stsp16	[sp+0x0], r4
 0e                    mov	r7, r6
 f0 33 22              ldsp16	r3, [sp+0x22]
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 09                 ldsp16	r5, [sp+0x2]
 fe 2c                 mul16	r5, r4
 f1 22                 mov	r4, r2
 c6 01 01              ldi16	r6, 0x101
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 12                 ldsp16	r6, [sp+0x4]
 fe 34                 mul16	r6, r4
 19                    add	r6, r5
 f1 22                 mov	r4, r2
 c5 02 01              ldi16	r5, 0x102
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 19                 ldsp16	r5, [sp+0x6]
 fe 2c                 mul16	r5, r4
 16                    add	r5, r6
 f1 22                 mov	r4, r2
 c6 03 01              ldi16	r6, 0x103
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 fe 34                 mul16	r6, r4
 19                    add	r6, r5
 f1 22                 mov	r4, r2
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 29                 ldsp16	r5, [sp+0xa]
 fe 2c                 mul16	r5, r4
 16                    add	r5, r6
 f1 22                 mov	r4, r2
 c6 05 01              ldi16	r6, 0x105
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f1 28                 mov	r6, r0
 fe 34                 mul16	r6, r4
 19                    add	r6, r5
 f1 22                 mov	r4, r2
 c5 06 01              ldi16	r5, 0x106
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 fe 04                 mul16	r0, r4
 f2 06                 add	r0, r6
 f1 22                 mov	r4, r2
 c5 0f 01              ldi16	r5, 0x10f
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 fe 1c                 mul16	r3, r4
 f0 3b 26              stsp16	[sp+0x26], r3
 f1 22                 mov	r4, r2
 c5 0e 01              ldi16	r5, 0x10e
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 fe 0c                 mul16	r1, r4
 f0 39 24              stsp16	[sp+0x24], r1
 f1 22                 mov	r4, r2
 c5 0d 01              ldi16	r5, 0x10d
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 fe 3c                 mul16	r7, r4
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f1 22                 mov	r4, r2
 c5 0c 01              ldi16	r5, 0x10c
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 fe 2c                 mul16	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f1 22                 mov	r4, r2
 c5 0b 01              ldi16	r5, 0x10b
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f0 35 10              ldsp16	r5, [sp+0x10]
 fe 2c                 mul16	r5, r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f1 22                 mov	r4, r2
 c5 0a 01              ldi16	r5, 0x10a
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f0 31 20              ldsp16	r1, [sp+0x20]
 fe 0c                 mul16	r1, r4
 f1 22                 mov	r4, r2
 c5 09 01              ldi16	r5, 0x109
 11                    add	r4, r5
 f5 33                 ld8u	r3, [r4]
 f6 43                 sext8	r3
 f4 39                 ldsp16	r5, [sp+0xe]
 fe 2b                 mul16	r5, r3
 f1 2a                 mov	r6, r2
 c4 08 01              ldi16	r4, 0x108
 18                    add	r6, r4
 4a                    ld8u	r6, [r6]
 f6 46                 sext8	r6
 f4 30                 ldsp16	r4, [sp+0xc]
 fe 26                 mul16	r4, r6
 f1 2a                 mov	r6, r2
 c7 07 01              ldi16	r7, 0x107
 1b                    add	r6, r7
 4a                    ld8u	r6, [r6]
 f6 46                 sext8	r6
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 fe 1e                 mul16	r3, r6
 f2 18                 add	r3, r0
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f2 1c                 add	r3, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 1d                 add	r3, r5
 f2 19                 add	r3, r1
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f2 1e                 add	r3, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 f2 1e                 add	r3, r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f2 1e                 add	r3, r6
 f0 36 24              ldsp16	r6, [sp+0x24]
 f2 1e                 add	r3, r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 f2 1e                 add	r3, r6
 f2 23                 add	r4, r3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 aa                 inc16	r2
 f0 0e 40              cmpi.s8	r2, 0x40
 db de fe              brne16	-0x122 <L2>
 f4 40                 stsp16	[sp+0x0], r4
 f0 32 28              ldsp16	r2, [sp+0x28]
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db c7 fe              brne16	-0x139 <L1>
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 5c 70 01           stm16	[0x170], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
