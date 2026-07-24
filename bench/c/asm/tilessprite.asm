
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite.c
00000283 l     O .rodata	0000000a SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000006c avm_test_main
00000281 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
00000102 g     O .data	00000002 offy
00000100 g     O .data	00000002 offx

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 6c                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 f0 50 02 01           ldm16	r0, [0x102]
 f0 54 00 01           ldm16	r4, [0x100]
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 83 02           ldi16	r2, 0x283
 f0 03 00              ldi8	r3, 0x0
 0b                    mov	r6, r7
 f1 24                 mov	r5, r0
 17                    add	r5, r7
 f4 00                 ldsp16	r4, [sp+0x0]
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
 cb 08                 addi.s8	r7, 0x8
 cf 40                 cmpi.s8	r7, 0x40
 d1 b7                 brne8	avm_test_main+26
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
