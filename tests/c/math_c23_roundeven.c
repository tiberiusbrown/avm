#include "math_test.h"

/* C23 roundeven rounds halfway cases to the even neighbor, keeps signed zeros,
   and returns infinities and NaNs unchanged. */
static const AVM_PROGMEM struct math_case cases[] = {
    {0x3f000000UL, 0x00000000UL, 0x00000000UL, 0}, /* 0.5 -> +0 */
    {0xbf000000UL, 0x00000000UL, 0x80000000UL, 0}, /* -0.5 -> -0 */
    {0x3f000001UL, 0x00000000UL, 0x3f800000UL, 0}, /* just above 0.5 -> 1 */
    {0x3f7fffffUL, 0x00000000UL, 0x3f800000UL, 0}, /* just below 1 -> 1 */
    {0x3fc00000UL, 0x00000000UL, 0x40000000UL, 0}, /* 1.5 -> 2 */
    {0x40100000UL, 0x00000000UL, 0x40000000UL, 0}, /* 2.25 -> 2 */
    {0x40200000UL, 0x00000000UL, 0x40000000UL, 0}, /* 2.5 -> 2 */
    {0x40600000UL, 0x00000000UL, 0x40800000UL, 0}, /* 3.5 -> 4 */
    {0x40400000UL, 0x00000000UL, 0x40400000UL, 0}, /* 3.0 -> 3 */
    {0xc0200000UL, 0x00000000UL, 0xc0000000UL, 0}, /* -2.5 -> -2 */
    {0xc0600000UL, 0x00000000UL, 0xc0800000UL, 0}, /* -3.5 -> -4 */
    {0x4b000000UL, 0x00000000UL, 0x4b000000UL, 0}, /* 2^23 is already integral */
    {0x4b000001UL, 0x00000000UL, 0x4b000001UL, 0}, /* 2^23+1 is already integral */
    {0x00000001UL, 0x00000000UL, 0x00000000UL, 0}, /* least subnormal -> +0 */
    {0x80000001UL, 0x00000000UL, 0x80000000UL, 0}, /* least negative -> -0 */
    {0x80000000UL, 0x00000000UL, 0x80000000UL, 0}, /* -0 is returned unchanged */
    {0x7f800000UL, 0x00000000UL, 0x7f800000UL, 0}, /* +inf */
    {0xff800000UL, 0x00000000UL, 0xff800000UL, 0}, /* -inf */
    {0x7fc00000UL, 0x00000000UL, 0x7fc00000UL, 0}, /* quiet NaN */
    {0x7fa00000UL, 0x00000000UL, 0x7fa00000UL, 0}, /* signaling NaN stays NaN */
};

static uint32_t float_bits(float x)
{
    union { float f; uint32_t u; } v = { x };
    return v.u;
}

int avm_test_main(void)
{
    if (check_unary(roundevenf, cases, sizeof(cases) / sizeof(cases[0]))) return 1;

    /* The double and long double forms share the binary32 representation. */
    if (float_bits((float)roundeven((double)from_bits(0x40200000UL))) != 0x40000000UL) return 2;
    if (float_bits((float)roundevenl((long double)from_bits(0xc0600000UL))) != 0xc0800000UL) return 3;
    if (float_bits((float)roundeven((double)from_bits(0x80000000UL))) != 0x80000000UL) return 4;
    return 0;
}
