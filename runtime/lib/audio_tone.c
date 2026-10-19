#include <avm/audio.h>

/* Guest program storage: linked only when the MIDI-compatible API is used. */
static const uint16_t AVM_PROGMEM note_increments[72] = {
    274,291,308,326,346,366,388,411,435,461,489,518,
    549,581,616,652,691,732,776,822,871,923,978,1036,
    1097,1163,1232,1305,1383,1465,1552,1644,1742,1845,1955,2071,
    2195,2325,2463,2610,2765,2930,3104,3288,3484,3691,3910,4143,
    4389,4650,4927,5220,5530,5859,6207,6577,6968,7382,7821,8286,
    8779,9301,9854,10440,11060,11718,12415,13153,13935,14764,15642,16572
};

void __avm_audio_tone_increment(uint8_t channel, uint16_t increment, uint8_t amplitude);

void avm_audio_tone(uint8_t channel, uint8_t note, uint8_t amplitude) {
    uint8_t index = note - 24;
    uint16_t increment = index < 72 ? note_increments[index] : 0;
    __avm_audio_tone_increment(channel, increment, amplitude);
}
