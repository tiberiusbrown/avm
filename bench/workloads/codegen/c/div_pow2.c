#include <stdint.h>

static volatile int16_t values16[24];
static volatile int32_t values32[24];
static volatile uint32_t div_pow2_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 24; ++i) {
        values16[i] = (int16_t)((int16_t)i * 2371 - 27000);
        values32[i] = (int32_t)i * 178903 - 2000000;
    }

    __avm_debug_break();

    uint32_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 20; ++repeat) {
        for (uint8_t i = 0; i < 24; ++i) {
            int16_t a = values16[i];
            int32_t b = values32[i];
            checksum += (uint16_t)(a / 2);
            checksum ^= (uint16_t)(a % 8);
            checksum += (uint32_t)(b / 16);
            checksum ^= (uint32_t)(b % 4);
        }
    }
    div_pow2_result = checksum;

    __avm_debug_break();
    return 0;
}
