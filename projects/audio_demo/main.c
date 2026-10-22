#include <avm.h>
#include "music.h"
#include "effect.h"
#include "songs/z1overw.h"
#include "songs/ff1town.h"
#include "songs/ff1overw.h"
#include "songs/ff1matya.h"

/* Program pointers and the table retain AVM's native 24-bit address space. */
static const void AVM_PROGMEM *const AVM_PROGMEM songs[] = {
    music, z1overw, ff1town, ff1overw, ff1matya
};
static const char AVM_PROGMEM *const AVM_PROGMEM titles[] = {
    F("Sunlit Garden"), F("Zelda Overworld"), F("FF1 Town"),
    F("FF1 Overworld"), F("FF1 Matoya's Cave")
};
enum { SONG_COUNT = sizeof(songs) / sizeof(songs[0]) };

void setup(void) {
    avm_set_frame_rate(60);
    avm_set_text_font(AVM_FONT_5X7);
    avm_audio_music_loop(1);
    avm_audio_play(music);
}
void loop(void) {
    static uint8_t x, y, paused, song;
    static uint8_t rate = AVM_AUDIO_RATE_16KHZ;
    if(!avm_next_frame()) return;
    avm_poll_buttons();
    if(avm_just_pressed(AVM_BUTTON_L) || avm_just_pressed(AVM_BUTTON_R)) {
        if(avm_just_pressed(AVM_BUTTON_R)) song = (song + 1) % SONG_COUNT;
        else song = song ? song - 1 : SONG_COUNT - 1;
        avm_audio_stop_sfx();
        avm_audio_play(songs[song]);
        if(paused) avm_audio_pause();
    }
    if(avm_just_pressed(AVM_BUTTON_U)) {
        rate ^= 1;
        avm_audio_rate(rate);
    }
    if(avm_just_pressed(AVM_BUTTON_A)) avm_audio_sfx(effect);
    if(avm_just_pressed(AVM_BUTTON_B)) {
        paused ^= 1;
        if(paused) avm_audio_pause(); else avm_audio_resume();
    }
    avm_draw_filled_rect_white(x++ & 127, 24 + (y++ & 7), 12, 8);
    avm_draw_filled_rect_white(127-(x&127), 33-(y&7), 6, 6);
    avm_draw_text_P(0, 8, titles[song]);
    avm_draw_textf_P(0, 18, F("%u/5  %s  %s"), (unsigned)song + 1,
        rate ? "16kHz" : "8kHz", paused ? "PAUSE" : "PLAY");
    avm_draw_text_P(0, 48, F("L/R: Song   A: SFX"));
    avm_draw_text_P(0, 58, F("B: Pause    U: Rate"));
    avm_display(true);
}
