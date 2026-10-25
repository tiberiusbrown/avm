#include <math.h>
#include <stdint.h>

/* All quadrants, ratios on either side of one, subnormal pairs and extreme exponent gaps. */
static volatile float inputs[32][2] = {
    {0.25f, 0.75f},
    {-0.25f, 0.75f},
    {0.25f, -0.75f},
    {-0.25f, -0.75f},
    {0.75f, 0.25f},
    {-0.75f, 0.25f},
    {0.75f, -0.25f},
    {-0.75f, -0.25f},
    {3.0f, 2.0f},
    {-3.0f, 2.0f},
    {3.0f, -2.0f},
    {-3.0f, -2.0f},
    {2.0f, 3.0f},
    {-2.0f, 3.0f},
    {2.0f, -3.0f},
    {-2.0f, -3.0f},
    {0x1p50f, 0x1p-50f},
    {-0x1p50f, 0x1p-50f},
    {0x1p50f, -0x1p-50f},
    {-0x1p50f, -0x1p-50f},
    {0x1p-50f, 0x1p50f},
    {-0x1p-50f, 0x1p50f},
    {0x1p-50f, -0x1p50f},
    {-0x1p-50f, -0x1p50f},
    {0x1p-149f, 0x1p-148f},
    {-0x1p-149f, 0x1p-148f},
    {0x1p-149f, -0x1p-148f},
    {-0x1p-149f, -0x1p-148f},
    {0.75000006f, 0.75f},
    {-0.75000006f, 0.75f},
    {0.75000006f, -0.75f},
    {-0.75000006f, -0.75f},
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += atan2f(inputs[i][0], inputs[i][1]);
    result = sum;
    __avm_debug_break();
    return 0;
}
