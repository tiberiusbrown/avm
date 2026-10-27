
avm.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 avm.c
00000000 l    d  .text.avm_set_frame_rate	00000000 .text.avm_set_frame_rate
00000000 l    d  .text.avm_set_frame_duration	00000000 .text.avm_set_frame_duration
00000000 l    d  .text.avm_next_frame	00000000 .text.avm_next_frame
00000000 l    d  .text.avm_poll_buttons	00000000 .text.avm_poll_buttons
00000000 l    d  .text.avm_just_pressed	00000000 .text.avm_just_pressed
00000000 l    d  .text.avm_just_released	00000000 .text.avm_just_released
00000000 l    d  .text.avm_init_random_seed	00000000 .text.avm_init_random_seed
00000000 l     O .data.random_seed	00000002 random_seed
00000000 l    d  .text.avm_set_random_seed	00000000 .text.avm_set_random_seed
00000000 l    d  .text.avm_random	00000000 .text.avm_random
00000000 l    d  .data.random_seed	00000000 .data.random_seed
00000000 l    d  .data..L_MergedGlobals	00000000 .data..L_MergedGlobals
00000000 l     O .data..L_MergedGlobals	00000001 frame_duration_ms
00000001 l     O .data..L_MergedGlobals	00000001 just_rendered
00000002 l     O .data..L_MergedGlobals	00000001 frame_start
00000003 l     O .data..L_MergedGlobals	00000001 buttons_state_curr
00000004 l     O .data..L_MergedGlobals	00000001 buttons_state_prev
00000000 g     F .text.avm_set_frame_rate	0000001c avm_set_frame_rate
00000000 g     F .text.avm_set_frame_duration	00000011 avm_set_frame_duration
00000000 g     F .text.avm_next_frame	00000041 avm_next_frame
00000000 g     F .text.avm_poll_buttons	0000000f avm_poll_buttons
00000000 g     F .text.avm_just_pressed	00000014 avm_just_pressed
00000000 g     F .text.avm_just_released	00000014 avm_just_released
00000000 g     F .text.avm_init_random_seed	0000000e avm_init_random_seed
00000000 g     F .text.avm_set_random_seed	0000000c avm_set_random_seed
00000000 g     F .text.avm_random	00000015 avm_random

Disassembly of section .text.avm_set_frame_rate:

<avm_set_frame_rate>:
 c1 01                 ldi8	r5, 0x1
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 c1 04                 ldi8	r5, 0x4
 cc 05                 cmpi.s8	r4, 0x5
 fc 6c                 cmov.uge	r5, r4
 c4 e8 03              ldi16	r4, 0x3e8
 ec 25                 udiv16	r4, r5
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals
 d7 02                 sys	millis
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 ef                    ret

Disassembly of section .text.avm_set_frame_duration:

<avm_set_frame_duration>:
 c1 01                 ldi8	r5, 0x1
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals
 d7 02                 sys	millis
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 ef                    ret

Disassembly of section .text.avm_next_frame:

<avm_next_frame>:
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_next_frame
		R_AVM_FAR24	.text.avm_next_frame+0x11
<L0>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_next_frame
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_next_frame+0x3c
 d7 02                 sys	millis
 f0 46 00 00           ldm8u	r6, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 04                    mov	r5, r4
 26                    sub	r5, r6
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f0 46 00 00           ldm8u	r6, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_next_frame
		R_AVM_FAR24	.text.avm_next_frame+0x36
<L1>:
 a0                    xor	r4, r4
 f4 ad                 inc16	r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_next_frame
		R_AVM_FAR24	.text.avm_next_frame+0x40
<L2>:
 d7 2a                 sys	idle
 ef                    ret
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals+0x2
 c0 01                 ldi8	r4, 0x1
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 ef                    ret

Disassembly of section .text.avm_poll_buttons:

<avm_poll_buttons>:
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x3
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals+0x4
 d7 29                 sys	buttons
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals+0x3
 ef                    ret

Disassembly of section .text.avm_just_pressed:

<avm_just_pressed>:
 f0 45 00 00           ldm8u	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x3
 84                    and	r5, r4
 f0 46 00 00           ldm8u	r6, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x4
 88                    and	r6, r4
 f4 a6                 tst8	r6
 f8 06                 cset.eq	r6
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 82                    and	r4, r6
 ef                    ret

Disassembly of section .text.avm_just_released:

<avm_just_released>:
 f0 45 00 00           ldm8u	r5, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x3
 84                    and	r5, r4
 f0 46 00 00           ldm8u	r6, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals+0x4
 88                    and	r6, r4
 f4 a6                 tst8	r6
 f8 0e                 cset.ne	r6
 f4 a5                 tst8	r5
 f8 04                 cset.eq	r4
 82                    and	r4, r6
 ef                    ret

Disassembly of section .text.avm_init_random_seed:

<avm_init_random_seed>:
 d7 2b                 sys	generate_random_seed
 c5 be ba              ldi16	r5, 0xbabe
 f6 2c                 tst16	r4
 fb 25                 cmov.eq	r4, r5
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.random_seed
 ef                    ret

Disassembly of section .text.avm_set_random_seed:

<avm_set_random_seed>:
 c5 be ba              ldi16	r5, 0xbabe
 f6 2c                 tst16	r4
 fb 25                 cmov.eq	r4, r5
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.random_seed
 ef                    ret

Disassembly of section .text.avm_random:

<avm_random>:
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.random_seed
 04                    mov	r5, r4
 fa 47                 lsl16i	r5, 0x7
 a4                    xor	r5, r4
 09                    mov	r6, r5
 fa 99                 lsr16i	r6, 0x9
 a9                    xor	r6, r5
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 a2                    xor	r4, r6
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.random_seed
 ef                    ret
