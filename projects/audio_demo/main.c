#include <avm.h>
#include "music.h"
#include "effect.h"

void setup(void) {
    avm_set_frame_rate(60);
    avm_audio_play(music, sizeof(music));
}
void loop(void) {
    static uint8_t x, y, paused;
    if(!avm_next_frame()) return;
    avm_poll_buttons();
    if(avm_just_pressed(AVM_BUTTON_A)) avm_audio_sfx(effect, sizeof(effect));
    if(avm_just_pressed(AVM_BUTTON_B)) {
        paused ^= 1;
        if(paused) avm_audio_pause(); else avm_audio_resume();
    }
    avm_draw_filled_rect_white(x++ & 127, y++ & 63, 12, 8);
    avm_draw_filled_rect_white(127-(x&127), 63-(y&63), 6, 6);
    avm_display(true);
}
