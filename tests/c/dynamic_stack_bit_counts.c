#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))

static NOINLINE uint16_t consume(const uint8_t *bytes, uint8_t length)
{
    uint16_t checksum = 0x1234u;
    for(uint8_t i = 0; i < length; ++i)
        checksum = (uint16_t)((checksum << 1) ^ bytes[i]);
    return checksum;
}

static NOINLINE uint16_t dynamic_buffer(uint8_t length, uint8_t seed)
{
    volatile uint16_t fixed = 0x55aau;
    uint8_t bytes[length];
    for(uint8_t i = 0; i < length; ++i)
        bytes[i] = (uint8_t)(seed + (uint8_t)(i * 13u));
    uint16_t checksum = consume(bytes, length);
    return checksum ^ fixed;
}

int avm_test_main(void)
{
    volatile uint8_t lengths[3] = {1, 8, 23};
    volatile uint16_t words[4] = {0x0001u, 0x8000u, 0x00f0u, 0xa5a5u};
    uint16_t pop16 = 0, clz16 = 0, ctz16 = 0;
    for(uint8_t i = 0; i < 4; ++i) {
        pop16 += (uint16_t)__builtin_popcount(words[i]);
        clz16 += (uint16_t)__builtin_clz(words[i]);
        ctz16 += (uint16_t)__builtin_ctz(words[i]);
    }

    uint16_t d1 = dynamic_buffer(lengths[0], 3);
    uint16_t d8 = dynamic_buffer(lengths[1], 17);
    uint16_t d23 = dynamic_buffer(lengths[2], 95);
    test_line16("P16", pop16);
    test_line16("L16", clz16);
    test_line16("T16", ctz16);
    test_line16("D1", d1);
    test_line16("D8", d8);
    test_line16("D23", d23);
    return pop16 != 14 || clz16 != 23 || ctz16 != 19 ||
           d1 != 0x71c1u || d8 != 0x6bf8u || d23 != 0x86dbu;
}
