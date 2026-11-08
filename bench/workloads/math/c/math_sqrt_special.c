#include <avm.h>
#include <math.h>
#include <stdint.h>

static const AVM_PROGMEM uint32_t input_bits[16] = {
    0x00000000UL, 0x00000001UL, 0x00000100UL, 0x00400000UL,
    0x007fffffUL, 0x00800000UL, 0x00800001UL, 0x3f800000UL,
    0x40000000UL, 0x407fffffUL, 0x40800000UL, 0x7f7fffffUL,
    0x7f800000UL, 0x7fc12345UL, 0x7fa12345UL, 0x7fffffffUL
};
static volatile float inputs[32];
static volatile float results[32];

int avm_test_main(void)
{
    /* Both signs: zeros, subnormals, finite values, infinities, quiet and
     * signaling NaNs. Store separately so NaNs do not change later sums. */
    for (uint8_t i = 0; i < 16; ++i) {
        union { uint32_t u; float f; } value = {input_bits[i]};
        inputs[2 * i] = value.f;
        value.u |= 0x80000000UL;
        inputs[2 * i + 1] = value.f;
    }
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        results[i] = sqrtf(inputs[i]);
    __avm_debug_break();
    return 0;
}
