
codegen_stack.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_stack.c
0000035c l     F .text	00000031 fibonacci
0000038d l     F .text	000000e0 stack_arrays
0000046d l     F .text	00000095 register_pressure
00000502 l     F .text	00000091 program_pointer_stack
00000100 l     O .data	00000003 .L.str
00000593 l     F .text	0000001a test_line16
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
00000109 l     O .data	00000003 .L.str.3
000005ad l     F .text	0000002c rotate_left
000005d9 l     F .text	00000024 helper4
0000010c l     O .data	00000009 .L__const.program_pointer_stack.pointers
00000115 l     O .data	00000003 .L__const.program_pointer_stack.counts
000005fd l     F .text	00000022 test_puts
0000061f l     F .text	0000000b test_putc
0000062a l     F .text	0000000f test_hex16
00000639 l     F .text	00000019 test_hex8
00000652 l     F .text	0000002c test_hex_digit
00000680 l     O .rodata	00000020 flash_data
00000000 l    df *ABS*	00000000 runtime.c
000006a0 l       .init_array	00000000 .hidden __init_array_end
000006a0 l       .init_array	00000000 .hidden __init_array_start
000006a0 l       .fini_array	00000000 .hidden __fini_array_start
000006a0 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000085 avm_test_main
0000067e g     F .text	00000002 avm_halt
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
 e1 60 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a0 06              ldi16	r4, 0x6a0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 a0 06              ldi16	r6, 0x6a0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 a0 06           ldi16	r0, 0x6a0
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a0 06           ldi16	r2, 0x6a0
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
 c4 a0 06              ldi16	r4, 0x6a0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 a0 06              ldi16	r6, 0x6a0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 a0 06           ldi16	r2, 0x6a0
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a0 06           ldi16	r0, 0x6a0
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
 d6 f1                 adjsp	-0xf
 c0 0a                 ldi8	r4, 0xa
 f1 68                 stsp8	[sp+0xe], r4
 c4 41 31              ldi16	r4, 0x3141
 f4 70                 stsp16	[sp+0xc], r4
 c4 3c 5a              ldi16	r4, 0x5a3c
 f4 68                 stsp16	[sp+0xa], r4
 f3 78                 ldsp8u	r4, [sp+0xe]
 d5 71                 call8	fibonacci
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 e1 9b 00              call16	stack_arrays
 f4 58                 stsp16	[sp+0x6], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 e1 74 01              call16	register_pressure
 f4 50                 stsp16	[sp+0x4], r4
 e1 04 02              call16	program_pointer_stack
 f4 48                 stsp16	[sp+0x2], r4
 f4 21                 ldsp16	r5, [sp+0x8]
 c4 00 01              ldi16	r4, 0x100
 e1 8b 02              call16	test_line16
 f4 19                 ldsp16	r5, [sp+0x6]
 c4 03 01              ldi16	r4, 0x103
 e1 83 02              call16	test_line16
 f4 11                 ldsp16	r5, [sp+0x4]
 c4 06 01              ldi16	r4, 0x106
 e1 7b 02              call16	test_line16
 f4 09                 ldsp16	r5, [sp+0x2]
 c4 09 01              ldi16	r4, 0x109
 e1 73 02              call16	test_line16
 f4 21                 ldsp16	r5, [sp+0x8]
 c0 01                 ldi8	r4, 0x1
 cd 37                 cmpi.s8	r5, 0x37
 f4 40                 stsp16	[sp+0x0], r4
 d1 2a                 brne8	avm_test_main+125
 d4 00                 jmp8	avm_test_main+85
 f4 19                 ldsp16	r5, [sp+0x6]
 c0 01                 ldi8	r4, 0x1
 c6 f0 9e              ldi16	r6, 0x9ef0
 36                    cmp	r5, r6
 f4 40                 stsp16	[sp+0x0], r4
 d1 1c                 brne8	avm_test_main+125
 d4 00                 jmp8	avm_test_main+99
 f4 11                 ldsp16	r5, [sp+0x4]
 c0 01                 ldi8	r4, 0x1
 c6 a8 e4              ldi16	r6, 0xe4a8
 36                    cmp	r5, r6
 f4 40                 stsp16	[sp+0x0], r4
 d1 0e                 brne8	avm_test_main+125
 d4 00                 jmp8	avm_test_main+113
 f4 08                 ldsp16	r4, [sp+0x2]
 c5 e8 d3              ldi16	r5, 0xd3e8
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+125
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 0f                 adjsp	0xf
 ef                    ret

