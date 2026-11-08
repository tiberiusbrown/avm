#include <math.h>
#include <stdint.h>

static volatile float inputs[16][2] = {
    {0x1p100f, 1.25f}, {0x1p-100f, 1.25f},
    {0x1p-149f, 0.5f}, {0x1.fffffep127f, -0.5f},
    {0x1p100f, -1.25f}, {0x1p-100f, -1.25f},
    {0x1p-80f, -1.5f}, {0x1p80f, -1.5f},
    {0x1p64f, -2.0f}, {0x1p-64f, -2.0f},
    {-0x1p40f, -3.0f}, {-0x1p-40f, -3.0f},
    {2.0f, 128.0f}, {2.0f, -150.0f},
    {0x1.000002p0f, 0x1p30f}, {0x1.fffffep-1f, 0x1p31f}
};
static volatile float results[32];
int avm_test_main(void)
{
    __avm_debug_break();
    for (uint8_t i=0; i<32; ++i) results[i]=powf(inputs[i&15][0],inputs[i&15][1]);
    __avm_debug_break();
    return 0;
}
