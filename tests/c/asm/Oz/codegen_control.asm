
codegen_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_control.c
00000372 l     F .text	00000011 dense_switch
00000100 l     O .data	0000000c .L__const.avm_test_main.sparse_inputs
00000383 l     F .text	00000033 sparse_switch
000003b6 l     F .text	0000002c loop_control
000003e2 l     F .text	00000053 run_state_machine
0000010c l     O .data	00000003 .L.str
00000435 l     F .text	00000026 test_line16
0000010f l     O .data	00000003 .L.str.1
00000112 l     O .data	00000003 .L.str.2
00000115 l     O .data	00000003 .L.str.3
00000118 l     O .data	00000003 .L.str.4
0000045b l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00000481 l       .init_array	00000000 .hidden __init_array_end
00000481 l       .init_array	00000000 .hidden __init_array_start
00000481 l       .fini_array	00000000 .hidden __fini_array_start
00000481 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000009b avm_test_main
0000047f g     F .text	00000002 avm_halt
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
 e1 61 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 81 04              ldi16	r4, 0x481
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 81 04              ldi16	r6, 0x481
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 81 04           ldi16	r0, 0x481
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 81 04           ldi16	r2, 0x481
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
 c4 81 04              ldi16	r4, 0x481
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 81 04              ldi16	r6, 0x481
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 81 04           ldi16	r2, 0x481
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 81 04           ldi16	r0, 0x481
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
 f2 39                 sub	r1, r1
 f1 01                 mov	r0, r1
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 cc 0c                 cmpi.s8	r4, 0xc
 d0 09                 breq8	avm_test_main+26
 e1 87 00              call16	dense_switch
 f2 04                 add	r0, r4
 f4 a9                 inc16	r1
 d4 ef                 jmp8	avm_test_main+9
 c4 0f 0f              ldi16	r4, 0xf0f
 f4 40                 stsp16	[sp+0x0], r4
 f0 05 00 01           ldi16	r1, 0x100
 f0 02 06              ldi8	r2, 0x6
 f6 2a                 tst16	r2
 d0 16                 breq8	avm_test_main+64
 f0 6c 93              ld16	r4, [r1+]
 d5 7d                 call8	sparse_switch
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 fa 51                 lsl16i	r6, 0x1
 99                    or	r6, r5
 a8                    xor	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 ea                 brne8	avm_test_main+42
 e1 9c 00              call16	loop_control
 f1 14                 mov	r2, r4
 e1 c3 00              call16	run_state_machine
 f1 0c                 mov	r1, r4
 c4 0c 01              ldi16	r4, 0x10c
 f1 24                 mov	r5, r0
 e1 0c 01              call16	test_line16
 c4 0f 01              ldi16	r4, 0x10f
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 41                 stsp16	[sp+0x0], r5
 e1 02 01              call16	test_line16
 c4 12 01              ldi16	r4, 0x112
 f1 26                 mov	r5, r2
 e1 fa 00              call16	test_line16
 c4 15 01              ldi16	r4, 0x115
 f1 25                 mov	r5, r1
 e1 f2 00              call16	test_line16
 c4 18 01              ldi16	r4, 0x118
 c5 9f a5              ldi16	r5, 0xa59f
 e1 e9 00              call16	test_line16
 c4 bc 44              ldi16	r4, 0x44bc
 f4 01                 ldsp16	r5, [sp+0x0]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 c5 c0 04              ldi16	r5, 0x4c0
 f5 05                 cmp	r0, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 e4 41              ldi16	r4, 0x41e4
 f5 14                 cmp	r2, r4
 f8 0e                 cset.ne	r6
 99                    or	r6, r5
 c4 10 e6              ldi16	r4, 0xe610
 f5 0c                 cmp	r1, r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<dense_switch>:
 c1 11                 ldi8	r5, 0x11
 cc 08                 cmpi.s8	r4, 0x8
 f3 11                 mulu8.w	r4, r5
 c8 10                 addi.s8	r4, 0x10
 c5 99 ff              ldi16	r5, 0xff99
 fc 2c                 cmov.ult	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 ef                    ret

