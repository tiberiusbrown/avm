#ifndef AVM_BENCH_MATH_ROUNDING_INPUTS_H
#define AVM_BENCH_MATH_ROUNDING_INPUTS_H

#include <avm.h>
#include <stdint.h>

/* Both signs of 16 magnitudes, including the word boundary at exponent 7,
 * halfway cases, carries into the exponent, and already integral values. */
static const AVM_PROGMEM uint32_t rounding_bits[16] = {
    0x00000000UL, 0x00000001UL, 0x3effffffUL, 0x3f000000UL,
    0x3f000001UL, 0x3fa00000UL, 0x3fc00000UL, 0x3fffffffUL,
    0x427fffffUL, 0x42810000UL, 0x42ffffffUL, 0x43008000UL,
    0x437fffffUL, 0x43804000UL, 0x4affffffUL, 0x4b000000UL
};
static volatile float rounding_inputs[32];

static void init_rounding_inputs(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        union { uint32_t u; float f; } value = {rounding_bits[i]};
        rounding_inputs[2 * i] = value.f;
        value.u |= 0x80000000UL;
        rounding_inputs[2 * i + 1] = value.f;
    }
}

#endif
