#include <stdint.h>

static volatile uint16_t values16[16];
static volatile int16_t signed_values16[16];
static volatile uint32_t values32[8];
static volatile uint8_t counts[16];
static volatile uint32_t shift_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        values16[i] = (uint16_t)(0x1234u + (uint16_t)i * 0x111u);
        signed_values16[i] = (int16_t)(-30000 + (int16_t)i * 731);
        counts[i] = (uint8_t)((i % 15u) + 1u);
    }
    for (uint8_t i = 0; i < 8; ++i)
        values32[i] = 0x81234567u ^ ((uint32_t)i * 0x11111111u);

    __avm_debug_break();

    uint32_t acc = 0;
    for (uint8_t repeat = 0; repeat < 8; ++repeat) {
        for (uint8_t i = 0; i < 16; ++i) {
            uint16_t value = values16[i];
            uint8_t count = counts[i];
            uint16_t rotate =
                (uint16_t)((value << count) | (value >> (16u - count)));

            acc += (uint16_t)(value << 1);
            acc ^= (uint16_t)(value >> 3);
            acc += rotate;
            acc ^= (uint16_t)(signed_values16[i] >> count);
        }
        for (uint8_t i = 0; i < 8; ++i) {
            uint32_t value = values32[i];
            uint8_t count = counts[i];
            acc += value << count;
            acc ^= value >> count;
        }
    }
    shift_result = acc;

    __avm_debug_break();
    return 0;
}
