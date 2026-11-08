#include <stdint.h>

static volatile float floats[16];
static volatile int32_t integers[16];
static volatile uint32_t float_conversions_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        floats[i] = (float)((int16_t)i * 273 - 1800) * 0.25f;
        integers[i] = (int32_t)i * 37001 - 230000;
    }

    __avm_debug_break();

    uint32_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 12; ++repeat) {
        for (uint8_t i = 0; i < 16; ++i) {
            float value = floats[i];
            int32_t integer = integers[i];
            int16_t narrow = (int16_t)value;
            int32_t wide = (int32_t)value;
            uint32_t positive = (uint32_t)(value + 1024.0f);
            float converted = (float)integer * 0.125f +
                              (float)(uint16_t)(integer + 300000);
            checksum += (uint16_t)narrow;
            checksum ^= (uint32_t)wide + positive;
            checksum += (uint32_t)(converted + 100000.0f);
        }
    }
    float_conversions_result = checksum;

    __avm_debug_break();
    return 0;
}
