; Ordinary AVM ABI wrappers. SYS_AUDIO preserves all registers except the
; status result in r4. Arguments already occupy q2 and r6, or r4 for volume.
.section .text,"ax",@progbits
.macro audio_api name, command
    .globl \name
    .type \name, @function
\name:
    ldi8 r7, \command
    sys 0x38
    ret
    .size \name, .-\name
.endm
audio_api avm_audio_play, 0
audio_api avm_audio_sfx, 1
audio_api avm_audio_stop, 2
audio_api avm_audio_pause, 3
audio_api avm_audio_resume, 4
audio_api avm_audio_volume, 5
audio_api avm_audio_enable, 6
audio_api avm_audio_disable, 7
audio_api avm_audio_stop_sfx, 8
audio_api avm_audio_status, 9
audio_api avm_audio_tone, 10
