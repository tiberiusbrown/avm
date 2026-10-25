
math_atan2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_atan2.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_atan2.c
00000a3e l       .init_array	00000000 .hidden __init_array_end
00000a3e l       .init_array	00000000 .hidden __init_array_start
00000a3e l       .fini_array	00000000 .hidden __fini_array_start
00000a3e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000050 avm_test_main
00000317 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000319 g     F .text	00000725 atan2f

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
 e1 f9 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 3e 0a              ldi16	r4, 0xa3e
 c1 00                 ldi8	r5, 0x0
 c6 3e 0a              ldi16	r6, 0xa3e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 3e 0a           ldi16	r0, 0xa3e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 3e 0a           ldi16	r2, 0xa3e
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
 c4 3e 0a              ldi16	r4, 0xa3e
 c1 00                 ldi8	r5, 0x0
 c6 3e 0a              ldi16	r6, 0xa3e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 3e 0a           ldi16	r2, 0xa3e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 3e 0a           ldi16	r0, 0xa3e
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
 d6 fa                 adjsp	-0x6
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 aa                    xor	r6, r6
 c7 00 3d              ldi16	r7, 0x3d00
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 64                 mov32	q1, q0
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2b                 fmul	q2, q3
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 ff 0b                 fadd	q2, q3
 aa                    xor	r6, r6
 c7 40 3f              ldi16	r7, 0x3f40
 d5 22                 call8	atan2f
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 06                 fadd	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 d8                 brne8	-0x28 <L0>
 c4 04 01              ldi16	r4, 0x104
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f2 62                 mov32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d2 50                 brult8	0x50 <L0>
 f2 68                 mov32	q2, q0
 ff 66                 fabs	q2
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d8 40                 bruge8	0x40 <L0>
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 d1 3a                 brne8	0x3a <L3>
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 c8              cmp32	q3, q2
 dc 9d 00              brult16	0x9d <L5>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 84              cmp32	q2, q1
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f2 63                 mov32	q0, q3
 d4 06                 jmp8	0x6 <L2>
<L0>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
<L1>:
 ff 02                 fadd	q0, q2
<L2>:
 f2 68                 mov32	q2, q0
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L3>:
 f1 21                 mov	r4, r1
 fa 7e                 lsr16i	r4, 0xe
 f0 00 02              ldi8	r0, 0x2
 f9 10                 and	r0, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f9 81                 or	r4, r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 d0 70                 breq8	0x70 <L6>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 da d7 00              breq16	0xd7 <L9>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d0 0c                 breq8	0xc <L4>
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 db 5c 01              brne16	0x15c <L13>
<L4>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 a5                    xor	r5, r5
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 f0 69 48              cmp32	q1, q2
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f2 63                 mov32	q0, q3
 d4 8a                 jmp8	-0x76 <L2>
<L5>:
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f2 67                 mov32	q1, q3
 f0 69 48              cmp32	q1, q2
 f8 10                 cset.ult	r0
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 84              cmp32	q2, q1
 d2 2e                 brult8	0x2e <L8>
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 c8              cmp32	q3, q2
 dd 95 00              bruge16	0x95 <L10>
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 e0 61 ff              jmp16	-159 <L2>
<L6>:
 cc 02                 cmpi.s8	r4, 0x2
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 dc 56 ff              brult16	-0xaa <L2>
 cc 03                 cmpi.s8	r4, 0x3
 db e6 02              brne16	0x2e6 <L22>
<L7>:
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 c0           ldi16	r1, 0xc049
 e0 46 ff              jmp16	-186 <L2>
<L8>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 8c              cmp32	q2, q3
 f0 38 00              stsp16	[sp+0x0], r0
 dc 8f 00              brult16	0x8f <L11>
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 8c              cmp32	q2, q3
 dc f7 00              brult16	0xf7 <L15>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 63                 mov32	q0, q3
 ff 0e                 fadd	q3, q2
 ff 00                 fadd	q0, q0
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 c0 01                 ldi8	r4, 0x1
 f0 3c 16              stsp16	[sp+0x16], r4
 e0 1f 01              jmp16	287 <L18>
