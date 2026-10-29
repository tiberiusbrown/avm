
fixed_point.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 fixed_point.c
00000100 l     O .data	00000100 bodies
00000200 l     O .data	00000002 fixed_point_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
000004dc l       .init_array	00000000 .hidden __init_array_end
000004dc l       .init_array	00000000 .hidden __init_array_start
000004dc l       .fini_array	00000000 .hidden __fini_array_start
000004dc l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	000000c7 avm_test_main
00000430 g     F .text	00000065 __avm_terminate
0000042e g     F .text	00000002 avm_halt
00000495 g     F .text	00000047 __avm_mulhisi3
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
 e1 1a 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 0b 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 dc 04              ldi16	r4, 0x4dc
 c1 00                 ldi8	r5, 0x0
 c6 dc 04              ldi16	r6, 0x4dc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 dc 04           ldi16	r0, 0x4dc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 dc 04           ldi16	r2, 0x4dc
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
 f2 42                 sub	r2, r2
 f0 00 80              ldi8	r0, 0x80
 c6 38 ff              ldi16	r6, 0xff38
 f0 05 fd ff           ldi16	r1, 0xfffd
 c5 00 f0              ldi16	r5, 0xf000
 c7 04 01              ldi16	r7, 0x104
 c4 00 01              ldi16	r4, 0x100
 f4 50                 stsp16	[sp+0x4], r4
 f0 03 07              ldi8	r3, 0x7
<L0>:
 ee be 1c              st16	[r7-4], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 14                    add	r5, r4
 f1 22                 mov	r4, r2
 ec 63                 urem16	r4, r3
 f2 52                 sub	r4, r2
 f2 21                 add	r4, r1
 7c                    st16	[r7], r4
 ee 1e 22              st16	[r7+2], r0
 ee de 1e              st16	[r7-2], r6
 cb 08                 addi.s8	r7, 0x8
 f4 a9                 inc16	r1
 f0 08 05              addi.s8	r0, 0x5
 f4 aa                 inc16	r2
 ca 11                 addi.s8	r6, 0x11
 c4 58 01              ldi16	r4, 0x158
 38                    cmp	r6, r4
 d1 da                 brne8	-0x26 <L0>
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f1 15                 mov	r2, r5
 d4 08                 jmp8	0x8 <L2>
<L1>:
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d0 64                 breq8	0x64 <L6>
<L2>:
 f4 41                 stsp16	[sp+0x0], r5
 c1 20                 ldi8	r5, 0x20
 f0 05 04 01           ldi16	r1, 0x104
 d4 17                 jmp8	0x17 <L5>
<L3>:
 c4 00 80              ldi16	r4, 0x8000
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 fd 26                 cmov.slt	r4, r6
<L4>:
 f4 11                 ldsp16	r5, [sp+0x4]
 f2 14                 add	r2, r4
 f9 4e                 xor	r2, r3
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
 d0 d7                 breq8	-0x29 <L1>
<L5>:
 f4 51                 stsp16	[sp+0x4], r5
 ed 92 1e              ld16	r4, [r1-2]
 ed 72 20              ld16	r3, [r1+0]
 f2 1c                 add	r3, r4
 ed 12 1c              ld16	r0, [r1-4]
 f2 03                 add	r0, r3
 ed 92 22              ld16	r4, [r1+2]
 f1 24                 mov	r5, r0
 e1 a1 00              call16	__avm_mulhisi3
 c2 80                 ldi8	r6, 0x80
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 0a                 ldsp16	r6, [sp+0x2]
 96                    or	r5, r6
 ee 12 1c              st16	[r1-4], r0
 fa b8                 asr16i	r4, 0x8
 09                    mov	r6, r5
 0c                    mov	r7, r4
 ee 72 1e              st16	[r1-2], r3
 f0 09 08              addi.s8	r1, 0x8
 c4 ff 7f              ldi16	r4, 0x7fff
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d9 ab                 brsge8	-0x55 <L3>
 c4 ff 7f              ldi16	r4, 0x7fff
 d4 b1                 jmp8	-0x4f <L4>
<L6>:
 f0 5a 00 02           stm16	[0x200], r2
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
 e1 bb fb              call16	-1093 <__avm_run_local_dtors>
<L0>:
 c4 dc 04              ldi16	r4, 0x4dc
 c1 00                 ldi8	r5, 0x0
 c6 dc 04              ldi16	r6, 0x4dc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 dc 04           ldi16	r2, 0x4dc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 dc 04           ldi16	r0, 0x4dc
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
 e1 72 fb              call16	-1166 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_mulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 3b                 mulsu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 0b                 ldsp16	r7, [sp+0x2]
 08                    mov	r6, r4
 f3 2b                 muls8.w	r6, r7
 f3 31                 mulsu8.w	r4, r5
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa e8                 asr16i	r7, 0x8
 1d                    add	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 18                    add	r6, r4
 fa 38                 lsl16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 1d                    add	r7, r5
 07                    mov	r5, r7
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 1b                    add	r6, r7
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
 ef                    ret
