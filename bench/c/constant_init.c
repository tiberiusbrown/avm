#include <stdint.h>

static uint16_t values[32];
static volatile uint16_t constant_init_result;

static __attribute__((noinline)) void populate(uint16_t* dst)
{
    for (uint8_t i = 0; i < 32; ++i)
        dst[i] = (uint16_t)((uint16_t)i * 2053u + 63u);
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 128; ++repeat) {
        populate(values);
        checksum = (uint16_t)(checksum + values[repeat & 31u]);
    }
    constant_init_result = checksum;

    __avm_debug_break();
    return 0;
}
