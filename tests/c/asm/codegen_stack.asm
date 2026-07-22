
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_stack.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_stack.c
00000421 l     F .text	0000002d fibonacci
0000044e l     F .text	000000a3 stack_arrays
00000544 l     F .text	0000004b program_pointer_stack
000004f1 l     F .text	00000053 register_pressure
0000058f l     F .text	00000014 helper4
00000109 l     O .data	00000003 .L__const.program_pointer_stack.counts
00000100 l     O .data	00000009 .L__const.program_pointer_stack.pointers
000005a5 l     O .rodata	00000020 flash_data
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000020b avm_test_main
000005a3 g     F .text	00000002 avm_halt

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
 e1 8d 03              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e1                 adjsp	-0x1f
 c0 0a                 ldi8	r4, 0xa
 f0 2c 1e              stsp8	[sp+0x1e], r4
 c4 41 31              ldi16	r4, 0x3141
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c4 3c 5a              ldi16	r4, 0x5a3c
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 1c 1e              ldsp8u	r4, [sp+0x1e]
 e1 ee 01              call16	fibonacci
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
 f0 3e 14              stsp16	[sp+0x14], r6
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
 f4 60                 stsp16	[sp+0x8], r4
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
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 e1 d6 01              call16	stack_arrays
 0c                    mov	r7, r4
 f9 e8                 and	r7, r2
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 0b                    mov	r6, r7
 ca 37                 addi.s8	r6, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 0c                    mov	r7, r4
 08                    mov	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 03                    mov	r4, r7
 c8 37                 addi.s8	r4, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 02                    mov	r4, r6
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 23                 cmp	r4, r3
 fc 35                 cmov.ult	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 e1 91 02              call16	program_pointer_stack
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
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 10              ldsp16	r4, [sp+0x10]
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
 f0 3c 16              stsp16	[sp+0x16], r4
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 18              stsp16	[sp+0x18], r4
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 23                 cmp	r4, r3
 fc 35                 cmov.ult	r6, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 3c 14              stsp16	[sp+0x14], r4
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 e1 af 01              call16	register_pressure
 f0 3c 12              stsp16	[sp+0x12], r4
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 c3 a0                 ldi8	r7, 0xa0
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 33                 ldsp16	r7, [sp+0xc]
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 c5                 or	r6, r1
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 0b                    mov	r6, r7
 ca 37                 addi.s8	r6, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f0 37 12              ldsp16	r7, [sp+0x12]
 03                    mov	r4, r7
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 33                 ldsp16	r7, [sp+0xc]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2f                 cmp	r7, r3
 fc 2c                 cmov.ult	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 f9 35                 or	r1, r5
 c9 37                 addi.s8	r5, 0x37
 f5 23                 cmp	r4, r3
 fc 29                 cmov.ult	r5, r1
 f0 04 f0 9e           ldi16	r0, 0x9ef0
 f4 38                 ldsp16	r4, [sp+0xe]
 f5 20                 cmp	r4, r0
 f8 09                 cset.ne	r1
 f0 04 e8 d3           ldi16	r0, 0xd3e8
 f5 2c                 cmp	r7, r0
 f8 08                 cset.ne	r0
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 37                 cmpi.s8	r4, 0x37
 f8 0a                 cset.ne	r2
 f9 45                 or	r2, r1
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c4 a8 e4              ldi16	r4, 0xe4a8
 f0 35 12              ldsp16	r5, [sp+0x12]
 34                    cmp	r5, r4
 f8 0f                 cset.ne	r7
 f9 e9                 or	r7, r2
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f9 e1                 or	r7, r0
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d6 1f                 adjsp	fibonacci+26
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
 d6 d7                 adjsp	fibonacci+10
 f2 39                 sub	r1, r1
 f0 12 11              leasp	r2, 0x11
 f1 04                 mov	r0, r4
 f1 19                 mov	r3, r1
 f1 25                 mov	r5, r1
 c9 f9                 addi.s8	r5, -0x7
 f0 0f 07              cmpi.s8	r3, 0x7
 fc 29                 cmov.ult	r5, r1
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
 f0 6d f5              st16	[r2+], r7
 f4 a9                 inc16	r1
 f4 ab                 inc16	r3
 f0 0f 0c              cmpi.s8	r3, 0xc
 f1 05                 mov	r0, r5
 d1 ce                 brne8	stack_arrays+15
 a0                    xor	r4, r4
 f1 0c                 mov	r1, r4
 08                    mov	r6, r4
 0c                    mov	r7, r4
 cb f4                 addi.s8	r7, -0xc
 cc 0c                 cmpi.s8	r4, 0xc
 fc 3c                 cmov.ult	r7, r4
 fa 61                 lsl16i	r7, 0x1
 f0 10 11              leasp	r0, 0x11
 f2 07                 add	r0, r7
 c3 08                 ldi8	r7, 0x8
 f9 e4                 and	r7, r1
 ed b0 20              ld16	r5, [r0+0]
 fa 17                 lsr16v	r5, r7
 a6                    xor	r5, r6
 f0 17 00              leasp	r7, 0x0
 1c                    add	r7, r4
 5d                    st8	[r7], r5
 f0 09 08              addi.s8	r1, 0x8
 ca 0d                 addi.s8	r6, 0xd
 f4 ac                 inc16	r4
 cc 11                 cmpi.s8	r4, 0x11
 d1 d8                 brne8	stack_arrays+69
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
 d1 e9                 brne8	stack_arrays+114
 f0 10 00              leasp	r0, 0x0
 c3 11                 ldi8	r7, 0x11
 c1 11                 ldi8	r5, 0x11
 f0 6c c1              ld8u	r6, [r0+]
 f3 19                 mulu8.w	r6, r5
 12                    add	r4, r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f4                 brne8	stack_arrays+144
 d6 29                 adjsp	register_pressure+36
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<register_pressure>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	stack_arrays+157
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
 d5 67                 call8	helper4
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d5 5b                 call8	helper4
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 fa 31                 lsl16i	r4, 0x1
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
 c3 03                 ldi8	r7, 0x3
 01                    mov	r4, r5
 f0 04 09 01           ldi16	r0, 0x109
 f2 05                 add	r0, r5
 ed 20 20              ld8u	r1, [r0+0]
 f0 0d 02              cmpi.s8	r1, 0x2
 f0 30 00              ldsp16	r0, [sp+0x0]
 fc 41                 cmov.uge	r0, r1
 f1 0d                 mov	r1, r5
 fe 0f                 mul16	r1, r7
 c6 00 01              ldi16	r6, 0x100
 f2 29                 add	r6, r1
 f0 6c 5d              ld16	r2, [r6+]
 ed 6c 20              ld8u	r3, [r6+0]
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 fa 31                 lsl16i	r4, 0x1
 92                    or	r4, r6
 f0 65 c4              ldp8u	r6, [q1+]
 12                    add	r4, r6
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 d1 f0                 brne8	program_pointer_stack+46
 f4 ad                 inc16	r5
 cd 03                 cmpi.s8	r5, 0x3
 d1 ca                 brne8	program_pointer_stack+14
 d6 02                 adjsp	program_pointer_stack+72
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
