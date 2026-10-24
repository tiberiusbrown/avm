#include <stdint.h>

struct ChunkCoord {
    uint8_t area, x, y;
};

static volatile ChunkCoord input[32];
static volatile uint16_t aggregate_byte_dispatch_result;

__attribute__((noinline)) static uint16_t dispatch(ChunkCoord coord)
{
    switch (coord.area) {
    case 1:
        switch ((uint16_t)coord.y * 3u + coord.x) {
        case 3: return 11;
        case 4: return 37;
        default: return 83;
        }
    default:
        return 149;
    }
}

extern "C" int avm_test_main()
{
    for (uint8_t i = 0; i < 32; ++i) {
        static const uint8_t areas[] = {0, 1, 1, 1, 127, 128, 255, 1};
        input[i].area = areas[i & 7u];
        input[i].x = i & 3u;
        input[i].y = (i >> 2) & 3u;
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            ChunkCoord coord{input[i].area, input[i].x, input[i].y};
            checksum = (uint16_t)(checksum + dispatch(coord));
        }
    }
    aggregate_byte_dispatch_result = checksum;

    __avm_debug_break();
    return 0;
}