<L9>:
 f0 69 0c              cmp32	q0, q3
 db 83 00              brne16	0x83 <L12>
 cc 02                 cmpi.s8	r4, 0x2
 df 66 02              brsge16	0x266 <L20>
 f4 a4                 tst8	r4
 db c9 02              brne16	0x2c9 <L25>
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 3f           ldi16	r1, 0x3f49
 e0 d5 fe              jmp16	-299 <L2>
<L10>:
 f0 38 00              stsp16	[sp+0x0], r0
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3c 14              stsp16	[sp+0x14], r4
 e0 d7 00              jmp16	215 <L18>
<L11>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 8c              cmp32	q2, q3
 dc a2 00              brult16	0xa2 <L16>
 f2 42                 sub	r2, r2
 f0 07 c0 bf           ldi16	r3, 0xbfc0
 f2 63                 mov32	q0, q3
 f2 68                 mov32	q2, q0
 ff 09                 fadd	q2, q1
 aa                    xor	r6, r6
 c7 c0 3f              ldi16	r7, 0x3fc0
 ff 23                 fmul	q0, q3
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 38                 fdiv	q2, q0
 c6 b4 0f              ldi16	r6, 0xfb4
 c7 14 33              ldi16	r7, 0x3314
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 5e 98              ldi16	r6, 0x985e
 c7 7b 3f              ldi16	r7, 0x3f7b
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 aa                    xor	r6, r6
 e0 8c 00              jmp16	140 <L17>
<L12>:
 cc 02                 cmpi.s8	r4, 0x2
 df f2 01              brsge16	0x1f2 <L21>
 f4 a4                 tst8	r4
 db 51 02              brne16	0x251 <L26>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e0 56 fe              jmp16	-426 <L2>
<L13>:
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f7 71                 sub32	q0, q1
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 f1 21                 mov	r4, r1
 fa b7                 asr16i	r4, 0x7
 cc 3d                 cmpi.s8	r4, 0x3d
 de dd 01              brslt16	0x1dd <L23>
<L14>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 e0 8f 04              jmp16	1167 <L37>
<L15>:
 f2 63                 mov32	q0, q3
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 ff 32                 fdiv	q0, q2
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c0 01                 ldi8	r4, 0x1
 f0 3c 14              stsp16	[sp+0x14], r4
 a0                    xor	r4, r4
 f0 3c 16              stsp16	[sp+0x16], r4
 d4 29                 jmp8	0x29 <L18>
<L16>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 3b                 fdiv	q2, q3
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 aa                    xor	r6, r6
<L17>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3e 14              stsp16	[sp+0x14], r6
<L18>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2f                 fmul	q3, q3
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 2f                 fmul	q3, q3
 c4 d7 69              ldi16	r4, 0x69d7
 c5 85 3c              ldi16	r5, 0x3c85
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 59 da              ldi16	r4, 0xda59
 c5 4b 3d              ldi16	r5, 0x3d4b
 ff 02                 fadd	q0, q2
 f0 06 21 a2           ldi16	r2, 0xa221
 f0 07 15 bd           ldi16	r3, 0xbd15
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 f0 06 6b f1           ldi16	r2, 0xf16b
 f0 07 6e bd           ldi16	r3, 0xbd6e
 ff 09                 fadd	q2, q1
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 95 87              ldi16	r4, 0x8795
 c5 9d bd              ldi16	r5, 0xbd9d
 ff 06                 fadd	q1, q2
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 06 35 6b           ldi16	r2, 0x6b35
 f0 07 88 3d           ldi16	r3, 0x3d88
 ff 09                 fadd	q2, q1
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 06 6e 2e           ldi16	r2, 0x2e6e
 f0 07 ba 3d           ldi16	r3, 0x3dba
 ff 09                 fadd	q2, q1
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 25 49              ldi16	r4, 0x4925
 c5 12 3e              ldi16	r5, 0x3e12
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 ff 29                 fmul	q2, q1
 f0 06 38 8e           ldi16	r2, 0x8e38
 f0 07 e3 bd           ldi16	r3, 0xbde3
 ff 09                 fadd	q2, q1
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 ff 06                 fadd	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 ff 2c                 fmul	q3, q0
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 aa 3e           ldi16	r3, 0x3eaa
 ff 0d                 fadd	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 23                 fmul	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d0 15                 breq8	0x15 <L19>
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0b                 fadd	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 ff 13                 fsub	q0, q3
 e0 01 fd              jmp16	-767 <L2>
