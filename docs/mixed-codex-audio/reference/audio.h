#ifndef AVM_AUDIO_H
#define AVM_AUDIO_H
#include <stdint.h>
#include <avm/pgmspace.h>
#ifdef __cplusplus
extern "C" {
#endif
/* Autonomous signed PCM8 music at exactly 15625 Hz. Assets use the AVM1
   container produced by avm_audio_pack.py from mixed one/two-bit AVAX with
   256-sample frames. Its loop flag controls end-of-track behavior. PLAY
   replaces the current track. Program pointers and payload lengths are 24 bit.
   Synthesized scores, sound effects, tones and rate selection are removed.
   No guest update call or guest RAM buffer is required. */
void avm_audio_play(void const AVM_PROGMEM *song);
void avm_audio_stop(void);
void avm_audio_pause(void);
void avm_audio_resume(void);
/* Gain = volume / 128; default 128 is unity, 0 mutes, 255 nearly doubles.
   Gain saturates only the output; predictor history is unaffected. */
void avm_audio_volume(uint8_t volume);
void avm_audio_music_volume(uint8_t volume);
void avm_audio_enable(void);
/* Stops playback and releases speaker pins/timers. PLAY enables output. */
void avm_audio_disable(void);
/* 0=stopped, 1=playing, 2=paused. */
uint8_t avm_audio_status(void);
#ifdef __cplusplus
}
#endif
#endif
