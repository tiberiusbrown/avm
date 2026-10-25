#include <math.h>
#include <stdint.h>

/* Near-one endpoints, adjacent floats, powers of two and scaled near-one mantissas. */
static volatile float inputs[32] = {
    0.9375f, 0.93749994f, 0.93750006f, 0.96875f,
    0.984375f, 0.999f, 0x1.fffffep-1f, 1.0f,
    0x1.000002p0f, 1.001f, 1.015625f, 1.03125f,
    1.06249988f, 1.0625f, 1.06250012f, 1.125f,
    0x1p-149f, 0x1p-126f, 0x1p-68f, 0x1p-1f,
    0x1p1f, 0x1p68f, 0x1p126f, 0x1.fffffep127f,
    0x1.ep-31f, 0x1.1p-29f, 0x1.ep29f, 0x1.1p31f,
    0x1.fffffep-2f, 0x1.000002p-1f, 0x1.fffffep0f, 0x1.000002p1f,
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += log10f(inputs[i]);
    result = sum;
    __avm_debug_break();
    return 0;
}
