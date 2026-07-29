
C:/Users/Brown/Documents/GitHub/avm/build/projects/ardurogue2/ardurogue2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0.c
00000000 l    df *ABS*	00000000 main.cpp
00000000 l    df *ABS*	00000000 avm.c
00000105 l     O .data	00000001 just_rendered
00000104 l     O .data	00000001 frame_duration_ms
00000106 l     O .data	00000001 frame_start
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000005 _start
00000205 g     F .text	00000072 main
000002c0 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
0000028d g     F .text	00000033 avm_next_frame
00000102 g     O .data	00000002 y
00000100 g     O .data	00000002 x
00000277 g     F .text	00000016 avm_set_frame_rate

Disassembly of section .text:

<_start>:
 d5 03                 call8	main
 e1 bb 00              call16	avm_halt

<main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c0 32                 ldi8	r4, 0x32
 d5 68                 call8	avm_set_frame_rate
 f0 00 01              ldi8	r0, 0x1
 f0 01 80              ldi8	r1, 0x80
 f0 02 10              ldi8	r2, 0x10
 f0 03 60              ldi8	r3, 0x60
 d4 12                 jmp8	main+42
 f0 55 02 01           ldm16	r5, [0x102]
 f4 41                 stsp16	[sp+0x0], r5
 03                    mov	r4, r7
 c2 14                 ldi8	r6, 0x14
 0e                    mov	r7, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 1d                 sys	display
 d5 5c                 call8	avm_next_frame
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d0 f8                 breq8	main+42
 d7 29                 sys	buttons
 04                    mov	r5, r4
 f9 a4                 and	r5, r1
 f4 a5                 tst8	r5
 d0 0a                 breq8	main+69
 f0 55 02 01           ldm16	r5, [0x102]
 f4 b5                 dec16	r5
 f0 5d 02 01           stm16	[0x102], r5
 04                    mov	r5, r4
 f9 a8                 and	r5, r2
 f4 a5                 tst8	r5
 d0 0a                 breq8	main+86
 f0 55 02 01           ldm16	r5, [0x102]
 f4 ad                 inc16	r5
 f0 5d 02 01           stm16	[0x102], r5
 04                    mov	r5, r4
 fa 86                 lsr16i	r5, 0x6
 f9 a0                 and	r5, r0
 08                    mov	r6, r4
 fa 5a                 lsl16i	r6, 0xa
 fa df                 asr16i	r6, 0xf
 19                    add	r6, r5
 f0 57 00 01           ldm16	r7, [0x100]
 1e                    add	r7, r6
 f9 8c                 and	r4, r3
 f4 a4                 tst8	r4
 d0 ac                 breq8	main+24
 f0 5f 00 01           stm16	[0x100], r7
 d4 a6                 jmp8	main+24

<avm_set_frame_rate>:
 c1 01                 ldi8	r5, 0x1
 f0 4d 05 01           stm8	[0x105], r5
 c5 e8 03              ldi16	r5, 0x3e8
 ec 2c                 udiv16	r5, r4
 f0 4d 04 01           stm8	[0x104], r5
 d7 02                 sys	millis
 f0 4c 06 01           stm8	[0x106], r4
 ef                    ret

<avm_next_frame>:
 f0 44 05 01           ldm8u	r4, [0x105]
 cc 01                 cmpi.s8	r4, 0x1
 d1 03                 brne8	avm_next_frame+11
 a0                    xor	r4, r4
 d4 23                 jmp8	avm_next_frame+46
 d7 02                 sys	millis
 f0 46 06 01           ldm8u	r6, [0x106]
 04                    mov	r5, r4
 26                    sub	r5, r6
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f0 46 04 01           ldm8u	r6, [0x104]
 3e                    cmp	r7, r6
 d8 0b                 bruge8	avm_next_frame+40
 a0                    xor	r4, r4
 f4 ad                 inc16	r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 d8 0d                 bruge8	avm_next_frame+50
 d7 2a                 sys	idle
 ef                    ret
 f0 4c 06 01           stm8	[0x106], r4
 c0 01                 ldi8	r4, 0x1
 f0 4c 05 01           stm8	[0x105], r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
