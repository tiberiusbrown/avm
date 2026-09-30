
codegen_stack.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_stack.c
000004c3 l     F .text	00000029 fibonacci
000004ec l     F .text	000000a0 stack_arrays
000005df l     F .text	00000048 program_pointer_stack
0000058c l     F .text	00000053 register_pressure
00000627 l     F .text	00000014 helper4
00000100 l     O .data	00000009 .L__const.program_pointer_stack.pointers
00000109 l     O .data	00000003 .L__const.program_pointer_stack.counts
0000063d l     O .rodata	00000020 flash_data
00000000 l    df *ABS*	00000000 runtime.c
0000065d l       .init_array	00000000 .hidden __init_array_end
0000065d l       .init_array	00000000 .hidden __init_array_start
0000065d l       .fini_array	00000000 .hidden __fini_array_start
0000065d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000001ec avm_test_main
0000063b g     F .text	00000002 avm_halt
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
 e1 1d 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 5d 06              ldi16	r4, 0x65d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 5d 06              ldi16	r6, 0x65d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 5d 06           ldi16	r0, 0x65d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 5d 06           ldi16	r2, 0x65d
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
 c4 5d 06              ldi16	r4, 0x65d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 5d 06              ldi16	r6, 0x65d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 5d 06           ldi16	r2, 0x65d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 5d 06           ldi16	r0, 0x65d
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
 d6 e7                 adjsp	-0x19
 c0 0a                 ldi8	r4, 0xa
 f0 2c 18              stsp8	[sp+0x18], r4
 c4 41 31              ldi16	r4, 0x3141
 f0 3c 16              stsp16	[sp+0x16], r4
 c4 3c 5a              ldi16	r4, 0x5a3c
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 1c 18              ldsp8u	r4, [sp+0x18]
 e1 cf 01              call16	fibonacci
 f0 01 30              ldi8	r1, 0x30
 f0 02 0f              ldi8	r2, 0xf
 04                    mov	r5, r4
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 c5                 or	r6, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 12              stsp16	[sp+0x12], r5
 04                    mov	r5, r4
 08                    mov	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 02                    mov	r4, r6
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f0 03 a0              ldi8	r3, 0xa0
 f5 23                 cmp	r4, r3
 fc 35                 cmov.ult	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f0 34 16              ldsp16	r4, [sp+0x16]
 e1 b5 01              call16	stack_arrays
 04                    mov	r5, r4
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 c5                 or	r6, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 69                 stsp16	[sp+0xa], r5
 04                    mov	r5, r4
 08                    mov	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 02                    mov	r4, r6
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 23                 cmp	r4, r3
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 30 14              ldsp16	r0, [sp+0x14]
 e1 70 02              call16	program_pointer_stack
 f4 70                 stsp16	[sp+0xc], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 3a                 ldsp16	r6, [sp+0xe]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 e1 a0 01              call16	register_pressure
 08                    mov	r6, r4
 f1 76                 zext8	r6
 f5 2b                 cmp	r6, r3
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 31                 ldsp16	r5, [sp+0xc]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 0e                    mov	r7, r6
 f9 e5                 or	r7, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 37                 cmov.ult	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 09                    mov	r6, r5
 0d                    mov	r7, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 68                 stsp16	[sp+0xa], r4
 08                    mov	r6, r4
 f9 c8                 and	r6, r2
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 c5                 or	r6, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 03                    mov	r4, r7
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 0e                    mov	r7, r6
 f9 e5                 or	r7, r1
 ca 37                 addi.s8	r6, 0x37
 f0 3e 12              stsp16	[sp+0x12], r6
 c6 00 a0              ldi16	r6, 0xa000
 32                    cmp	r4, r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 fc 27                 cmov.ult	r4, r7
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 f9 3d                 or	r1, r7
 cb 37                 addi.s8	r7, 0x37
 32                    cmp	r4, r6
 fc 39                 cmov.ult	r7, r1
 c4 f0 9e              ldi16	r4, 0x9ef0
 f4 3a                 ldsp16	r6, [sp+0xe]
 38                    cmp	r6, r4
 f8 0a                 cset.ne	r2
 c4 e8 d3              ldi16	r4, 0xd3e8
 f4 32                 ldsp16	r6, [sp+0xc]
 38                    cmp	r6, r4
 f8 08                 cset.ne	r0
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 37                 cmpi.s8	r4, 0x37
 f8 09                 cset.ne	r1
 f9 29                 or	r1, r2
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c4 a8 e4              ldi16	r4, 0xe4a8
 f4 29                 ldsp16	r5, [sp+0xa]
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f9 a5                 or	r5, r1
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 f9 a1                 or	r5, r0
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d6 19                 adjsp	0x19
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fibonacci>:
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f0 0c 02              cmpi.s8	r0, 0x2
 d2 15                 brult8	fibonacci+32
 f1 20                 mov	r4, r0
 f4 b4                 dec16	r4
 f1 74                 zext8	r4
 d5 ed                 call8	fibonacci
 f2 0c                 add	r1, r4
 f0 08 fe              addi.s8	r0, -0x2
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d8 eb                 bruge8	fibonacci+11
 f1 70                 zext8	r0
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<stack_arrays>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d7                 adjsp	-0x29
 f2 42                 sub	r2, r2
 f0 11 11              leasp	r1, 0x11
 f1 04                 mov	r0, r4
 f1 1a                 mov	r3, r2
 f1 26                 mov	r5, r2
 c9 f9                 addi.s8	r5, -0x7
 f0 0f 07              cmpi.s8	r3, 0x7
 fc 2a                 cmov.ult	r5, r2
 f4 a5                 tst8	r5
 0c                    mov	r7, r4
 d0 0f                 breq8	stack_arrays+44
 c2 10                 ldi8	r6, 0x10
 29                    sub	r6, r5
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 fa 0d                 shl16v	r7, r5
 07                    mov	r5, r7
 f1 76                 zext8	r6
 0c                    mov	r7, r4
 fa 1e                 lsr16v	r7, r6
 9d                    or	r7, r5
 c5 23 01              ldi16	r5, 0x123
 f2 24                 add	r5, r0
 f9 e2                 xor	r7, r0
 f0 6d f3              st16	[r1+], r7
 f4 aa                 inc16	r2
 f4 ab                 inc16	r3
 f0 0f 0c              cmpi.s8	r3, 0xc
 f1 05                 mov	r0, r5
 d1 ce                 brne8	stack_arrays+15
 a0                    xor	r4, r4
 f1 04                 mov	r0, r4
 08                    mov	r6, r4
 0c                    mov	r7, r4
 cb f4                 addi.s8	r7, -0xc
 cc 0c                 cmpi.s8	r4, 0xc
 fc 3c                 cmov.ult	r7, r4
 fa 61                 lsl16i	r7, 0x1
 f0 15 11              leasp	r5, 0x11
 17                    add	r5, r7
 c3 08                 ldi8	r7, 0x8
 f9 e0                 and	r7, r0
 65                    ld16	r5, [r5]
 fa 17                 lsr16v	r5, r7
 a6                    xor	r5, r6
 f0 17 00              leasp	r7, 0x0
 1c                    add	r7, r4
 5d                    st8	[r7], r5
 f0 08 08              addi.s8	r0, 0x8
 ca 0d                 addi.s8	r6, 0xd
 f4 ac                 inc16	r4
 cc 11                 cmpi.s8	r4, 0x11
 d1 db                 brne8	stack_arrays+69
 c4 68 24              ldi16	r4, 0x2468
 c1 0c                 ldi8	r5, 0xc
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 fa 31                 lsl16i	r4, 0x1
 92                    or	r4, r6
 09                    mov	r6, r5
 fa 51                 lsl16i	r6, 0x1
 f0 17 11              leasp	r7, 0x11
 1e                    add	r7, r6
 ed de 1e              ld16	r6, [r7-2]
 a2                    xor	r4, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 e9                 brne8	stack_arrays+111
 f0 10 00              leasp	r0, 0x0
 c3 11                 ldi8	r7, 0x11
 c1 11                 ldi8	r5, 0x11
 f0 6c c1              ld8u	r6, [r0+]
 f3 19                 mulu8.w	r6, r5
 12                    add	r4, r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f4                 brne8	stack_arrays+141
 d6 29                 adjsp	0x29
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
 d5 64                 call8	helper4
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d5 58                 call8	helper4
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
 d6 fe                 adjsp	-0x2
 f2 42                 sub	r2, r2
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f0 03 03              ldi8	r3, 0x3
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 f1 2e                 mov	r7, r2
 c6 09 01              ldi16	r6, 0x109
 1e                    add	r7, r6
 4b                    ld8u	r6, [r7]
 ce 02                 cmpi.s8	r6, 0x2
 f4 03                 ldsp16	r7, [sp+0x0]
 fc 7e                 cmov.uge	r7, r6
 f1 2a                 mov	r6, r2
 fe 33                 mul16	r6, r3
 19                    add	r6, r5
 f7 30                 ld16	r0, [r6+]
 f5 39                 ld8u	r1, [r6]
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 fa 31                 lsl16i	r4, 0x1
 92                    or	r4, r6
 f0 65 c0              ldp8u	r6, [q0+]
 12                    add	r4, r6
 f4 b7                 dec16	r7
 f4 a7                 tst8	r7
 d1 f0                 brne8	program_pointer_stack+42
 f4 aa                 inc16	r2
 f0 0e 03              cmpi.s8	r2, 0x3
 d1 d3                 brne8	program_pointer_stack+20
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
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

<avm_halt>:
 d4 fe                 jmp8	avm_halt
