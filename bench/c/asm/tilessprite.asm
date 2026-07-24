
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite.c
0000034d l     O .rodata	0000000a SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000135 avm_test_main
0000034b g     F .text	00000002 avm_halt
00000102 g     O .data	00000002 offy
00000100 g     O .data	00000002 offx

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 35 01              call16	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+3
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f1 10                 mov	r2, r0
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 c6 4d 03              ldi16	r6, 0x34d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 54 00 01           ldm16	r4, [0x100]
 f4 40                 stsp16	[sp+0x0], r4
 f1 25                 mov	r5, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 08                 addi.s8	r5, 0x8
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 10                 addi.s8	r5, 0x10
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 18                 addi.s8	r5, 0x18
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 20                 addi.s8	r5, 0x20
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 28                 addi.s8	r5, 0x28
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 30                 addi.s8	r5, 0x30
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 38                 addi.s8	r5, 0x38
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 40                 addi.s8	r5, 0x40
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 48                 addi.s8	r5, 0x48
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 50                 addi.s8	r5, 0x50
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 60                 addi.s8	r5, 0x60
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 68                 addi.s8	r5, 0x68
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 70                 addi.s8	r5, 0x70
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 51 02 01           ldm16	r1, [0x102]
 f2 0a                 add	r1, r2
 f0 55 00 01           ldm16	r5, [0x100]
 c9 78                 addi.s8	r5, 0x78
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 0a 08              addi.s8	r2, 0x8
 f0 0e 40              cmpi.s8	r2, 0x40
 db df fe              brne16	avm_test_main+11
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	avm_test_main+307
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
