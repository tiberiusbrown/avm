
math_log_scaled.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_log_scaled.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_log.c
000003bc l       .init_array	00000000 .hidden __init_array_end
000003bc l       .init_array	00000000 .hidden __init_array_start
000003bc l       .fini_array	00000000 .hidden __fini_array_start
000003bc l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000002f avm_test_main
000002f6 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002f8 g     F .text	000000c4 logf

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
 e1 d8 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 bc 03              ldi16	r4, 0x3bc
 c1 00                 ldi8	r5, 0x0
 c6 bc 03              ldi16	r6, 0x3bc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 bc 03           ldi16	r0, 0x3bc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 bc 03           ldi16	r2, 0x3bc
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
 c4 bc 03              ldi16	r4, 0x3bc
 c1 00                 ldi8	r5, 0x0
 c6 bc 03              ldi16	r6, 0x3bc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 bc 03           ldi16	r2, 0x3bc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 bc 03           ldi16	r0, 0x3bc
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
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 06 00 01           ldi16	r2, 0x100
 f0 03 20              ldi8	r3, 0x20
 d7 01                 sys	debug_break
<L0>:
 f0 6a 84              ld32	q2, [r2]
 d5 1b                 call8	logf
 ff 02                 fadd	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 f0                 brne8	-0x10 <L0>
 c4 80 01              ldi16	r4, 0x180
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

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d2 13                 brult8	0x13 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 68              fcmp	r6, q2, q0
 f6 2e                 tst16	r6
 db 90 00              brne16	0x90 <L4>
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e0 82 00              jmp16	130 <L3>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d2 0d                 brult8	0xd <L1>
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 ff 28                 fmul	q2, q0
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
<L2>:
 f4 52                 stsp16	[sp+0x4], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6d                 add32	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 80                 ldi8	r6, 0x80
 8b                    and	r6, r7
 f9 79                 or	r3, r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 28                 fmul	q2, q0
 ff c0 63              s16tof	q3, r6
 ff 0b                 fadd	q2, q3
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
<L3>:
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L5>
 ff 0a                 fadd	q2, q2
 d4 ea                 jmp8	-0x16 <L3>
<L5>:
 ff 1a                 fsub	q2, q2
 ff 38                 fdiv	q2, q0
 d4 e4                 jmp8	-0x1c <L3>
