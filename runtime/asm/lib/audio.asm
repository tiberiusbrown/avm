
audio.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text	00000005 avm_audio_play
00000005 g     F .text	00000005 avm_audio_sfx
0000000a g     F .text	00000005 avm_audio_stop
0000000f g     F .text	00000005 avm_audio_pause
00000014 g     F .text	00000005 avm_audio_resume
00000019 g     F .text	00000005 avm_audio_volume
0000001e g     F .text	00000005 avm_audio_enable
00000023 g     F .text	00000005 avm_audio_disable
00000028 g     F .text	00000005 avm_audio_stop_sfx
0000002d g     F .text	00000005 avm_audio_status
00000032 g     F .text	00000005 __avm_audio_tone_increment
00000037 g     F .text	00000005 avm_audio_music_volume
0000003c g     F .text	00000005 avm_audio_sfx_volume
00000041 g     F .text	00000005 avm_audio_rate
00000046 g     F .text	00000005 avm_audio_music_loop
0000004b g     F .text	00000005 avm_audio_lowpass

Disassembly of section .text:

<avm_audio_play>:
 c3 00                 ldi8	r7, 0x0
 d7 38                 sys	audio
 ef                    ret

<avm_audio_sfx>:
 c3 01                 ldi8	r7, 0x1
 d7 38                 sys	audio
 ef                    ret

<avm_audio_stop>:
 c3 02                 ldi8	r7, 0x2
 d7 38                 sys	audio
 ef                    ret

<avm_audio_pause>:
 c3 03                 ldi8	r7, 0x3
 d7 38                 sys	audio
 ef                    ret

<avm_audio_resume>:
 c3 04                 ldi8	r7, 0x4
 d7 38                 sys	audio
 ef                    ret

<avm_audio_volume>:
 c3 05                 ldi8	r7, 0x5
 d7 38                 sys	audio
 ef                    ret

<avm_audio_enable>:
 c3 06                 ldi8	r7, 0x6
 d7 38                 sys	audio
 ef                    ret

<avm_audio_disable>:
 c3 07                 ldi8	r7, 0x7
 d7 38                 sys	audio
 ef                    ret

<avm_audio_stop_sfx>:
 c3 08                 ldi8	r7, 0x8
 d7 38                 sys	audio
 ef                    ret

<avm_audio_status>:
 c3 09                 ldi8	r7, 0x9
 d7 38                 sys	audio
 ef                    ret

<__avm_audio_tone_increment>:
 c3 0a                 ldi8	r7, 0xa
 d7 38                 sys	audio
 ef                    ret

<avm_audio_music_volume>:
 c3 0b                 ldi8	r7, 0xb
 d7 38                 sys	audio
 ef                    ret

<avm_audio_sfx_volume>:
 c3 0c                 ldi8	r7, 0xc
 d7 38                 sys	audio
 ef                    ret

<avm_audio_rate>:
 c3 0d                 ldi8	r7, 0xd
 d7 38                 sys	audio
 ef                    ret

<avm_audio_music_loop>:
 c3 0e                 ldi8	r7, 0xe
 d7 38                 sys	audio
 ef                    ret

<avm_audio_lowpass>:
 c3 0f                 ldi8	r7, 0xf
 d7 38                 sys	audio
 ef                    ret
