#include <math.h>
#include <stdint.h>

/* Negative exponent packing, gradual underflow, reduction boundaries,
   ordinary positive exponents and the finite overflow boundary. */
static volatile float inputs[32] = {
    -103.9f, -103.5f, -100.0f, -90.0f,
    -88.0f, -87.5f, -68.0f, -16.0f,
    -2.0f, -1.0f, -0.75f, -0.5f,
    -0.3465736f, -0.125f, -0x1p-24f, -0.0f,
    0.0f, 0x1p-24f, 0.125f, 0.3465736f,
    0.5f, 0.75f, 1.0f, 2.0f,
    4.0f, 8.0f, 16.0f, 32.0f,
    64.0f, 68.0f, 88.0f, 88.7f
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += expf(inputs[i]);
    result = sum;
    __avm_debug_break();
    return 0;
}
