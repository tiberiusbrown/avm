#include <avm/audio.h>

/* Guest program storage: linked only when the MIDI-compatible API is used.
   The increments include the compiler's per-note tuning corrections, so a direct
   tone sounds exactly like the same note in a compiled score. */
static const uint16_t AVM_PROGMEM note_increments[72] = {
#include "note_increments.inc"
};

/* Command 10: r4 low byte channel, r4 high byte pulse duty, r5 raw increment,
   r6 amplitude 0..31 with bit 5 selecting triangle; r0 duration in ticks.
   The assembly wrapper moves the fourth ABI argument from r7 to r0. */
void __avm_audio_tone_raw(uint16_t channel_duty, uint16_t increment, uint16_t amplitude_wave, uint16_t ticks);

static uint16_t tone_increment(uint8_t note) {
    uint8_t index = note - 24;
    return index < 72 ? note_increments[index] : 0;
}

/* Direct tones always use the tonal sound-effect channel, physical channel 1. */
#define AVM_TONE_CHANNEL 1

/* Round up without overflowing a 16-bit millisecond duration. */
static uint16_t duration_ticks(uint16_t ms) {
    return (ms >> 2) + ((ms & 3) != 0);
}

void avm_audio_tone_pulse_ticks(uint8_t note, uint8_t amplitude, uint8_t duty, uint16_t ticks) {
    __avm_audio_tone_raw(AVM_TONE_CHANNEL | ((uint16_t)duty << 8), tone_increment(note),
                         amplitude & 31, ticks);
}

void avm_audio_tone_triangle_ticks(uint8_t note, uint8_t amplitude, uint16_t ticks) {
    __avm_audio_tone_raw(AVM_TONE_CHANNEL, tone_increment(note), (amplitude & 31) | 32, ticks);
}

void avm_audio_tone_ticks(uint8_t note, uint8_t amplitude, uint16_t ticks) {
    avm_audio_tone_pulse_ticks(note, amplitude, 128, ticks);
}

void avm_audio_tone_pulse(uint8_t note, uint8_t amplitude, uint8_t duty, uint16_t ms) {
    avm_audio_tone_pulse_ticks(note, amplitude, duty, duration_ticks(ms));
}

void avm_audio_tone_triangle(uint8_t note, uint8_t amplitude, uint16_t ms) {
    avm_audio_tone_triangle_ticks(note, amplitude, duration_ticks(ms));
}

void avm_audio_tone(uint8_t note, uint8_t amplitude, uint16_t ms) {
    avm_audio_tone_ticks(note, amplitude, duration_ticks(ms));
}
