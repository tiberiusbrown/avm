
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/loop_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 loop_control.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000002 loop_control_result
00000000 l    df *ABS*	00000000 runtime.c
00000375 l       .init_array	00000000 .hidden __init_array_end
00000375 l       .init_array	00000000 .hidden __init_array_start
00000375 l       .fini_array	00000000 .hidden __fini_array_start
00000375 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000009c avm_test_main
00000373 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
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
 c4 75 03              ldi16	r4, 0x375
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 75 03              ldi16	r6, 0x375
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 75 03           ldi16	r0, 0x375
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 75 03           ldi16	r2, 0x375
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
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
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 75 03              ldi16	r4, 0x375
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 75 03              ldi16	r6, 0x375
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 75 03           ldi16	r2, 0x375
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 75 03           ldi16	r0, 0x375
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
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
 c4 8d 92              ldi16	r4, 0x928d
 c5 97 9c              ldi16	r5, 0x9c97
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 79 7e              ldi16	r4, 0x7e79
 c5 83 88              ldi16	r5, 0x8883
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 65 6a              ldi16	r4, 0x6a65
 c5 6f 74              ldi16	r5, 0x746f
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 51 56              ldi16	r4, 0x5651
 c5 5b 60              ldi16	r5, 0x605b
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 3d 42              ldi16	r4, 0x423d
 c5 47 4c              ldi16	r5, 0x4c47
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 29 2e              ldi16	r4, 0x2e29
 c5 33 38              ldi16	r5, 0x3833
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 15 1a              ldi16	r4, 0x1a15
 c5 1f 24              ldi16	r5, 0x241f
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 01 06              ldi16	r4, 0x601
 c5 0b 10              ldi16	r5, 0x100b
 f0 07 00 01           ldi16	r3, 0x100
 f0 6b 86              st32	[r3], q2
 c5 34 12              ldi16	r5, 0x1234
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 05 00 03           ldi16	r1, 0x300
 c2 1f                 ldi8	r6, 0x1f
 c7 00 01              ldi16	r7, 0x100
 c9 18                 addi.s8	r5, 0x18
 f9 a6                 xor	r5, r1
 f2 30                 sub	r0, r0
 f1 20                 mov	r4, r0
 82                    and	r4, r6
 f2 23                 add	r4, r3
 40                    ld8u	r4, [r4]
 14                    add	r5, r4
 f4 a8                 inc16	r0
 f5 07                 cmp	r0, r7
 d1 f3                 brne8	avm_test_main+123
 f4 aa                 inc16	r2
 c0 80                 ldi8	r4, 0x80
 f5 14                 cmp	r2, r4
 d1 e5                 brne8	avm_test_main+117
 f0 5d 20 01           stm16	[0x120], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
