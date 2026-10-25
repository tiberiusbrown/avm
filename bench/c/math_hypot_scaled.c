#include <math.h>
#include <stdint.h>

/* Ordinary operands, both scaling directions, subnormals, zeros and large exponent gaps. */
static volatile float inputs[32][2] = {
    {0.75f, 0.25f},
    {-0.75f, 0.25f},
    {0.75f, 0.75f},
    {-0.75f, 0.75f},
    {3.0f, 4.0f},
    {-3.0f, 4.0f},
    {0x1p30f, 1.0f},
    {-0x1p30f, 1.0f},
    {0x1p50f, 0x1p49f},
    {-0x1p50f, 0x1p49f},
    {0x1p51f, 0x1p50f},
    {-0x1p51f, 0x1p50f},
    {0x1p126f, 0x1p125f},
    {-0x1p126f, 0x1p125f},
    {0x1p-50f, 0x1p-51f},
    {-0x1p-50f, 0x1p-51f},
    {0x1p-68f, 0x1p-69f},
    {-0x1p-68f, 0x1p-69f},
    {0x1p-126f, 0x1p-127f},
    {-0x1p-126f, 0x1p-127f},
    {0x1p-149f, 0x1p-149f},
    {-0x1p-149f, 0x1p-149f},
    {0x1.fffffcp-127f, 0x1p-149f},
    {-0x1.fffffcp-127f, 0x1p-149f},
    {0x1.fffffep-1f, 0x1p-1f},
    {-0x1.fffffep-1f, 0x1p-1f},
    {0.25f, 0.0f},
    {-0.25f, 0.0f},
    {0x1p100f, 0x1p-100f},
    {-0x1p100f, 0x1p-100f},
    {1.25f, 1.0f},
    {-1.25f, 1.0f},
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += hypotf(inputs[i][0], inputs[i][1]);
    result = sum;
    __avm_debug_break();
    return 0;
}
