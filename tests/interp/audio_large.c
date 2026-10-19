#include <avm.h>
#include "audio_large.h"

void _start(void) {
    avm_audio_play(long_song);
    for(;;) avm_idle();
}
