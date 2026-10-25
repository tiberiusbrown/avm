
math_atan2_ratios.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_atan2_ratios.c
00000100 l     O .data	00000100 inputs
00000200 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_atan2.c
00000a2a l       .init_array	00000000 .hidden __init_array_end
00000a2a l       .init_array	00000000 .hidden __init_array_start
00000a2a l       .fini_array	00000000 .hidden __fini_array_start
00000a2a l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	0000003b avm_test_main
00000402 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000404 g     F .text	00000626 atan2f

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
 e1 e4 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 2a 0a              ldi16	r4, 0xa2a
 c1 00                 ldi8	r5, 0x0
 c6 2a 0a              ldi16	r6, 0xa2a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 2a 0a           ldi16	r0, 0xa2a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 2a 0a           ldi16	r2, 0xa2a
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
 e1 89 fc              call16	-887 <__avm_run_local_dtors>
<L0>:
 c4 2a 0a              ldi16	r4, 0xa2a
 c1 00                 ldi8	r5, 0x0
 c6 2a 0a              ldi16	r6, 0xa2a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 2a 0a           ldi16	r2, 0xa2a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 2a 0a           ldi16	r0, 0xa2a
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
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
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
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 2a                 mov	r6, r2
 c7 04 01              ldi16	r7, 0x104
 1b                    add	r6, r7
 f0 6a cc              ld32	q3, [r6]
 d5 19                 call8	atan2f
 ff 02                 fadd	q0, q2
 f0 0a 08              addi.s8	r2, 0x8
 f5 13                 cmp	r2, r3
 d1 e3                 brne8	-0x1d <L0>
 c4 00 02              ldi16	r4, 0x200
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
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
 d6 e4                 adjsp	-0x1c
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d2 48                 brult8	0x48 <L0>
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 3a                 bruge8	0x3a <L0>
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d1 31                 brne8	0x31 <L1>
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 08              cmp32	q0, q2
 dc 84 00              brult16	0x84 <L5>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 d4 5c                 jmp8	0x5c <L3>
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0b                 fadd	q2, q3
 d4 56                 jmp8	0x56 <L4>
<L1>:
 09                    mov	r6, r5
 fa 9e                 lsr16i	r6, 0xe
 c0 02                 ldi8	r4, 0x2
 82                    and	r4, r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 98                    or	r6, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 86 00              breq16	0x86 <L6>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 da de 00              breq16	0xde <L9>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 0a                 breq8	0xa <L2>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 db 35 01              brne16	0x135 <L12>
<L2>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
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
<L3>:
 02                    mov	r4, r6
 07                    mov	r5, r7
<L4>:
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f0 69 08              cmp32	q0, q2
 f8 12                 cset.ult	r2
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 80              cmp32	q2, q0
 d2 3f                 brult8	0x3f <L8>
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 08              cmp32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d2 d8                 brult8	-0x28 <L4>
 f0 3a 00              stsp16	[sp+0x0], r2
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 aa                    xor	r6, r6
 e0 38 01              jmp16	312 <L16>
<L6>:
 ce 02                 cmpi.s8	r6, 0x2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d2 b3                 brult8	-0x4d <L4>
 ce 03                 cmpi.s8	r6, 0x3
 db 1f 02              brne16	0x21f <L21>
<L7>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 c0              ldi16	r5, 0xc049
 d4 a6                 jmp8	-0x5a <L4>
<L8>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 80              cmp32	q2, q0
 f0 3a 00              stsp16	[sp+0x0], r2
 d2 57                 brult8	0x57 <L10>
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 80              cmp32	q2, q0
 dc bf 00              brult16	0xbf <L14>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 ff 00                 fadd	q0, q0
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c0 01                 ldi8	r4, 0x1
 f0 3c 16              stsp16	[sp+0x16], r4
 e0 de 00              jmp16	222 <L17>
<L9>:
 f0 69 08              cmp32	q0, q2
 d1 54                 brne8	0x54 <L11>
 ce 02                 cmpi.s8	r6, 0x2
 df ae 01              brsge16	0x1ae <L19>
 f4 a6                 tst8	r6
 db ff 01              brne16	0x1ff <L24>
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 3f              ldi16	r5, 0x3f49
 e0 41 ff              jmp16	-191 <L4>
<L10>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 80              cmp32	q2, q0
 dc 95 00              brult16	0x95 <L15>
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 67                 mov32	q1, q3
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 22                 fmul	q0, q2
 ff 01                 fadd	q0, q1
 ff 3c                 fdiv	q3, q0
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 f2 63                 mov32	q0, q3
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3c 10              stsp16	[sp+0x10], r4
 e0 85 00              jmp16	133 <L17>
