#include <math.h>
#include <stdint.h>

static volatile float inputs[32];
static volatile float result;

int avm_test_main(void)
{
    /* Both exponent parities at 16 evenly spaced mantissas. Alternate just
     * below and just above lookup boundaries, including the top of [1,4). */
    for (uint8_t i = 0; i < 32; ++i) {
        uint32_t bits = 0x3f800000UL + ((uint32_t)(i & 1) << 23) +
                        ((uint32_t)(i >> 1) << 19);
        bits += (i & 2) ? 0x0007ffffUL : 1;
        union { uint32_t u; float f; } value = {bits};
        inputs[i] = value.f;
    }
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += sqrtf(inputs[i]);
    result = sum;
    __avm_debug_break();
    return 0;
}
