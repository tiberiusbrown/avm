
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite_cached.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite_cached.c
00000356 l     O .rodata	0000000a SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000013e avm_test_main
00000354 g     F .text	00000002 avm_halt
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
 e1 3e 01              call16	avm_halt

<avm_test_main>:
 d6 de                 adjsp	-0x22
 d7 01                 sys	debug_break
 c4 56 03              ldi16	r4, 0x356
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 af                    xor	r7, r7
 0b                    mov	r6, r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 7a                 stsp16	[sp+0xe], r6
 f4 72                 stsp16	[sp+0xc], r6
 f4 6a                 stsp16	[sp+0xa], r6
 f4 62                 stsp16	[sp+0x8], r6
 f4 5a                 stsp16	[sp+0x6], r6
 f4 52                 stsp16	[sp+0x4], r6
 f4 4a                 stsp16	[sp+0x2], r6
 f4 42                 stsp16	[sp+0x0], r6
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 08                 addi.s8	r4, 0x8
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 10                 addi.s8	r4, 0x10
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 18                 addi.s8	r4, 0x18
 f0 36 18              ldsp16	r6, [sp+0x18]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 20                 addi.s8	r4, 0x20
 f0 36 16              ldsp16	r6, [sp+0x16]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 28                 addi.s8	r4, 0x28
 f0 36 14              ldsp16	r6, [sp+0x14]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 30                 addi.s8	r4, 0x30
 f0 36 12              ldsp16	r6, [sp+0x12]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 38                 addi.s8	r4, 0x38
 f0 36 10              ldsp16	r6, [sp+0x10]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 40                 addi.s8	r4, 0x40
 f4 3a                 ldsp16	r6, [sp+0xe]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 48                 addi.s8	r4, 0x48
 f4 32                 ldsp16	r6, [sp+0xc]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 50                 addi.s8	r4, 0x50
 f4 2a                 ldsp16	r6, [sp+0xa]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 58                 addi.s8	r4, 0x58
 f4 22                 ldsp16	r6, [sp+0x8]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 60                 addi.s8	r4, 0x60
 f4 1a                 ldsp16	r6, [sp+0x6]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 68                 addi.s8	r4, 0x68
 f4 12                 ldsp16	r6, [sp+0x4]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 70                 addi.s8	r4, 0x70
 f4 0a                 ldsp16	r6, [sp+0x2]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 17                    add	r5, r7
 f0 54 00 01           ldm16	r4, [0x100]
 c8 78                 addi.s8	r4, 0x78
 f4 02                 ldsp16	r6, [sp+0x0]
 d7 23                 sys	draw_overwrite
 cb 08                 addi.s8	r7, 0x8
 cf 40                 cmpi.s8	r7, 0x40
 db fd fe              brne16	avm_test_main+53
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 22                 adjsp	0x22
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
