
math_trig_reconstruction.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_trig_reconstruction.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000184 l     O .data	00000080 counts
00000000 l    df *ABS*	00000000 runtime.c
0000047c l       .init_array	00000000 .hidden __init_array_end
0000047c l       .init_array	00000000 .hidden __init_array_start
0000047c l       .fini_array	00000000 .hidden __fini_array_start
0000047c l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	000000b3 avm_test_main
0000047a g     F .text	00000002 avm_halt
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
 e1 5c 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7c 04              ldi16	r4, 0x47c
 c1 00                 ldi8	r5, 0x0
 c6 7c 04              ldi16	r6, 0x47c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 7c 04           ldi16	r0, 0x47c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7c 04           ldi16	r2, 0x47c
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
 c4 7c 04              ldi16	r4, 0x47c
 c1 00                 ldi8	r5, 0x0
 c6 7c 04              ldi16	r6, 0x47c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 7c 04           ldi16	r2, 0x47c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7c 04           ldi16	r0, 0x47c
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
 d6 f8                 adjsp	-0x8
 f0 03 c7              ldi8	r3, 0xc7
 f0 04 84 01           ldi16	r0, 0x184
 f0 05 00 01           ldi16	r1, 0x100
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 c5 80 3e              ldi16	r5, 0x3e80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 13                 mov	r2, r3
<L0>:
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f0 6b 80              st32	[r0], q2
 f0 6a 80              ld32	q2, [r0]
 ff 11                 u32tof
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f0 6b 82              st32	[r1], q2
 f2 13                 add	r2, r3
 f0 09 04              addi.s8	r1, 0x4
 f0 08 04              addi.s8	r0, 0x4
 c4 a7 19              ldi16	r4, 0x19a7
 f5 14                 cmp	r2, r4
 d1 d7                 brne8	-0x29 <L0>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 50                 stsp16	[sp+0x4], r4
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 48              ld32	q1, [r4]
 f4 10                 ldsp16	r4, [sp+0x4]
 c5 84 01              ldi16	r5, 0x184
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 ff 11                 u32tof
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd b9              ldi16	r7, 0xb9fd
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 c8 04                 addi.s8	r4, 0x4
 f4 50                 stsp16	[sp+0x4], r4
 c0 80                 ldi8	r4, 0x80
 f4 11                 ldsp16	r5, [sp+0x4]
 34                    cmp	r5, r4
 01                    mov	r4, r5
 d1 b0                 brne8	-0x50 <L1>
 c4 80 01              ldi16	r4, 0x180
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
