
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilessprite16_cached.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilessprite16_cached.c
0000030d l     O .rodata	00000022 SPRITE
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000f5 avm_test_main
0000030b g     F .text	00000002 avm_halt
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
 e1 f5 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 d7 01                 sys	debug_break
 c4 0d 03              ldi16	r4, 0x30d
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 57 02 01           ldm16	r7, [0x102]
 f0 51 00 01           ldm16	r1, [0x100]
 f2 30                 sub	r0, r0
 f1 21                 mov	r4, r1
 f4 70                 stsp16	[sp+0xc], r4
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 f1 21                 mov	r4, r1
 c8 10                 addi.s8	r4, 0x10
 f4 50                 stsp16	[sp+0x4], r4
 d7 23                 sys	draw_overwrite
 f1 25                 mov	r5, r1
 c9 20                 addi.s8	r5, 0x20
 01                    mov	r4, r5
 f1 15                 mov	r2, r5
 f0 3a 02              stsp16	[sp+0x2], r2
 07                    mov	r5, r7
 d7 23                 sys	draw_overwrite
 f1 25                 mov	r5, r1
 c9 30                 addi.s8	r5, 0x30
 f4 61                 stsp16	[sp+0x8], r5
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 23                 sys	draw_overwrite
 f1 25                 mov	r5, r1
 c9 40                 addi.s8	r5, 0x40
 01                    mov	r4, r5
 f1 1d                 mov	r3, r5
 f0 3b 00              stsp16	[sp+0x0], r3
 07                    mov	r5, r7
 d7 23                 sys	draw_overwrite
 f1 25                 mov	r5, r1
 c9 50                 addi.s8	r5, 0x50
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 23                 sys	draw_overwrite
 f1 25                 mov	r5, r1
 c9 60                 addi.s8	r5, 0x60
 f4 69                 stsp16	[sp+0xa], r5
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 23                 sys	draw_overwrite
 f1 25                 mov	r5, r1
 c9 70                 addi.s8	r5, 0x70
 f4 71                 stsp16	[sp+0xc], r5
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 23                 sys	draw_overwrite
 c9 10                 addi.s8	r5, 0x10
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 20                 mov	r4, r0
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f0 32 08              ldsp16	r2, [sp+0x8]
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f0 33 06              ldsp16	r3, [sp+0x6]
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 23                 sys	draw_overwrite
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 07                    mov	r5, r7
 c9 20                 addi.s8	r5, 0x20
 aa                    xor	r6, r6
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f1 20                 mov	r4, r0
 d7 23                 sys	draw_overwrite
 f0 30 02              ldsp16	r0, [sp+0x2]
 f1 20                 mov	r4, r0
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f0 32 00              ldsp16	r2, [sp+0x0]
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 07                    mov	r5, r7
 c9 30                 addi.s8	r5, 0x30
 af                    xor	r7, r7
 0b                    mov	r6, r7
 f1 21                 mov	r4, r1
 d7 23                 sys	draw_overwrite
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 23                 sys	draw_overwrite
 f1 20                 mov	r4, r0
 d7 23                 sys	draw_overwrite
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 23                 sys	draw_overwrite
 f1 22                 mov	r4, r2
 d7 23                 sys	draw_overwrite
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 23                 sys	draw_overwrite
 f1 23                 mov	r4, r3
 d7 23                 sys	draw_overwrite
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 23                 sys	draw_overwrite
 d7 01                 sys	debug_break
 03                    mov	r4, r7
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
