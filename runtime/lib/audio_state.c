#include <avm/audio.h>

/* Interpreter-private SRAM contract: docs/audio.md, "Timers, atomic publication,
   and memory", and interp/interp.asm. Update these addresses with any layout
   change. Timer ISRs never change stream status or the start pointer. */
#define AUDIO_MUSIC_STATUS (*(uint8_t const volatile *)0x0a4e)
#define AUDIO_MUSIC_START (*(void const AVM_PROGMEM * const volatile *)0x0a50)
#define AUDIO_VOLUME (*(uint8_t const volatile *)0x0a17)
#define AUDIO_MUSIC_VOLUME (*(uint8_t const volatile *)0x0a71)
#define AUDIO_SFX_VOLUME (*(uint8_t const volatile *)0x0a72)

void const AVM_PROGMEM *avm_audio_get_music(void) {
    return AUDIO_MUSIC_STATUS ? AUDIO_MUSIC_START : 0;
}

uint8_t avm_audio_get_volume(void) {
    return AUDIO_VOLUME;
}

uint8_t avm_audio_get_music_volume(void) {
    return AUDIO_MUSIC_VOLUME;
}

uint8_t avm_audio_get_sfx_volume(void) {
    return AUDIO_SFX_VOLUME;
}
