
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_stack.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_stack.c
00000410 l     F .text	00000029 fibonacci
000006dc l     F .text	00000049 program_pointer_stack
00000439 l     F .text	00000250 stack_arrays
00000689 l     F .text	00000053 register_pressure
00000725 l     F .text	00000014 helper4
00000100 l     O .data	00000009 .L__const.program_pointer_stack.pointers
00000109 l     O .data	00000003 .L__const.program_pointer_stack.counts
0000073b l     O .rodata	00000020 flash_data
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000001fa avm_test_main
00000739 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 23 05              call16	avm_halt

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
 e1 dd 01              call16	fibonacci
 f0 03 30              ldi8	r3, 0x30
 f0 02 0f              ldi8	r2, 0xf
 04                    mov	r5, r4
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 04                    mov	r5, r4
 08                    mov	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 f1 06                 mov	r0, r6
 fc 3d                 cmov.ult	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3c 10              stsp16	[sp+0x10], r4
 e1 62 04              call16	program_pointer_stack
 f0 3c 12              stsp16	[sp+0x12], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 c1 53                 ldi8	r5, 0x53
 01                    mov	r4, r5
 0d                    mov	r7, r5
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 00 0a              ldi8	r0, 0xa
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 e1 6b 01              call16	stack_arrays
 08                    mov	r6, r4
 f9 c8                 and	r6, r2
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 04                    mov	r5, r4
 f4 70                 stsp16	[sp+0xc], r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 f1 76                 zext8	r6
 c1 a0                 ldi8	r5, 0xa0
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 0e                    mov	r7, r6
 f9 ed                 or	r7, r3
 ca 37                 addi.s8	r6, 0x37
 fc 37                 cmov.ult	r6, r7
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 f4 50                 stsp16	[sp+0x4], r4
 cb 37                 addi.s8	r7, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 f4 31                 ldsp16	r5, [sp+0xc]
 34                    cmp	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 e1 54 03              call16	register_pressure
 04                    mov	r5, r4
 0c                    mov	r7, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 0b                    mov	r6, r7
 f4 6a                 stsp16	[sp+0xa], r6
 06                    mov	r5, r6
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f0 3f 10              stsp16	[sp+0x10], r7
 c7 00 a0              ldi16	r7, 0xa000
 37                    cmp	r5, r7
 f0 35 10              ldsp16	r5, [sp+0x10]
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 f9 75                 or	r3, r5
 c9 37                 addi.s8	r5, 0x37
 33                    cmp	r4, r7
 fc 2b                 cmov.ult	r5, r3
 c7 e8 d3              ldi16	r7, 0xd3e8
 f0 34 12              ldsp16	r4, [sp+0x12]
 33                    cmp	r4, r7
 f8 08                 cset.ne	r0
 c7 f0 9e              ldi16	r7, 0x9ef0
 f4 30                 ldsp16	r4, [sp+0xc]
 33                    cmp	r4, r7
 f8 0f                 cset.ne	r7
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 37                 cmpi.s8	r4, 0x37
 f8 09                 cset.ne	r1
 f9 3d                 or	r1, r7
 c3 3d                 ldi8	r7, 0x3d
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
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
 c2 0a                 ldi8	r6, 0xa
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 f9 a1                 or	r5, r0
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
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
 d6 d8                 adjsp	-0x28
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 08                    mov	r6, r4
 fa 54                 lsl16i	r6, 0x4
 99                    or	r6, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 04                    mov	r5, r4
 fa 8a                 lsr16i	r5, 0xa
 08                    mov	r6, r4
 fa 56                 lsl16i	r6, 0x6
 99                    or	r6, r5
 f0 3e 1a              stsp16	[sp+0x1a], r6
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 08                    mov	r6, r4
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 3e 24              stsp16	[sp+0x24], r6
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 04                    mov	r5, r4
 08                    mov	r6, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 97                    or	r5, r7
 f0 3d 1e              stsp16	[sp+0x1e], r5
 c5 81 0c              ldi16	r5, 0xc81
 16                    add	r5, r6
 f0 37 18              ldsp16	r7, [sp+0x18]
 a7                    xor	r5, r7
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 04 d0 48           ldi16	r0, 0x48d0
 f9 16                 xor	r0, r5
 f4 80                 lsl16.1	r0
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f9 81                 or	r4, r0
 f0 3c 1c              stsp16	[sp+0x1c], r4
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 02                    mov	r4, r6
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 02                    mov	r4, r6
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 1a                    add	r6, r6
 1a                    add	r6, r6
 99                    or	r6, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 c5 d2 06              ldi16	r5, 0x6d2
 14                    add	r5, r4
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 a6                    xor	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 c5 8c 04              ldi16	r5, 0x48c
 14                    add	r5, r4
 a7                    xor	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 c5 69 03              ldi16	r5, 0x369
 14                    add	r5, r4
 f0 05 5e 0b           ldi16	r1, 0xb5e
 f2 0c                 add	r1, r4
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f9 3a                 xor	r1, r6
 a6                    xor	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 c5 af 05              ldi16	r5, 0x5af
 14                    add	r5, r4
 f0 36 24              ldsp16	r6, [sp+0x24]
 a6                    xor	r5, r6
 f4 59                 stsp16	[sp+0x6], r5
 f0 07 18 09           ldi16	r3, 0x918
 f2 1c                 add	r3, r4
 c5 23 01              ldi16	r5, 0x123
 14                    add	r5, r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 06 46 02           ldi16	r2, 0x246
 f2 14                 add	r2, r4
 c6 3b 0a              ldi16	r6, 0xa3b
 18                    add	r6, r4
 f0 04 f5 07           ldi16	r0, 0x7f5
 f2 04                 add	r0, r4
 f9 82                 xor	r4, r0
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f9 e6                 xor	r7, r1
 07                    mov	r5, r7
 fa 8f                 lsr16i	r5, 0xf
 1f                    add	r7, r7
 9d                    or	r7, r5
 f0 3f 1c              stsp16	[sp+0x1c], r7
 06                    mov	r5, r6
 f0 36 22              ldsp16	r6, [sp+0x22]
 a6                    xor	r5, r6
 f9 5a                 xor	r2, r6
 f1 02                 mov	r0, r2
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 36 26              ldsp16	r6, [sp+0x26]
 ae                    xor	r7, r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f9 7a                 xor	r3, r6
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 c2 75                 ldi8	r6, 0x75
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 ab                    xor	r6, r7
 f0 3e 26              stsp16	[sp+0x26], r6
 f1 71                 zext8	r1
 c2 82                 ldi8	r6, 0x82
 f9 c6                 xor	r6, r1
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 37 20              ldsp16	r7, [sp+0x20]
 fa a8                 lsr16i	r7, 0x8
 c2 8f                 ldi8	r6, 0x8f
 ab                    xor	r6, r7
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 36 24              ldsp16	r6, [sp+0x24]
 fa 98                 lsr16i	r6, 0x8
 c3 a9                 ldi8	r7, 0xa9
 ae                    xor	r7, r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c3 0d                 ldi8	r7, 0xd
 ae                    xor	r7, r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 32 02              ldsp16	r2, [sp+0x2]
 f1 2a                 mov	r6, r2
 f1 76                 zext8	r6
 c3 4e                 ldi8	r7, 0x4e
 ae                    xor	r7, r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f1 2b                 mov	r6, r3
 f1 76                 zext8	r6
 c3 68                 ldi8	r7, 0x68
 ae                    xor	r7, r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 a6                    xor	r5, r6
 f1 28                 mov	r6, r0
 f1 08                 mov	r1, r0
 f1 76                 zext8	r6
 c3 b6                 ldi8	r7, 0xb6
 ae                    xor	r7, r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 c3 1a                 ldi8	r7, 0x1a
 ae                    xor	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 98                 lsr16i	r6, 0x8
 c3 c3                 ldi8	r7, 0xc3
 ae                    xor	r7, r6
 f0 3f 18              stsp16	[sp+0x18], r7
 c3 27                 ldi8	r7, 0x27
 ae                    xor	r7, r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 28                 mov	r6, r0
 f1 76                 zext8	r6
 c3 d0                 ldi8	r7, 0xd0
 ae                    xor	r7, r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c3 34                 ldi8	r7, 0x34
 ae                    xor	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 98                 lsr16i	r6, 0x8
 c3 41                 ldi8	r7, 0x41
 ae                    xor	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 c2 5b                 ldi8	r6, 0x5b
 ab                    xor	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 c3 11                 ldi8	r7, 0x11
 f0 36 12              ldsp16	r6, [sp+0x12]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 36 20              ldsp16	r6, [sp+0x20]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 36 22              ldsp16	r6, [sp+0x22]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 1b                 mulu8.w	r6, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 1b                 mulu8.w	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f3 1b                 mulu8.w	r6, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 f3 1b                 mulu8.w	r6, r7
 f0 3e 16              stsp16	[sp+0x16], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 1b                 mulu8.w	r6, r7
 0d                    mov	r7, r5
 fa af                 lsr16i	r7, 0xf
 15                    add	r5, r5
 97                    or	r5, r7
 f9 ae                 xor	r5, r3
 0d                    mov	r7, r5
 fa af                 lsr16i	r7, 0xf
 15                    add	r5, r5
 97                    or	r5, r7
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f9 8a                 xor	r4, r2
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f9 82                 xor	r4, r0
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f9 86                 xor	r4, r1
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 35 24              ldsp16	r5, [sp+0x24]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 11                    add	r4, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 12                    add	r4, r6
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 11                    add	r4, r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 11                    add	r4, r5
 f0 35 22              ldsp16	r5, [sp+0x22]
 11                    add	r4, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 11                    add	r4, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 11                    add	r4, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 11                    add	r4, r5
 c5 5c 0a              ldi16	r5, 0xa5c
 11                    add	r4, r5
 d6 28                 adjsp	0x28
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
 d5 64                 call8	helper4
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d5 58                 call8	helper4
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
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
 f0 6c 1d              ld16	r0, [r6+]
 ed 2c 20              ld8u	r1, [r6+0]
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 10                    add	r4, r4
 92                    or	r4, r6
 f0 65 c0              ldp8u	r6, [q0+]
 12                    add	r4, r6
 f4 b7                 dec16	r7
 f4 a7                 tst8	r7
 d1 f1                 brne8	program_pointer_stack+44
 f4 aa                 inc16	r2
 f0 0e 03              cmpi.s8	r2, 0x3
 d1 d2                 brne8	program_pointer_stack+20
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
