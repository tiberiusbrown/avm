
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite16_cached.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite16_cached.c
000003cf l     O .rodata	00000022 SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000001b7 avm_test_main
000003cd g     F .text	00000002 avm_halt
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
 e1 b7 01              call16	avm_halt

<avm_test_main>:
 d7 01                 sys	debug_break
 c4 cf 03              ldi16	r4, 0x3cf
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 55 02 01           ldm16	r5, [0x102]
 f0 54 00 01           ldm16	r4, [0x100]
 af                    xor	r7, r7
 0b                    mov	r6, r7
 d7 23                 sys	draw_overwrite
 f0 54 00 01           ldm16	r4, [0x100]
 c8 10                 addi.s8	r4, 0x10
 f0 55 02 01           ldm16	r5, [0x102]
 d7 23                 sys	draw_overwrite
 f0 54 00 01           ldm16	r4, [0x100]
 c8 20                 addi.s8	r4, 0x20
 f0 55 02 01           ldm16	r5, [0x102]
 d7 23                 sys	draw_overwrite
 f0 54 00 01           ldm16	r4, [0x100]
 c8 30                 addi.s8	r4, 0x30
 f0 55 02 01           ldm16	r5, [0x102]
 d7 23                 sys	draw_overwrite
 f0 54 00 01           ldm16	r4, [0x100]
 c8 40                 addi.s8	r4, 0x40
 f0 55 02 01           ldm16	r5, [0x102]
 d7 23                 sys	draw_overwrite
 f0 54 00 01           ldm16	r4, [0x100]
 c8 50                 addi.s8	r4, 0x50
 f0 55 02 01           ldm16	r5, [0x102]
 d7 23                 sys	draw_overwrite
 f0 54 00 01           ldm16	r4, [0x100]
 c8 60                 addi.s8	r4, 0x60
 f0 55 02 01           ldm16	r5, [0x102]
 d7 23                 sys	draw_overwrite
 f0 54 00 01           ldm16	r4, [0x100]
 c8 70                 addi.s8	r4, 0x70
 f0 55 02 01           ldm16	r5, [0x102]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 10                 addi.s8	r5, 0x10
 f0 54 00 01           ldm16	r4, [0x100]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 10                 addi.s8	r5, 0x10
 f0 54 00 01           ldm16	r4, [0x100]
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 10                 addi.s8	r5, 0x10
 f0 54 00 01           ldm16	r4, [0x100]
 c8 20                 addi.s8	r4, 0x20
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 10                 addi.s8	r5, 0x10
 f0 54 00 01           ldm16	r4, [0x100]
 c8 30                 addi.s8	r4, 0x30
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 10                 addi.s8	r5, 0x10
 f0 54 00 01           ldm16	r4, [0x100]
 c8 40                 addi.s8	r4, 0x40
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 10                 addi.s8	r5, 0x10
 f0 54 00 01           ldm16	r4, [0x100]
 c8 50                 addi.s8	r4, 0x50
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 10                 addi.s8	r5, 0x10
 f0 54 00 01           ldm16	r4, [0x100]
 c8 60                 addi.s8	r4, 0x60
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 10                 addi.s8	r5, 0x10
 f0 54 00 01           ldm16	r4, [0x100]
 c8 70                 addi.s8	r4, 0x70
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 20                 addi.s8	r5, 0x20
 f0 54 00 01           ldm16	r4, [0x100]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 20                 addi.s8	r5, 0x20
 f0 54 00 01           ldm16	r4, [0x100]
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 20                 addi.s8	r5, 0x20
 f0 54 00 01           ldm16	r4, [0x100]
 c8 20                 addi.s8	r4, 0x20
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 20                 addi.s8	r5, 0x20
 f0 54 00 01           ldm16	r4, [0x100]
 c8 30                 addi.s8	r4, 0x30
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 20                 addi.s8	r5, 0x20
 f0 54 00 01           ldm16	r4, [0x100]
 c8 40                 addi.s8	r4, 0x40
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 20                 addi.s8	r5, 0x20
 f0 54 00 01           ldm16	r4, [0x100]
 c8 50                 addi.s8	r4, 0x50
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 20                 addi.s8	r5, 0x20
 f0 54 00 01           ldm16	r4, [0x100]
 c8 60                 addi.s8	r4, 0x60
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 20                 addi.s8	r5, 0x20
 f0 54 00 01           ldm16	r4, [0x100]
 c8 70                 addi.s8	r4, 0x70
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 30                 addi.s8	r5, 0x30
 f0 54 00 01           ldm16	r4, [0x100]
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 30                 addi.s8	r5, 0x30
 f0 54 00 01           ldm16	r4, [0x100]
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 30                 addi.s8	r5, 0x30
 f0 54 00 01           ldm16	r4, [0x100]
 c8 20                 addi.s8	r4, 0x20
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 30                 addi.s8	r5, 0x30
 f0 54 00 01           ldm16	r4, [0x100]
 c8 30                 addi.s8	r4, 0x30
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 30                 addi.s8	r5, 0x30
 f0 54 00 01           ldm16	r4, [0x100]
 c8 40                 addi.s8	r4, 0x40
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 30                 addi.s8	r5, 0x30
 f0 54 00 01           ldm16	r4, [0x100]
 c8 50                 addi.s8	r4, 0x50
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 30                 addi.s8	r5, 0x30
 f0 54 00 01           ldm16	r4, [0x100]
 c8 60                 addi.s8	r4, 0x60
 d7 23                 sys	draw_overwrite
 f0 55 02 01           ldm16	r5, [0x102]
 c9 30                 addi.s8	r5, 0x30
 f0 54 00 01           ldm16	r4, [0x100]
 c8 70                 addi.s8	r4, 0x70
 d7 23                 sys	draw_overwrite
 d7 01                 sys	debug_break
 03                    mov	r4, r7
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
