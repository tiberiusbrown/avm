
audio_tone.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 audio_tone.c
00000000 l    d  .text.avm_audio_tone_pulse	00000000 .text.avm_audio_tone_pulse
00000000 l     O .rodata.note_increments	00000090 note_increments
00000000 l    d  .text.avm_audio_tone_triangle	00000000 .text.avm_audio_tone_triangle
00000000 l    d  .text.avm_audio_tone	00000000 .text.avm_audio_tone
00000000 l    d  .rodata.note_increments	00000000 .rodata.note_increments
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.avm_audio_tone_pulse	00000037 avm_audio_tone_pulse
00000000         *UND*	00000000 __avm_audio_tone_raw
00000000 g     F .text.avm_audio_tone_triangle	00000036 avm_audio_tone_triangle
00000000 g     F .text.avm_audio_tone	00000034 avm_audio_tone

Disassembly of section .text.avm_audio_tone_pulse:

<avm_audio_tone_pulse>:
 b1                    push16	r1
 b0                    push16	r0
 0d                    mov	r7, r5
 c8 e8                 addi.s8	r4, -0x18
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 48                 cmpi.s8	r5, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone_pulse
		R_AVM_FAR24	.text.avm_audio_tone_pulse+0x27
<L0>:
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 10                 and	r0, r4
 f7 60                 add32	q0, q0
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	.rodata.note_increments
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	.rodata.note_increments
 f7 68                 add32	q2, q0
 f0 62 a8              ldp16	r5, [q2]
 e2 00 00 00           jmpf	avm_audio_tone_pulse
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone_pulse+0x28
 a5                    xor	r5, r5
 c0 1f                 ldi8	r4, 0x1f
 8c                    and	r7, r4
 fa 58                 lsl16i	r6, 0x8
 c0 01                 ldi8	r4, 0x1
 92                    or	r4, r6
 0b                    mov	r6, r7
 b8                    pop16	r0
 b9                    pop16	r1
 e2 00 00 00           jmpf	avm_audio_tone_pulse
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw

Disassembly of section .text.avm_audio_tone_triangle:

<avm_audio_tone_triangle>:
 b1                    push16	r1
 b0                    push16	r0
 c8 e8                 addi.s8	r4, -0x18
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 48                 cmpi.s8	r6, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone_triangle
		R_AVM_FAR24	.text.avm_audio_tone_triangle+0x26
<L0>:
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 10                 and	r0, r4
 f7 60                 add32	q0, q0
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata.note_increments
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata.note_increments
 f7 6c                 add32	q3, q0
 f0 62 ec              ldp16	r7, [q3]
 e2 00 00 00           jmpf	avm_audio_tone_triangle
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone_triangle+0x27
 af                    xor	r7, r7
 c0 1f                 ldi8	r4, 0x1f
 84                    and	r5, r4
 c2 20                 ldi8	r6, 0x20
 99                    or	r6, r5
 c0 01                 ldi8	r4, 0x1
 07                    mov	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 e2 00 00 00           jmpf	avm_audio_tone_triangle
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw

Disassembly of section .text.avm_audio_tone:

<avm_audio_tone>:
 b1                    push16	r1
 b0                    push16	r0
 09                    mov	r6, r5
 c8 e8                 addi.s8	r4, -0x18
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 48                 cmpi.s8	r5, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone
		R_AVM_FAR24	.text.avm_audio_tone+0x27
<L0>:
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 10                 and	r0, r4
 f7 60                 add32	q0, q0
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	.rodata.note_increments
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	.rodata.note_increments
 f7 68                 add32	q2, q0
 f0 62 a8              ldp16	r5, [q2]
 e2 00 00 00           jmpf	avm_audio_tone
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone+0x28
 a5                    xor	r5, r5
 c0 1f                 ldi8	r4, 0x1f
 88                    and	r6, r4
 c4 01 80              ldi16	r4, 0x8001
 b8                    pop16	r0
 b9                    pop16	r1
 e2 00 00 00           jmpf	avm_audio_tone
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw
