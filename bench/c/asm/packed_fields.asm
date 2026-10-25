
packed_fields.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 packed_fields.c
00000100 l     O .data	00000004 packed_fields_result
00000104 l     O .data	000000c0 packets
00000000 l    df *ABS*	00000000 runtime.c
0000040a l       .init_array	00000000 .hidden __init_array_end
0000040a l       .init_array	00000000 .hidden __init_array_start
0000040a l       .fini_array	00000000 .hidden __fini_array_start
0000040a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000081 avm_test_main
00000348 g     F .text	00000002 avm_halt
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
 e1 2a 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 0a 04              ldi16	r4, 0x40a
 c1 00                 ldi8	r5, 0x0
 c6 0a 04              ldi16	r6, 0x40a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 0a 04           ldi16	r0, 0x40a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 0a 04           ldi16	r2, 0x40a
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
 c4 0a 04              ldi16	r4, 0x40a
 c1 00                 ldi8	r5, 0x0
 c6 0a 04              ldi16	r6, 0x40a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 0a 04           ldi16	r2, 0x40a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 0a 04           ldi16	r0, 0x40a
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
 c4 04 01              ldi16	r4, 0x104
 c6 4a 03              ldi16	r6, 0x34a
 c3 00                 ldi8	r7, 0x0
 c1 c0                 ldi8	r5, 0xc0
 d7 10                 sys	memcpy_p
 a0                    xor	r4, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 c5 09 01              ldi16	r5, 0x109
 c6 05 01              ldi16	r6, 0x105
 0c                    mov	r7, r4
<L0>:
 f4 43                 stsp16	[sp+0x0], r7
 f2 39                 sub	r1, r1
<L1>:
 f1 21                 mov	r4, r1
 11                    add	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f1 01                 mov	r0, r1
 f2 06                 add	r0, r6
 f0 6a c0              ld32	q3, [r0]
 60                    ld16	r4, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f1 29                 mov	r6, r1
 c7 0b 01              ldi16	r7, 0x10b
 1b                    add	r6, r7
 4a                    ld8u	r6, [r6]
 af                    xor	r7, r7
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f1 21                 mov	r4, r1
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 74                    st16	[r5], r4
 f0 6b c0              st32	[r0], q3
 a5                    xor	r5, r5
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 c6 05 01              ldi16	r6, 0x105
 f7 66                 add32	q1, q2
 c5 09 01              ldi16	r5, 0x109
 f0 09 08              addi.s8	r1, 0x8
 c0 c0                 ldi8	r4, 0xc0
 f5 0c                 cmp	r1, r4
 d1 be                 brne8	-0x42 <L1>
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 18                 cmpi.s8	r4, 0x18
 d1 af                 brne8	-0x51 <L0>
 c4 00 01              ldi16	r4, 0x100
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
