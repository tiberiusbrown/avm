
math_exp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_exp.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_exp.c
00000518 l       .init_array	00000000 .hidden __init_array_end
00000518 l       .init_array	00000000 .hidden __init_array_start
00000518 l       .fini_array	00000000 .hidden __fini_array_start
00000518 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000004c avm_test_main
00000313 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000315 g     F .text	00000203 expf

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
 c4 18 05              ldi16	r4, 0x518
 c1 00                 ldi8	r5, 0x0
 c6 18 05              ldi16	r6, 0x518
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 18 05           ldi16	r0, 0x518
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 18 05           ldi16	r2, 0x518
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
 c4 18 05              ldi16	r4, 0x518
 c1 00                 ldi8	r5, 0x0
 c6 18 05              ldi16	r6, 0x518
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 18 05           ldi16	r2, 0x518
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 18 05           ldi16	r0, 0x518
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
 d5 22                 call8	expf
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

<expf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d2 07                 brult8	0x7 <L0>
 ff 0a                 fadd	q2, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e0 d7 01              jmp16	471 <L10>
<L0>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d1 14                 brne8	0x14 <L1>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 08              cmp32	q0, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 e0 ba 01              jmp16	442 <L10>
<L1>:
 f0 06 17 72           ldi16	r2, 0x7217
 f0 07 b1 42           ldi16	r3, 0x42b1
 f0 69 48              cmp32	q1, q2
 de ac 01              brslt16	0x1ac <L10>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 12                 brslt8	0x12 <L2>
 f0 06 b5 f1           ldi16	r2, 0xf1b5
 f0 07 cf 42           ldi16	r3, 0x42cf
 f0 69 40              cmp32	q1, q0
 d8 05                 bruge8	0x5 <L2>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e0 8f 01              jmp16	399 <L10>
<L2>:
 f0 06 19 72           ldi16	r2, 0x7219
 f0 07 b1 3e           ldi16	r3, 0x3eb1
 f0 69 04              cmp32	q0, q1
 d2 5a                 brult8	0x5a <L3>
 f0 06 91 15           ldi16	r2, 0x1591
 f0 07 85 3f           ldi16	r3, 0x3f85
 f0 69 40              cmp32	q1, q0
 d2 63                 brult8	0x63 <L4>
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 b7           ldi16	r3, 0xb717
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 fd 10                 cmov.slt	r2, r0
 fd 19                 cmov.slt	r3, r1
 c6 80 71              ldi16	r6, 0x7180
 c7 31 bf              ldi16	r7, 0xbf31
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 f4 22                 ldsp16	r6, [sp+0x8]
 a2                    xor	r4, r6
 22                    sub	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d4 6b                 jmp8	0x6b <L5>
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 33              ldi16	r7, 0x33ff
 f0 69 c0              cmp32	q3, q0
 d2 6e                 brult8	0x6e <L6>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e0 12 01              jmp16	274 <L10>
<L4>:
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c7 00 3f              ldi16	r7, 0x3f00
 f2 42                 sub	r2, r2
 f0 07 00 bf           ldi16	r3, 0xbf00
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 1e                 mov	r3, r6
 f0 69 04              cmp32	q0, q1
 f0 31 0a              ldsp16	r1, [sp+0xa]
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 04 3b aa           ldi16	r0, 0xaa3b
 f0 05 b8 3f           ldi16	r1, 0x3fb8
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 ff c2 61              ftos16	r6, q1
 f4 62                 stsp16	[sp+0x8], r6
 ff c0 63              s16tof	q3, r6
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 ff 2c                 fmul	q3, q0
<L5>:
 ff 1b                 fsub	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ff 1d                 fsub	q3, q1
 d4 05                 jmp8	0x5 <L7>
<L6>:
 aa                    xor	r6, r6
 f4 62                 stsp16	[sp+0x8], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L7>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 67                 mov32	q1, q3
 ff 25                 fmul	q1, q1
 c6 4c bb              ldi16	r6, 0xbb4c
 c7 31 33              ldi16	r7, 0x3331
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f0 04 0e ea           ldi16	r0, 0xea0e
 f0 05 dd b5           ldi16	r1, 0xb5dd
 ff 0c                 fadd	q3, q0
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f0 04 55 b3           ldi16	r0, 0xb355
 f0 05 8a 38           ldi16	r1, 0x388a
 ff 0c                 fadd	q3, q0
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f0 04 61 0b           ldi16	r0, 0xb61
 f0 05 36 bb           ldi16	r1, 0xbb36
 ff 0c                 fadd	q3, q0
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 ff 0c                 fadd	q3, q0
 ff 27                 fmul	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 63                 mov32	q0, q3
 ff 11                 fsub	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f6 2e                 tst16	r6
 d0 23                 breq8	0x23 <L8>
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 ff 1c                 fsub	q3, q0
 ff 37                 fdiv	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 1d                 fsub	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 23                 ldsp16	r7, [sp+0x8]
 cf 83                 cmpi.s8	r7, -0x7d
 d3 1c                 brslt8	0x1c <L9>
 fa 67                 lsl16i	r7, 0x7
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 d4 25                 jmp8	0x25 <L10>
<L8>:
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 ff 02                 fadd	q0, q2
 ff 34                 fdiv	q1, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1d                 fsub	q3, q1
 c5 80 3f              ldi16	r5, 0x3f80
 ff 0e                 fadd	q3, q2
 d4 10                 jmp8	0x10 <L10>
<L9>:
 fa 67                 lsl16i	r7, 0x7
 c6 00 32              ldi16	r6, 0x3200
 1b                    add	r6, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 0d              ldi16	r5, 0xd80
 ff 2e                 fmul	q3, q2
<L10>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
