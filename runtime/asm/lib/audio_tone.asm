
audio_tone.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 audio_tone.c
00000000 l    d  .text.avm_audio_tone	00000000 .text.avm_audio_tone
00000000 l     O .rodata.note_increments	00000090 note_increments
00000000 l    d  .rodata.note_increments	00000000 .rodata.note_increments
00000000 g     F .text.avm_audio_tone	00000033 avm_audio_tone
00000000         *UND*	00000000 __avm_audio_tone_increment

Disassembly of section .text.avm_audio_tone:

<avm_audio_tone>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c9 e8                 addi.s8	r5, -0x18
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 cf 48                 cmpi.s8	r7, 0x48
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_tone
		R_AVM_FAR24	.text.avm_audio_tone+0x2a
<L0>:
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 54                 and	r2, r5
 f7 65                 add32	q1, q1
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.rodata.note_increments
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.rodata.note_increments
 f7 61                 add32	q0, q1
 f0 62 a0              ldp16	r5, [q0]
 e2 00 00 00           jmpf	avm_audio_tone
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_audio_tone+0x2b
 a5                    xor	r5, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e2 00 00 00           jmpf	avm_audio_tone
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_audio_tone_increment
