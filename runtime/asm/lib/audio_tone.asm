
audio_tone.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 audio_tone.c
00000000 l    d  .text.avm_audio_tone_pulse_ticks	00000000 .text.avm_audio_tone_pulse_ticks
00000000 l     O .rodata.note_increments	00000090 note_increments
00000000 l    d  .text.avm_audio_tone_triangle_ticks	00000000 .text.avm_audio_tone_triangle_ticks
00000000 l    d  .text.avm_audio_tone_ticks	00000000 .text.avm_audio_tone_ticks
00000000 l    d  .text.avm_audio_tone_pulse	00000000 .text.avm_audio_tone_pulse
00000000 l    d  .text.avm_audio_tone_triangle	00000000 .text.avm_audio_tone_triangle
00000000 l    d  .text.avm_audio_tone	00000000 .text.avm_audio_tone
00000000 l    d  .rodata.note_increments	00000000 .rodata.note_increments
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.avm_audio_tone_pulse_ticks	0000003c avm_audio_tone_pulse_ticks
00000000         *UND*	00000000 __avm_audio_tone_raw
00000000 g     F .text.avm_audio_tone_triangle_ticks	0000003c avm_audio_tone_triangle_ticks
00000000 g     F .text.avm_audio_tone_ticks	00000035 avm_audio_tone_ticks
00000000 g     F .text.avm_audio_tone_pulse	00000046 avm_audio_tone_pulse
00000000 g     F .text.avm_audio_tone_triangle	00000049 avm_audio_tone_triangle
00000000 g     F .text.avm_audio_tone	0000003f avm_audio_tone

Disassembly of section .text.avm_audio_tone_pulse_ticks:

<avm_audio_tone_pulse_ticks>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 05                 mov	r0, r5
 c8 e8                 addi.s8	r4, -0x18
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 48                 cmpi.s8	r5, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone_pulse_ticks
		R_AVM_FAR24	.text.avm_audio_tone_pulse_ticks+0x29
<L0>:
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 50                 and	r2, r4
 f7 65                 add32	q1, q1
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	.rodata.note_increments
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	.rodata.note_increments
 f7 69                 add32	q2, q1
 f0 62 a8              ldp16	r5, [q2]
 e2 00 00 00           jmpf	avm_audio_tone_pulse_ticks
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone_pulse_ticks+0x2a
 a5                    xor	r5, r5
 c0 1f                 ldi8	r4, 0x1f
 f9 10                 and	r0, r4
 fa 58                 lsl16i	r6, 0x8
 c0 01                 ldi8	r4, 0x1
 92                    or	r4, r6
 f1 28                 mov	r6, r0
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 e2 00 00 00           jmpf	avm_audio_tone_pulse_ticks
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw

Disassembly of section .text.avm_audio_tone_triangle_ticks:

<avm_audio_tone_triangle_ticks>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 06                 mov	r0, r6
 c8 e8                 addi.s8	r4, -0x18
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 48                 cmpi.s8	r6, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone_triangle_ticks
		R_AVM_FAR24	.text.avm_audio_tone_triangle_ticks+0x29
<L0>:
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 50                 and	r2, r4
 f7 65                 add32	q1, q1
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata.note_increments
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata.note_increments
 f7 6d                 add32	q3, q1
 f0 62 ec              ldp16	r7, [q3]
 e2 00 00 00           jmpf	avm_audio_tone_triangle_ticks
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone_triangle_ticks+0x2a
 af                    xor	r7, r7
 c0 1f                 ldi8	r4, 0x1f
 84                    and	r5, r4
 c2 20                 ldi8	r6, 0x20
 99                    or	r6, r5
 c0 01                 ldi8	r4, 0x1
 07                    mov	r5, r7
 f1 2c                 mov	r7, r0
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 e2 00 00 00           jmpf	avm_audio_tone_triangle_ticks
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw

Disassembly of section .text.avm_audio_tone_ticks:

