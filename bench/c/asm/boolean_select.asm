
boolean_select.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 boolean_select.c
00000100 l     O .data	00000002 boolean_select_result
00000102 l     O .data	00000040 coordinates
00000000 l    df *ABS*	00000000 runtime.c
00000367 l       .init_array	00000000 .hidden __init_array_end
00000367 l       .init_array	00000000 .hidden __init_array_start
00000367 l       .fini_array	00000000 .hidden __fini_array_start
00000367 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000005e avm_test_main
00000325 g     F .text	00000002 avm_halt
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
 e1 07 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 67 03              ldi16	r4, 0x367
 c1 00                 ldi8	r5, 0x0
 c6 67 03              ldi16	r6, 0x367
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 67 03           ldi16	r0, 0x367
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 67 03           ldi16	r2, 0x367
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
 c4 67 03              ldi16	r4, 0x367
 c1 00                 ldi8	r5, 0x0
 c6 67 03              ldi16	r6, 0x367
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 67 03           ldi16	r2, 0x367
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 67 03           ldi16	r0, 0x367
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
 d6 fc                 adjsp	-0x4
 c4 02 01              ldi16	r4, 0x102
 c6 27 03              ldi16	r6, 0x327
 c3 00                 ldi8	r7, 0x0
 c1 40                 ldi8	r5, 0x40
 d7 10                 sys	memcpy_p
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 f1 2b                 mov	r6, r3
 f1 27                 mov	r5, r3
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 f4 03                 ldsp16	r7, [sp+0x0]
 c5 02 01              ldi16	r5, 0x102
<L1>:
 f5 44                 ld16	r0, [r5]
 f1 08                 mov	r1, r0
 f0 09 c0              addi.s8	r1, -0x40
 f5 01                 cmp	r0, r1
 fc 0b                 cmov.ult	r1, r3
 f1 20                 mov	r4, r0
 c8 80                 addi.s8	r4, -0x80
 f5 04                 cmp	r0, r4
 fc 23                 cmov.ult	r4, r3
 12                    add	r4, r6
 f9 86                 xor	r4, r1
 f0 08 25              addi.s8	r0, 0x25
 f7 48                 st16	[r5+], r0
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 08                    mov	r6, r4
 d1 de                 brne8	-0x22 <L1>
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 08                    mov	r6, r4
 d1 ce                 brne8	-0x32 <L0>
 f0 5c 00 01           stm16	[0x100], r4
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