<fibonacci>:
 d6 fb                 adjsp	-0x5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 02                 cmpi.s8	r4, 0x2
 d9 08                 brsge8	fibonacci+18
 d4 00                 jmp8	fibonacci+12
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 4c                 stsp16	[sp+0x3], r4
 d4 1a                 jmp8	fibonacci+44
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 b4                 dec16	r4
 f1 74                 zext8	r4
 d5 e6                 call8	fibonacci
 f4 40                 stsp16	[sp+0x0], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 fe                 addi.s8	r4, -0x2
 f1 74                 zext8	r4
 d5 dc                 call8	fibonacci
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 11                    add	r4, r5
 f4 4c                 stsp16	[sp+0x3], r4
 d4 00                 jmp8	fibonacci+44
 f4 0c                 ldsp16	r4, [sp+0x3]
 d6 05                 adjsp	0x5
 ef                    ret

<stack_arrays>:
 d6 ca                 adjsp	-0x36
 f0 3c 34              stsp16	[sp+0x34], r4
 a0                    xor	r4, r4
 f1 58                 stsp8	[sp+0xa], r4
 d4 00                 jmp8	stack_arrays+10
 f3 68                 ldsp8u	r4, [sp+0xa]
 cc 0c                 cmpi.s8	r4, 0xc
 d9 2d                 brsge8	stack_arrays+61
 d4 00                 jmp8	stack_arrays+18
 f0 34 34              ldsp16	r4, [sp+0x34]
 f3 69                 ldsp8u	r5, [sp+0xa]
 c6 23 01              ldi16	r6, 0x123
 0d                    mov	r7, r5
 fe 3e                 mul16	r7, r6
 08                    mov	r6, r4
 1b                    add	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 c2 07                 ldi8	r6, 0x7
 ec 6e                 urem16	r5, r6
 e1 f8 01              call16	rotate_left
 f4 01                 ldsp16	r5, [sp+0x0]
 a4                    xor	r5, r4
 f3 6a                 ldsp8u	r6, [sp+0xa]
 1a                    add	r6, r6
 f0 14 1c              leasp	r4, 0x1c
 12                    add	r4, r6
 71                    st16	[r4], r5
 d4 00                 jmp8	stack_arrays+53
 f3 68                 ldsp8u	r4, [sp+0xa]
 f4 ac                 inc16	r4
 f1 58                 stsp8	[sp+0xa], r4
 d4 cd                 jmp8	stack_arrays+10
 a0                    xor	r4, r4
 f1 54                 stsp8	[sp+0x9], r4
 d4 00                 jmp8	stack_arrays+66
 f3 64                 ldsp8u	r4, [sp+0x9]
 cc 11                 cmpi.s8	r4, 0x11
 d9 3b                 brsge8	stack_arrays+131
 d4 00                 jmp8	stack_arrays+74
 f3 65                 ldsp8u	r5, [sp+0x9]
 c0 0c                 ldi8	r4, 0xc
 ec 6c                 urem16	r5, r4
 15                    add	r5, r5
 f0 14 1c              leasp	r4, 0x1c
 11                    add	r4, r5
 60                    ld16	r4, [r4]
 f4 5c                 stsp16	[sp+0x7], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f3 67                 ldsp8u	r7, [sp+0x9]
 c1 01                 ldi8	r5, 0x1
 8d                    and	r7, r5
 a5                    xor	r5, r5
 c2 08                 ldi8	r6, 0x8
 f4 a7                 tst8	r7
 fb 6e                 cmov.ne	r5, r6
 fa 11                 lsr16v	r4, r5
 f1 48                 stsp8	[sp+0x6], r4
 f3 59                 ldsp8u	r5, [sp+0x6]
 f3 66                 ldsp8u	r6, [sp+0x9]
 c3 0d                 ldi8	r7, 0xd
 02                    mov	r4, r6
 f3 13                 mulu8.w	r4, r7
 a4                    xor	r5, r4
 f0 14 0b              leasp	r4, 0xb
 12                    add	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	stack_arrays+123
 f3 64                 ldsp8u	r4, [sp+0x9]
 f4 ac                 inc16	r4
 f1 54                 stsp8	[sp+0x9], r4
 d4 bf                 jmp8	stack_arrays+66
 c4 68 24              ldi16	r4, 0x2468
 f4 50                 stsp16	[sp+0x4], r4
 c0 0c                 ldi8	r4, 0xc
 f1 3c                 stsp8	[sp+0x3], r4
 d4 00                 jmp8	stack_arrays+142
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f4 a4                 tst8	r4
 d0 20                 breq8	stack_arrays+180
 d4 00                 jmp8	stack_arrays+150
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 e1 83 01              call16	rotate_left
 f3 4d                 ldsp8u	r5, [sp+0x3]
 15                    add	r5, r5
 f0 16 1c              leasp	r6, 0x1c
 16                    add	r5, r6
 ed ba 1e              ld16	r5, [r5-2]
 a1                    xor	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	stack_arrays+172
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f4 b4                 dec16	r4
 f1 3c                 stsp8	[sp+0x3], r4
 d4 da                 jmp8	stack_arrays+142
 a0                    xor	r4, r4
 f1 38                 stsp8	[sp+0x2], r4
 d4 00                 jmp8	stack_arrays+185
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 11                 cmpi.s8	r4, 0x11
 d9 1c                 brsge8	stack_arrays+219
 d4 00                 jmp8	stack_arrays+193
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 4a                 ldsp8u	r6, [sp+0x2]
 f0 15 0b              leasp	r5, 0xb
 16                    add	r5, r6
 45                    ld8u	r5, [r5]
 c2 11                 ldi8	r6, 0x11
 f3 16                 mulu8.w	r5, r6
 11                    add	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	stack_arrays+211
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f1 38                 stsp8	[sp+0x2], r4
 d4 de                 jmp8	stack_arrays+185
 f4 10                 ldsp16	r4, [sp+0x4]
 d6 36                 adjsp	0x36
 ef                    ret

