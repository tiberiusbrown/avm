
loop_shapes.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 loop_shapes.c
00000100 l     O .data	00000020 lengths
00000120 l     O .data	00000080 values
000001a0 l     O .data	00000002 loop_shapes_result
00000000 l    df *ABS*	00000000 runtime.c
0000037c l       .init_array	00000000 .hidden __init_array_end
0000037c l       .init_array	00000000 .hidden __init_array_start
0000037c l       .fini_array	00000000 .hidden __fini_array_start
0000037c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000b3 avm_test_main
0000037a g     F .text	00000002 avm_halt
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
 c4 7c 03              ldi16	r4, 0x37c
 c1 00                 ldi8	r5, 0x0
 c6 7c 03              ldi16	r6, 0x37c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 7c 03           ldi16	r0, 0x37c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7c 03           ldi16	r2, 0x37c
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 7c 03              ldi16	r4, 0x37c
 c1 00                 ldi8	r5, 0x0
 c6 7c 03              ldi16	r6, 0x37c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 7c 03           ldi16	r2, 0x37c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7c 03           ldi16	r0, 0x37c
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
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
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 01              ldi8	r1, 0x1
 a5                    xor	r5, r5
 c3 20                 ldi8	r7, 0x20
 c0 39                 ldi8	r4, 0x39
 f4 48                 stsp16	[sp+0x2], r4
 c0 09                 ldi8	r4, 0x9
 f4 40                 stsp16	[sp+0x0], r4
 09                    mov	r6, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 fa 99                 lsr16i	r6, 0x9
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 01                    mov	r4, r5
 22                    sub	r4, r6
 21                    sub	r4, r5
 f2 21                 add	r4, r1
 f0 6d 81              st8	[r0+], r4
 f4 ad                 inc16	r5
 f4 a9                 inc16	r1
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 e3                 brne8	avm_test_main+24
 c4 20 01              ldi16	r4, 0x120
 c1 05                 ldi8	r5, 0x5
 c2 80                 ldi8	r6, 0x80
 f6 05                 st8	[r4+], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+60
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 07                    mov	r5, r7
 d4 0b                 jmp8	avm_test_main+87
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 d0 4e                 breq8	avm_test_main+165
 f4 49                 stsp16	[sp+0x2], r5
 a5                    xor	r5, r5
 f1 1d                 mov	r3, r5
 d4 09                 jmp8	avm_test_main+103
 f0 0b 03              addi.s8	r3, 0x3
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d0 e5                 breq8	avm_test_main+76
 09                    mov	r6, r5
 c4 00 01              ldi16	r4, 0x100
 18                    add	r6, r4
 f5 3a                 ld8u	r2, [r6]
 f4 a2                 tst8	r2
 d0 ec                 breq8	avm_test_main+94
 f1 02                 mov	r0, r2
 f2 03                 add	r0, r3
 c4 20 01              ldi16	r4, 0x120
 d4 06                 jmp8	avm_test_main+129
 f4 b0                 dec16	r0
 f4 a2                 tst8	r2
 d0 dd                 breq8	avm_test_main+94
 f1 28                 mov	r6, r0
 f1 76                 zext8	r6
 18                    add	r6, r4
 f4 b2                 dec16	r2
 f5 39                 ld8u	r1, [r6]
 c2 07                 ldi8	r6, 0x7
 f9 c4                 and	r6, r1
 f4 a6                 tst8	r6
 d0 e9                 breq8	avm_test_main+123
 f2 2d                 add	r7, r1
 c2 f0                 ldi8	r6, 0xf0
 f5 29                 cmp	r6, r1
 d8 e1                 bruge8	avm_test_main+123
 f0 0b 03              addi.s8	r3, 0x3
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 c4                 brne8	avm_test_main+103
 d4 a7                 jmp8	avm_test_main+76
 f0 5f a0 01           stm16	[0x1a0], r7
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
