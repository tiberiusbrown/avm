
struct_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 struct_copy.c
00000100 l     O .data	00000004 struct_result
00000104 l     O .data	000000c0 input_particles
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000003ff l       .init_array	00000000 .hidden __init_array_end
000003ff l       .init_array	00000000 .hidden __init_array_start
000003ff l       .fini_array	00000000 .hidden __fini_array_start
000003ff l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000071 avm_test_main
000002da g     F .text	00000065 __avm_terminate
000002d8 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 c4 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 b5 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ff 03              ldi16	r4, 0x3ff
 c1 00                 ldi8	r5, 0x0
 c6 ff 03              ldi16	r6, 0x3ff
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 ff 03           ldi16	r0, 0x3ff
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ff 03           ldi16	r2, 0x3ff
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

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 c4 04 01              ldi16	r4, 0x104
 c6 3f 03              ldi16	r6, 0x33f
 c3 00                 ldi8	r7, 0x0
 c1 c0                 ldi8	r5, 0xc0
 d7 10                 sys	memcpy_p
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c0 18                 ldi8	r4, 0x18
 f4 40                 stsp16	[sp+0x0], r4
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 0b 01              ldi16	r5, 0x10b
<L1>:
 f4 50                 stsp16	[sp+0x4], r4
 41                    ld8u	r4, [r5]
 f6 44                 sext8	r4
 ed da 1d              ld16	r6, [r5-3]
 12                    add	r4, r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 09                    mov	r6, r5
 ca f9                 addi.s8	r6, -0x7
 f0 6a cc              ld32	q3, [r6]
 f7 6d                 add32	q3, q1
 f7 63                 add32	q0, q3
 f1 14                 mov	r2, r4
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 ed 8a 1f              ld8u	r4, [r5-1]
 a2                    xor	r4, r6
 08                    mov	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f7 61                 add32	q0, q1
 c9 08                 addi.s8	r5, 0x8
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 cb                 brne8	-0x35 <L1>
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 bc                 brne8	-0x44 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
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

<__avm_terminate>:
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
 e1 11 fd              call16	-751 <__avm_run_local_dtors>
<L0>:
 c4 ff 03              ldi16	r4, 0x3ff
 c1 00                 ldi8	r5, 0x0
 c6 ff 03              ldi16	r6, 0x3ff
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 ff 03           ldi16	r2, 0x3ff
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ff 03           ldi16	r0, 0x3ff
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
 e1 c8 fc              call16	-824 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
