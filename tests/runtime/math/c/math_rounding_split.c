#include "math_test.h"

static int check_bits(uint32_t bits, uint32_t mask, uint32_t half)
{
    float x = from_bits(bits);
    uint32_t truncated = bits & ~mask;
    uint32_t away = (bits + mask + 1) & ~mask;
    uint32_t down = (bits & 0x80000000UL) ? away : truncated;
    uint32_t up = (bits & 0x80000000UL) ? truncated : away;
    if (!(bits & mask)) down = up = bits;
    return check_result(truncf(x), truncated, 0, 0) ||
           check_result(floorf(x), down, 0, 1) ||
           check_result(ceilf(x), up, 0, 2) ||
           check_result(roundf(x), (bits + half) & ~mask, 0, 3);
}

int avm_test_main(void)
{
    for (uint16_t e = 0; e < 23; ++e) {
        uint32_t base = (uint32_t)(e + 127) << 23;
        uint32_t half = 0x00400000UL >> e;
        uint32_t mask = (half << 1) - 1;
        uint32_t fractions[] = {
            0, 1, half - 1, half, half + 1, mask, mask + 1,
            0x7fff, 0x8000, 0xffff, 0x10000, 0x10001,
            0x7effff, 0x7f0000, 0x7fffff
        };
        for (uint8_t i = 0; i < sizeof(fractions) / sizeof(fractions[0]); ++i) {
            uint32_t bits = base | (fractions[i] & 0x007fffffUL);
            if (check_bits(bits, mask, half) ||
                check_bits(bits | 0x80000000UL, mask, half)) return 1;
        }
    }
    return 0;
}
