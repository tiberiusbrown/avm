#include <stdint.h>

static volatile uint16_t words[24];
static volatile uint16_t result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 24; ++i)
        words[i] = (uint16_t)(0x1800u ^ (uint16_t)(i * 2317u));

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 20; ++repeat) {
        for (uint8_t i = 0; i < 24; ++i)
            checksum += (uint16_t)__builtin_ctz(words[i] | 0x8000u);
    }
    result = checksum;

    __avm_debug_break();
    return 0;
}
