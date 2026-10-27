
math_fmod_subnormal.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_fmod_subnormal.c
00000100 l     O .data	00000100 inputs
00000465 l     O .rodata	00000080 pairs
00000200 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_fmod.c
000004e5 l       .init_array	00000000 .hidden __init_array_end
000004e5 l       .init_array	00000000 .hidden __init_array_start
000004e5 l       .fini_array	00000000 .hidden __fini_array_start
000004e5 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	00000094 avm_test_main
000003fd g     F .text	00000065 __avm_terminate
000003fb g     F .text	00000002 avm_halt
00000462 g     F .text	00000003 fmodf
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
 e1 e7 00              call16	__avm_terminate
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
 c4 e5 04              ldi16	r4, 0x4e5
 c1 00                 ldi8	r5, 0x0
 c6 e5 04              ldi16	r6, 0x4e5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e5 04           ldi16	r0, 0x4e5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e5 04           ldi16	r2, 0x4e5
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
 d6 fe                 adjsp	-0x2
 aa                    xor	r6, r6
 c5 08 01              ldi16	r5, 0x108
 c4 00 80              ldi16	r4, 0x8000
 f4 40                 stsp16	[sp+0x0], r4
<L0>:
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 02                    mov	r4, r6
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f1 04                 mov	r0, r4
 f1 0f                 mov	r1, r7
 f0 06 65 04           ldi16	r2, 0x465
 f0 03 00              ldi8	r3, 0x0
 f7 64                 add32	q1, q0
 f0 64 44              ldp32	q1, [q1]
 01                    mov	r4, r5
 c8 f8                 addi.s8	r4, -0x8
 f0 6b 48              st32	[r4], q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 71                 or	r3, r4
 f0 6b 4a              st32	[r5], q1
 f0 06 69 04           ldi16	r2, 0x469
 f0 03 00              ldi8	r3, 0x0
 f7 61                 add32	q0, q1
 f0 64 00              ldp32	q0, [q0]
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6b 08              st32	[r4], q0
 01                    mov	r4, r5
 c8 fc                 addi.s8	r4, -0x4
 f0 6b 08              st32	[r4], q0
 c9 10                 addi.s8	r5, 0x10
 f4 ae                 inc16	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 bc                 brne8	-0x44 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 04 01           ldi16	r3, 0x104
<L1>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 2a                 mov	r6, r2
 f2 2b                 add	r6, r3
 f0 6a cc              ld32	q3, [r6]
 e1 89 00              call16	fmodf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 0a 08              addi.s8	r2, 0x8
 c4 00 01              ldi16	r4, 0x100
 f5 14                 cmp	r2, r4
 d1 db                 brne8	-0x25 <L1>
 c4 00 02              ldi16	r4, 0x200
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
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
 e1 ee fb              call16	-1042 <__avm_run_local_dtors>
<L0>:
 c4 e5 04              ldi16	r4, 0x4e5
 c1 00                 ldi8	r5, 0x0
 c6 e5 04              ldi16	r6, 0x4e5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e5 04           ldi16	r2, 0x4e5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e5 04           ldi16	r0, 0x4e5
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
 e1 a5 fb              call16	-1115 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fmodf>:
 ff 1c                 fmod
 ef                    ret
