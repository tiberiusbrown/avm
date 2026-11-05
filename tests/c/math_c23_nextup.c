#include "math_test.h"

/* nextup moves toward +inf in the binary32 ordering. Zeros step to the least
   positive subnormal, and +inf is a fixed point. */
static const AVM_PROGMEM struct math_case up_cases[] = {
    {0x00000000UL, 0x00000000UL, 0x00000001UL, 0}, /* +0 -> least positive */
    {0x80000000UL, 0x00000000UL, 0x00000001UL, 0}, /* -0 -> least positive */
    {0x80000001UL, 0x00000000UL, 0x80000000UL, 0}, /* least negative -> -0 */
    {0x00000001UL, 0x00000000UL, 0x00000002UL, 0}, /* least positive -> next */
    {0x007fffffUL, 0x00000000UL, 0x00800000UL, 0}, /* largest subnormal -> least normal */
    {0x3f800000UL, 0x00000000UL, 0x3f800001UL, 0}, /* 1 -> next above */
    {0xbf800000UL, 0x00000000UL, 0xbf7fffffUL, 0}, /* -1 -> next toward zero */
    {0x7f7fffffUL, 0x00000000UL, 0x7f800000UL, 0}, /* largest finite -> +inf */
    {0xff7fffffUL, 0x00000000UL, 0xff7ffffeUL, 0}, /* most negative finite -> next up */
    {0xff800000UL, 0x00000000UL, 0xff7fffffUL, 0}, /* -inf -> most negative finite */
    {0x7f800000UL, 0x00000000UL, 0x7f800000UL, 0}, /* +inf is unchanged */
    {0x7fc00000UL, 0x00000000UL, 0x7fc00000UL, 0}, /* quiet NaN */
    {0x7fa00000UL, 0x00000000UL, 0x7fe00000UL, 0}, /* signaling NaN quiets, payload kept */
};

/* nextdown is the mirror image, moving toward -inf. */
static const AVM_PROGMEM struct math_case down_cases[] = {
    {0x00000000UL, 0x00000000UL, 0x80000001UL, 0}, /* +0 -> least negative */
    {0x80000000UL, 0x00000000UL, 0x80000001UL, 0}, /* -0 -> least negative */
    {0x00000001UL, 0x00000000UL, 0x00000000UL, 0}, /* least positive -> +0 */
    {0x80000001UL, 0x00000000UL, 0x80000002UL, 0}, /* least negative -> next down */
    {0x3f800000UL, 0x00000000UL, 0x3f7fffffUL, 0}, /* 1 -> next below */
    {0xbf800000UL, 0x00000000UL, 0xbf800001UL, 0}, /* -1 -> next below */
    {0x7f800000UL, 0x00000000UL, 0x7f7fffffUL, 0}, /* +inf -> largest finite */
    {0xff800000UL, 0x00000000UL, 0xff800000UL, 0}, /* -inf is unchanged */
    {0x7f7fffffUL, 0x00000000UL, 0x7f7ffffeUL, 0}, /* largest finite -> next down */
    {0x7fc00000UL, 0x00000000UL, 0x7fc00000UL, 0}, /* quiet NaN */
};

static uint32_t float_bits(float x)
{
    union { float f; uint32_t u; } v = { x };
    return v.u;
}

int avm_test_main(void)
{
    if (check_unary(nextupf, up_cases, sizeof(up_cases) / sizeof(up_cases[0]))) return 1;
    if (check_unary(nextdownf, down_cases, sizeof(down_cases) / sizeof(down_cases[0]))) return 2;

    /* Wider forms return the same values for the shared binary32 representation. */
    if (float_bits((float)nextup((double)from_bits(0x3f800000UL))) != 0x3f800001UL) return 3;
    if (float_bits((float)nextdownl((long double)from_bits(0x3f800000UL))) != 0x3f7fffffUL) return 4;
    if (float_bits((float)nextup((double)from_bits(0x80000000UL))) != 0x00000001UL) return 5;
    return 0;
}
