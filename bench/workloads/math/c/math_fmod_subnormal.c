#include <avm.h>
#include <math.h>
#include <stdint.h>

/* Both signs, subnormal normalization in either operand, exact zeros and
   large exponent gaps that use the fixed-point remainder loop. */
static const AVM_PROGMEM uint32_t pairs[16][2] = {
    {3, 2}, {5, 3}, {0x0000ffffUL, 3}, {0x00010000UL, 3},
    {0x00010001UL, 0x0000ffffUL}, {0x007fffffUL, 2},
    {0x007fffffUL, 0x00010001UL}, {0x00800000UL, 3},
    {0x00800001UL, 0x007fffffUL}, {0x01000000UL, 1},
    {0x3f800000UL, 0x00080001UL}, {0x3f800000UL, 0x00800000UL},
    {0x00800000UL, 0x00800001UL}, {0x3fc00000UL, 0x3f800000UL},
    {0x40a00000UL, 0x40000000UL}, {0x3f800000UL, 0x3f800000UL}
};
static volatile float inputs[32][2];
static volatile float result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        union { uint32_t u; float f; } a = {pairs[i][0]}, b = {pairs[i][1]};
        inputs[2*i][0] = a.f;
        a.u |= 0x80000000UL;
        inputs[2*i+1][0] = a.f;
        inputs[2*i][1] = inputs[2*i+1][1] = b.f;
    }
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += fmodf(inputs[i][0], inputs[i][1]);
    result = sum;
    __avm_debug_break();
    return 0;
}
