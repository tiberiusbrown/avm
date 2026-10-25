
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
000009b9 l       .init_array	00000000 .hidden __init_array_end
000009b9 l       .init_array	00000000 .hidden __init_array_start
000009b9 l       .fini_array	00000000 .hidden __fini_array_start
000009b9 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	0000003b avm_test_main
00000402 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000404 g     F .text	000005b5 atan2f

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
 c4 b9 09              ldi16	r4, 0x9b9
 c1 00                 ldi8	r5, 0x0
 c6 b9 09              ldi16	r6, 0x9b9
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 b9 09           ldi16	r0, 0x9b9
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b9 09           ldi16	r2, 0x9b9
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
 c4 b9 09              ldi16	r4, 0x9b9
 c1 00                 ldi8	r5, 0x0
 c6 b9 09              ldi16	r6, 0x9b9
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 b9 09           ldi16	r2, 0x9b9
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b9 09           ldi16	r0, 0x9b9
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
 d6 e8                 adjsp	-0x18
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 69 40              cmp32	q1, q0
 d2 5a                 brult8	0x5a <L0>
 f2 66                 mov32	q1, q2
 ff 65                 fabs	q1
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 40              cmp32	q1, q0
 d8 4a                 bruge8	0x4a <L0>
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d1 42                 brne8	0x42 <L2>
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 69 48              cmp32	q1, q2
 dc aa 00              brult16	0xaa <L4>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 80              cmp32	q2, q0
 fd 16                 cmov.slt	r2, r6
 fd 1f                 cmov.slt	r3, r7
 d4 04                 jmp8	0x4 <L1>
<L0>:
 ff 0b                 fadd	q2, q3
 f2 66                 mov32	q1, q2
<L1>:
 f2 69                 mov32	q2, q1
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L2>:
 03                    mov	r4, r7
 fa 7e                 lsr16i	r4, 0xe
 c1 02                 ldi8	r5, 0x2
 84                    and	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f1 23                 mov	r4, r3
 fa 7f                 lsr16i	r4, 0xf
 f4 11                 ldsp16	r5, [sp+0x4]
 91                    or	r4, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 69 40              cmp32	q1, q0
 d0 78                 breq8	0x78 <L5>
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 84              cmp32	q2, q1
 da e0 00              breq16	0xe0 <L8>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d0 14                 breq8	0x14 <L3>
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 69 84              cmp32	q2, q1
 f2 66                 mov32	q1, q2
 db 61 01              brne16	0x161 <L12>
<L3>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
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
 f2 67                 mov32	q1, q3
 e0 79 ff              jmp16	-135 <L1>
<L4>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 84              cmp32	q2, q1
 d2 2e                 brult8	0x2e <L7>
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 48              cmp32	q1, q2
 dd ab 00              bruge16	0xab <L9>
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 e0 5b ff              jmp16	-165 <L1>
<L5>:
 cc 02                 cmpi.s8	r4, 0x2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 dc 50 ff              brult16	-0xb0 <L1>
 cc 03                 cmpi.s8	r4, 0x3
 db f4 01              brne16	0x1f4 <L21>
<L6>:
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 c0           ldi16	r3, 0xc049
 e0 40 ff              jmp16	-192 <L1>
<L7>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 84              cmp32	q2, q1
 dc ab 00              brult16	0xab <L10>
 a0                    xor	r4, r4
 c5 30 3f              ldi16	r5, 0x3f30
 f0 69 48              cmp32	q1, q2
 dd 10 01              bruge16	0x110 <L15>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 ff 05                 fadd	q1, q1
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 c4 69 37              ldi16	r4, 0x3769
 c5 ac 31              ldi16	r5, 0x31ac
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 38 63              ldi16	r4, 0x6338
 c5 ed 3e              ldi16	r5, 0x3eed
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 e0 52 01              jmp16	338 <L18>
<L8>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 0c              cmp32	q0, q3
 d1 7c                 brne8	0x7c <L11>
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 02                 cmpi.s8	r4, 0x2
 df 5e 01              brsge16	0x15e <L19>
 f4 a4                 tst8	r4
 db c0 01              brne16	0x1c0 <L25>
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 3f           ldi16	r3, 0x3f49
 e0 b9 fe              jmp16	-327 <L1>
<L9>:
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 f2 62                 mov32	q0, q2
 ff 2c                 fmul	q3, q0
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 ff 16                 fsub	q1, q2
 e0 89 fe              jmp16	-375 <L1>
<L10>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 84              cmp32	q2, q1
 dc ab 00              brult16	0xab <L16>
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 26                 fmul	q1, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 ff 3d                 fdiv	q3, q1
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 e0 9a 00              jmp16	154 <L17>
<L11>:
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 02                 cmpi.s8	r4, 0x2
 df f1 00              brsge16	0xf1 <L20>
 f4 a4                 tst8	r4
 db 4f 01              brne16	0x14f <L26>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e0 41 fe              jmp16	-447 <L1>
<L12>:
 f2 69                 mov32	q2, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 78                 sub32	q2, q0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa b7                 asr16i	r4, 0x7
 cc 3d                 cmpi.s8	r4, 0x3d
 de e2 00              brslt16	0xe2 <L22>
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
<L13>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
<L14>:
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 02                 cmpi.s8	r4, 0x2
 df fc 00              brsge16	0xfc <L24>
 e0 ec 00              jmp16	236 <L23>
