#include <math.h>
#include <stdint.h>

/* Both signs around every atan reduction boundary and at extreme magnitudes. */
static volatile float inputs[32] = {
    0x1p-149f, -0x1p-149f, 0x1p-29f, -0x1p-29f,
    0.25f, -0.25f, 0.43749997f, -0.43749997f,
    0.4375f, -0.4375f, 0.5f, -0.5f,
    0.6875f, -0.6875f, 1.0f, -1.0f,
    1.1875f, -1.1875f, 1.5f, -1.5f,
    2.43749976f, -2.43749976f, 2.4375f, -2.4375f,
    4.0f, -4.0f, 0x1p16f, -0x1p16f,
    0x1p34f, -0x1p34f, 0x1.fffffep127f, -0x1.fffffep127f,
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += atanf(inputs[i]);
    result = sum;
    __avm_debug_break();
    return 0;
}
