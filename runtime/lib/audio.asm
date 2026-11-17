; Ordinary AVM ABI wrappers. SYS_AUDIO preserves all registers except the
; status result in r4. Play pointers occupy q2; tone uses r4-r6 and r0; gain uses r4.
.section .text,"ax",@progbits
.macro audio_api name, command, tone=0
    .globl \name
    .type \name, @function
\name:
    .if \tone
    push16 r0
    mov r0, r7 ; duration argument; preserve the ordinary ABI callee-saved r0
    .endif
    ldi8 r7, \command
    sys 0x38
    .if \tone
    pop16 r0
    .endif
    ret
    .size \name, .-\name
    ; The tone wrapper saves r0; other SYS wrappers allocate no guest stack.
    .pushsection .stack_sizes,"o",@progbits,.text
    .3byte \name
    .uleb128 (2 * \tone)
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte \name
    .3byte 0
    .short 0
    .byte 8
    .popsection
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
; Internal raw-pitch entry used by the tone C wrappers.
audio_api __avm_audio_tone_raw, 10, 1
audio_api avm_audio_music_volume, 11
audio_api avm_audio_sfx_volume, 12
audio_api avm_audio_rate, 13
audio_api avm_audio_music_loop, 14
; Internal queue command; the public C wrapper handles an inactive music stream.
audio_api __avm_audio_play_fade, 16
