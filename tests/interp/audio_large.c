#include <avm.h>
#include "audio_large.h"

struct LargeRecord {
    uint8_t first[32768UL];
    uint8_t second[32768UL];
    uint8_t last[3];
};

static const struct LargeRecord AVM_PROGMEM large_record = {{0x12}, {0x34}, {0x56, 0x78, 0x9a}};
static volatile uint32_t large_index = 65536UL;
static volatile uint16_t record_index = 1;

void _start(void) {
    // Volatile indices force real program-memory loads across 64 KB, rather
    // than letting constant folding hide truncated array or record layouts.
    if(large_bytes[large_index] != 65536UL % 251 ||
        large_bytes[large_index + 2] != 65538UL % 251 ||
        large_record.last[record_index] != 0x78)
        __builtin_trap();
    avm_audio_play(long_song);
    for(;;) avm_idle();
}