<L19>:
 f0 06 68 21           ldi16	r2, 0x2168
 f0 07 22 33           ldi16	r3, 0x3322
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 a6                 tst8	r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f2 63                 mov32	q0, q3
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 c6 38 63              ldi16	r6, 0x6338
 c7 ed 3e              ldi16	r7, 0x3eed
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 a6                 tst8	r6
 f4 02                 ldsp16	r6, [sp+0x0]
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 c6 69 37              ldi16	r6, 0x3769
 c7 ac 31              ldi16	r7, 0x31ac
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0b                 fadd	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 1e                 fsub	q3, q2
 ff 13                 fsub	q0, q3
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f2 61                 mov32	q0, q1
 e0 7f fc              jmp16	-897 <L2>
<L20>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 78                 brne8	0x78 <L27>
 f0 04 e4 cb           ldi16	r0, 0xcbe4
 f0 05 16 40           ldi16	r1, 0x4016
 e0 70 fc              jmp16	-912 <L2>
<L21>:
 cc 02                 cmpi.s8	r4, 0x2
 db 1a fd              brne16	-0x2e6 <L7>
<L22>:
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 40           ldi16	r1, 0x4049
 e0 60 fc              jmp16	-928 <L2>
<L23>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 d3 05                 brslt8	0x5 <L24>
 cc c4                 cmpi.s8	r4, -0x3c
 de a5 02              brslt16	0x2a5 <L37>
<L24>:
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 33                 fdiv	q0, q3
 ff 64                 fabs	q0
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 08              cmp32	q0, q2
 f2 6a                 mov32	q3, q0
 d2 3d                 brult8	0x3d <L28>
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 dc 7b 02              brult16	0x27b <L37>
 ff 0a                 fadd	q2, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e0 72 02              jmp16	626 <L37>
<L25>:
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 bf           ldi16	r1, 0xbf49
 e0 0c fc              jmp16	-1012 <L2>
<L26>:
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 e0 03 fc              jmp16	-1021 <L2>
<L27>:
 f0 04 e4 cb           ldi16	r0, 0xcbe4
 f0 05 16 c0           ldi16	r1, 0xc016
 e0 f8 fb              jmp16	-1032 <L2>
<L28>:
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f0 69 c8              cmp32	q3, q2
 f8 10                 cset.ult	r0
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 8c              cmp32	q2, q3
 d2 29                 brult8	0x29 <L29>
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 c8              cmp32	q3, q2
 f2 67                 mov32	q1, q3
 dc 9b fd              brult16	-0x265 <L14>
 f0 38 00              stsp16	[sp+0x0], r0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 e0 d7 00              jmp16	215 <L33>
<L29>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 8c              cmp32	q2, q3
 f0 38 00              stsp16	[sp+0x0], r0
 d2 3e                 brult8	0x3e <L30>
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 8c              cmp32	q2, q3
 d2 6d                 brult8	0x6d <L31>
 f2 67                 mov32	q1, q3
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 ff 0e                 fadd	q3, q2
 ff 05                 fadd	q1, q1
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 f0 3e 14              stsp16	[sp+0x14], r6
 c2 01                 ldi8	r6, 0x1
 f0 3e 16              stsp16	[sp+0x16], r6
 e0 91 00              jmp16	145 <L34>
