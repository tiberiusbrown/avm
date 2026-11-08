#include <math.h>
#include <stdint.h>

/* Leave static storage for errno; retain the last case on the stack. */
static volatile float inputs[255];

int avm_test_main(void)
{
    /* A reproducible random mantissa at every finite exponent, plus the
     * largest finite input. Generate before timing and keep calls volatile. */
    volatile float largest = 0x1.fffffep127f;
    uint32_t state = 0x12345678UL;
    for (uint16_t i = 0; i < 255; ++i) {
        state = state * 1664525UL + 1013904223UL;
        uint32_t bits = ((uint32_t)i << 23) | (state & 0x007fffffUL);
        union { uint32_t u; float f; } value = {bits};
        inputs[i] = value.f;
    }
    float sum = 0.0f;
    __avm_debug_break();
    for (uint16_t i = 0; i < 255; ++i)
        sum += sqrtf(inputs[i]);
    sum += sqrtf(largest);
    inputs[0] = sum;
    __avm_debug_break();
    return 0;
}

