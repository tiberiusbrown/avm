
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite.c
00000282 l     O .rodata	0000000a SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000006b avm_test_main
00000280 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
00000102 g     O .data	00000002 offy
00000100 g     O .data	00000002 offx

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 6b                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 51 02 01           ldm16	r1, [0x102]
 f0 52 00 01           ldm16	r2, [0x100]
 c6 82 02              ldi16	r6, 0x282
 c3 00                 ldi8	r7, 0x0
 f1 18                 mov	r3, r0
 f1 25                 mov	r5, r1
 f2 27                 add	r5, r3
 f1 22                 mov	r4, r2
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c8 08                 addi.s8	r4, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 f0 0b 08              addi.s8	r3, 0x8
 f0 0f 40              cmpi.s8	r3, 0x40
 d1 b4                 brne8	avm_test_main+23
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
