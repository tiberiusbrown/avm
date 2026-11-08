#include <stdint.h>

struct ChunkCoord { uint8_t area, x, y; };

static volatile uint8_t positions[16];
static volatile uint8_t area;
static volatile uint16_t aggregate_byte_packing_hoisted_result;

__attribute__((noinline)) uint16_t consume_coord(ChunkCoord coord)
{
    return (uint16_t)(coord.area + (uint16_t)coord.x * 3u +
                      (uint16_t)coord.y * 5u);
}

extern "C" int avm_test_main()
{
    for (uint8_t i = 0; i < 16; ++i)
        positions[i] = (uint8_t)(i * 37u);
    area = 129;

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 8; ++repeat) {
        for (uint8_t row = 0; row < 16; ++row) {
            uint8_t y = positions[row];
            for (uint8_t col = 0; col < 16; ++col) {
                uint8_t x = positions[col];
                checksum = (uint16_t)(checksum + consume_coord({area, x, y}));
            }
        }
    }
    aggregate_byte_packing_hoisted_result = checksum;

    __avm_debug_break();
    return 0;
}
