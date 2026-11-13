
audio_state.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 audio_state.c
00000000 l    d  .text.avm_audio_get_music	00000000 .text.avm_audio_get_music
00000000 l    d  .text.avm_audio_get_volume	00000000 .text.avm_audio_get_volume
00000000 l    d  .text.avm_audio_get_music_volume	00000000 .text.avm_audio_get_music_volume
00000000 l    d  .text.avm_audio_get_sfx_volume	00000000 .text.avm_audio_get_sfx_volume
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.avm_audio_get_music	00000016 avm_audio_get_music
00000000 g     F .text.avm_audio_get_volume	00000005 avm_audio_get_volume
00000000 g     F .text.avm_audio_get_music_volume	00000005 avm_audio_get_music_volume
00000000 g     F .text.avm_audio_get_sfx_volume	00000005 avm_audio_get_sfx_volume

Disassembly of section .text.avm_audio_get_music:

<avm_audio_get_music>:
 c4 4e 0a              ldi16	r4, 0xa4e
 40                    ld8u	r4, [r4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_audio_get_music
		R_AVM_FAR24	.text.avm_audio_get_music+0x13
<L0>:
 c6 50 0a              ldi16	r6, 0xa50
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 ef                    ret
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ef                    ret

Disassembly of section .text.avm_audio_get_volume:

<avm_audio_get_volume>:
 c4 17 0a              ldi16	r4, 0xa17
 40                    ld8u	r4, [r4]
 ef                    ret

Disassembly of section .text.avm_audio_get_music_volume:

<avm_audio_get_music_volume>:
 c4 71 0a              ldi16	r4, 0xa71
 40                    ld8u	r4, [r4]
 ef                    ret

Disassembly of section .text.avm_audio_get_sfx_volume:

<avm_audio_get_sfx_volume>:
 c4 72 0a              ldi16	r4, 0xa72
 40                    ld8u	r4, [r4]
 ef                    ret