<L15>:
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 c7 80 bf              ldi16	r7, 0xbf80
 ff 07                 fadd	q1, q3
 ff 36                 fdiv	q1, q2
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 d4 45                 jmp8	0x45 <L18>
<L16>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 3d                 fdiv	q3, q1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
<L17>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 67                 mov32	q1, q3
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
<L18>:
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 11                 fsub	q0, q1
 ff 1c                 fsub	q3, q0
 ff 0b                 fadd	q2, q3
 f2 66                 mov32	q1, q2
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 e0 6b fd              jmp16	-661 <L1>
<L19>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 77                 brne8	0x77 <L27>
 f0 06 e4 cb           ldi16	r2, 0xcbe4
 f0 07 16 40           ldi16	r3, 0x4016
 e0 5c fd              jmp16	-676 <L1>
<L20>:
 cc 02                 cmpi.s8	r4, 0x2
 db 0c fe              brne16	-0x1f4 <L6>
<L21>:
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 40           ldi16	r3, 0x4049
 e0 4c fd              jmp16	-692 <L1>
<L22>:
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 d3 56                 brslt8	0x56 <L28>
 f0 34 14              ldsp16	r4, [sp+0x14]
 cc c4                 cmpi.s8	r4, -0x3c
 f4 20                 ldsp16	r4, [sp+0x8]
 d9 4d                 brsge8	0x4d <L28>
 cc 02                 cmpi.s8	r4, 0x2
 d9 0d                 brsge8	0xd <L24>
<L23>:
 f4 a4                 tst8	r4
 d1 65                 brne8	0x65 <L29>
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 e0 21 fd              jmp16	-735 <L1>
<L24>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 63                 brne8	0x63 <L30>
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 40           ldi16	r3, 0x4049
 ff 17                 fsub	q1, q3
 e0 04 fd              jmp16	-764 <L1>
<L25>:
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 bf           ldi16	r3, 0xbf49
 e0 f9 fc              jmp16	-775 <L1>
<L26>:
 f2 42                 sub	r2, r2
 f0 07 00 80           ldi16	r3, 0x8000
 e0 f0 fc              jmp16	-784 <L1>
<L27>:
 f0 06 e4 cb           ldi16	r2, 0xcbe4
 f0 07 16 c0           ldi16	r3, 0xc016
 e0 e5 fc              jmp16	-795 <L1>
<L28>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 84              cmp32	q2, q1
 f8 10                 cset.ult	r0
 d8 39                 bruge8	0x39 <L31>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 3e                 fdiv	q3, q2
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 48              cmp32	q1, q2
 d2 53                 brult8	0x53 <L33>
 d4 39                 jmp8	0x39 <L32>
<L29>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 61                 fneg	q1
 e0 ba fc              jmp16	-838 <L1>
<L30>:
 c4 2e bd              ldi16	r4, 0xbd2e
 c5 bb 33              ldi16	r5, 0x33bb
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 06                 fadd	q1, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 c0              ldi16	r5, 0xc049
 ff 06                 fadd	q1, q2
 e0 a1 fc              jmp16	-863 <L1>
<L31>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 3b                 fdiv	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 48              cmp32	q1, q2
 d2 18                 brult8	0x18 <L33>
<L32>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d2 52                 brult8	0x52 <L34>
 ff 05                 fadd	q1, q1
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 da a2 01              breq16	0x1a2 <L44>
 e0 8c 01              jmp16	396 <L43>
<L33>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 84              cmp32	q2, q1
 d2 4d                 brult8	0x4d <L35>
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 48              cmp32	q1, q2
 dc 6f 01              brult16	0x16f <L42>
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 ff 16                 fsub	q1, q2
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 da 5e 01              breq16	0x15e <L44>
 e0 48 01              jmp16	328 <L43>
<L34>:
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 da 4a 01              breq16	0x14a <L44>
 e0 34 01              jmp16	308 <L43>
<L35>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 84              cmp32	q2, q1
 f0 38 0c              stsp16	[sp+0xc], r0
 d2 49                 brult8	0x49 <L36>
 a0                    xor	r4, r4
 c5 30 3f              ldi16	r5, 0x3f30
 f0 69 48              cmp32	q1, q2
 d8 75                 bruge8	0x75 <L37>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 ff 05                 fadd	q1, q1
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f0 04 69 37           ldi16	r0, 0x3769
 f0 05 ac 31           ldi16	r1, 0x31ac
 c4 38 63              ldi16	r4, 0x6338
 c5 ed 3e              ldi16	r5, 0x3eed
 d4 71                 jmp8	0x71 <L38>
<L36>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 84              cmp32	q2, q1
 d2 7c                 brult8	0x7c <L39>
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 61                 mov32	q0, q1
 ff 02                 fadd	q0, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 26                 fmul	q1, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 ff 31                 fdiv	q0, q1
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 06 5e 98           ldi16	r2, 0x985e
 f0 07 7b 3f           ldi16	r3, 0x3f7b
 d4 6e                 jmp8	0x6e <L40>
<L37>:
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 c7 80 bf              ldi16	r7, 0xbf80
 ff 07                 fadd	q1, q3
 ff 36                 fdiv	q1, q2
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f0 04 68 21           ldi16	r0, 0x2168
 f0 05 22 33           ldi16	r1, 0x3322
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
<L38>:
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 f2 6a                 mov32	q3, q0
 f2 61                 mov32	q0, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 d4 45                 jmp8	0x45 <L41>
<L39>:
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 31                 fdiv	q0, q1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 3f           ldi16	r3, 0x3fc9
<L40>:
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
<L41>:
 ff 1b                 fsub	q2, q3
 ff 12                 fsub	q0, q2
 ff 04                 fadd	q1, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
<L42>:
 c0 01                 ldi8	r4, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d0 13                 breq8	0x13 <L44>
<L43>:
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 b3              ldi16	r5, 0xb3a2
 ff 06                 fadd	q1, q2
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 19                 fsub	q2, q1
 e0 ad fc              jmp16	-851 <L13>
<L44>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 e0 a8 fc              jmp16	-856 <L14>