<avm_audio_tone_ticks>:
 b1                    push16	r1
 b0                    push16	r0
 0e                    mov	r7, r6
 09                    mov	r6, r5
 c8 e8                 addi.s8	r4, -0x18
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 48                 cmpi.s8	r5, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone_ticks
		R_AVM_FAR24	.text.avm_audio_tone_ticks+0x28
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
 e2 00 00 00           jmpf	avm_audio_tone_ticks
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone_ticks+0x29
 a5                    xor	r5, r5
 c0 1f                 ldi8	r4, 0x1f
 88                    and	r6, r4
 c4 01 80              ldi16	r4, 0x8001
 b8                    pop16	r0
 b9                    pop16	r1
 e2 00 00 00           jmpf	avm_audio_tone_ticks
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw

Disassembly of section .text.avm_audio_tone_pulse:

<avm_audio_tone_pulse>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 05                 mov	r0, r5
 c8 e8                 addi.s8	r4, -0x18
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 48                 cmpi.s8	r5, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone_pulse
		R_AVM_FAR24	.text.avm_audio_tone_pulse+0x29
<L0>:
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 50                 and	r2, r4
 f7 65                 add32	q1, q1
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	.rodata.note_increments
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	.rodata.note_increments
 f7 69                 add32	q2, q1
 f0 62 a8              ldp16	r5, [q2]
 e2 00 00 00           jmpf	avm_audio_tone_pulse
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone_pulse+0x2a
 a5                    xor	r5, r5
 c0 1f                 ldi8	r4, 0x1f
 f9 10                 and	r0, r4
 fa 58                 lsl16i	r6, 0x8
 c0 01                 ldi8	r4, 0x1
 92                    or	r4, r6
 c2 03                 ldi8	r6, 0x3
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 f8 0e                 cset.ne	r6
 fa a2                 lsr16i	r7, 0x2
 1e                    add	r7, r6
 f1 28                 mov	r6, r0
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 e2 00 00 00           jmpf	avm_audio_tone_pulse
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw

Disassembly of section .text.avm_audio_tone_triangle:

<avm_audio_tone_triangle>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 0e                    mov	r7, r6
 c8 e8                 addi.s8	r4, -0x18
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 48                 cmpi.s8	r6, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone_triangle
		R_AVM_FAR24	.text.avm_audio_tone_triangle+0x2b
<L0>:
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 50                 and	r2, r4
 f7 65                 add32	q1, q1
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.rodata.note_increments
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.rodata.note_increments
 f7 61                 add32	q0, q1
 f0 62 00              ldp16	r0, [q0]
 e2 00 00 00           jmpf	avm_audio_tone_triangle
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone_triangle+0x2d
 f2 30                 sub	r0, r0
 c0 1f                 ldi8	r4, 0x1f
 84                    and	r5, r4
 c2 20                 ldi8	r6, 0x20
 99                    or	r6, r5
 c0 03                 ldi8	r4, 0x3
 83                    and	r4, r7
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 fa a2                 lsr16i	r7, 0x2
 1c                    add	r7, r4
 c0 01                 ldi8	r4, 0x1
 f1 24                 mov	r5, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e2 00 00 00           jmpf	avm_audio_tone_triangle
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw

Disassembly of section .text.avm_audio_tone:

<avm_audio_tone>:
 b1                    push16	r1
 b0                    push16	r0
 0e                    mov	r7, r6
 09                    mov	r6, r5
 c8 e8                 addi.s8	r4, -0x18
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 48                 cmpi.s8	r5, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone
		R_AVM_FAR24	.text.avm_audio_tone+0x28
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
		R_AVM_FAR24	.text.avm_audio_tone+0x29
 a5                    xor	r5, r5
 c0 1f                 ldi8	r4, 0x1f
 88                    and	r6, r4
 c0 03                 ldi8	r4, 0x3
 83                    and	r4, r7
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 fa a2                 lsr16i	r7, 0x2
 1c                    add	r7, r4
 c4 01 80              ldi16	r4, 0x8001
 b8                    pop16	r0
 b9                    pop16	r1
 e2 00 00 00           jmpf	avm_audio_tone
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_raw
