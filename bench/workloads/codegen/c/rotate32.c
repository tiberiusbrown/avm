#include <stdint.h>

static volatile uint32_t values[16];
static volatile uint8_t counts[16];
static volatile uint32_t rotate32_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        values[i] = UINT32_C(0x12345678) ^ ((uint32_t)i * 0x1020304u);
        counts[i] = (uint8_t)(i * 7u % 31u + 1u);
    }

    __avm_debug_break();

    uint32_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 24; ++repeat) {
        for (uint8_t i = 0; i < 16; ++i) {
            uint32_t value = values[i];
            uint8_t count = counts[i];
            checksum += (value << 8) | (value >> 24);
            checksum ^= (value >> 16) | (value << 16);
            checksum += (value << count) | (value >> (32u - count));
        }
    }
    rotate32_result = checksum;

    __avm_debug_break();
    return 0;
}
