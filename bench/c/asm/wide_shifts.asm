
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/wide_shifts.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 wide_shifts.c
00000100 l     O .data	00000020 values
00000120 l     O .data	00000004 counts
00000124 l     O .data	00000008 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 integer.c
00000642 l       .init_array	00000000 .hidden __init_array_end
00000642 l       .init_array	00000000 .hidden __init_array_start
00000642 l       .fini_array	00000000 .hidden __fini_array_start
00000642 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000173 avm_test_main
0000044a g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000044c g     F .text	00000077 __avm_ashldi3
000004c3 g     F .text	00000087 __avm_lshrdi3
0000054a g     F .text	00000085 __avm_ashrdi3
000005cf g     F .text	00000024 __avm_ashlsi3
000005f3 g     F .text	00000024 __avm_lshrsi3
00000617 g     F .text	0000002b __avm_ashrsi3

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
 e1 2c 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 42 06              ldi16	r4, 0x642
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 42 06              ldi16	r6, 0x642
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 42 06           ldi16	r0, 0x642
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 42 06           ldi16	r2, 0x642
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
 c4 42 06              ldi16	r4, 0x642
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 42 06              ldi16	r6, 0x642
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 42 06           ldi16	r2, 0x642
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 42 06           ldi16	r0, 0x642
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
 d6 e2                 adjsp	-0x1e
 c4 67 45              ldi16	r4, 0x4567
 c5 23 81              ldi16	r5, 0x8123
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 ef cd              ldi16	r4, 0xcdef
 c5 ab 89              ldi16	r5, 0x89ab
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 ff ff              ldi16	r5, 0xffff
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 00 80              ldi16	r5, 0x8000
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 f0 4c 20 01           stm8	[0x120], r4
 c0 0f                 ldi8	r4, 0xf
 f0 4c 21 01           stm8	[0x121], r4
 c0 20                 ldi8	r4, 0x20
 f0 4c 22 01           stm8	[0x122], r4
 c0 3f                 ldi8	r4, 0x3f
 f0 4c 23 01           stm8	[0x123], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c5 20 01              ldi16	r5, 0x120
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 c4 00 01              ldi16	r4, 0x100
 08                    mov	r6, r4
 a0                    xor	r4, r4
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f0 3c 18              stsp16	[sp+0x18], r4
 f4 5a                 stsp16	[sp+0x6], r6
 f0 37 18              ldsp16	r7, [sp+0x18]
 1d                    add	r7, r5
 06                    mov	r5, r6
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 6a 8c              ld32	q2, [r6]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 4b                    ld8u	r6, [r7]
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 d6 fe                 adjsp	-0x2
 f4 42                 stsp16	[sp+0x0], r6
 f2 6b                 mov32	q3, q1
 e1 b8 00              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f2 66                 mov32	q1, q2
 f2 63                 mov32	q0, q3
 d6 fe                 adjsp	-0x2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e1 11 01              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 d6 fe                 adjsp	-0x2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 40                 stsp16	[sp+0x0], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f7 63                 add32	q0, q3
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 69                 add32	q2, q1
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 69 84              cmp32	q2, q1
 f8 14                 cset.ult	r4
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e1 4d 01              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f2 62                 mov32	q0, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 c5 20 01              ldi16	r5, 0x120
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 ca 08                 addi.s8	r6, 0x8
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 3d ff              brne16	avm_test_main+138
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 2a ff              brne16	avm_test_main+131
 c4 24 01              ldi16	r4, 0x124
 f0 6b 08              st32	[r4], q0
 c4 28 01              ldi16	r4, 0x128
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_ashldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 13              ldsp16	r2, [sp+0x13]
 f0 0e 40              cmpi.s8	r2, 0x40
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d8 58                 bruge8	__avm_ashldi3+112
 f0 0e 20              cmpi.s8	r2, 0x20
 d2 11                 brult8	__avm_ashldi3+46
 f0 0a e0              addi.s8	r2, -0x20
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 5b 01              call16	__avm_ashlsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 42                 jmp8	__avm_ashldi3+112
 f6 2a                 tst16	r2
 d0 38                 breq8	__avm_ashldi3+106
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 3f 01              call16	__avm_ashlsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 54 01              call16	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 1d 01              call16	__avm_ashlsi3
 f2 6b                 mov32	q3, q1
 d4 06                 jmp8	__avm_ashldi3+112
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 68                 mov32	q2, q0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_lshrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 17              ldsp16	r2, [sp+0x17]
 f0 0e 40              cmpi.s8	r2, 0x40
 f2 62                 mov32	q0, q2
 d8 68                 bruge8	__avm_lshrdi3+126
 f0 0e 20              cmpi.s8	r2, 0x20
 d2 14                 brult8	__avm_lshrdi3+47
 f0 0a e0              addi.s8	r2, -0x20
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e1 07 01              call16	__avm_lshrsi3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 4f                 jmp8	__avm_lshrdi3+126
 f6 2a                 tst16	r2
 d0 45                 breq8	__avm_lshrdi3+120
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 e1 e6 00              call16	__avm_lshrsi3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 68                 mov32	q2, q0
 e1 ad 00              call16	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e1 be 00              call16	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 d4 06                 jmp8	__avm_lshrdi3+126
 f2 63                 mov32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 0c 40              cmpi.s8	r0, 0x40
 d2 0d                 brult8	__avm_ashrdi3+27
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa bf                 asr16i	r4, 0xf
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 63                 jmp8	__avm_ashrdi3+126
 f0 0c 20              cmpi.s8	r0, 0x20
 d2 1e                 brult8	__avm_ashrdi3+62
 f0 08 e0              addi.s8	r0, -0x20
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 67                 mov32	q1, q3
 f2 6a                 mov32	q3, q0
 e1 9f 00              call16	__avm_ashrsi3
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa df                 asr16i	r6, 0xf
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 af                    xor	r7, r7
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 d4 40                 jmp8	__avm_ashrdi3+126
 f6 28                 tst16	r0
 d0 3c                 breq8	__avm_ashrdi3+126
 f1 10                 mov	r2, r0
 f2 4b                 sub	r3, r3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6b                 mov32	q3, q1
 d5 55                 call8	__avm_lshrsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 50                 sub	r4, r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 69                 mov32	q2, q1
 d5 1d                 call8	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d5 53                 call8	__avm_ashrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
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

<__avm_ashrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 0b                 bruge8	__avm_ashrsi3+23
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa bf                 asr16i	r4, 0xf
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d4 11                 jmp8	__avm_ashrsi3+40
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_ashrsi3+40
 f7 86                 asr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_ashrsi3+32
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