<L11>:
 ce 02                 cmpi.s8	r6, 0x2
 df 67 01              brsge16	0x167 <L20>
 f4 a6                 tst8	r6
 db b4 01              brne16	0x1b4 <L25>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e0 f1 fe              jmp16	-271 <L4>
<L12>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 68                 mov32	q2, q0
 f7 79                 sub32	q2, q1
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa b7                 asr16i	r4, 0x7
 cc 3d                 cmpi.s8	r4, 0x3d
 de 54 01              brslt16	0x154 <L22>
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
<L13>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 e0 e2 03              jmp16	994 <L42>
<L14>:
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 ff 32                 fdiv	q0, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 a0                    xor	r4, r4
 f0 3c 16              stsp16	[sp+0x16], r4
 d4 25                 jmp8	0x25 <L17>
<L15>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 38                 fdiv	q2, q0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 aa                    xor	r6, r6
<L16>:
 f2 62                 mov32	q0, q2
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3e 10              stsp16	[sp+0x10], r6
<L17>:
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c6 d1 51              ldi16	r6, 0x51d1
 c7 7f 3d              ldi16	r7, 0x3d7f
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 c6 6e a0              ldi16	r6, 0xa06e
 c7 da bd              ldi16	r7, 0xbdda
 ff 07                 fadd	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 e1 fe           ldi16	r2, 0xfee1
 f0 07 11 3e           ldi16	r3, 0x3e11
 ff 0d                 fadd	q3, q1
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 16 cb              ldi16	r6, 0xcb16
 c7 4c be              ldi16	r7, 0xbe4c
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 aa aa              ldi16	r4, 0xaaaa
 c5 aa 3e              ldi16	r5, 0x3eaa
 ff 0e                 fadd	q3, q2
 ff 27                 fmul	q1, q3
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d0 0f                 breq8	0xf <L18>
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2b                 fmul	q2, q3
 ff 12                 fsub	q0, q2
 f2 68                 mov32	q2, q0
 e0 11 fe              jmp16	-495 <L4>
<L18>:
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 c4 38 63              ldi16	r4, 0x6338
 c5 ed 3e              ldi16	r5, 0x3eed
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f4 a4                 tst8	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 c4 69 37              ldi16	r4, 0x3769
 c5 ac 31              ldi16	r5, 0x31ac
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2b                 fmul	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 1b                 fsub	q2, q3
 ff 12                 fsub	q0, q2
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f2 69                 mov32	q2, q1
 e0 a1 fd              jmp16	-607 <L4>
<L19>:
 ce 02                 cmpi.s8	r6, 0x2
 d1 62                 brne8	0x62 <L26>
 c4 e4 cb              ldi16	r4, 0xcbe4
 c5 16 40              ldi16	r5, 0x4016
 e0 94 fd              jmp16	-620 <L4>
<L20>:
 ce 02                 cmpi.s8	r6, 0x2
 db e1 fd              brne16	-0x21f <L7>
<L21>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 e0 86 fd              jmp16	-634 <L4>
<L22>:
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d3 08                 brslt8	0x8 <L23>
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc c4                 cmpi.s8	r4, -0x3c
 de 7e 02              brslt16	0x27e <L42>
<L23>:
 f0 69 40              cmp32	q1, q0
 f8 10                 cset.ult	r0
 d8 30                 bruge8	0x30 <L27>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 3e                 fdiv	q3, q2
 ff 67                 fabs	q3
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 c8              cmp32	q3, q2
 d2 4a                 brult8	0x4a <L29>
 d4 30                 jmp8	0x30 <L28>
<L24>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 bf              ldi16	r5, 0xbf49
 e0 42 fd              jmp16	-702 <L4>
<L25>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 e0 3b fd              jmp16	-709 <L4>
<L26>:
 c4 e4 cb              ldi16	r4, 0xcbe4
 c5 16 c0              ldi16	r5, 0xc016
 e0 32 fd              jmp16	-718 <L4>
<L27>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 3b                 fdiv	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 c8              cmp32	q3, q2
 d2 18                 brult8	0x18 <L29>
<L28>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d2 4f                 brult8	0x4f <L30>
 ff 0f                 fadd	q3, q3
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 da 17 02              breq16	0x217 <L41>
 e0 01 02              jmp16	513 <L40>
