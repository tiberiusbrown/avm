
stack_array.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 54 00 01           ldm16	r4, [0x100]
 e1 c3 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 e1 b8 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 02                 addi.s8	r4, 0x2
 e1 ab 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 03                 addi.s8	r4, 0x3
 e1 9e 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 04                 addi.s8	r4, 0x4
 e1 91 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 05                 addi.s8	r4, 0x5
 e1 84 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 06                 addi.s8	r4, 0x6
 d5 78                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 07                 addi.s8	r4, 0x7
 d5 6c                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 08                 addi.s8	r4, 0x8
 d5 60                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 09                 addi.s8	r4, 0x9
 d5 54                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0a                 addi.s8	r4, 0xa
 d5 48                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0b                 addi.s8	r4, 0xb
 d5 3c                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0c                 addi.s8	r4, 0xc
 d5 30                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0d                 addi.s8	r4, 0xd
 d5 24                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0e                 addi.s8	r4, 0xe
 d5 18                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0f                 addi.s8	r4, 0xf
 d5 0c                 call8	stack_kernel
 f9 82                 xor	r4, r0
 f0 5c 02 01           stm16	[0x102], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<stack_kernel>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 0c                    mov	r7, r4
 c2 94                 ldi8	r6, 0x94
 1b                    add	r6, r7
 f1 0f                 mov	r1, r7
 f0 09 25              addi.s8	r1, 0x25
 f9 c6                 xor	r6, r1
 f1 17                 mov	r2, r7
 f0 0a 4a              addi.s8	r2, 0x4a
 f9 46                 xor	r2, r1
 f1 26                 mov	r5, r2
 a7                    xor	r5, r7
 a9                    xor	r6, r5
 f1 1e                 mov	r3, r6
 f1 05                 mov	r0, r5
 f0 38 06              stsp16	[sp+0x6], r0
 0b                    mov	r6, r7
 ca 6f                 addi.s8	r6, 0x6f
 ab                    xor	r6, r7
 f9 c6                 xor	r6, r1
 c1 01                 ldi8	r5, 0x1
 f9 aa                 xor	r5, r2
 a9                    xor	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f1 15                 mov	r2, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 ab                    xor	r6, r7
 c1 02                 ldi8	r5, 0x2
 a6                    xor	r5, r6
 f9 76                 xor	r3, r5
 f0 3b 0a              stsp16	[sp+0xa], r3
 01                    mov	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 c1 de                 ldi8	r5, 0xde
 17                    add	r5, r7
 f9 a6                 xor	r5, r1
 f9 a2                 xor	r5, r0
 a4                    xor	r5, r4
 a7                    xor	r5, r7
 f9 ae                 xor	r5, r3
 c0 b9                 ldi8	r4, 0xb9
 13                    add	r4, r7
 a3                    xor	r4, r7
 f9 86                 xor	r4, r1
 f9 8a                 xor	r4, r2
 a3                    xor	r4, r7
 f0 32 02              ldsp16	r2, [sp+0x2]
 f9 8a                 xor	r4, r2
 f1 03                 mov	r0, r3
 f9 1e                 xor	r0, r7
 c2 03                 ldi8	r6, 0x3
 f9 c2                 xor	r6, r0
 a2                    xor	r4, r6
 f4 42                 stsp16	[sp+0x0], r6
 13                    add	r4, r7
 11                    add	r4, r5
 c5 03 01              ldi16	r5, 0x103
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 a2                 xor	r5, r0
 a7                    xor	r5, r7
 f1 1a                 mov	r3, r2
 f9 ae                 xor	r5, r3
 a6                    xor	r5, r6
 14                    add	r5, r4
 c4 28 01              ldi16	r4, 0x128
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 a2                    xor	r4, r6
 f0 32 08              ldsp16	r2, [sp+0x8]
 f9 8a                 xor	r4, r2
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 4d 01              ldi16	r5, 0x14d
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f9 a2                 xor	r5, r0
 a7                    xor	r5, r7
 f9 ae                 xor	r5, r3
 f0 32 00              ldsp16	r2, [sp+0x0]
 f9 aa                 xor	r5, r2
 14                    add	r5, r4
 c4 72 01              ldi16	r4, 0x172
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 a2                    xor	r4, r6
 f0 30 08              ldsp16	r0, [sp+0x8]
 f9 82                 xor	r4, r0
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 97 01              ldi16	r5, 0x197
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f0 33 04              ldsp16	r3, [sp+0x4]
 f9 ae                 xor	r5, r3
 a7                    xor	r5, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 a6                    xor	r5, r6
 f9 aa                 xor	r5, r2
 14                    add	r5, r4
 c4 bc 01              ldi16	r4, 0x1bc
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 a2                    xor	r4, r6
 f9 82                 xor	r4, r0
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 e1 01              ldi16	r5, 0x1e1
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f9 ae                 xor	r5, r3
 a7                    xor	r5, r7
 f0 33 02              ldsp16	r3, [sp+0x2]
 f9 ae                 xor	r5, r3
 f1 02                 mov	r0, r2
 f9 a2                 xor	r5, r0
 14                    add	r5, r4
 c4 06 02              ldi16	r4, 0x206
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f0 32 06              ldsp16	r2, [sp+0x6]
 f9 8a                 xor	r4, r2
 f4 22                 ldsp16	r6, [sp+0x8]
 a2                    xor	r4, r6
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 2b 02              ldi16	r5, 0x22b
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 a6                    xor	r5, r6
 a7                    xor	r5, r7
 f9 ae                 xor	r5, r3
 f9 a2                 xor	r5, r0
 14                    add	r5, r4
 c4 50 02              ldi16	r4, 0x250
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f9 8a                 xor	r4, r2
 f1 1a                 mov	r3, r2
 f0 32 08              ldsp16	r2, [sp+0x8]
 f9 8a                 xor	r4, r2
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 c5 75 02              ldi16	r5, 0x275
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 a2                 xor	r5, r0
 a7                    xor	r5, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 a6                    xor	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 a6                    xor	r5, r6
 14                    add	r5, r4
 c4 9a 02              ldi16	r4, 0x29a
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f9 8e                 xor	r4, r3
 f9 8a                 xor	r4, r2
 a3                    xor	r4, r7
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f9 8a                 xor	r4, r2
 11                    add	r4, r5
 c5 bf 02              ldi16	r5, 0x2bf
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f9 a2                 xor	r5, r0
 a7                    xor	r5, r7
 f0 33 02              ldsp16	r3, [sp+0x2]
 f9 ae                 xor	r5, r3
 a6                    xor	r5, r6
 14                    add	r5, r4
 c4 e4 02              ldi16	r4, 0x2e4
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 a2                    xor	r4, r6
 f0 30 08              ldsp16	r0, [sp+0x8]
 f9 82                 xor	r4, r0
 a3                    xor	r4, r7
 f9 8a                 xor	r4, r2
 11                    add	r4, r5
 c5 09 03              ldi16	r5, 0x309
 17                    add	r5, r7
 a7                    xor	r5, r7
 f9 a6                 xor	r5, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 a6                    xor	r5, r6
 a7                    xor	r5, r7
 f9 ae                 xor	r5, r3
 f0 32 00              ldsp16	r2, [sp+0x0]
 f9 aa                 xor	r5, r2
 14                    add	r5, r4
 c4 2e 03              ldi16	r4, 0x32e
 13                    add	r4, r7
 f9 86                 xor	r4, r1
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 8e                 xor	r4, r3
 f9 82                 xor	r4, r0
 a3                    xor	r4, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 11                    add	r4, r5
 f0 04 53 03           ldi16	r0, 0x353
 f2 07                 add	r0, r7
 07                    mov	r5, r7
 f9 a2                 xor	r5, r0
 f9 36                 xor	r1, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f9 3a                 xor	r1, r6
 f9 3e                 xor	r1, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 f9 3a                 xor	r1, r6
 f9 2a                 xor	r1, r2
 f2 0c                 add	r1, r4
 f1 23                 mov	r4, r3
 a1                    xor	r4, r5
 f0 33 08              ldsp16	r3, [sp+0x8]
 f9 8e                 xor	r4, r3
 ac                    xor	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 ac                    xor	r7, r4
 f2 2d                 add	r7, r1
 a9                    xor	r6, r5
 f9 ca                 xor	r6, r2
 1e                    add	r7, r6
 a4                    xor	r5, r4
 1d                    add	r7, r5
 f2 2c                 add	r7, r0
 03                    mov	r4, r7
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
