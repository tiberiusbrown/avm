
math_exp_primary.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_exp_primary.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_exp.c
00000435 l       .init_array	00000000 .hidden __init_array_end
00000435 l       .init_array	00000000 .hidden __init_array_start
00000435 l       .fini_array	00000000 .hidden __fini_array_start
00000435 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000004e avm_test_main
00000315 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000317 g     F .text	0000011e expf

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
 e1 f7 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 35 04              ldi16	r4, 0x435
 c1 00                 ldi8	r5, 0x0
 c6 35 04              ldi16	r6, 0x435
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 35 04           ldi16	r0, 0x435
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 35 04           ldi16	r2, 0x435
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
 c4 35 04              ldi16	r4, 0x435
 c1 00                 ldi8	r5, 0x0
 c6 35 04              ldi16	r6, 0x435
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 35 04           ldi16	r2, 0x435
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 35 04           ldi16	r0, 0x435
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
 c6 58 39              ldi16	r6, 0x3958
 c7 b4 3c              ldi16	r7, 0x3cb4
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
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 20                 brult8	0x20 <L0>
 f0 69 4c              cmp32	q1, q3
 d1 6a                 brne8	0x6a <L3>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 f2 6a                 mov32	q3, q0
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 d4 53                 jmp8	0x53 <L5>
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 d3 0d                 brslt8	0xd <L1>
 f0 04 17 72           ldi16	r0, 0x7217
 f0 05 b1 42           ldi16	r1, 0x42b1
 f0 69 04              cmp32	q0, q1
 d2 35                 brult8	0x35 <L5>
<L1>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 d3 0d                 brslt8	0xd <L2>
 c6 b5 f1              ldi16	r6, 0xf1b5
 c7 cf 42              ldi16	r7, 0x42cf
 f0 69 c4              cmp32	q3, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d2 17                 brult8	0x17 <L5>
<L2>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 33              ldi16	r7, 0x33ff
 f0 69 c4              cmp32	q3, q1
 d2 15                 brult8	0x15 <L6>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 d4 02                 jmp8	0x2 <L4>
<L3>:
 ff 0a                 fadd	q2, q2
<L4>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L5>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 ff 2b                 fmul	q2, q3
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 3e              ldi16	r7, 0x3eb1
 f0 69 c4              cmp32	q3, q1
 d8 4f                 bruge8	0x4f <L7>
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 9f                 lsr16i	r6, 0xf
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f2 42                 sub	r2, r2
 f0 07 00 bf           ldi16	r3, 0xbf00
 f4 a6                 tst8	r6
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0c                 fadd	q3, q0
 ff c2 63              ftos16	r6, q3
 ff c0 60              s16tof	q0, r6
 ff 18                 fsub	q2, q0
 ff ca 05 d1 b0 1e 3c 7e 0e 65 3d e1 fb 75 3e 61 70 31 3f 01 00 80 3f  fpoly	5, 0.009685711, 0.055922024, 0.240218654, 0.693121016, 1.00000012
 ce 83                 cmpi.s8	r6, -0x7d
 d9 29                 brsge8	0x29 <L8>
 fa 57                 lsl16i	r6, 0x7
 c7 00 32              ldi16	r7, 0x3200
 1e                    add	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 0d              ldi16	r5, 0xd80
 ff 2e                 fmul	q3, q2
 d4 95                 jmp8	-0x6b <L5>
<L7>:
 ff ca 05 d1 b0 1e 3c 7e 0e 65 3d e1 fb 75 3e 61 70 31 3f 01 00 80 3f  fpoly	5, 0.009685711, 0.055922024, 0.240218654, 0.693121016, 1.00000012
 aa                    xor	r6, r6
<L8>:
 fa 57                 lsl16i	r6, 0x7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 e0 74 ff              jmp16	-140 <L5>
