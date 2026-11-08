#include <math.h>
#include <stdint.h>

/* Paired signs cover small, medium, and large argument reduction. */
static volatile float inputs[32] = {
    0.25f, -0.25f, 0.75f, -0.75f,
    1.25f, -1.25f, 2.0f, -2.0f,
    3.0f, -3.0f, 16.0f, -16.0f,
    128.0f, -128.0f, 201.0f, -201.0f,
    256.0f, -256.0f,
    0x1.234568p16f, -0x1.234568p16f,
    0x1.234568p32f, -0x1.234568p32f,
    0x1.234568p48f, -0x1.234568p48f,
    0x1.234568p64f, -0x1.234568p64f,
    0x1.234568p80f, -0x1.234568p80f,
    0x1.234568p96f, -0x1.234568p96f,
    0x1.fffffep127f, -0x1.fffffep127f
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i) {
        float x = inputs[i];
        sum += tanf(x);
    }
    result = sum;
    __avm_debug_break();
    return 0;
}
