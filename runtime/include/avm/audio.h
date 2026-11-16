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
/* During an active fade, replace only the queued song, keeping the original
   saved attenuation and remaining fade time, even if the current song ended.
   Otherwise start immediately with avm_audio_play when music is stopped, or
   queue music without blocking (including while paused). A new fade saves
   the current music attenuation, lowers it by one each 4 ms, then restores
   the saved attenuation and plays song. At 255 this takes 1020 ms; zero
   starts immediately.
   Play/stop/disable cancels a pending music fade. Master gain and SFX
   attenuation are unchanged. */
void avm_audio_play_fade(void const AVM_PROGMEM *song);
/* Pending fade's saved attenuation, or zero when no fade is active. The song
   getter returns its 24-bit queued asset pointer, or null when inactive. */
uint8_t avm_audio_get_fade_volume(void);
void const AVM_PROGMEM *avm_audio_get_fade_song(void);
/* Original 24-bit asset pointer while music is playing or paused; null when
   stopped. Reads the interpreter's current RAM state directly. */
void const AVM_PROGMEM *avm_audio_get_music(void);
/* Repeat music at End when enabled (any nonzero value). Default disabled.
   Changes preserve position; disabling finishes the current pass. Enabling
   stopped music does not restart it. The setting persists across play, stop,
   pause and disable/enable. SFX always ends, regardless of this setting. */
void avm_audio_music_loop(uint8_t enabled);
/* Raw loop setting; any nonzero value enables repetition. */
uint8_t avm_audio_get_music_loop(void);
void avm_audio_sfx(void const AVM_PROGMEM *effect);
void avm_audio_stop(void);
void avm_audio_pause(void);
void avm_audio_resume(void);
/* Shared music/SFX output gain: default 128, 0=mute, 32=unity, 255=796.875%.
   Gain applies after individual music/SFX attenuation, the tonal
   low-pass and noise addition; the result rounds and saturates at PWM limits.
   Gain edits preserve phase, filter history and timing. */
void avm_audio_volume(uint8_t volume);
/* Independent music/SFX attenuation: default 255, 0=mute, 255=full volume.
   Rounded to each channel's 0..31 amplitude before mixing/filtering; low
   volumes have coarse fade steps. SFX includes direct tones and retains its
   slots while muted. Edits preserve phase, timing and desired channel volumes.
   Settings persist across play, stop, pause and disable/enable. */
void avm_audio_music_volume(uint8_t volume);
void avm_audio_sfx_volume(uint8_t volume);
/* Current shared output gain and independent music/SFX attenuation. */
uint8_t avm_audio_get_volume(void);
uint8_t avm_audio_get_music_volume(void);
uint8_t avm_audio_get_sfx_volume(void);
void avm_audio_enable(void);
void avm_audio_disable(void);
enum { AVM_AUDIO_RATE_8KHZ = 0, AVM_AUDIO_RATE_16KHZ = 1 };
/* Default 16 kHz (15625 Hz); 8 kHz is 7812.5 Hz.
   Changing rate preserves playback and oscillator phase. At 8 kHz, prepared
   increments are doubled, saturating at 65535. Other rate values are ignored.
   The selection persists across stop, pause and disable/enable. */
void avm_audio_rate(uint8_t rate);
uint8_t avm_audio_get_rate(void);
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
/* Requested coefficient, before synthesis-rate adjustment. */
uint8_t avm_audio_get_lowpass(void);
void avm_audio_stop_sfx(void);
/* bit 0=music playing, bit 1=music paused, bit 2=SFX playing. */
uint8_t avm_audio_status(void);
/* MIDI note constants for every supported pitch (C1..B6, 24..95).
   S denotes sharp and B denotes flat: CS4 and DB4 are the same pitch.
   Middle C is AVM_NOTE_C4 (60); AVM_NOTE_A4 is 69 (nominally 440 Hz).
   Use these with any avm_audio_tone* function. */
enum {
    AVM_NOTE_C1 = 24,
    AVM_NOTE_CS1 = 25, AVM_NOTE_DB1 = AVM_NOTE_CS1,
    AVM_NOTE_D1 = 26,
    AVM_NOTE_DS1 = 27, AVM_NOTE_EB1 = AVM_NOTE_DS1,
    AVM_NOTE_E1 = 28,
    AVM_NOTE_F1 = 29,
    AVM_NOTE_FS1 = 30, AVM_NOTE_GB1 = AVM_NOTE_FS1,
    AVM_NOTE_G1 = 31,
    AVM_NOTE_GS1 = 32, AVM_NOTE_AB1 = AVM_NOTE_GS1,
    AVM_NOTE_A1 = 33,
    AVM_NOTE_AS1 = 34, AVM_NOTE_BB1 = AVM_NOTE_AS1,
    AVM_NOTE_B1 = 35,

    AVM_NOTE_C2 = 36,
    AVM_NOTE_CS2 = 37, AVM_NOTE_DB2 = AVM_NOTE_CS2,
    AVM_NOTE_D2 = 38,
    AVM_NOTE_DS2 = 39, AVM_NOTE_EB2 = AVM_NOTE_DS2,
    AVM_NOTE_E2 = 40,
    AVM_NOTE_F2 = 41,
    AVM_NOTE_FS2 = 42, AVM_NOTE_GB2 = AVM_NOTE_FS2,
    AVM_NOTE_G2 = 43,
    AVM_NOTE_GS2 = 44, AVM_NOTE_AB2 = AVM_NOTE_GS2,
    AVM_NOTE_A2 = 45,
    AVM_NOTE_AS2 = 46, AVM_NOTE_BB2 = AVM_NOTE_AS2,
    AVM_NOTE_B2 = 47,

