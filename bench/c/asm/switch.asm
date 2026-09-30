
switch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 switch.c
00000300 l     F .text	00000042 dense_dispatch
00000342 l     F .text	00000032 sparse_dispatch
00000100 l     O .data	00000002 switch_result
00000000 l    df *ABS*	00000000 runtime.c
00000376 l       .init_array	00000000 .hidden __init_array_end
00000376 l       .init_array	00000000 .hidden __init_array_start
00000376 l       .fini_array	00000000 .hidden __fini_array_start
00000376 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000039 avm_test_main
00000374 g     F .text	00000002 avm_halt
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
 e1 56 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 76 03              ldi16	r4, 0x376
 c1 00                 ldi8	r5, 0x0
 c6 76 03              ldi16	r6, 0x376
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 76 03           ldi16	r0, 0x376
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 76 03           ldi16	r2, 0x376
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
 c4 76 03              ldi16	r4, 0x376
 c1 00                 ldi8	r5, 0x0
 c6 76 03              ldi16	r6, 0x376
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 76 03           ldi16	r2, 0x376
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 76 03           ldi16	r0, 0x376
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
 c5 5a 5a              ldi16	r5, 0x5a5a
 f0 04 00 02           ldi16	r0, 0x200
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 02 07              ldi8	r2, 0x7
 f1 19                 mov	r3, r1
 f1 21                 mov	r4, r1
 f9 88                 and	r4, r2
 d5 1f                 call8	dense_dispatch
 04                    mov	r5, r4
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 d5 5a                 call8	sparse_dispatch
 04                    mov	r5, r4
 f4 a9                 inc16	r1
 f0 0b 25              addi.s8	r3, 0x25
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e7                 brne8	avm_test_main+20
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<dense_dispatch>:
 cc 04                 cmpi.s8	r4, 0x4
 d9 0c                 brsge8	dense_dispatch+16
 cc 02                 cmpi.s8	r4, 0x2
 d9 14                 brsge8	dense_dispatch+28
 f4 a4                 tst8	r4
 d1 23                 brne8	dense_dispatch+47
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 ef                    ret
 cc 06                 cmpi.s8	r4, 0x6
 d9 11                 brsge8	dense_dispatch+37
 cc 04                 cmpi.s8	r4, 0x4
 d1 1b                 brne8	dense_dispatch+51
 f4 8d                 lsr16.1	r5
 01                    mov	r4, r5
 ef                    ret
 cc 02                 cmpi.s8	r4, 0x2
 d1 19                 brne8	dense_dispatch+57
 c4 aa 55              ldi16	r4, 0x55aa
 d4 1a                 jmp8	dense_dispatch+63
 cc 06                 cmpi.s8	r4, 0x6
 d1 13                 brne8	dense_dispatch+60
 c4 7f 7f              ldi16	r4, 0x7f7f
 84                    and	r5, r4
 01                    mov	r4, r5
 ef                    ret
 c9 fd                 addi.s8	r5, -0x3
 01                    mov	r4, r5
 ef                    ret
 c4 01 01              ldi16	r4, 0x101
 94                    or	r5, r4
 01                    mov	r4, r5
 ef                    ret
 15                    add	r5, r5
 01                    mov	r4, r5
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 a4                    xor	r5, r4
 01                    mov	r4, r5
 ef                    ret

<sparse_dispatch>:
 cc 40                 cmpi.s8	r4, 0x40
 d3 12                 brslt8	sparse_dispatch+22
 cc 40                 cmpi.s8	r4, 0x40
 d0 1c                 breq8	sparse_dispatch+36
 cc 7f                 cmpi.s8	r4, 0x7f
 d0 1c                 breq8	sparse_dispatch+40
 c2 c8                 ldi8	r6, 0xc8
 32                    cmp	r4, r6
 d1 1a                 brne8	sparse_dispatch+43
 01                    mov	r4, r5
 fa 35                 lsl16i	r4, 0x5
 d4 0b                 jmp8	sparse_dispatch+33
 cc 03                 cmpi.s8	r4, 0x3
 d0 14                 breq8	sparse_dispatch+46
 cc 13                 cmpi.s8	r4, 0x13
 d1 0d                 brne8	sparse_dispatch+43
 c4 34 12              ldi16	r4, 0x1234
 a4                    xor	r5, r4
 01                    mov	r4, r5
 ef                    ret
 c9 e3                 addi.s8	r5, -0x1d
 01                    mov	r4, r5
 ef                    ret
 01                    mov	r4, r5
 fa 73                 lsr16i	r4, 0x3
 14                    add	r5, r4
 01                    mov	r4, r5
 ef                    ret
 c9 11                 addi.s8	r5, 0x11
 01                    mov	r4, r5
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
