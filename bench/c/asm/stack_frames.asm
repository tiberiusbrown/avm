
stack_frames.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 stack_frames.c
00000100 l     O .data	00000002 stack_seed
000003d1 l     F .text	00000052 outer
00000102 l     O .data	00000002 stack_frames_result
00000423 l     F .text	000000ad middle
000004d0 l     F .text	0000000c leaf
00000000 l    df *ABS*	00000000 runtime.c
000004de l       .init_array	00000000 .hidden __init_array_end
000004de l       .init_array	00000000 .hidden __init_array_start
000004de l       .fini_array	00000000 .hidden __fini_array_start
000004de l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000010a avm_test_main
000004dc g     F .text	00000002 avm_halt
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
 e1 be 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 de 04              ldi16	r4, 0x4de
 c1 00                 ldi8	r5, 0x0
 c6 de 04              ldi16	r6, 0x4de
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 de 04           ldi16	r0, 0x4de
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 de 04           ldi16	r2, 0x4de
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 de 04              ldi16	r4, 0x4de
 c1 00                 ldi8	r5, 0x0
 c6 de 04              ldi16	r6, 0x4de
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 de 04           ldi16	r2, 0x4de
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 de 04           ldi16	r0, 0x4de
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 50 00 01           ldm16	r0, [0x100]
 f1 20                 mov	r4, r0
 e1 fd 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 f4 ac                 inc16	r4
 e1 f2 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 e1 e7 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 03                 addi.s8	r4, 0x3
 e1 dc 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 e1 d1 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 05                 addi.s8	r4, 0x5
 e1 c6 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 06                 addi.s8	r4, 0x6
 e1 bb 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 07                 addi.s8	r4, 0x7
 e1 b0 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 08                 addi.s8	r4, 0x8
 e1 a5 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 09                 addi.s8	r4, 0x9
 e1 9a 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 0a                 addi.s8	r4, 0xa
 e1 8f 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 0b                 addi.s8	r4, 0xb
 e1 84 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 0c                 addi.s8	r4, 0xc
 d5 7a                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 0d                 addi.s8	r4, 0xd
 d5 70                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 0e                 addi.s8	r4, 0xe
 d5 66                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 0f                 addi.s8	r4, 0xf
 d5 5c                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 10                 addi.s8	r4, 0x10
 d5 52                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 11                 addi.s8	r4, 0x11
 d5 48                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 12                 addi.s8	r4, 0x12
 d5 3e                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 13                 addi.s8	r4, 0x13
 d5 34                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 14                 addi.s8	r4, 0x14
 d5 2a                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 15                 addi.s8	r4, 0x15
 d5 20                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 16                 addi.s8	r4, 0x16
 d5 16                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 17                 addi.s8	r4, 0x17
 d5 0c                 call8	outer
 f2 21                 add	r4, r1
 f0 5c 02 01           stm16	[0x102], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<outer>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 04                 mov	r0, r4
 d5 48                 call8	middle
 f4 50                 stsp16	[sp+0x4], r4
 f1 20                 mov	r4, r0
 c8 1f                 addi.s8	r4, 0x1f
 d5 40                 call8	middle
 f4 48                 stsp16	[sp+0x2], r4
 f1 20                 mov	r4, r0
 c8 3e                 addi.s8	r4, 0x3e
 d5 38                 call8	middle
 f4 40                 stsp16	[sp+0x0], r4
 f1 20                 mov	r4, r0
 c8 5d                 addi.s8	r4, 0x5d
 d5 30                 call8	middle
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 c8 7c                 addi.s8	r4, 0x7c
 d5 28                 call8	middle
 f1 14                 mov	r2, r4
 c0 9b                 ldi8	r4, 0x9b
 f2 20                 add	r4, r0
 d5 20                 call8	middle
 f1 1c                 mov	r3, r4
 c0 ba                 ldi8	r4, 0xba
 f2 20                 add	r4, r0
 d5 18                 call8	middle
 f9 8e                 xor	r4, r3
 f9 8a                 xor	r4, r2
 f9 86                 xor	r4, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 a1                    xor	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 a1                    xor	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 f9 82                 xor	r4, r0
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<middle>:
 b1                    push16	r1
 b0                    push16	r0
 d6 e9                 adjsp	-0x17
 f1 04                 mov	r0, r4
 c8 1e                 addi.s8	r4, 0x1e
 f0 2c 16              stsp8	[sp+0x16], r4
 f1 20                 mov	r4, r0
 c8 11                 addi.s8	r4, 0x11
 f0 2c 15              stsp8	[sp+0x15], r4
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 f0 2c 14              stsp8	[sp+0x14], r4
 f1 20                 mov	r4, r0
 c8 f7                 addi.s8	r4, -0x9
 f0 2c 13              stsp8	[sp+0x13], r4
 f1 20                 mov	r4, r0
 c8 ea                 addi.s8	r4, -0x16
 f0 2c 12              stsp8	[sp+0x12], r4
 f1 20                 mov	r4, r0
 c8 dd                 addi.s8	r4, -0x23
 f0 2c 11              stsp8	[sp+0x11], r4
 f1 20                 mov	r4, r0
 c8 d0                 addi.s8	r4, -0x30
 f0 2c 10              stsp8	[sp+0x10], r4
 f1 20                 mov	r4, r0
 c8 c3                 addi.s8	r4, -0x3d
 f1 6c                 stsp8	[sp+0xf], r4
 f1 20                 mov	r4, r0
 c8 b6                 addi.s8	r4, -0x4a
 f1 68                 stsp8	[sp+0xe], r4
 f1 20                 mov	r4, r0
 c8 a9                 addi.s8	r4, -0x57
 f1 64                 stsp8	[sp+0xd], r4
 f1 20                 mov	r4, r0
 c8 9c                 addi.s8	r4, -0x64
 f1 60                 stsp8	[sp+0xc], r4
 f1 20                 mov	r4, r0
 c8 8f                 addi.s8	r4, -0x71
 f1 5c                 stsp8	[sp+0xb], r4
 f1 20                 mov	r4, r0
 c8 82                 addi.s8	r4, -0x7e
 f1 58                 stsp8	[sp+0xa], r4
 f1 20                 mov	r4, r0
 c8 75                 addi.s8	r4, 0x75
 f1 54                 stsp8	[sp+0x9], r4
 f1 20                 mov	r4, r0
 c8 68                 addi.s8	r4, 0x68
 f1 50                 stsp8	[sp+0x8], r4
 f1 20                 mov	r4, r0
 c8 5b                 addi.s8	r4, 0x5b
 f1 4c                 stsp8	[sp+0x7], r4
 f1 20                 mov	r4, r0
 c8 4e                 addi.s8	r4, 0x4e
 f1 48                 stsp8	[sp+0x6], r4
 f1 20                 mov	r4, r0
 c8 41                 addi.s8	r4, 0x41
 f1 44                 stsp8	[sp+0x5], r4
 f1 20                 mov	r4, r0
 c8 34                 addi.s8	r4, 0x34
 f1 40                 stsp8	[sp+0x4], r4
 f1 20                 mov	r4, r0
 c8 27                 addi.s8	r4, 0x27
 f1 3c                 stsp8	[sp+0x3], r4
 f1 20                 mov	r4, r0
 c8 1a                 addi.s8	r4, 0x1a
 f1 38                 stsp8	[sp+0x2], r4
 f1 20                 mov	r4, r0
 c8 0d                 addi.s8	r4, 0xd
 f1 34                 stsp8	[sp+0x1], r4
 f0 28 00              stsp8	[sp+0x0], r0
 f0 14 00              leasp	r4, 0x0
 c1 17                 ldi8	r5, 0x17
 f1 28                 mov	r6, r0
 d5 12                 call8	leaf
 f1 0c                 mov	r1, r4
 f0 14 03              leasp	r4, 0x3
 c1 11                 ldi8	r5, 0x11
 f1 28                 mov	r6, r0
 d5 07                 call8	leaf
 f9 86                 xor	r4, r1
 d6 17                 adjsp	0x17
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<leaf>:
 1a                    add	r6, r6
 f7 07                 ld8u	r7, [r4+]
 ab                    xor	r6, r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f6                 brne8	leaf
 02                    mov	r4, r6
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