<L30>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 8c              cmp32	q2, q3
 f2 63                 mov32	q0, q3
 d2 5f                 brult8	0x5f <L32>
 aa                    xor	r6, r6
 c7 c0 bf              ldi16	r7, 0xbfc0
 f2 64                 mov32	q1, q0
 ff 07                 fadd	q1, q3
 c7 c0 3f              ldi16	r7, 0x3fc0
 ff 23                 fmul	q0, q3
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 34                 fdiv	q1, q0
 c6 b4 0f              ldi16	r6, 0xfb4
 c7 14 33              ldi16	r7, 0x3314
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 5e 98              ldi16	r6, 0x985e
 c7 7b 3f              ldi16	r7, 0x3f7b
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 d4 51                 jmp8	0x51 <L33>
<L31>:
 f2 67                 mov32	q1, q3
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 c7 80 bf              ldi16	r7, 0xbf80
 ff 07                 fadd	q1, q3
 ff 36                 fdiv	q1, q2
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 14              stsp16	[sp+0x14], r6
 aa                    xor	r6, r6
 f0 3e 16              stsp16	[sp+0x16], r6
 d4 25                 jmp8	0x25 <L34>
<L32>:
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 ff 34                 fdiv	q1, q0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
<L33>:
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3e 14              stsp16	[sp+0x14], r6
<L34>:
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 ff 25                 fmul	q1, q1
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 25                 fmul	q1, q1
 c4 d7 69              ldi16	r4, 0x69d7
 c5 85 3c              ldi16	r5, 0x3c85
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 59 da              ldi16	r4, 0xda59
 c5 4b 3d              ldi16	r5, 0x3d4b
 ff 02                 fadd	q0, q2
 c4 21 a2              ldi16	r4, 0xa221
 c5 15 bd              ldi16	r5, 0xbd15
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 6b f1              ldi16	r4, 0xf16b
 c5 6e bd              ldi16	r5, 0xbd6e
 ff 0e                 fadd	q3, q2
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 95 87              ldi16	r6, 0x8795
 c7 9d bd              ldi16	r7, 0xbd9d
 ff 0b                 fadd	q2, q3
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 35 6b           ldi16	r0, 0x6b35
 f0 05 88 3d           ldi16	r1, 0x3d88
 ff 0c                 fadd	q3, q0
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 6e 2e              ldi16	r6, 0x2e6e
 c7 ba 3d              ldi16	r7, 0x3dba
 ff 0b                 fadd	q2, q3
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 25 49              ldi16	r4, 0x4925
 c5 12 3e              ldi16	r5, 0x3e12
 ff 02                 fadd	q0, q2
 f2 69                 mov32	q2, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 2b                 fmul	q2, q3
 c6 38 8e              ldi16	r6, 0x8e38
 c7 e3 bd              ldi16	r7, 0xbde3
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 ff 0e                 fadd	q3, q2
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 ff 24                 fmul	q1, q0
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d0 14                 breq8	0x14 <L35>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 ff 13                 fsub	q0, q3
 d4 70                 jmp8	0x70 <L36>
<L35>:
 f0 04 68 21           ldi16	r0, 0x2168
 f0 05 22 33           ldi16	r1, 0x3322
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 a6                 tst8	r6
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 06 38 63           ldi16	r2, 0x6338
 f0 07 ed 3e           ldi16	r3, 0x3eed
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 a6                 tst8	r6
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 c6 69 37              ldi16	r6, 0x3769
 c7 ac 31              ldi16	r7, 0x31ac
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 1e                 fsub	q3, q2
 ff 17                 fsub	q1, q3
 ff 01                 fadd	q0, q1
<L36>:
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
<L37>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 02                 cmpi.s8	r4, 0x2
 d9 0d                 brsge8	0xd <L38>
 f4 a4                 tst8	r4
 d1 26                 brne8	0x26 <L39>
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 e0 91 f9              jmp16	-1647 <L2>
<L38>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 24                 brne8	0x24 <L40>
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 40           ldi16	r1, 0x4049
 ff 13                 fsub	q0, q3
 e0 74 f9              jmp16	-1676 <L2>
<L39>:
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 60                 fneg	q0
 e0 69 f9              jmp16	-1687 <L2>
<L40>:
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 02                 fadd	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 c0              ldi16	r5, 0xc049
 e0 50 f9              jmp16	-1712 <L1>
