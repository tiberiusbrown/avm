#include <stdint.h>

static volatile float input_a[16];
static volatile float input_b[16];
static volatile float float_result;
static volatile int16_t float_integer_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        input_a[i] = (float)i * 0.25f - 1.5f;
        input_b[i] = (float)i * 0.125f + 0.75f;
    }

    __avm_debug_break();

    float acc = 0.5f;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        for (uint8_t i = 0; i < 16; ++i) {
            float a = input_a[i];
            float b = input_b[i];
            float value = (a * b + acc) / (b + 1.25f);
            value = value < -2.0f ? -2.0f : value;
            value = value > 3.0f ? 3.0f : value;
            acc += value + (float)i;
        }
    }
    float_result = acc;
    float_integer_result = (int16_t)acc;

    __avm_debug_break();
    return 0;
}
