#ifndef AVM_AUDIO_H
#define AVM_AUDIO_H
#include <stdint.h>
#include <avm/pgmspace.h>
#ifdef __cplusplus
extern "C" {
#endif
/* Playback advances automatically. A5 music ends with End or Loop. D1..D3
   one-shot SFX ends with End and overrides only declared tonal (voice 1) / noise
   (voice 3) slots. Arrange melody on 0, harmony on 1, bass on 2. Undeclared SFX slots leave music audible; declared slots
   retain ownership through rests. Raw uint16 phase increments use 15625 Hz
   regardless of the selected synthesis rate. Pitch updates preserve phase.
   Tonal controls select pulse (default, duty 128=50%) or triangle independently.
   Waveform changes preserve phase; triangle retains but ignores duty. Noise retriggers
   use seeds 1..63. The reader uses 24-bit cursors and may read ahead past the terminator. */
void avm_audio_play(void const AVM_PROGMEM *song);
void avm_audio_sfx(void const AVM_PROGMEM *effect);
void avm_audio_stop(void);
void avm_audio_pause(void);
void avm_audio_resume(void);
/* Set both music and SFX masters: default 128, 0=mute, 32=unity, 255=796.875%.
   Channel amplitudes are prepared as floor(volume*master/32); the completed
   mix saturates at the PWM limits. Gain edits preserve phase and timing. */
void avm_audio_volume(uint8_t volume);
/* Independently set music or SFX gain; direct tones use the SFX master.
   These controls do not change ownership, so muted SFX still overrides music. */
void avm_audio_music_volume(uint8_t volume);
void avm_audio_sfx_volume(uint8_t volume);
void avm_audio_enable(void);
void avm_audio_disable(void);
enum { AVM_AUDIO_RATE_8KHZ = 0, AVM_AUDIO_RATE_16KHZ = 1 };
/* Default 8 kHz (7812.5 Hz); 16 kHz is 15625 Hz. No output smoothing.
   Changing rate preserves playback and oscillator phase. At 8 kHz, prepared
   increments are doubled, saturating at 65535. Other rate values are ignored.
   The selection persists across stop, pause and disable/enable. */
void avm_audio_rate(uint8_t rate);
void avm_audio_stop_sfx(void);
/* bit 0=music playing, bit 1=music paused, bit 2=SFX playing. */
uint8_t avm_audio_status(void);
/* Replaces SFX with a latched tone until stop_sfx; channel 0..3 (3=noise),
   MIDI 24..95, amplitude 0..31. Out-of-range MIDI mutes the selected voice.
   MIDI conversion is in the guest runtime; explicit channel overrides remain
   available independently of sequenced SFX routing. Tonal direct tones default
   to pulse with duty 128. Phase is preserved. */
void avm_audio_tone(uint8_t channel, uint8_t note, uint8_t amplitude);
#ifdef __cplusplus
}
#endif
#endif
