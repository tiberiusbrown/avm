#include <math.h>
#include <stdint.h>

/* Bounded log/exp endpoints, adjacent fallback inputs, signed fractional
   exponents, plus multiplication-path bounds and their adjacent fallbacks. */
static volatile float inputs[32][2] = {
    {0.5f, 1.25f}, {0.5f, -1.25f}, {2.0f, 1.25f}, {2.0f, -1.25f},
    {0x1.fffffep-2f, 1.25f}, {0x1.000002p-1f, 1.25f},
    {0x1.fffffep0f, 1.25f}, {0x1.000002p1f, 1.25f},
    {0.75f, 0.25f}, {0.75f, -0.25f}, {1.25f, 0.75f}, {1.25f, -0.75f},
    {0x1.fffffep-1f, 1.25f}, {0x1.000002p0f, -1.25f},
    {0.5f, 0x1.400002p0f}, {2.0f, -0x1.400002p0f},
    {0x1p-15f, 3.0f}, {0x1p15f, -3.0f},
    {0x1p-15f, 4.0f}, {0x1p15f, -4.0f},
    {0x1p-15f, 5.0f}, {0x1p15f, -5.0f},
    {0x1.fffffep-16f, 5.0f}, {0x1.000002p15f, -5.0f},
    {-0x1p-15f, 3.0f}, {-0x1p15f, -3.0f},
    {-0x1p-15f, 4.0f}, {-0x1p15f, -4.0f},
    {-0x1p-15f, 5.0f}, {-0x1p15f, -5.0f},
    {0.75f, 6.0f}, {1.25f, -8.0f}
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += powf(inputs[i][0], inputs[i][1]);
    result = sum;
    __avm_debug_break();
    return 0;
}
