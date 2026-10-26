
conditional_fdiv_skipped.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 conditional_fdiv_skipped.c
00000100 l     O .data	00000080 divisors
00000497 l     F .text	00000019 conditional_division
00000180 l     O .data	00000004 division_sink
00000184 l     O .data	00000040 conditions
000001c4 l     O .data	00000080 numerators
00000000 l    df *ABS*	00000000 runtime.c
000004b2 l       .init_array	00000000 .hidden __init_array_end
000004b2 l       .init_array	00000000 .hidden __init_array_start
000004b2 l       .fini_array	00000000 .hidden __fini_array_start
000004b2 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	000000d0 avm_test_main
000004b0 g     F .text	00000002 avm_halt
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
 e1 92 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b2 04              ldi16	r4, 0x4b2
 c1 00                 ldi8	r5, 0x0
 c6 b2 04              ldi16	r6, 0x4b2
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 b2 04           ldi16	r0, 0x4b2
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b2 04           ldi16	r2, 0x4b2
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
 c4 b2 04              ldi16	r4, 0x4b2
 c1 00                 ldi8	r5, 0x0
 c6 b2 04              ldi16	r6, 0x4b2
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 b2 04           ldi16	r2, 0x4b2
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b2 04           ldi16	r0, 0x4b2
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
 d6 f6                 adjsp	-0xa
 c4 84 01              ldi16	r4, 0x184
 aa                    xor	r6, r6
 f2 30                 sub	r0, r0
 f0 05 00 3d           ldi16	r1, 0x3d00
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 06                    mov	r5, r6
<L0>:
 f4 61                 stsp16	[sp+0x8], r5
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 ff c1 70              u16tof	q0, r7
 f2 64                 mov32	q1, q0
 0c                    mov	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 26                 fmul	q1, q2
 03                    mov	r4, r7
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 07                 fadd	q1, q3
 09                    mov	r6, r5
 0e                    mov	r7, r6
 c5 c4 01              ldi16	r5, 0x1c4
 1d                    add	r7, r5
 f0 6b 4e              st32	[r7], q1
 f2 42                 sub	r2, r2
 f0 07 80 3c           ldi16	r3, 0x3c80
 ff 21                 fmul	q0, q1
 f0 07 c0 3f           ldi16	r3, 0x3fc0
 ff 01                 fadd	q0, q1
 0e                    mov	r7, r6
 c5 00 01              ldi16	r5, 0x100
 1d                    add	r7, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 6b 0e              st32	[r7], q0
 af                    xor	r7, r7
 f7 47                 st16	[r4+], r7
 f4 ad                 inc16	r5
 ca 04                 addi.s8	r6, 0x4
 c3 80                 ldi8	r7, 0x80
 3b                    cmp	r6, r7
 d1 ba                 brne8	-0x46 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 f0 07 84 01           ldi16	r3, 0x184
 f0 3b 08              stsp16	[sp+0x8], r3
 f2 42                 sub	r2, r2
<L2>:
 f1 22                 mov	r4, r2
 c5 c4 01              ldi16	r5, 0x1c4
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f1 2a                 mov	r6, r2
 c7 00 01              ldi16	r7, 0x100
 1b                    add	r6, r7
 f0 6a cc              ld32	q3, [r6]
 f2 68                 mov32	q2, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 6c 71              ld16	r3, [r0+]
 f0 38 08              stsp16	[sp+0x8], r0
 f2 62                 mov32	q0, q2
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 d5 28                 call8	conditional_division
 c2 80                 ldi8	r6, 0x80
 d6 02                 adjsp	0x2
 ff 02                 fadd	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 f5 16                 cmp	r2, r6
 d1 c5                 brne8	-0x3b <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 d1 af                 brne8	-0x51 <L1>
 c4 80 01              ldi16	r4, 0x180
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<conditional_division>:
 b1                    push16	r1
 b0                    push16	r0
 f0 30 07              ldsp16	r0, [sp+0x7]
 f6 28                 tst16	r0
 d0 09                 breq8	0x9 <L0>
 f2 62                 mov32	q0, q2
 ff 33                 fdiv	q0, q3
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L0>:
 f2 62                 mov32	q0, q2
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