<register_pressure>:
 d6 e4                 adjsp	-0x1c
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c5 11 11              ldi16	r5, 0x1111
 11                    add	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c5 22 22              ldi16	r5, 0x2222
 a1                    xor	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c1 03                 ldi8	r5, 0x3
 e1 1f 01              call16	rotate_left
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 12              ldsp16	r5, [sp+0x12]
 a1                    xor	r4, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 33 33              ldi16	r5, 0x3333
 11                    add	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 c1 05                 ldi8	r5, 0x5
 e1 f8 00              call16	rotate_left
 f4 70                 stsp16	[sp+0xc], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 35 16              ldsp16	r5, [sp+0x16]
 21                    sub	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 35 18              ldsp16	r5, [sp+0x18]
 a1                    xor	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e1 fd 00              call16	helper4
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 ee 00              call16	helper4
 f4 48                 stsp16	[sp+0x2], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 c1 01                 ldi8	r5, 0x1
 e1 b5 00              call16	rotate_left
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 a1                    xor	r4, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 a1                    xor	r4, r5
 d6 1c                 adjsp	0x1c
 ef                    ret

<program_pointer_stack>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ed                 adjsp	-0x13
 c5 0c 01              ldi16	r5, 0x10c
 c2 09                 ldi8	r6, 0x9
 f0 14 0a              leasp	r4, 0xa
 d7 0f                 sys	memcpy
 f0 44 17 01           ldm8u	r4, [0x117]
 f1 54                 stsp8	[sp+0x9], r4
 f0 44 16 01           ldm8u	r4, [0x116]
 f1 50                 stsp8	[sp+0x8], r4
 f0 44 15 01           ldm8u	r4, [0x115]
 f1 4c                 stsp8	[sp+0x7], r4
 a0                    xor	r4, r4
 f4 54                 stsp16	[sp+0x5], r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 00                 jmp8	program_pointer_stack+41
 f3 50                 ldsp8u	r4, [sp+0x4]
 cc 03                 cmpi.s8	r4, 0x3
 d9 59                 brsge8	program_pointer_stack+136
 d4 00                 jmp8	program_pointer_stack+49
 f3 50                 ldsp8u	r4, [sp+0x4]
 c1 03                 ldi8	r5, 0x3
 f3 11                 mulu8.w	r4, r5
 f0 16 0a              leasp	r6, 0xa
 18                    add	r6, r4
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 f4 44                 stsp16	[sp+0x1], r4
 f1 3d                 stsp8	[sp+0x3], r5
 a0                    xor	r4, r4
 f1 30                 stsp8	[sp+0x0], r4
 d4 00                 jmp8	program_pointer_stack+71
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 52                 ldsp8u	r6, [sp+0x4]
 f0 15 07              leasp	r5, 0x7
 16                    add	r5, r6
 45                    ld8u	r5, [r5]
 31                    cmp	r4, r5
 d9 2b                 brsge8	program_pointer_stack+126
 d4 00                 jmp8	program_pointer_stack+85
 f4 14                 ldsp16	r4, [sp+0x5]
 c1 01                 ldi8	r5, 0x1
 d5 50                 call8	rotate_left
 f4 06                 ldsp16	r6, [sp+0x1]
 f3 4f                 ldsp8u	r7, [sp+0x3]
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 38 01              stsp16	[sp+0x1], r0
 f0 29 03              stsp8	[sp+0x3], r1
 f0 60 ac              ldp8u	r5, [q3]
 11                    add	r4, r5
 f4 54                 stsp16	[sp+0x5], r4
 d4 00                 jmp8	program_pointer_stack+118
 f3 40                 ldsp8u	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f1 30                 stsp8	[sp+0x0], r4
 d4 c9                 jmp8	program_pointer_stack+71
 d4 00                 jmp8	program_pointer_stack+128
 f3 50                 ldsp8u	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 a1                 jmp8	program_pointer_stack+41
 f4 14                 ldsp16	r4, [sp+0x5]
 d6 13                 adjsp	0x13
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 60                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 7e                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 84 00              call16	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 75                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<rotate_left>:
 d6 fb                 adjsp	-0x5
 f4 44                 stsp16	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f3 40                 ldsp8u	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d1 08                 brne8	rotate_left+20
 d4 00                 jmp8	rotate_left+14
 f4 04                 ldsp16	r4, [sp+0x1]
 f4 4c                 stsp16	[sp+0x3], r4
 d4 13                 jmp8	rotate_left+39
 f4 05                 ldsp16	r5, [sp+0x1]
 f3 43                 ldsp8u	r7, [sp+0x0]
 01                    mov	r4, r5
 fa 03                 shl16v	r4, r7
 c2 10                 ldi8	r6, 0x10
 2b                    sub	r6, r7
 f1 76                 zext8	r6
 fa 16                 lsr16v	r5, r6
 91                    or	r4, r5
 f4 4c                 stsp16	[sp+0x3], r4
 d4 00                 jmp8	rotate_left+39
 f4 0c                 ldsp16	r4, [sp+0x3]
 d6 05                 adjsp	0x5
 ef                    ret