    AVM_NOTE_C3 = 48,
    AVM_NOTE_CS3 = 49, AVM_NOTE_DB3 = AVM_NOTE_CS3,
    AVM_NOTE_D3 = 50,
    AVM_NOTE_DS3 = 51, AVM_NOTE_EB3 = AVM_NOTE_DS3,
    AVM_NOTE_E3 = 52,
    AVM_NOTE_F3 = 53,
    AVM_NOTE_FS3 = 54, AVM_NOTE_GB3 = AVM_NOTE_FS3,
    AVM_NOTE_G3 = 55,
    AVM_NOTE_GS3 = 56, AVM_NOTE_AB3 = AVM_NOTE_GS3,
    AVM_NOTE_A3 = 57,
    AVM_NOTE_AS3 = 58, AVM_NOTE_BB3 = AVM_NOTE_AS3,
    AVM_NOTE_B3 = 59,

    AVM_NOTE_C4 = 60,
    AVM_NOTE_CS4 = 61, AVM_NOTE_DB4 = AVM_NOTE_CS4,
    AVM_NOTE_D4 = 62,
    AVM_NOTE_DS4 = 63, AVM_NOTE_EB4 = AVM_NOTE_DS4,
    AVM_NOTE_E4 = 64,
    AVM_NOTE_F4 = 65,
    AVM_NOTE_FS4 = 66, AVM_NOTE_GB4 = AVM_NOTE_FS4,
    AVM_NOTE_G4 = 67,
    AVM_NOTE_GS4 = 68, AVM_NOTE_AB4 = AVM_NOTE_GS4,
    AVM_NOTE_A4 = 69,
    AVM_NOTE_AS4 = 70, AVM_NOTE_BB4 = AVM_NOTE_AS4,
    AVM_NOTE_B4 = 71,

    AVM_NOTE_C5 = 72,
    AVM_NOTE_CS5 = 73, AVM_NOTE_DB5 = AVM_NOTE_CS5,
    AVM_NOTE_D5 = 74,
    AVM_NOTE_DS5 = 75, AVM_NOTE_EB5 = AVM_NOTE_DS5,
    AVM_NOTE_E5 = 76,
    AVM_NOTE_F5 = 77,
    AVM_NOTE_FS5 = 78, AVM_NOTE_GB5 = AVM_NOTE_FS5,
    AVM_NOTE_G5 = 79,
    AVM_NOTE_GS5 = 80, AVM_NOTE_AB5 = AVM_NOTE_GS5,
    AVM_NOTE_A5 = 81,
    AVM_NOTE_AS5 = 82, AVM_NOTE_BB5 = AVM_NOTE_AS5,
    AVM_NOTE_B5 = 83,

    AVM_NOTE_C6 = 84,
    AVM_NOTE_CS6 = 85, AVM_NOTE_DB6 = AVM_NOTE_CS6,
    AVM_NOTE_D6 = 86,
    AVM_NOTE_DS6 = 87, AVM_NOTE_EB6 = AVM_NOTE_DS6,
    AVM_NOTE_E6 = 88,
    AVM_NOTE_F6 = 89,
    AVM_NOTE_FS6 = 90, AVM_NOTE_GB6 = AVM_NOTE_FS6,
    AVM_NOTE_G6 = 91,
    AVM_NOTE_GS6 = 92, AVM_NOTE_AB6 = AVM_NOTE_GS6,
    AVM_NOTE_A6 = 93,
    AVM_NOTE_AS6 = 94, AVM_NOTE_BB6 = AVM_NOTE_AS6,
    AVM_NOTE_B6 = 95,
};
/* Replaces SFX with a pulse tone on physical channel 1; MIDI 24..95,
   amplitude 0..31, duty 128 (50%). Out-of-range MIDI mutes the tone.
   Phase is preserved. Duration is uint16 milliseconds, rounded up to 4 ms
   audio ticks. Zero latches until stop_sfx or replacement. Expiry releases
   SFX ownership and restores current music. Timing follows audio tick
   boundaries and interpreter servicing, not an independent wall clock. */
void avm_audio_tone(uint8_t note, uint8_t amplitude, uint16_t dur_ms);
/* Same tone with a triangle waveform; triangle ignores duty. */
void avm_audio_tone_triangle(uint8_t note, uint8_t amplitude, uint16_t dur_ms);
/* Same tone with pulse duty threshold 0..255 (128 = 50%). */
void avm_audio_tone_pulse(uint8_t note, uint8_t amplitude, uint8_t duty, uint16_t dur_ms);
/* Durations in 4 ms audio ticks; zero latches, 65535 = 262.14 seconds. */
void avm_audio_tone_ticks(uint8_t note, uint8_t amplitude, uint16_t dur_ticks);
void avm_audio_tone_triangle_ticks(uint8_t note, uint8_t amplitude, uint16_t dur_ticks);
void avm_audio_tone_pulse_ticks(uint8_t note, uint8_t amplitude, uint8_t duty, uint16_t dur_ticks);
#ifdef __cplusplus
}
#endif
#endif
