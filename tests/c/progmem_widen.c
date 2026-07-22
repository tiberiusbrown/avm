#include <avm/pgmspace.h>
#include <stdint.h>

#include "test_hex_output.h"

#if defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

static const uint8_t AVM_PROGMEM program_bytes[96] = {
    0x6b, 0x9f, 0xab, 0x67, 0x23, 0xaf, 0x63, 0x27, 0x2b, 0x7f, 0xab, 0xd7,
    0x73, 0xcf, 0x93, 0x77, 0x0b, 0xdf, 0x8b, 0xc7, 0x03, 0x4f, 0x83, 0xc7,
    0x0b, 0x3f, 0x8b, 0x57, 0x33, 0xef, 0x93, 0xb7, 0xeb, 0x5f, 0xab, 0xe7,
    0x23, 0x2f, 0xe3, 0xa7, 0x2b, 0xff, 0xab, 0x97, 0xf3, 0x0f, 0x53, 0xf7,
    0x4b, 0x1f, 0xcb, 0x87, 0x43, 0x0f, 0x43, 0x87, 0xcb, 0x3f, 0x4b, 0x97,
    0xb3, 0x6f, 0xd3, 0xb7, 0x6b, 0x1f, 0x2b, 0x67, 0xa3, 0x2f, 0x63, 0xa7,
    0xab, 0x7f, 0x2b, 0xd7, 0x73, 0xcf, 0x13, 0x77, 0x8b, 0xdf, 0x0b, 0xc7,
    0x83, 0x4f, 0x03, 0xc7, 0x8b, 0xbf, 0x0b, 0x57, 0xb3, 0xef, 0x13, 0x37
};

static const uint16_t AVM_PROGMEM program_words[40] = {
    0xb60d, 0xe0f5, 0x5619, 0x8421, 0xf5ed, 0x2855, 0x9ac1, 0xd4d9,
    0x026d, 0x73a5, 0xa399, 0x2c71, 0x7a8d, 0x8885, 0xd971, 0x6d99,
    0xbdad, 0xc175, 0x1ed9, 0xacc1, 0xff4d, 0x0fd5, 0x5f21, 0xef19,
    0x3f0d, 0x5105, 0x8119, 0xcdf1, 0x7d2d, 0xa925, 0xd8f1, 0x0b59,
    0xb34d, 0xe3f5, 0x1359, 0x42a1, 0xf4ed, 0x2a95, 0x5981, 0xf599
};

static uint16_t rotate_left(uint16_t value, uint8_t count)
{
    return (uint16_t)((uint16_t)(value << count) |
                      (uint16_t)(value >> (uint8_t)(16 - count)));
}

static NOINLINE uint16_t
sum_bytes(const uint8_t AVM_PROGMEM *base, uint16_t count)
{
    uint16_t sum = 0;
    const uint8_t AVM_PROGMEM *p = base;

    for(uint16_t i = 0; i < count; ++i)
        sum = (uint16_t)(sum + *p++);

    return sum;
}

static NOINLINE uint16_t
sum_signed_bytes(const uint8_t AVM_PROGMEM *base, uint16_t count)
{
    uint16_t sum = 0;
    const uint8_t AVM_PROGMEM *p = base;

    for(uint16_t i = 0; i < count; ++i)
        sum = (uint16_t)(sum + (int16_t)(int8_t)*p++);

    return sum;
}

static NOINLINE uint16_t
mix_bytes(const uint8_t AVM_PROGMEM *base, uint16_t count)
{
    uint16_t value = 0x6d2b;
    const uint8_t AVM_PROGMEM *p = base;

    for(uint16_t i = 0; i < count; ++i) {
        const uint16_t byte = *p++;
        value = rotate_left(value, 1);
        value ^= (uint16_t)(byte * 0x0101u);
        value = (uint16_t)(value + (uint16_t)(i * 17u + 3u));
    }

    return value;
}

static NOINLINE uint16_t
sum_byte_pairs(const uint8_t AVM_PROGMEM *base, uint16_t pair_count)
{
    uint16_t sum = 0;
    const uint8_t AVM_PROGMEM *p = base;

    for(uint16_t i = 0; i < pair_count; ++i) {
        const uint16_t low = *p++;
        const uint16_t high = *p++;
        sum = (uint16_t)(sum | 0u);
        sum = (uint16_t)(sum + (uint16_t)(low | (uint16_t)(high << 8)));
    }

    return sum;
}

static NOINLINE uint16_t
sum_words(const uint16_t AVM_PROGMEM *base, uint16_t count)
{
    uint16_t sum = 0;
    const uint16_t AVM_PROGMEM *p = base;

    for(uint16_t i = 0; i < count; ++i)
        sum = (uint16_t)(sum + *p++);

    return sum;
}

int avm_test_main(void)
{
    volatile uint16_t byte_count_0 = 65;
    volatile uint16_t byte_count_1 = 62;
    volatile uint16_t signed_count = 37;
    volatile uint16_t mix_count = 41;
    volatile uint16_t pair_count = 23;
    volatile uint16_t word_count_0 = 33;
    volatile uint16_t word_count_1 = 17;

    const uint16_t b0 = sum_bytes(program_bytes, byte_count_0);
    const uint16_t b1 = sum_bytes(program_bytes + 1, byte_count_1);
    const uint16_t bs = sum_signed_bytes(program_bytes + 3, signed_count);
    const uint16_t bm = mix_bytes(program_bytes + 2, mix_count);
    const uint16_t p0 = sum_byte_pairs(program_bytes + 1, pair_count);
    const uint16_t w0 = sum_words(program_words, word_count_0);
    const uint16_t w1 = sum_words(program_words + 1, word_count_1);

    test_line16("B0", b0);
    test_line16("B1", b1);
    test_line16("BS", bs);
    test_line16("BM", bm);
    test_line16("P0", p0);
    test_line16("W0", w0);
    test_line16("W1", w1);

    return b0 != 0x20ab || b1 != 0x1f1e || bs != 0xff63 ||
           bm != 0x59d2 || p0 != 0x4a31 || w0 != 0xd46d ||
           w1 != 0x5865;
}