<L29>:
 f0 02 01              ldi8	r2, 0x1
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f0 69 c8              cmp32	q3, q2
 f8 11                 cset.ult	r1
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 8c              cmp32	q2, q3
 d2 3c                 brult8	0x3c <L31>
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 c8              cmp32	q3, q2
 dc d8 01              brult16	0x1d8 <L39>
 f0 39 12              stsp16	[sp+0x12], r1
 f0 38 0c              stsp16	[sp+0xc], r0
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 e0 ef 00              jmp16	239 <L35>
<L30>:
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 da c4 01              breq16	0x1c4 <L41>
 e0 ae 01              jmp16	430 <L40>
<L31>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 8c              cmp32	q2, q3
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 12              stsp16	[sp+0x12], r1
 d2 40                 brult8	0x40 <L32>
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 8c              cmp32	q2, q3
 d2 6d                 brult8	0x6d <L33>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 63                 mov32	q0, q3
 ff 0e                 fadd	q3, q2
 ff 00                 fadd	q0, q0
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 f2 6a                 mov32	q3, q0
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c0 01                 ldi8	r4, 0x1
 f0 3c 1a              stsp16	[sp+0x1a], r4
 e0 92 00              jmp16	146 <L36>
<L32>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 8c              cmp32	q2, q3
 d2 62                 brult8	0x62 <L34>
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 63                 mov32	q0, q3
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 22                 fmul	q0, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 02                 fadd	q0, q2
 ff 3c                 fdiv	q3, q0
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 d4 54                 jmp8	0x54 <L35>
<L33>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 ff 08                 fadd	q2, q0
 f2 63                 mov32	q0, q3
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 f2 6a                 mov32	q3, q0
 ff 3e                 fdiv	q3, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3a 10              stsp16	[sp+0x10], r2
 d4 25                 jmp8	0x25 <L36>
<L34>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 3e                 fdiv	q3, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
<L35>:
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3c 10              stsp16	[sp+0x10], r4
<L36>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 67                 mov32	q1, q3
 ff 25                 fmul	q1, q1
 c6 d1 51              ldi16	r6, 0x51d1
 c7 7f 3d              ldi16	r7, 0x3d7f
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 c6 6e a0              ldi16	r6, 0xa06e
 c7 da bd              ldi16	r7, 0xbdda
 ff 03                 fadd	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 e1 fe           ldi16	r0, 0xfee1
 f0 05 11 3e           ldi16	r1, 0x3e11
 ff 0c                 fadd	q3, q0
 f0 35 12              ldsp16	r5, [sp+0x12]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 c6 16 cb              ldi16	r6, 0xcb16
 c7 4c be              ldi16	r7, 0xbe4c
 ff 03                 fadd	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 aa aa           ldi16	r0, 0xaaaa
 f0 05 aa 3e           ldi16	r1, 0x3eaa
 ff 0c                 fadd	q3, q0
 ff 27                 fmul	q1, q3
 f4 a5                 tst8	r5
 d0 0c                 breq8	0xc <L37>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 d4 64                 jmp8	0x64 <L38>
<L37>:
 c6 68 21              ldi16	r6, 0x2168
 c7 22 33              ldi16	r7, 0x3322
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 a4                 tst8	r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f0 04 38 63           ldi16	r0, 0x6338
 f0 05 ed 3e           ldi16	r1, 0x3eed
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f4 a6                 tst8	r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 c6 69 37              ldi16	r6, 0x3769
 c7 ac 31              ldi16	r7, 0x31ac
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 1d                 fsub	q3, q1
 ff 13                 fsub	q0, q3
 ff 08                 fadd	q2, q0
<L38>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
<L39>:
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d0 13                 breq8	0x13 <L41>
<L40>:
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 b3              ldi16	r5, 0xb3a2
 ff 0e                 fadd	q3, q2
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 1b                 fsub	q2, q3
 e0 1b fc              jmp16	-997 <L13>
<L41>:
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
<L42>:
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 02                 cmpi.s8	r4, 0x2
 d9 0b                 brsge8	0xb <L43>
 f4 a4                 tst8	r4
 d1 22                 brne8	0x22 <L44>
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e0 da fa              jmp16	-1318 <L4>
<L43>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 20                 brne8	0x20 <L45>
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0e                 fadd	q3, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 1b                 fsub	q2, q3
 e0 bf fa              jmp16	-1345 <L4>
<L44>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 62                 fneg	q2
 e0 b6 fa              jmp16	-1354 <L4>
<L45>:
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0e                 fadd	q3, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 c0              ldi16	r5, 0xc049
 ff 0e                 fadd	q3, q2
 e0 9d fa              jmp16	-1379 <L3>
