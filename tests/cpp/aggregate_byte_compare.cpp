#include <stdint.h>

struct ChunkCoord {
    uint8_t area, x, y;
};

static volatile uint8_t input;
static volatile uint16_t words[] = {0, 1, 127, 128, 255, 256, 32767, 32768, 65535};

#define NOINLINE __attribute__((noinline))
#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)

static NOINLINE uint16_t dispatch(ChunkCoord coord)
{
    switch (coord.area) {
    case 1: return (uint16_t)(coord.y * 3u + coord.x);
    default: return 0xffffu;
    }
}

static NOINLINE uint16_t masked_compare(uint32_t a, uint32_t b)
{
    a &= 0xffffUL;
    b &= 0xffffUL;
    return (uint16_t)((a == b) | ((a != b) << 1) | ((a < b) << 2) |
                      ((a <= b) << 3) | ((a > b) << 4) | ((a >= b) << 5) |
                      (((int32_t)a < (int32_t)b) << 6) |
                      (((int32_t)a >= (int32_t)b) << 7));
}

static NOINLINE uint16_t prefixed_compare(uint32_t a, uint32_t b)
{
    int32_t left = (int32_t)((a & 0xffffUL) | 0xffff0000UL);
    int32_t right = (int32_t)((b & 0xffffUL) | 0xffff0000UL);
    return (uint16_t)((left < right) | ((left >= right) << 1));
}

static NOINLINE uint16_t signed_compare(int16_t a, int16_t b)
{
    int32_t left = a, right = b;
    return (uint16_t)((left < right) | (((uint32_t)left < (uint32_t)right) << 1));
}

static NOINLINE bool wide_equal(uint32_t a, uint32_t b)
{
    return a == b;
}

static NOINLINE bool mixed_less(int16_t a, uint16_t b)
{
    return (int32_t)a < (int32_t)(uint32_t)b;
}

extern "C" int avm_test_main()
{
    for (uint16_t i = 0; i < 256; ++i) {
        input = (uint8_t)i;
        ChunkCoord coord{input, (uint8_t)(i ^ 0x80u), (uint8_t)(i ^ 0xffu)};
        uint16_t expected = i == 1 ? (uint16_t)(254u * 3u + 129u) : 0xffffu;
        CHECK(dispatch(coord) == expected);
    }

    for (uint8_t i = 0; i < 9; ++i) {
        for (uint8_t j = 0; j < 9; ++j) {
            uint16_t a = words[i], b = words[j];
            uint16_t expected = (uint16_t)((a == b) | ((a != b) << 1) |
                ((a < b) << 2) | ((a <= b) << 3) | ((a > b) << 4) |
                ((a >= b) << 5) | ((a < b) << 6) | ((a >= b) << 7));
            CHECK(masked_compare(0x12340000UL | a, 0xabcd0000UL | b) == expected);
            CHECK(prefixed_compare(a, b) == (uint16_t)((a < b) | ((a >= b) << 1)));
            CHECK(signed_compare((int16_t)a, (int16_t)b) ==
                (uint16_t)(((int16_t)a < (int16_t)b) | ((a < b) << 1)));
            CHECK(mixed_less((int16_t)a, b) == ((int16_t)a < 0 || a < b));
            CHECK(!wide_equal(0x10000UL | a, (uint32_t)a));
        }
    }
    return 0;
}
