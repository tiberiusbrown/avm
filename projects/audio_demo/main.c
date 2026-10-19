#include <avm.h>
#include "music.h"
#include "effect.h"

void setup(void) {
    avm_set_frame_rate(60);
    avm_set_text_font(AVM_FONT_5X7);
    avm_audio_play(music);
}
void loop(void) {
    static uint8_t x, y, paused, rate;
    if(!avm_next_frame()) return;
    avm_poll_buttons();
    if(avm_just_pressed(AVM_BUTTON_U)) {
        rate ^= 1;
        avm_audio_rate(rate);
    }
    if(avm_just_pressed(AVM_BUTTON_A)) avm_audio_sfx(effect);
    if(avm_just_pressed(AVM_BUTTON_B)) {
        paused ^= 1;
        if(paused) avm_audio_pause(); else avm_audio_resume();
    }
    avm_draw_filled_rect_white(x++ & 127, y++ & 63, 12, 8);
    avm_draw_filled_rect_white(127-(x&127), 63-(y&63), 6, 6);
    avm_draw_text(0, 8, rate ? "16 kHz" : "8 kHz");
    avm_display(true);
}
