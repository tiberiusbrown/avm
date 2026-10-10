#ifndef AVM_AUDIO_H
#define AVM_AUDIO_H
#include <stdint.h>
#include <avm/pgmspace.h>
#ifdef __cplusplus
extern "C" {
#endif
/* Playback advances automatically; byte lengths bound every FX read. */
void avm_audio_play(void const AVM_PROGMEM *song, uint16_t size);
void avm_audio_sfx(void const AVM_PROGMEM *effect, uint16_t size);
void avm_audio_stop(void);
void avm_audio_pause(void);
void avm_audio_resume(void);
/* Set both music and SFX masters: 0=mute, 32=unity, 255=796.875%.
   Channel amplitudes are prepared as floor(volume*master/32); the completed
   mix saturates at the PWM limits. Gain edits preserve phase and timing. */
void avm_audio_volume(uint8_t volume);
/* Independently set music or SFX gain; direct tones use the SFX master.
   These controls do not change ownership, so muted SFX still overrides music. */
void avm_audio_music_volume(uint8_t volume);
void avm_audio_sfx_volume(uint8_t volume);
void avm_audio_enable(void);
void avm_audio_disable(void);
void avm_audio_stop_sfx(void);
/* bit 0=music playing, bit 1=music paused, bit 2=SFX playing. */
uint8_t avm_audio_status(void);
/* Replaces SFX with a latched tone until stop_sfx; channel 0..3 (3=noise),
   MIDI 24..95, amplitude 0..31. Out-of-range MIDI mutes the selected voice. */
void avm_audio_tone(uint8_t channel, uint8_t note, uint8_t amplitude);
#ifdef __cplusplus
}
#endif
#endif
