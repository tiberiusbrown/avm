#include <avm/audio.h>

/* Guest program storage: linked only when the MIDI-compatible API is used. */
static const uint16_t AVM_PROGMEM note_increments[72] = {
    137,145,154,163,173,183,194,206,218,231,244,259,
    274,291,308,326,346,366,388,411,435,461,489,518,
    549,581,616,652,691,732,776,822,871,923,978,1036,
    1097,1163,1232,1305,1383,1465,1552,1644,1742,1845,1955,2071,
    2195,2325,2463,2610,2765,2930,3104,3288,3484,3691,3910,4143,
    4389,4650,4927,5220,5530,5859,6207,6577,6968,7382,7821,8286
};

/* Command 10: r4 low byte channel, r4 high byte pulse duty, r5 raw increment,
   r6 amplitude 0..31 with bit 5 selecting triangle. */
void __avm_audio_tone_raw(uint16_t channel_duty, uint16_t increment, uint16_t amplitude_wave);

static uint16_t tone_increment(uint8_t note) {
    uint8_t index = note - 24;
    return index < 72 ? note_increments[index] : 0;
}

/* Direct tones always use the tonal sound-effect channel, physical channel 1. */
#define AVM_TONE_CHANNEL 1

void avm_audio_tone_pulse(uint8_t note, uint8_t amplitude, uint8_t duty) {
    __avm_audio_tone_raw(AVM_TONE_CHANNEL | ((uint16_t)duty << 8), tone_increment(note),
                         amplitude & 31);
}

void avm_audio_tone_triangle(uint8_t note, uint8_t amplitude) {
    __avm_audio_tone_raw(AVM_TONE_CHANNEL, tone_increment(note), (amplitude & 31) | 32);
}

void avm_audio_tone(uint8_t note, uint8_t amplitude) {
    avm_audio_tone_pulse(note, amplitude, 128);
}
