#include <avm.h>
#include "../../projects/audio_demo/music.h"
#include "../../projects/audio_demo/songs/z1overw.h"
#include "../../projects/audio_demo/songs/ff1town.h"
#include "../../projects/audio_demo/songs/ff1overw.h"
#include "../../projects/audio_demo/songs/ff1matya.h"

static const void AVM_PROGMEM *const AVM_PROGMEM songs[] = {
    music, z1overw, ff1town, ff1overw, ff1matya
};
static void select_song(unsigned index) {
    avm_audio_stop_sfx();
    avm_audio_play(songs[index]);
}
void _start(void) {
    avm_audio_music_loop(1);
    avm_audio_play(songs[0]);
    select_song(4);
    avm_audio_rate(AVM_AUDIO_RATE_8KHZ);
    select_song(0);
    select_song(1);
    avm_audio_pause();
    select_song(2); avm_audio_pause();
    select_song(3); avm_audio_pause();
    select_song(4); avm_audio_pause();
    select_song(0); avm_audio_pause();
    avm_audio_resume();
    avm_debug_break();
    for(;;) {}
}
