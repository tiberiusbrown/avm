#ifndef AVM_AUDIO_H
#define AVM_AUDIO_H
#include <stdint.h>
#include <avm/pgmspace.h>
#ifdef __cplusplus
extern "C" {
#endif
/* Playback advances automatically. Compiler-validated streams end with End.
   One-shot SFX ends with End and overrides only declared tonal (voice 1) / noise
   (voice 3) slots. Arrange melody on 0, harmony on 1, bass on 2. Undeclared SFX slots leave music audible; declared slots
   retain ownership through rests. Raw uint16 phase increments use 15625 Hz
   regardless of the selected synthesis rate. Pitch updates preserve phase.
   Tonal controls select pulse (default, duty 128=50%) or triangle independently.
   Waveform changes preserve phase; triangle retains but ignores duty. Noise retriggers
   use seeds 1..63. Both streams begin with one physical ownership-mask byte,
   without type/version magic; their events use physical channel masks.
   The reader trusts compiler output, uses 24-bit cursors, and may read ahead
   past the terminator. Recompile older assets for this format. */
void avm_audio_play(void const AVM_PROGMEM *song);
/* Repeat music at End when enabled (any nonzero value). Default disabled.
   Changes preserve position; disabling finishes the current pass. Enabling
   stopped music does not restart it. The setting persists across play, stop,
   pause and disable/enable. SFX always ends, regardless of this setting. */
void avm_audio_music_loop(uint8_t enabled);
void avm_audio_sfx(void const AVM_PROGMEM *effect);
void avm_audio_stop(void);
void avm_audio_pause(void);
void avm_audio_resume(void);
/* Shared music/SFX output gain: default 128, 0=mute, 32=unity, 255=796.875%.
   Channels retain their full 0..31 volumes. Gain applies after the tonal
   low-pass and noise addition; the result rounds and saturates at PWM limits.
   Gain edits preserve phase, filter history and timing. */
void avm_audio_volume(uint8_t volume);
/* Compatibility aliases for avm_audio_volume: both set the same shared gain.
   Use channel volumes to balance music/SFX; muted SFX still owns its slots. */
void avm_audio_music_volume(uint8_t volume);
void avm_audio_sfx_volume(uint8_t volume);
void avm_audio_enable(void);
void avm_audio_disable(void);
enum { AVM_AUDIO_RATE_8KHZ = 0, AVM_AUDIO_RATE_16KHZ = 1 };
/* Default 16 kHz (15625 Hz); 8 kHz is 7812.5 Hz.
   Changing rate preserves playback and oscillator phase. At 8 kHz, prepared
   increments are doubled, saturating at 65535. Other rate values are ignored.
   The selection persists across stop, pause and disable/enable. */
void avm_audio_rate(uint8_t rate);
enum {
    AVM_AUDIO_LOWPASS_OFF = 0,
    AVM_AUDIO_LOWPASS_MILD = 128,
    AVM_AUDIO_LOWPASS_MEDIUM = 64,
    AVM_AUDIO_LOWPASS_STRONG = 32,
    AVM_AUDIO_LOWPASS_DEFAULT = AVM_AUDIO_LOWPASS_OFF
};
/* Global one-pole low-pass on the sum of tonal channels 0..2, including SFX;
   noise channel 3 bypasses it. Default OFF bypasses smoothing.
   alpha is a uint8 coefficient: 0=bypass, 1..255 gives alpha/256 at 15625 Hz;
   smaller nonzero values smooth more. Set before play for per-song tuning.
   The coefficient persists across play, stop, pause and disable/enable. History starts
   at silence (biased byte 128) on startup, output restart and OFF-to-enabled transitions;
   changes between nonzero coefficients and sample rates retain history.
   Stop/pause allow a short tonal decay. Byte steps round toward the target;
   the half-rate coefficient is prepared in foreground to retain decay time. */
void avm_audio_lowpass(uint8_t alpha);
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
