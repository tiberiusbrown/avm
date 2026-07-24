
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite16.c
00000266 l     O .rodata	00000022 SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000004f avm_test_main
00000264 g     F .text	00000002 avm_halt
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
 d5 4f                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 51 02 01           ldm16	r1, [0x102]
 f0 54 00 01           ldm16	r4, [0x100]
 f4 40                 stsp16	[sp+0x0], r4
 c6 66 02              ldi16	r6, 0x266
 c3 00                 ldi8	r7, 0x0
 f1 02                 mov	r0, r2
 f1 25                 mov	r5, r1
 f2 26                 add	r5, r2
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 1e                 sys	draw_sprite_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 1e                 sys	draw_sprite_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 1e                 sys	draw_sprite_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 1e                 sys	draw_sprite_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 1e                 sys	draw_sprite_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 1e                 sys	draw_sprite_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 1e                 sys	draw_sprite_overwrite
 c8 10                 addi.s8	r4, 0x10
 d7 1e                 sys	draw_sprite_overwrite
 f0 0a 10              addi.s8	r2, 0x10
 f0 0e 40              cmpi.s8	r2, 0x40
 d1 d4                 brne8	avm_test_main+26
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
