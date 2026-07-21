#include <stdint.h>

static volatile int8_t signed_bytes[32];
static volatile uint8_t unsigned_bytes[32];
static volatile int16_t signed_words[32];
static volatile uint32_t wide_values[32];
static volatile int32_t mixed_width_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i) {
        signed_bytes[i] = (int8_t)((int16_t)i - 16);
        unsigned_bytes[i] = (uint8_t)(i * 5u);
        signed_words[i] = (int16_t)(-4000 + (int16_t)i * 251);
        wide_values[i] = (uint32_t)((int32_t)i - 20);
    }

    __avm_debug_break();

    int32_t acc = 0;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            int16_t sx8 = signed_bytes[i];
            uint16_t zx8 = unsigned_bytes[i];
            int32_t sx16 = signed_words[i];
            uint32_t zx16 = (uint16_t)signed_words[i];

            int8_t narrow8 = (int8_t)wide_values[i];
            int16_t narrow16 = (int16_t)wide_values[i];

            acc += (int32_t)sx8 * 257 + (int32_t)zx8;
            acc ^= sx16 + (int32_t)zx16;
            acc += (int32_t)narrow8 + (int32_t)narrow16;
        }
    }
    mixed_width_result = acc;

    __avm_debug_break();
    return 0;
}
