#include <stdint.h>

static volatile uint16_t words[24];
static volatile uint16_t bit_count_result;

__attribute__((noinline))
static uint8_t count_set_bits(uint16_t value)
{
    uint8_t count = 0;
    while (value != 0) {
        value = (uint16_t)(value & (uint16_t)(value - 1u));
        ++count;
    }
    return count;
}

__attribute__((noinline))
static uint8_t count_trailing_zeroes(uint16_t value)
{
    uint8_t count = 0;
    while ((value & 1u) == 0) {
        value >>= 1;
        ++count;
    }
    return count;
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 24; ++i)
        words[i] = (uint16_t)(0x8001u ^ (uint16_t)(i * 2317u));

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 20; ++repeat) {
        for (uint8_t i = 0; i < 24; ++i) {
            uint16_t value = words[i];
            checksum += count_set_bits(value);
            checksum ^= count_trailing_zeroes(value | 0x8000u);
        }
    }
    bit_count_result = checksum;

    __avm_debug_break();
    return 0;
}
