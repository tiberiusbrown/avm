
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite16_cached.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite16_cached.c
000002b3 l     O .rodata	00000022 SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000009b avm_test_main
000002b1 g     F .text	00000002 avm_halt
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
 e1 9b 00              call16	avm_halt

<avm_test_main>:
 d7 01                 sys	debug_break
 c4 b3 02              ldi16	r4, 0x2b3
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 55 02 01           ldm16	r5, [0x102]
 f0 54 00 01           ldm16	r4, [0x100]
 af                    xor	r7, r7
 0b                    mov	r6, r7
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 90                 addi.s8	r4, -0x70
 c9 10                 addi.s8	r5, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 90                 addi.s8	r4, -0x70
 c9 10                 addi.s8	r5, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 90                 addi.s8	r4, -0x70
 c9 10                 addi.s8	r5, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 23                 sys	draw_overwrite
 d7 01                 sys	debug_break
 03                    mov	r4, r7
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
