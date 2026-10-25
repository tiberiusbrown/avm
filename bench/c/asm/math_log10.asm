
math_log10.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_log10.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_log10.c
0000066e l       .init_array	00000000 .hidden __init_array_end
0000066e l       .init_array	00000000 .hidden __init_array_start
0000066e l       .fini_array	00000000 .hidden __fini_array_start
0000066e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000004c avm_test_main
00000313 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000315 g     F .text	00000359 log10f

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
 e1 f5 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 6e 06              ldi16	r4, 0x66e
 c1 00                 ldi8	r5, 0x0
 c6 6e 06              ldi16	r6, 0x66e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 6e 06           ldi16	r0, 0x66e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 6e 06           ldi16	r2, 0x66e
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
 c4 6e 06              ldi16	r4, 0x66e
 c1 00                 ldi8	r5, 0x0
 c6 6e 06              ldi16	r6, 0x66e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 6e 06           ldi16	r2, 0x66e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 6e 06           ldi16	r0, 0x66e
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
 d5 22                 call8	log10f
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 06                 fadd	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 dc                 brne8	-0x24 <L0>
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

<log10f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d1 0f                 brne8	0xf <L1>
 f2 42                 sub	r2, r2
 f0 07 80 ff           ldi16	r3, 0xff80
<L0>:
 f2 69                 mov32	q2, q1
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d9 20                 brsge8	0x20 <L2>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 1f                 bruge8	0x1f <L3>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 04              cmp32	q0, q1
 d2 17                 brult8	0x17 <L4>
 a0                    xor	r4, r4
 c5 00 4c              ldi16	r5, 0x4c00
 ff 26                 fmul	q1, q2
 c4 68 ff              ldi16	r4, 0xff68
 d4 0f                 jmp8	0xf <L5>
<L2>:
 ff 15                 fsub	q1, q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff 36                 fdiv	q1, q2
 d4 c4                 jmp8	-0x3c <L0>
<L3>:
 ff 05                 fadd	q1, q1
 d4 c0                 jmp8	-0x40 <L0>
<L4>:
 c4 81 ff              ldi16	r4, 0xff81
<L5>:
 f4 60                 stsp16	[sp+0x8], r4
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6c                 add32	q3, q0
 c0 80                 ldi8	r4, 0x80
 83                    and	r4, r7
 f1 25                 mov	r5, r1
 94                    or	r5, r4
 f1 20                 mov	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 23                 mov	r4, r3
 fa b7                 asr16i	r4, 0x7
 f4 21                 ldsp16	r5, [sp+0x8]
 11                    add	r4, r5
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 16                    add	r5, r6
 f0 3d 10              stsp16	[sp+0x10], r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 14                    add	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 c0 0f                 ldi8	r4, 0xf
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 c6 f0 ff              ldi16	r6, 0xfff0
 c3 7f                 ldi8	r7, 0x7f
 88                    and	r6, r4
 8d                    and	r7, r5
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 34 18              ldsp16	r4, [sp+0x18]
 ff c0 41              s16tof	q1, r4
 c4 db 27              ldi16	r4, 0x27db
 c5 54 35              ldi16	r5, 0x3554
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 da 43 01              breq16	0x143 <L6>
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 ff 33                 fdiv	q0, q3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 ff 20                 fmul	q0, q0
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 ff 20                 fmul	q0, q0
 c6 97 88              ldi16	r6, 0x8897
 c7 17 3e              ldi16	r7, 0x3e17
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 25 33              ldi16	r6, 0x3325
 c7 3a 3e              ldi16	r7, 0x3e3a
 ff 0b                 fadd	q2, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 88 c2              ldi16	r4, 0xc288
 c1 35                 ldi8	r5, 0x35
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7b                 sub32	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c6 30 5c              ldi16	r6, 0x5c30
 c7 cf ff              ldi16	r7, 0xffcf
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 2e                 fmul	q3, q2
 c4 25 49              ldi16	r4, 0x4925
 c5 92 3e              ldi16	r5, 0x3e92
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c6 4f d0              ldi16	r6, 0xd04f
 c7 1c 3e              ldi16	r7, 0x3e1c
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 29 8e              ldi16	r6, 0x8e29
 c7 63 3e              ldi16	r7, 0x3e63
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 cc 3e              ldi16	r5, 0x3ecc
 ff 0e                 fadd	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 92                    or	r4, r6
 97                    or	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 2e                 fmul	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 22                 fmul	q0, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3f              ldi16	r5, 0x3f2a
 ff 02                 fadd	q0, q2
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 28                 fmul	q2, q0
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 ff c0 43              s16tof	q3, r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 de b1 00              brslt16	0xb1 <L7>
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2c                 fmul	q3, q0
 ff 2b                 fmul	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 2e                 tst16	r6
 da d8 00              breq16	0xd8 <L8>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 0c                 fadd	q3, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 23                 fmul	q0, q3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 37              ldi16	r7, 0x3717
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 23                 fmul	q0, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 03                 fadd	q0, q3
 ff 18                 fsub	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 1b                 fsub	q2, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 ff 1e                 fsub	q3, q2
 e0 28 01              jmp16	296 <L13>
<L6>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff c8 4b              fcmp	r4, q2, q3
 f6 2c                 tst16	r4
 db 9d 00              brne16	0x9d <L9>
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 da 1a 01              breq16	0x11a <L14>
 ff c0 43              s16tof	q3, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 37              ldi16	r5, 0x3717
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2b                 fmul	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2e                 fmul	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 0e                 fadd	q3, q2
 e0 e4 00              jmp16	228 <L14>
<L7>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 da ba 00              breq16	0xba <L11>
 f2 68                 mov32	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 18                 fsub	q2, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 22                 fmul	q0, q2
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 b7              ldi16	r5, 0xb717
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 12                 fsub	q0, q2
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 ff 2e                 fmul	q3, q2
 e0 99 00              jmp16	153 <L12>
<L8>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 0c                 fadd	q3, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 23                 fmul	q0, q3
 ff 12                 fsub	q0, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0c                 fadd	q3, q0
 d4 7f                 jmp8	0x7f <L13>
<L9>:
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 02                 fadd	q0, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2f                 fmul	q3, q3
 ff 2c                 fmul	q3, q0
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d0 36                 breq8	0x36 <L10>
 f0 34 10              ldsp16	r4, [sp+0x10]
 ff c0 40              s16tof	q0, r4
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 c4 80 71              ldi16	r4, 0x7180
 c5 31 3f              ldi16	r5, 0x3f31
 ff 22                 fmul	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c4 d1 f7              ldi16	r4, 0xf7d1
 c5 17 b7              ldi16	r5, 0xb717
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 22                 fmul	q0, q2
 f2 68                 mov32	q2, q0
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 1e                 fsub	q3, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
<L10>:
 ff 1b                 fsub	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 16                 jmp8	0x16 <L13>
<L11>:
 f2 6a                 mov32	q3, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 18                 fsub	q2, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 ff 22                 fmul	q0, q2
<L12>:
 ff 1c                 fsub	q3, q0
<L13>:
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
<L14>:
 c4 80 20              ldi16	r4, 0x2080
 c5 9a 3e              ldi16	r5, 0x3e9a
 ff 26                 fmul	q1, q2
 c4 d9 5b              ldi16	r4, 0x5bd9
 c5 de 3e              ldi16	r5, 0x3ede
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 ff 04                 fadd	q1, q0
 e0 be fc              jmp16	-834 <L0>
