
codegen_calls.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_calls.c
0000034c l     F .text	00000005 many_arguments
0000035b l     F .text	00000002 add_values
00000351 l     F .text	0000000a call_indirect
0000035d l     F .text	00000008 xor_values
00000100 l     O .data	00000003 .L.str
00000365 l     F .text	00000013 test_line16
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000378 l     F .text	0000000d test_puts
00000385 l     F .text	00000011 test_hex16
00000109 l     O .data	00000003 .L.str.3
00000396 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
000003bc l       .init_array	00000000 .hidden __init_array_end
000003bc l       .init_array	00000000 .hidden __init_array_start
000003bc l       .fini_array	00000000 .hidden __fini_array_start
000003bc l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000075 avm_test_main
000003ba g     F .text	00000002 avm_halt
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
 e1 9c 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 bc 03              ldi16	r4, 0x3bc
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 bc 03              ldi16	r6, 0x3bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 bc 03           ldi16	r0, 0x3bc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 bc 03           ldi16	r2, 0x3bc
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
 c4 bc 03              ldi16	r4, 0x3bc
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 bc 03              ldi16	r6, 0x3bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 bc 03           ldi16	r2, 0x3bc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 bc 03           ldi16	r0, 0x3bc
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
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 68                 call8	many_arguments
 f1 04                 mov	r0, r4
 c4 5b 03              ldi16	r4, 0x35b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 34 12              ldi16	r6, 0x1234
 c7 67 45              ldi16	r7, 0x4567
 d5 5c                 call8	call_indirect
 f1 14                 mov	r2, r4
 c4 5d 03              ldi16	r4, 0x35d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cd ab              ldi16	r6, 0xabcd
 c7 0f 0f              ldi16	r7, 0xf0f
 d5 4b                 call8	call_indirect
 f1 0c                 mov	r1, r4
 c4 00 01              ldi16	r4, 0x100
 f1 24                 mov	r5, r0
 d5 56                 call8	test_line16
 f9 2a                 xor	r1, r2
 c4 03 01              ldi16	r4, 0x103
 f1 25                 mov	r5, r1
 d5 4d                 call8	test_line16
 c4 06 01              ldi16	r4, 0x106
 d5 5b                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c4 8d b8              ldi16	r4, 0xb88d
 d5 5f                 call8	test_hex16
 c4 11 67              ldi16	r4, 0x6711
 d5 5a                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c4 09 01              ldi16	r4, 0x109
 c5 51 65              ldi16	r5, 0x6551
 d5 2e                 call8	test_line16
 c4 2e 84              ldi16	r4, 0x842e
 f5 0c                 cmp	r1, r4
 f8 0d                 cset.ne	r5
 c4 c6 01              ldi16	r4, 0x1c6
 f5 04                 cmp	r0, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<many_arguments>:
 c5 c5 01              ldi16	r5, 0x1c5
 11                    add	r4, r5
 ef                    ret

<call_indirect>:
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 e8                    callp	q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<add_values>:
 11                    add	r4, r5
 ef                    ret

<xor_values>:
 09                    mov	r6, r5
 fa 9d                 lsr16i	r6, 0xd
 fa 43                 lsl16i	r5, 0x3
 99                    or	r6, r5
 a2                    xor	r4, r6
 ef                    ret

<test_line16>:
 b0                    push16	r0
 f1 05                 mov	r0, r5
 d5 0e                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d5 13                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<test_puts>:
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_puts+12
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_puts+1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 fa 78                 lsr16i	r4, 0x8
 d5 09                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 b0                    push16	r0
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 c2 0f                 ldi8	r6, 0xf
 88                    and	r6, r4
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 30                 cmov.ult	r6, r0
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
