#include <math.h>
#include <stdint.h>

/* Positive and negative bases/exponents 3..8, fast-path bounds, range fallbacks and special cases. */
static volatile float inputs[32][2] = {
    {1.03125f, 3.0f},
    {0.75f, 4.0f},
    {1.03125f, 5.0f},
    {0.75f, 6.0f},
    {1.03125f, 7.0f},
    {0.75f, 8.0f},
    {-1.03125f, 3.0f},
    {-0.75f, 4.0f},
    {-1.03125f, 5.0f},
    {-0.75f, 6.0f},
    {-1.03125f, 7.0f},
    {-0.75f, 8.0f},
    {1.03125f, -3.0f},
    {0.75f, -4.0f},
    {1.03125f, -5.0f},
    {0.75f, -6.0f},
    {1.03125f, -7.0f},
    {0.75f, -8.0f},
    {-1.03125f, -3.0f},
    {-0.75f, -4.0f},
    {-1.03125f, -5.0f},
    {-0.75f, -6.0f},
    {-1.03125f, -7.0f},
    {-0.75f, -8.0f},
    {0x1p-15f, 8.0f},
    {0x1p15f, -8.0f},
    {0x1p-20f, -8.0f},
    {0x1p20f, -8.0f},
    {0.0f, -3.0f},
    {-0.0f, 3.0f},
    {1.25f, 1.25f},
    {-2.0f, 0.5f},
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
