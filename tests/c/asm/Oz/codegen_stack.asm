
codegen_stack.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_stack.c
00000347 l     F .text	0000002b fibonacci
00000372 l     F .text	000000b9 stack_arrays
0000042b l     F .text	00000054 register_pressure
0000047f l     F .text	00000044 program_pointer_stack
00000100 l     O .data	00000003 .L.str
000004c3 l     F .text	00000026 test_line16
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
000004e9 l     F .text	00000014 helper4
00000115 l     O .data	00000003 .L__const.program_pointer_stack.counts
0000010c l     O .data	00000009 .L__const.program_pointer_stack.pointers
000004fd l     F .text	00000024 test_hex8
00000523 l     O .rodata	00000020 flash_data
00000000 l    df *ABS*	00000000 runtime.c
00000543 l       .init_array	00000000 .hidden __init_array_end
00000543 l       .init_array	00000000 .hidden __init_array_start
00000543 l       .fini_array	00000000 .hidden __fini_array_start
00000543 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000070 avm_test_main
00000521 g     F .text	00000002 avm_halt
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
 e1 03 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 43 05              ldi16	r4, 0x543
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 43 05              ldi16	r6, 0x543
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 43 05           ldi16	r0, 0x543
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 43 05           ldi16	r2, 0x543
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
 c4 43 05              ldi16	r4, 0x543
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 43 05              ldi16	r6, 0x543
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 43 05           ldi16	r2, 0x543
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 43 05           ldi16	r0, 0x543
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
 d6 fb                 adjsp	-0x5
 c0 0a                 ldi8	r4, 0xa
 f1 40                 stsp8	[sp+0x4], r4
 c4 41 31              ldi16	r4, 0x3141
 f4 48                 stsp16	[sp+0x2], r4
 c4 3c 5a              ldi16	r4, 0x5a3c
 f4 40                 stsp16	[sp+0x0], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 d5 58                 call8	fibonacci
 f1 04                 mov	r0, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 7d                 call8	stack_arrays
 f1 1c                 mov	r3, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 2f 01              call16	register_pressure
 f1 14                 mov	r2, r4
 e1 7e 01              call16	program_pointer_stack
 f1 0c                 mov	r1, r4
 c4 00 01              ldi16	r4, 0x100
 f1 24                 mov	r5, r0
 e1 b8 01              call16	test_line16
 c4 03 01              ldi16	r4, 0x103
 f1 27                 mov	r5, r3
 e1 b0 01              call16	test_line16
 c4 06 01              ldi16	r4, 0x106
 f1 26                 mov	r5, r2
 e1 a8 01              call16	test_line16
 c4 09 01              ldi16	r4, 0x109
 f1 25                 mov	r5, r1
 e1 a0 01              call16	test_line16
 c4 f0 9e              ldi16	r4, 0x9ef0
 f5 1c                 cmp	r3, r4
 f8 0c                 cset.ne	r4
 f0 0c 37              cmpi.s8	r0, 0x37
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 c4 a8 e4              ldi16	r4, 0xe4a8
 f5 14                 cmp	r2, r4
 f8 0e                 cset.ne	r6
 99                    or	r6, r5
 c4 e8 d3              ldi16	r4, 0xd3e8
 f5 0c                 cmp	r1, r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 d6 05                 adjsp	0x5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fibonacci>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f1 10                 mov	r2, r0
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 12                 brult8	fibonacci+35
 f1 22                 mov	r4, r2
 f4 b4                 dec16	r4
 f1 74                 zext8	r4
 d5 e7                 call8	fibonacci
 f2 0c                 add	r1, r4
 f0 0a fe              addi.s8	r2, -0x2
 f0 08 fe              addi.s8	r0, -0x2
 d4 e6                 jmp8	fibonacci+9
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<stack_arrays>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d5                 adjsp	-0x2b
 f2 42                 sub	r2, r2
 f0 10 13              leasp	r0, 0x13
 f1 0c                 mov	r1, r4
 f1 1a                 mov	r3, r2
 f4 40                 stsp16	[sp+0x0], r4
 f0 0f 0c              cmpi.s8	r3, 0xc
 d0 35                 breq8	stack_arrays+75
 f1 26                 mov	r5, r2
 c9 f9                 addi.s8	r5, -0x7
 f0 0f 07              cmpi.s8	r3, 0x7
 fc 2a                 cmov.ult	r5, r2
 f4 a5                 tst8	r5
 0c                    mov	r7, r4
 d0 12                 breq8	stack_arrays+54
 c2 10                 ldi8	r6, 0x10
 29                    sub	r6, r5
 f1 75                 zext8	r5
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 01                 shl16v	r4, r5
 f1 76                 zext8	r6
 f4 03                 ldsp16	r7, [sp+0x0]
 fa 1e                 lsr16v	r7, r6
 9c                    or	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 23 01              ldi16	r5, 0x123
 f2 25                 add	r5, r1
 f9 e6                 xor	r7, r1
 f0 6d f1              st16	[r0+], r7
 f4 aa                 inc16	r2
 f4 ab                 inc16	r3
 f1 0d                 mov	r1, r5
 f0 0f 0c              cmpi.s8	r3, 0xc
 d1 cb                 brne8	stack_arrays+22
 aa                    xor	r6, r6
 f0 10 02              leasp	r0, 0x2
 06                    mov	r5, r6
 f1 0e                 mov	r1, r6
 c0 88                 ldi8	r4, 0x88
 34                    cmp	r5, r4
 d0 24                 breq8	stack_arrays+123
 02                    mov	r4, r6
 c8 f4                 addi.s8	r4, -0xc
 ce 0c                 cmpi.s8	r6, 0xc
 fc 26                 cmov.ult	r4, r6
 fa 31                 lsl16i	r4, 0x1
 f0 17 13              leasp	r7, 0x13
 1c                    add	r7, r4
 c0 08                 ldi8	r4, 0x8
 81                    and	r4, r5
 6f                    ld16	r7, [r7]
 fa 1c                 lsr16v	r7, r4
 f9 e6                 xor	r7, r1
 f0 6d e1              st8	[r0+], r7
 c9 08                 addi.s8	r5, 0x8
 f0 09 0d              addi.s8	r1, 0xd
 f4 ae                 inc16	r6
 c0 88                 ldi8	r4, 0x88
 34                    cmp	r5, r4
 d1 dc                 brne8	stack_arrays+87
 c4 68 24              ldi16	r4, 0x2468
 c1 0c                 ldi8	r5, 0xc
 f6 2d                 tst16	r5
 d0 17                 breq8	stack_arrays+155
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 fa 31                 lsl16i	r4, 0x1
 92                    or	r4, r6
 09                    mov	r6, r5
 fa 51                 lsl16i	r6, 0x1
 f0 17 13              leasp	r7, 0x13
 1e                    add	r7, r6
 ed de 1e              ld16	r6, [r7-2]
 a2                    xor	r4, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 e9                 brne8	stack_arrays+132
 f0 10 02              leasp	r0, 0x2
 c2 11                 ldi8	r6, 0x11
 c1 11                 ldi8	r5, 0x11
 f6 2e                 tst16	r6
 d0 0c                 breq8	stack_arrays+178
 f0 6c e1              ld8u	r7, [r0+]
 f3 1d                 mulu8.w	r7, r5
 13                    add	r4, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f4                 brne8	stack_arrays+166
 d6 2b                 adjsp	0x2b
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<register_pressure>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 0c                    mov	r7, r4
 fa 63                 lsl16i	r7, 0x3
 9d                    or	r7, r5
 f0 04 22 22           ldi16	r0, 0x2222
 f9 12                 xor	r0, r4
 c5 11 11              ldi16	r5, 0x1111
 11                    add	r4, r5
 08                    mov	r6, r4
 f2 28                 add	r6, r0
 f4 52                 stsp16	[sp+0x4], r6
 ab                    xor	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 c5 33 33              ldi16	r5, 0x3333
 16                    add	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 fa 8b                 lsr16i	r5, 0xb
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 06                    mov	r5, r6
 f2 54                 sub	r5, r0
 f4 49                 stsp16	[sp+0x2], r5
 a4                    xor	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 1d                    add	r7, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 e1 86 00              call16	helper4
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d5 7a                 call8	helper4
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 fa 31                 lsl16i	r4, 0x1
 91                    or	r4, r5
 f9 86                 xor	r4, r1
 f4 21                 ldsp16	r5, [sp+0x8]
 a1                    xor	r4, r5
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<program_pointer_stack>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 c2 03                 ldi8	r6, 0x3
 f0 05 15 01           ldi16	r1, 0x115
 f1 20                 mov	r4, r0
 f0 0c 03              cmpi.s8	r0, 0x3
 d0 2c                 breq8	program_pointer_stack+63
 f1 24                 mov	r5, r0
 fe 2e                 mul16	r5, r6
 c7 0c 01              ldi16	r7, 0x10c
 17                    add	r5, r7
 f1 2c                 mov	r7, r0
 f2 2d                 add	r7, r1
 4f                    ld8u	r7, [r7]
 f7 2a                 ld16	r2, [r5+]
 f5 37                 ld8u	r3, [r5]
 f4 a7                 tst8	r7
 d0 10                 breq8	program_pointer_stack+56
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 fa 31                 lsl16i	r4, 0x1
 91                    or	r4, r5
 f0 65 a4              ldp8u	r5, [q1+]
 11                    add	r4, r5
 f4 b7                 dec16	r7
 f4 a7                 tst8	r7
 d1 f0                 brne8	program_pointer_stack+40
 f4 a8                 inc16	r0
 f0 0c 03              cmpi.s8	r0, 0x3
 d1 d4                 brne8	program_pointer_stack+19
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
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
 d5 21                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 1b                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 02                 adjsp	0x2
 ef                    ret

<helper4>:
 b0                    push16	r0
 f0 00 05              ldi8	r0, 0x5
 fe 30                 mul16	r6, r0
 f0 00 07              ldi8	r0, 0x7
 fe 38                 mul16	r7, r0
 1e                    add	r7, r6
 c2 03                 ldi8	r6, 0x3
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 a3                    xor	r4, r7
 b8                    pop16	r0
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