<sparse_switch>:
 c5 00 80              ldi16	r5, 0x8000
 31                    cmp	r4, r5
 d0 29                 breq8	sparse_switch+47
 cc 01                 cmpi.s8	r4, 0x1
 d0 14                 breq8	sparse_switch+30
 c5 00 10              ldi16	r5, 0x1000
 31                    cmp	r4, r5
 d0 16                 breq8	sparse_switch+38
 c5 01 01              ldi16	r5, 0x101
 31                    cmp	r4, r5
 d0 0c                 breq8	sparse_switch+34
 cc 11                 cmpi.s8	r4, 0x11
 d1 10                 brne8	sparse_switch+42
 c4 22 22              ldi16	r4, 0x2222
 ef                    ret
 c4 11 11              ldi16	r4, 0x1111
 ef                    ret
 c4 33 33              ldi16	r4, 0x3333
 ef                    ret
 c4 44 44              ldi16	r4, 0x4444
 ef                    ret
 c5 5a a5              ldi16	r5, 0xa55a
 a1                    xor	r4, r5
 ef                    ret
 c4 55 55              ldi16	r4, 0x5555
 ef                    ret

<loop_control>:
 b0                    push16	r0
 c4 2b 6d              ldi16	r4, 0x6d2b
 af                    xor	r7, r7
 c2 55                 ldi8	r6, 0x55
 f0 00 03              ldi8	r0, 0x3
 cf 40                 cmpi.s8	r7, 0x40
 d0 1c                 breq8	loop_control+42
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 cd 01                 cmpi.s8	r5, 0x1
 d0 0b                 breq8	loop_control+32
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 fa 31                 lsl16i	r4, 0x1
 91                    or	r4, r5
 a2                    xor	r4, r6
 cf 25                 cmpi.s8	r7, 0x25
 d0 0a                 breq8	loop_control+42
 c5 23 01              ldi16	r5, 0x123
 19                    add	r6, r5
 f4 af                 inc16	r7
 cf 40                 cmpi.s8	r7, 0x40
 d1 e4                 brne8	loop_control+14
 b8                    pop16	r0
 ef                    ret

<run_state_machine>:
 c4 34 12              ldi16	r4, 0x1234
 c3 02                 ldi8	r7, 0x2
 a5                    xor	r5, r5
 c6 87 01              ldi16	r6, 0x187
 36                    cmp	r5, r6
 f1 77                 zext8	r7
 d0 43                 breq8	run_state_machine+81
 cf 03                 cmpi.s8	r7, 0x3
 d0 2b                 breq8	run_state_machine+61
 cf 01                 cmpi.s8	r7, 0x1
 d0 12                 breq8	run_state_machine+40
 cf 02                 cmpi.s8	r7, 0x2
 d0 18                 breq8	run_state_machine+50
 f4 a7                 tst8	r7
 d1 29                 brne8	run_state_machine+71
 c7 11 01              ldi16	r7, 0x111
 13                    add	r4, r7
 c3 03                 ldi8	r7, 0x3
 c9 11                 addi.s8	r5, 0x11
 d4 e1                 jmp8	run_state_machine+9
 c7 22 22              ldi16	r7, 0x2222
 a3                    xor	r4, r7
 c3 04                 ldi8	r7, 0x4
 c9 11                 addi.s8	r5, 0x11
 d4 d7                 jmp8	run_state_machine+9
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 fa 33                 lsl16i	r4, 0x3
 93                    or	r4, r7
 af                    xor	r7, r7
 c9 11                 addi.s8	r5, 0x11
 d4 cc                 jmp8	run_state_machine+9
 c7 cd fc              ldi16	r7, 0xfccd
 13                    add	r4, r7
 c3 01                 ldi8	r7, 0x1
 c9 11                 addi.s8	r5, 0x11
 d4 c2                 jmp8	run_state_machine+9
 11                    add	r4, r5
 c3 02                 ldi8	r7, 0x2
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 f1 77                 zext8	r7
 d1 bd                 brne8	run_state_machine+14
 a3                    xor	r4, r7
 ef                    ret

<test_line16>:
 d6 fe                 adjsp	-0x2
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_line16+14
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_line16+3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 d5 0d                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 07                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
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
