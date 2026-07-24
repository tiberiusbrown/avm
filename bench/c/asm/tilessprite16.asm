
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite16.c
0000028e l     O .rodata	00000022 SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000077 avm_test_main
0000028c g     F .text	00000002 avm_halt
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
 d5 77                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 54 02 01           ldm16	r4, [0x102]
 f4 48                 stsp16	[sp+0x2], r4
 f0 54 00 01           ldm16	r4, [0x100]
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 8e 02           ldi16	r2, 0x28e
 f0 03 00              ldi8	r3, 0x0
 f2 39                 sub	r1, r1
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 24                 add	r5, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 6b                 mov32	q3, q1
 b0                    push16	r0
 f1 01                 mov	r0, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c8 10                 addi.s8	r4, 0x10
 b0                    push16	r0
 f1 01                 mov	r0, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c8 10                 addi.s8	r4, 0x10
 b0                    push16	r0
 f1 01                 mov	r0, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c8 10                 addi.s8	r4, 0x10
 b0                    push16	r0
 f1 01                 mov	r0, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c8 10                 addi.s8	r4, 0x10
 b0                    push16	r0
 f1 01                 mov	r0, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c8 10                 addi.s8	r4, 0x10
 b0                    push16	r0
 f1 01                 mov	r0, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c8 10                 addi.s8	r4, 0x10
 b0                    push16	r0
 f1 01                 mov	r0, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c8 10                 addi.s8	r4, 0x10
 b0                    push16	r0
 f1 01                 mov	r0, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 f0 08 10              addi.s8	r0, 0x10
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 b2                 brne8	avm_test_main+31
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+118
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