<helper4>:
 d6 f8                 adjsp	-0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 c2 03                 ldi8	r6, 0x3
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 c2 05                 ldi8	r6, 0x5
 fe 2e                 mul16	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 c3 07                 ldi8	r7, 0x7
 fe 37                 mul16	r6, r7
 16                    add	r5, r6
 a1                    xor	r4, r5
 d6 08                 adjsp	0x8
 ef                    ret

<test_puts>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_puts+6
 f4 00                 ldsp16	r4, [sp+0x0]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 10                 breq8	test_puts+31
 d4 00                 jmp8	test_puts+17
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f4 41                 stsp16	[sp+0x0], r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 d5 05                 call8	test_putc
 d4 e7                 jmp8	test_puts+6
 d6 02                 adjsp	0x2
 ef                    ret

<test_putc>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 d5 07                 call8	test_hex8
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 fa 74                 lsr16i	r4, 0x4
 d5 0f                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d8                 call8	test_putc
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 07                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d0                 call8	test_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex_digit>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 0a                 cmpi.s8	r4, 0xa
 d9 0c                 brsge8	test_hex_digit+29
 d4 00                 jmp8	test_hex_digit+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 30                 addi.s8	r4, 0x30
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0a                 jmp8	test_hex_digit+39
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 37                 addi.s8	r4, 0x37
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_hex_digit+39
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 03                 adjsp	0x3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
