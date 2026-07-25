
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite_cached.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite_cached.c
0000051b l     O .rodata	0000000a SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000303 avm_test_main
00000519 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
00000102 g     O .data	00000002 offy
00000100 g     O .data	00000002 offx

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
 e1 03 03              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 d7 01                 sys	debug_break
 c4 1b 05              ldi16	r4, 0x51b
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 50 02 01           ldm16	r0, [0x102]
 f0 53 00 01           ldm16	r3, [0x100]
 af                    xor	r7, r7
 f1 23                 mov	r4, r3
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f1 24                 mov	r5, r0
 0b                    mov	r6, r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 23                 sys	draw_overwrite
 f1 23                 mov	r4, r3
 c8 08                 addi.s8	r4, 0x8
 f0 3c 1a              stsp16	[sp+0x1a], r4
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 10                 addi.s8	r5, 0x10
 f0 3d 12              stsp16	[sp+0x12], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 18                 addi.s8	r5, 0x18
 f0 3d 16              stsp16	[sp+0x16], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 20                 addi.s8	r5, 0x20
 f0 3d 1c              stsp16	[sp+0x1c], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 28                 addi.s8	r5, 0x28
 01                    mov	r4, r5
 f1 0d                 mov	r1, r5
 f0 39 04              stsp16	[sp+0x4], r1
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 30                 addi.s8	r5, 0x30
 f4 71                 stsp16	[sp+0xc], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 38                 addi.s8	r5, 0x38
 f0 3d 10              stsp16	[sp+0x10], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 40                 addi.s8	r5, 0x40
 f4 69                 stsp16	[sp+0xa], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 48                 addi.s8	r5, 0x48
 f0 3d 18              stsp16	[sp+0x18], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 50                 addi.s8	r5, 0x50
 01                    mov	r4, r5
 f1 15                 mov	r2, r5
 f0 3a 02              stsp16	[sp+0x2], r2
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 58                 addi.s8	r5, 0x58
 f4 41                 stsp16	[sp+0x0], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 60                 addi.s8	r5, 0x60
 f4 79                 stsp16	[sp+0xe], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 68                 addi.s8	r5, 0x68
 f4 61                 stsp16	[sp+0x8], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 70                 addi.s8	r5, 0x70
 f0 3d 14              stsp16	[sp+0x14], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 f1 27                 mov	r5, r3
 c9 78                 addi.s8	r5, 0x78
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 23                 sys	draw_overwrite
 c9 08                 addi.s8	r5, 0x8
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 23                 sys	draw_overwrite
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 23                 sys	draw_overwrite
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 23                 sys	draw_overwrite
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 23                 sys	draw_overwrite
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 23                 sys	draw_overwrite
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f0 32 00              ldsp16	r2, [sp+0x0]
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 23                 sys	draw_overwrite
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 23                 sys	draw_overwrite
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 23                 sys	draw_overwrite
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 23                 sys	draw_overwrite
 f1 24                 mov	r5, r0
 c9 10                 addi.s8	r5, 0x10
 aa                    xor	r6, r6
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f0 37 12              ldsp16	r7, [sp+0x12]
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 23                 sys	draw_overwrite
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 23                 sys	draw_overwrite
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 23                 sys	draw_overwrite
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 31 10              ldsp16	r1, [sp+0x10]
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 23                 sys	draw_overwrite
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 23                 sys	draw_overwrite
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 23                 sys	draw_overwrite
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 23                 sys	draw_overwrite
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 23                 sys	draw_overwrite
 f1 24                 mov	r5, r0
 c9 18                 addi.s8	r5, 0x18
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 23                 sys	draw_overwrite
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f0 37 16              ldsp16	r7, [sp+0x16]
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 23                 sys	draw_overwrite
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 23                 sys	draw_overwrite
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 23                 sys	draw_overwrite
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 23                 sys	draw_overwrite
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f0 32 08              ldsp16	r2, [sp+0x8]
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 23                 sys	draw_overwrite
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 23                 sys	draw_overwrite
 f1 24                 mov	r5, r0
 c9 20                 addi.s8	r5, 0x20
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 23                 sys	draw_overwrite
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 23                 sys	draw_overwrite
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 23                 sys	draw_overwrite
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 23                 sys	draw_overwrite
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 31 18              ldsp16	r1, [sp+0x18]
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 23                 sys	draw_overwrite
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 23                 sys	draw_overwrite
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f0 32 14              ldsp16	r2, [sp+0x14]
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 23                 sys	draw_overwrite
 f1 24                 mov	r5, r0
 c9 28                 addi.s8	r5, 0x28
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 23                 sys	draw_overwrite
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 23                 sys	draw_overwrite
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 23                 sys	draw_overwrite
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f4 13                 ldsp16	r7, [sp+0x4]
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 23                 sys	draw_overwrite
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 23                 sys	draw_overwrite
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 23                 sys	draw_overwrite
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 23                 sys	draw_overwrite
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f0 32 06              ldsp16	r2, [sp+0x6]
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f1 24                 mov	r5, r0
 c9 30                 addi.s8	r5, 0x30
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 23                 sys	draw_overwrite
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 23                 sys	draw_overwrite
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 23                 sys	draw_overwrite
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 23                 sys	draw_overwrite
 03                    mov	r4, r7
 d7 23                 sys	draw_overwrite
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 23                 sys	draw_overwrite
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 23                 sys	draw_overwrite
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 23                 sys	draw_overwrite
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 31 00              ldsp16	r1, [sp+0x0]
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 23                 sys	draw_overwrite
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 23                 sys	draw_overwrite
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f1 24                 mov	r5, r0
 c9 38                 addi.s8	r5, 0x38
 af                    xor	r7, r7
 0b                    mov	r6, r7
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 23                 sys	draw_overwrite
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 23                 sys	draw_overwrite
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 23                 sys	draw_overwrite
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 23                 sys	draw_overwrite
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 23                 sys	draw_overwrite
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 23                 sys	draw_overwrite
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 23                 sys	draw_overwrite
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 23                 sys	draw_overwrite
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 23                 sys	draw_overwrite
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 23                 sys	draw_overwrite
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 23                 sys	draw_overwrite
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 d7 01                 sys	debug_break
 03                    mov	r4, r7
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
