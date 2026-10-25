#include <math.h>
#include <avm.h>
#include <stdint.h>

/* Positive finite inputs: subnormal normalization, both exponent parities,
 * powers of two and their neighbors, and magnitudes across binary32. */
static const AVM_PROGMEM uint32_t input_bits[32] = {
    0x00000001UL, 0x00000002UL, 0x000001ffUL, 0x00010001UL,
    0x00200000UL, 0x00400001UL, 0x007fffffUL, 0x00800000UL,
    0x00800001UL, 0x0c123456UL, 0x14ffffffUL, 0x20800000UL,
    0x2b654321UL, 0x35000001UL, 0x3e7fffffUL, 0x3e800000UL,
    0x3f7fffffUL, 0x3f800000UL, 0x3f800001UL, 0x3fffffffUL,
    0x40000000UL, 0x40000001UL, 0x407fffffUL, 0x40800000UL,
    0x40800001UL, 0x4b123456UL, 0x55ffffffUL, 0x60800000UL,
    0x6b654321UL, 0x75000001UL, 0x7f000000UL, 0x7f7fffffUL
};
static volatile float inputs[32];
static volatile float result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i) {
        union { uint32_t u; float f; } value = {input_bits[i]};
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
