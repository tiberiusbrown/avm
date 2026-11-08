#include <stdint.h>

static uint16_t values[64];
static volatile uint16_t constant_arith_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 64; ++i)
        values[i] = (uint16_t)(i * 257u + 123u);

    __avm_debug_break();

    uint16_t result = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        for (uint8_t i = 0; i < 64; ++i) {
            uint16_t x = values[i];
            result = (uint16_t)(result + x * 3u);
            result ^= (uint16_t)(x * 5u);
            result = (uint16_t)(result + x * 7u);
            result ^= (uint16_t)(x * 10u);
            result = (uint16_t)(result + x * 31u);
            result ^= (uint16_t)(x * 257u);

            result = (uint16_t)(result + x / 2u + x % 2u);
            result ^= (uint16_t)(x / 3u + x % 3u);
            result = (uint16_t)(result + x / 5u + x % 5u);
            result ^= (uint16_t)(x / 10u + x % 10u);

            int16_t sx = (int16_t)(x ^ 0x8000u);
            result = (uint16_t)(result + (uint16_t)(sx / 3));
            result ^= (uint16_t)(sx % 5);
        }
    }
    constant_arith_result = result;

    __avm_debug_break();
    return 0;
}
