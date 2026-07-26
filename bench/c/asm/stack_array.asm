
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/stack_array.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 stack_array.c
00000100 l     O .data	00000002 stack_seed
000002e4 l     F .text	00000304 stack_kernel
00000102 l     O .data	00000002 stack_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000ce avm_test_main
000005e8 g     F .text	00000002 avm_halt

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
 e1 d2 03              call16	avm_halt

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
 d6 d0                 adjsp	-0x30
 08                    mov	r6, r4
 ca 6f                 addi.s8	r6, 0x6f
 a8                    xor	r6, r4
 0c                    mov	r7, r4
 cb 25                 addi.s8	r7, 0x25
 ab                    xor	r6, r7
 04                    mov	r5, r4
 c9 4a                 addi.s8	r5, 0x4a
 a7                    xor	r5, r7
 f1 0f                 mov	r1, r7
 f0 39 2e              stsp16	[sp+0x2e], r1
 c3 01                 ldi8	r7, 0x1
 ad                    xor	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 f1 05                 mov	r0, r5
 ab                    xor	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 a8                    xor	r6, r4
 f0 03 02              ldi8	r3, 0x2
 f9 7a                 xor	r3, r6
 c1 94                 ldi8	r5, 0x94
 14                    add	r5, r4
 f9 a6                 xor	r5, r1
 f9 12                 xor	r0, r4
 f9 a2                 xor	r5, r0
 f9 ae                 xor	r5, r3
 f4 61                 stsp16	[sp+0x8], r5
 f0 01 03              ldi8	r1, 0x3
 a4                    xor	r5, r4
 f9 a6                 xor	r5, r1
 f4 51                 stsp16	[sp+0x4], r5
 f0 06 72 01           ldi16	r2, 0x172
 f2 14                 add	r2, r4
 f0 05 e4 02           ldi16	r1, 0x2e4
 f2 0c                 add	r1, r4
 c1 de                 ldi8	r5, 0xde
 14                    add	r5, r4
 c7 9a 02              ldi16	r7, 0x29a
 1c                    add	r7, r4
 f0 3f 28              stsp16	[sp+0x28], r7
 c7 2e 03              ldi16	r7, 0x32e
 1c                    add	r7, r4
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 a7                    xor	r5, r7
 f0 3d 12              stsp16	[sp+0x12], r5
 f9 3e                 xor	r1, r7
 f9 5e                 xor	r2, r7
 c5 28 01              ldi16	r5, 0x128
 14                    add	r5, r4
 a7                    xor	r5, r7
 c6 bc 01              ldi16	r6, 0x1bc
 18                    add	r6, r4
 ab                    xor	r6, r7
 f9 c2                 xor	r6, r0
 f0 3e 18              stsp16	[sp+0x18], r6
 f9 a2                 xor	r5, r0
 f4 71                 stsp16	[sp+0xc], r5
 f9 42                 xor	r2, r0
 f0 3a 16              stsp16	[sp+0x16], r2
 f9 22                 xor	r1, r0
 f0 39 26              stsp16	[sp+0x26], r1
 f0 35 12              ldsp16	r5, [sp+0x12]
 f9 a2                 xor	r5, r0
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 ae                    xor	r7, r6
 f0 31 28              ldsp16	r1, [sp+0x28]
 f9 3a                 xor	r1, r6
 c5 50 02              ldi16	r5, 0x250
 14                    add	r5, r4
 a6                    xor	r5, r6
 f0 06 06 02           ldi16	r2, 0x206
 f2 14                 add	r2, r4
 f9 5a                 xor	r2, r6
 f9 42                 xor	r2, r0
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f9 a2                 xor	r5, r0
 f0 3d 24              stsp16	[sp+0x24], r5
 f9 22                 xor	r1, r0
 f1 11                 mov	r2, r1
 f9 e2                 xor	r7, r0
 f0 05 53 03           ldi16	r1, 0x353
 f2 0c                 add	r1, r4
 f0 39 02              stsp16	[sp+0x2], r1
 04                    mov	r5, r4
 f9 a6                 xor	r5, r1
 f4 79                 stsp16	[sp+0xe], r5
 f9 16                 xor	r0, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 f9 ae                 xor	r5, r3
 f0 3d 12              stsp16	[sp+0x12], r5
 f9 ee                 xor	r7, r3
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 35 26              ldsp16	r5, [sp+0x26]
 f9 ae                 xor	r5, r3
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 f9 ae                 xor	r5, r3
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 31                 ldsp16	r5, [sp+0xc]
 f9 ae                 xor	r5, r3
 f4 71                 stsp16	[sp+0xc], r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 f9 ae                 xor	r5, r3
 f0 3d 18              stsp16	[sp+0x18], r5
 f9 0e                 xor	r0, r3
 f0 38 1a              stsp16	[sp+0x1a], r0
 f9 4e                 xor	r2, r3
 f0 3a 28              stsp16	[sp+0x28], r2
 f0 35 24              ldsp16	r5, [sp+0x24]
 f9 ae                 xor	r5, r3
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f9 ae                 xor	r5, r3
 f0 3d 2c              stsp16	[sp+0x2c], r5
 c5 4d 01              ldi16	r5, 0x14d
 14                    add	r5, r4
 f1 1d                 mov	r3, r5
 c7 09 03              ldi16	r7, 0x309
 1c                    add	r7, r4
 f0 02 b9              ldi8	r2, 0xb9
 f2 14                 add	r2, r4
 f0 05 03 01           ldi16	r1, 0x103
 f2 0c                 add	r1, r4
 c5 bf 02              ldi16	r5, 0x2bf
 14                    add	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f9 32                 xor	r1, r4
 f9 52                 xor	r2, r4
 ac                    xor	r7, r4
 f1 03                 mov	r0, r3
 f9 12                 xor	r0, r4
 c5 e1 01              ldi16	r5, 0x1e1
 14                    add	r5, r4
 a4                    xor	r5, r4
 c6 97 01              ldi16	r6, 0x197
 18                    add	r6, r4
 a8                    xor	r6, r4
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f9 ce                 xor	r6, r3
 f0 3e 14              stsp16	[sp+0x14], r6
 f9 ae                 xor	r5, r3
 f0 3d 10              stsp16	[sp+0x10], r5
 f9 0e                 xor	r0, r3
 f0 38 22              stsp16	[sp+0x22], r0
 f9 ee                 xor	r7, r3
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f9 4e                 xor	r2, r3
 f9 2e                 xor	r1, r3
 f1 03                 mov	r0, r3
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ac                    xor	r7, r4
 c5 75 02              ldi16	r5, 0x275
 14                    add	r5, r4
 a4                    xor	r5, r4
 c6 2b 02              ldi16	r6, 0x22b
 18                    add	r6, r4
 a8                    xor	r6, r4
 f9 c2                 xor	r6, r0
 f0 3e 20              stsp16	[sp+0x20], r6
 f9 a2                 xor	r5, r0
 f1 1d                 mov	r3, r5
 f9 e2                 xor	r7, r0
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 16                 xor	r0, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 f9 36                 xor	r1, r5
 f9 56                 xor	r2, r5
 ad                    xor	r7, r5
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 a9                    xor	r6, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f9 16                 xor	r0, r5
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 36 22              ldsp16	r6, [sp+0x22]
 a9                    xor	r6, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 30 10              ldsp16	r0, [sp+0x10]
 f9 16                 xor	r0, r5
 f0 37 14              ldsp16	r7, [sp+0x14]
 ad                    xor	r7, r5
 f0 3f 14              stsp16	[sp+0x14], r7
 f9 76                 xor	r3, r5
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 37 20              ldsp16	r7, [sp+0x20]
 ad                    xor	r7, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 35 12              ldsp16	r5, [sp+0x12]
 a4                    xor	r5, r4
 f4 23                 ldsp16	r7, [sp+0x8]
 a7                    xor	r5, r7
 f9 52                 xor	r2, r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f9 5a                 xor	r2, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 f9 5e                 xor	r2, r7
 f2 14                 add	r2, r4
 f2 15                 add	r2, r5
 f9 32                 xor	r1, r4
 f9 3a                 xor	r1, r6
 f9 3e                 xor	r1, r7
 f2 0a                 add	r1, r2
 f0 33 16              ldsp16	r3, [sp+0x16]
 f9 72                 xor	r3, r4
 f0 35 26              ldsp16	r5, [sp+0x26]
 a4                    xor	r5, r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 a4                    xor	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f9 12                 xor	r0, r4
 f0 38 10              stsp16	[sp+0x10], r0
 f0 35 22              ldsp16	r5, [sp+0x22]
 a4                    xor	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 a4                    xor	r5, r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f9 52                 xor	r2, r4
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 a4                    xor	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 a4                    xor	r5, r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 35 24              ldsp16	r5, [sp+0x24]
 a4                    xor	r5, r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 35 28              ldsp16	r5, [sp+0x28]
 a4                    xor	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 a4                    xor	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 a4                    xor	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 2b                 ldsp16	r7, [sp+0xa]
 ac                    xor	r7, r4
 f0 30 18              ldsp16	r0, [sp+0x18]
 f9 12                 xor	r0, r4
 f0 35 14              ldsp16	r5, [sp+0x14]
 a4                    xor	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 31                 ldsp16	r5, [sp+0xc]
 a1                    xor	r4, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 a1                    xor	r4, r5
 f2 21                 add	r4, r1
 09                    mov	r6, r5
 f9 7a                 xor	r3, r6
 f0 3b 16              stsp16	[sp+0x16], r3
 f4 19                 ldsp16	r5, [sp+0x6]
 ad                    xor	r7, r5
 f4 6b                 stsp16	[sp+0xa], r7
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ad                    xor	r7, r5
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f9 56                 xor	r2, r5
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f9 36                 xor	r1, r5
 f0 37 22              ldsp16	r7, [sp+0x22]
 ad                    xor	r7, r5
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 ad                    xor	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 37 20              ldsp16	r7, [sp+0x20]
 ad                    xor	r7, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ae                    xor	r7, r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f9 5a                 xor	r2, r6
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f0 37 26              ldsp16	r7, [sp+0x26]
 ae                    xor	r7, r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 37 28              ldsp16	r7, [sp+0x28]
 ae                    xor	r7, r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 37 24              ldsp16	r7, [sp+0x24]
 ae                    xor	r7, r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 ae                    xor	r7, r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f9 1a                 xor	r0, r6
 f0 38 18              stsp16	[sp+0x18], r0
 f0 33 14              ldsp16	r3, [sp+0x14]
 f1 15                 mov	r2, r5
 f9 6a                 xor	r3, r2
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 5e                 xor	r2, r7
 ae                    xor	r7, r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ae                    xor	r7, r6
 13                    add	r4, r7
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f9 3a                 xor	r1, r6
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 a6                    xor	r5, r6
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f9 1a                 xor	r0, r6
 f4 29                 ldsp16	r5, [sp+0xa]
 a6                    xor	r5, r6
 f0 31 20              ldsp16	r1, [sp+0x20]
 f9 3a                 xor	r1, r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 ae                    xor	r7, r6
 f9 7a                 xor	r3, r6
 f9 5a                 xor	r2, r6
 f2 23                 add	r4, r3
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 13                    add	r4, r7
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 12                    add	r4, r6
 f2 21                 add	r4, r1
 f0 36 24              ldsp16	r6, [sp+0x24]
 12                    add	r4, r6
 11                    add	r4, r5
 f0 36 28              ldsp16	r6, [sp+0x28]
 12                    add	r4, r6
 f2 20                 add	r4, r0
 f0 35 26              ldsp16	r5, [sp+0x26]
 11                    add	r4, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 12                    add	r4, r6
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 11                    add	r4, r5
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 12                    add	r4, r6
 f2 22                 add	r4, r2
 f4 39                 ldsp16	r5, [sp+0xe]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
