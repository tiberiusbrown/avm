
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_stack.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_stack.c
00000422 l     F .text	0000002d fibonacci
0000044f l     F .text	0000018d stack_arrays
0000062f l     F .text	00000045 program_pointer_stack
000005dc l     F .text	00000053 register_pressure
00000674 l     F .text	00000014 helper4
00000109 l     O .data	00000003 .L__const.program_pointer_stack.counts
00000100 l     O .data	00000009 .L__const.program_pointer_stack.pointers
0000068a l     O .rodata	00000020 flash_data
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000020c avm_test_main
00000688 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 72 04              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 df                 adjsp	-0x21
 c0 0a                 ldi8	r4, 0xa
 f0 2c 20              stsp8	[sp+0x20], r4
 c4 41 31              ldi16	r4, 0x3141
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c4 3c 5a              ldi16	r4, 0x5a3c
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 e1 ef 01              call16	fibonacci
 f0 01 30              ldi8	r1, 0x30
 f0 02 0f              ldi8	r2, 0xf
 0c                    mov	r7, r4
 f9 e8                 and	r7, r2
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 0b                    mov	r6, r7
 ca 37                 addi.s8	r6, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 16              stsp16	[sp+0x16], r6
 0c                    mov	r7, r4
 08                    mov	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 03                    mov	r4, r7
 c8 37                 addi.s8	r4, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 25                 cmov.ult	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 f1 1e                 mov	r3, r6
 fc 3d                 cmov.ult	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 e1 d7 01              call16	stack_arrays
 0c                    mov	r7, r4
 f9 e8                 and	r7, r2
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 0b                    mov	r6, r7
 ca 37                 addi.s8	r6, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 0c                    mov	r7, r4
 08                    mov	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 03                    mov	r4, r7
 c8 37                 addi.s8	r4, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 25                 cmov.ult	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 02                    mov	r4, r6
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 23                 cmp	r4, r3
 fc 35                 cmov.ult	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 e1 7c 03              call16	program_pointer_stack
 f0 3c 14              stsp16	[sp+0x14], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 23                 cmp	r4, r3
 fc 35                 cmov.ult	r6, r5
 c1 53                 ldi8	r5, 0x53
 01                    mov	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 1a              stsp16	[sp+0x1a], r4
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 23                 cmp	r4, r3
 fc 35                 cmov.ult	r6, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 3c 16              stsp16	[sp+0x16], r4
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 e1 99 02              call16	register_pressure
 f4 40                 stsp16	[sp+0x0], r4
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 c3 a0                 ldi8	r7, 0xa0
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 02                    mov	r4, r6
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 03                 ldsp16	r7, [sp+0x0]
 03                    mov	r4, r7
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 c8 37                 addi.s8	r4, 0x37
 f5 2b                 cmp	r6, r3
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 f9 35                 or	r1, r5
 c9 37                 addi.s8	r5, 0x37
 f5 23                 cmp	r4, r3
 08                    mov	r6, r4
 fc 29                 cmov.ult	r5, r1
 c7 f0 9e              ldi16	r7, 0x9ef0
 f0 34 10              ldsp16	r4, [sp+0x10]
 33                    cmp	r4, r7
 f8 09                 cset.ne	r1
 c7 e8 d3              ldi16	r7, 0xd3e8
 f0 34 14              ldsp16	r4, [sp+0x14]
 33                    cmp	r4, r7
 f8 08                 cset.ne	r0
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc 37                 cmpi.s8	r4, 0x37
 f8 0a                 cset.ne	r2
 f9 45                 or	r2, r1
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 c4 a8 e4              ldi16	r4, 0xe4a8
 38                    cmp	r6, r4
 f8 0f                 cset.ne	r7
 f9 e9                 or	r7, r2
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f9 e1                 or	r7, r0
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d6 21                 adjsp	fibonacci+28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fibonacci>:
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 0c 02              cmpi.s8	r0, 0x2
 d8 04                 bruge8	fibonacci+13
 f2 39                 sub	r1, r1
 d4 17                 jmp8	fibonacci+36
 f2 39                 sub	r1, r1
 f1 20                 mov	r4, r0
 f4 b4                 dec16	r4
 f1 74                 zext8	r4
 d5 e9                 call8	fibonacci
 f2 0c                 add	r1, r4
 f0 08 fe              addi.s8	r0, -0x2
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d8 eb                 bruge8	fibonacci+15
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
 d6 b9                 adjsp	avm_test_main+504
 f2 42                 sub	r2, r2
 f0 11 2f              leasp	r1, 0x2f
 f1 04                 mov	r0, r4
 f1 1a                 mov	r3, r2
 d4 00                 jmp8	stack_arrays+17
 f1 26                 mov	r5, r2
 c9 f9                 addi.s8	r5, -0x7
 f0 0f 07              cmpi.s8	r3, 0x7
 fc 2a                 cmov.ult	r5, r2
 f4 a5                 tst8	r5
 0c                    mov	r7, r4
 d0 0f                 breq8	stack_arrays+46
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
 d1 ce                 brne8	stack_arrays+17
 a0                    xor	r4, r4
 f1 04                 mov	r0, r4
 08                    mov	r6, r4
 0c                    mov	r7, r4
 cb f4                 addi.s8	r7, -0xc
 cc 0c                 cmpi.s8	r4, 0xc
 fc 3c                 cmov.ult	r7, r4
 1f                    add	r7, r7
 f0 15 2f              leasp	r5, 0x2f
 17                    add	r5, r7
 c3 08                 ldi8	r7, 0x8
 f9 e0                 and	r7, r0
 65                    ld16	r5, [r5]
 fa 17                 lsr16v	r5, r7
 a6                    xor	r5, r6
 f0 17 1e              leasp	r7, 0x1e
 1c                    add	r7, r4
 5d                    st8	[r7], r5
 f0 08 08              addi.s8	r0, 0x8
 ca 0d                 addi.s8	r6, 0xd
 f4 ac                 inc16	r4
 cc 11                 cmpi.s8	r4, 0x11
 d1 dc                 brne8	stack_arrays+71
 c5 d0 48              ldi16	r5, 0x48d0
 f0 34 45              ldsp16	r4, [sp+0x45]
 a4                    xor	r5, r4
 15                    add	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 91                    or	r4, r5
 f0 36 43              ldsp16	r6, [sp+0x43]
 a8                    xor	r6, r4
 02                    mov	r4, r6
 fa 7f                 lsr16i	r4, 0xf
 1a                    add	r6, r6
 98                    or	r6, r4
 f0 35 41              ldsp16	r5, [sp+0x41]
 a6                    xor	r5, r6
 c0 11                 ldi8	r4, 0x11
 f0 1e 2e              ldsp8u	r6, [sp+0x2e]
 f3 18                 mulu8.w	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 1e 2d              ldsp8u	r6, [sp+0x2d]
 f3 18                 mulu8.w	r6, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 1e 2c              ldsp8u	r6, [sp+0x2c]
 f3 18                 mulu8.w	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 1e 2b              ldsp8u	r6, [sp+0x2b]
 f3 18                 mulu8.w	r6, r4
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 1e 2a              ldsp8u	r6, [sp+0x2a]
 f3 18                 mulu8.w	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 1e 29              ldsp8u	r6, [sp+0x29]
 f3 18                 mulu8.w	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 1e 28              ldsp8u	r6, [sp+0x28]
 f3 18                 mulu8.w	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 1e 27              ldsp8u	r6, [sp+0x27]
 f3 18                 mulu8.w	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f0 1e 26              ldsp8u	r6, [sp+0x26]
 f3 18                 mulu8.w	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f0 1e 25              ldsp8u	r6, [sp+0x25]
 f3 18                 mulu8.w	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 1e 24              ldsp8u	r6, [sp+0x24]
 f3 18                 mulu8.w	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f0 1e 23              ldsp8u	r6, [sp+0x23]
 f3 18                 mulu8.w	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 f0 1e 22              ldsp8u	r6, [sp+0x22]
 f3 18                 mulu8.w	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f0 1e 21              ldsp8u	r6, [sp+0x21]
 f3 18                 mulu8.w	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f0 1e 20              ldsp8u	r6, [sp+0x20]
 f3 18                 mulu8.w	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f0 1f 1f              ldsp8u	r7, [sp+0x1f]
 f3 1c                 mulu8.w	r7, r4
 f0 1e 1e              ldsp8u	r6, [sp+0x1e]
 f3 18                 mulu8.w	r6, r4
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 3f              ldsp16	r4, [sp+0x3f]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 35 3d              ldsp16	r5, [sp+0x3d]
 a4                    xor	r5, r4
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 3b              ldsp16	r4, [sp+0x3b]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 35 39              ldsp16	r5, [sp+0x39]
 a4                    xor	r5, r4
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 37              ldsp16	r4, [sp+0x37]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 35 35              ldsp16	r5, [sp+0x35]
 a4                    xor	r5, r4
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 33              ldsp16	r4, [sp+0x33]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 35 31              ldsp16	r5, [sp+0x31]
 a4                    xor	r5, r4
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 2f              ldsp16	r4, [sp+0x2f]
 a1                    xor	r4, r5
 12                    add	r4, r6
 13                    add	r4, r7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 11                    add	r4, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 11                    add	r4, r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 11                    add	r4, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 d6 47                 adjsp	register_pressure+66
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<register_pressure>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	stack_arrays+391
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 0c                    mov	r7, r4
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
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
 d5 60                 call8	helper4
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d5 54                 call8	helper4
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f9 86                 xor	r4, r1
 f4 21                 ldsp16	r5, [sp+0x8]
 a1                    xor	r4, r5
 d6 0a                 adjsp	program_pointer_stack+7
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<program_pointer_stack>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	program_pointer_stack+4
 a5                    xor	r5, r5
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f0 01 03              ldi8	r1, 0x3
 01                    mov	r4, r5
 c6 09 01              ldi16	r6, 0x109
 19                    add	r6, r5
 4e                    ld8u	r7, [r6]
 cf 02                 cmpi.s8	r7, 0x2
 f4 02                 ldsp16	r6, [sp+0x0]
 fc 77                 cmov.uge	r6, r7
 0d                    mov	r7, r5
 fe 39                 mul16	r7, r1
 f0 04 00 01           ldi16	r0, 0x100
 f2 07                 add	r0, r7
 f0 6c 51              ld16	r2, [r0+]
 ed 60 20              ld8u	r3, [r0+0]
 0c                    mov	r7, r4
 fa af                 lsr16i	r7, 0xf
 10                    add	r4, r4
 93                    or	r4, r7
 f0 65 e4              ldp8u	r7, [q1+]
 13                    add	r4, r7
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d1 f1                 brne8	program_pointer_stack+41
 f4 ad                 inc16	r5
 cd 03                 cmpi.s8	r5, 0x3
 d1 d1                 brne8	program_pointer_stack+15
 d6 02                 adjsp	program_pointer_stack+66
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
