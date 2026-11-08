#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))

static volatile uint16_t input;

static NOINLINE uint16_t check_bytes(const uint8_t *bytes, uint16_t seed,
                                    uint8_t step)
{
    uint16_t failures = 0;
    uint8_t expected = (uint8_t)seed;
    for(uint8_t i = 0; i < 23; ++i) {
        failures += bytes[i] != expected;
        expected = (uint8_t)(expected + step);
    }
    return failures;
}

static NOINLINE uint16_t bytes_forward(uint16_t seed)
{
    uint8_t bytes[23];
    for(uint8_t i = 0; i < 23; ++i)
        bytes[i] = (uint8_t)(seed + (uint16_t)i * 13u);
    return check_bytes(bytes, seed, 13);
}

static NOINLINE uint16_t bytes_reverse(uint16_t seed)
{
    uint8_t bytes[23];
    for(uint8_t i = 0; i < 23; ++i)
        bytes[i] = (uint8_t)(seed - (uint16_t)i * 29u);
    return check_bytes(bytes, seed, (uint8_t)-29);
}

static NOINLINE uint16_t check_words(const uint16_t *words, uint16_t seed)
{
    uint16_t failures = 0;
    uint16_t expected = (uint16_t)(seed + 32760u);
    for(uint8_t i = 0; i < 9; ++i) {
        failures += words[i] != expected;
        expected = (uint16_t)(expected + 7u);
    }
    return failures;
}

static NOINLINE uint16_t words_forward(uint16_t seed)
{
    uint16_t words[9];
    for(uint8_t i = 0; i < 9; ++i)
        words[i] = (uint16_t)(seed + 32760u + (uint16_t)i * 7u);
    return check_words(words, seed);
}

static NOINLINE uint16_t check_shared(const uint8_t *bytes, uint16_t seed)
{
    return bytes[0] != (uint8_t)(seed + 117u) ||
           bytes[1] != (uint8_t)(seed - 126u) ||
           bytes[2] != (uint8_t)(seed + 143u);
}

static NOINLINE uint16_t shared_value(uint16_t seed, uint16_t *full)
{
    uint8_t bytes[3];
    bytes[0] = (uint8_t)(seed + 117u);
    uint16_t value = (uint16_t)(seed - 126u);
    bytes[1] = (uint8_t)value;
    bytes[2] = (uint8_t)(seed + 143u);
    *full = value;
    return check_shared(bytes, seed);
}

int avm_test_main(void)
{
    static const uint16_t seeds[] = {
        0, 1, 127, 128, 255, 256, 0x2345, 0x7fff, 0x8000, 0xff80, 0xffff
    };
    uint16_t failures = 0;
    for(uint8_t i = 0; i < sizeof(seeds) / sizeof(seeds[0]); ++i) {
        input = seeds[i];
        uint16_t seed = input;
        failures += bytes_forward(seed);
        failures += bytes_reverse(seed);
        failures += words_forward(seed);
        uint16_t full;
        failures += shared_value(seed, &full);
        failures += full != (uint16_t)(seed - 126u);
    }
    test_line16("failures", failures);
    return failures != 0;
}
