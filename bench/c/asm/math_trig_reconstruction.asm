
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
00000475 l       .init_array	00000000 .hidden __init_array_end
00000475 l       .init_array	00000000 .hidden __init_array_start
00000475 l       .fini_array	00000000 .hidden __fini_array_start
00000475 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	000000ac avm_test_main
00000473 g     F .text	00000002 avm_halt
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
 e1 55 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 75 04              ldi16	r4, 0x475
 c1 00                 ldi8	r5, 0x0
 c6 75 04              ldi16	r6, 0x475
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 75 04           ldi16	r0, 0x475
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 75 04           ldi16	r2, 0x475
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
 c4 75 04              ldi16	r4, 0x475
 c1 00                 ldi8	r5, 0x0
 c6 75 04              ldi16	r6, 0x475
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 75 04           ldi16	r2, 0x475
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 75 04           ldi16	r0, 0x475
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
 c3 c7                 ldi8	r7, 0xc7
 c5 84 01              ldi16	r5, 0x184
 c6 00 01              ldi16	r6, 0x100
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 30                 sub	r0, r0
 f0 05 80 3e           ldi16	r1, 0x3e80
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
<L0>:
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f0 6b 0a              st32	[r5], q0
 f0 6a 0a              ld32	q0, [r5]
 ff c5 00              u32tof	q0, q0
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 21                 fmul	q0, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 01                 fadd	q0, q1
 f0 6b 0c              st32	[r6], q0
 c0 c7                 ldi8	r4, 0xc7
 1c                    add	r7, r4
 ca 04                 addi.s8	r6, 0x4
 c9 04                 addi.s8	r5, 0x4
 c4 a7 19              ldi16	r4, 0x19a7
 3c                    cmp	r7, r4
 d1 d3                 brne8	-0x2d <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
<L1>:
 f4 52                 stsp16	[sp+0x4], r6
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c4 00 01              ldi16	r4, 0x100
 18                    add	r6, r4
 f0 6a 4c              ld32	q1, [r6]
 f4 12                 ldsp16	r6, [sp+0x4]
 c4 84 01              ldi16	r4, 0x184
 18                    add	r6, r4
 f0 6a 0c              ld32	q0, [r6]
 ff c5 08              u32tof	q2, q0
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd b9              ldi16	r7, 0xb9fd
 ff 2b                 fmul	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 ff 06                 fadd	q1, q2
 ff 01                 fadd	q0, q1
 ca 04                 addi.s8	r6, 0x4
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 d1 c0                 brne8	-0x40 <L1>
 c6 80 01              ldi16	r6, 0x180
 f0 6b 0c              st32	[r6], q0
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
