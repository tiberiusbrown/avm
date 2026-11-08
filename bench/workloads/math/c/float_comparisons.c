#include <stdint.h>

static volatile float first[16];
static volatile float second[16];
static volatile uint16_t float_comparisons_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        first[i] = (float)((int16_t)i - 8) * 0.375f;
        second[i] = (float)((int16_t)(i * 7u % 13u) - 6) * 0.5f;
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 24; ++repeat) {
        for (uint8_t i = 0; i < 16; ++i) {
            float a = first[i];
            float b = second[i];
            float minimum = a < b ? a : b;
            float maximum = a > b ? a : b;
            checksum += a == b;
            checksum += a != b;
            checksum += minimum < 0.0f;
            checksum ^= (uint16_t)(maximum >= 1.0f) << (i & 7u);
        }
    }
    float_comparisons_result = checksum;

    __avm_debug_break();
    return 0;
}
