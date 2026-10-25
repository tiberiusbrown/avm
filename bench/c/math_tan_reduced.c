#include <math.h>
#include <stdint.h>

/* Reduced polynomial, pi/4 transform, reciprocal and both sides of the first pole. */
static volatile float inputs[32] = {
    0x1p-149f, -0x1p-149f, 0x1p-28f, -0x1p-28f,
    0.125f, -0.125f, 0.25f, -0.25f,
    0.5f, -0.5f, 0.67439997f, -0.67439997f,
    0.67440003f, -0.67440003f, 0x1.921fb4p-1f, -0x1.921fb4p-1f,
    0x1.921fb6p-1f, -0x1.921fb6p-1f, 1.0f, -1.0f,
    0x1.921fb4p0f, -0x1.921fb4p0f, 0x1.921fb6p0f, -0x1.921fb6p0f,
    0x1.921fb8p0f, -0x1.921fb8p0f, 2.0f, -2.0f,
    3.0f, -3.0f, 4.0f, -4.0f,
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += tanf(inputs[i]);
    result = sum;
    __avm_debug_break();
    return 0;
}
