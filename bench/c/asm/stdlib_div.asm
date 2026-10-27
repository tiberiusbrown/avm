
stdlib_div.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdlib_div.c
00000100 l     O .data	00000003 call
00000113 l     O .data	00000010 denominators
00000103 l     O .data	00000010 numerators
00000123 l     O .data	00000002 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
0000032d l       .init_array	00000000 .hidden __init_array_end
0000032d l       .init_array	00000000 .hidden __init_array_start
0000032d l       .fini_array	00000000 .hidden __fini_array_start
0000032d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000055 avm_test_main
000002c8 g     F .text	00000065 __avm_terminate
000002bc g     F .text	00000002 avm_halt
000002be g     F .text	0000000a div
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
 e1 b2 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 99 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 2d 03              ldi16	r4, 0x32d
 c1 00                 ldi8	r5, 0x0
 c6 2d 03              ldi16	r6, 0x32d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 2d 03           ldi16	r0, 0x32d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 2d 03           ldi16	r2, 0x32d
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
 d6 fc                 adjsp	-0x4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 00 01              ldi16	r6, 0x100
 f1 15                 mov	r2, r5
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 c4 13 01              ldi16	r4, 0x113
 f1 1c                 mov	r3, r4
 f0 05 03 01           ldi16	r1, 0x103
<L1>:
 02                    mov	r4, r6
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 6c 93              ld16	r4, [r1+]
 f0 6c b7              ld16	r5, [r3+]
 eb                    callp	q3
 08                    mov	r6, r4
 f2 2a                 add	r6, r2
 f1 2f                 mov	r7, r3
 f1 15                 mov	r2, r5
 f1 1f                 mov	r3, r7
 f2 16                 add	r2, r6
 c6 00 01              ldi16	r6, 0x100
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e1                 brne8	-0x1f <L1>
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 cb                 brne8	-0x35 <L0>
 f0 5a 23 01           stm16	[0x123], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<div>:
 08                    mov	r6, r4
 ec b5                 sdiv16	r6, r5
 0e                    mov	r7, r6
 fe 3d                 mul16	r7, r5
 23                    sub	r4, r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 ef                    ret

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
 e1 23 fd              call16	-733 <__avm_run_local_dtors>
<L0>:
 c4 2d 03              ldi16	r4, 0x32d
 c1 00                 ldi8	r5, 0x0
 c6 2d 03              ldi16	r6, 0x32d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 2d 03           ldi16	r2, 0x32d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 2d 03           ldi16	r0, 0x32d
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
 e1 da fc              call16	-806 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
