#include "math_test.h"

/* IEEE maximum and minimum propagate NaNs and order +0 above -0. The _num forms
   return the number when exactly one operand is NaN. The _mag forms choose by
   absolute value and use the plain extremum on ties. */

static const AVM_PROGMEM struct math_case maximum_cases[] = {
    {0x00000000UL, 0x80000000UL, 0x00000000UL, 0}, /* +0 over -0 */
    {0x80000000UL, 0x00000000UL, 0x00000000UL, 0},
    {0x80000000UL, 0x80000000UL, 0x80000000UL, 0},
    {0x3f800000UL, 0x7fc00000UL, 0x7fc00000UL, 0}, /* a NaN operand propagates */
    {0x7fc00000UL, 0x3f800000UL, 0x7fc00000UL, 0},
    {0x40000000UL, 0x40400000UL, 0x40400000UL, 0},
    {0xc0400000UL, 0xc0000000UL, 0xc0000000UL, 0},
    {0xff800000UL, 0x7f800000UL, 0x7f800000UL, 0},
    {0x7fa00000UL, 0x3f800000UL, 0x7fa00000UL, 0}, /* signaling NaN propagates */
};

static const AVM_PROGMEM struct math_case minimum_cases[] = {
    {0x00000000UL, 0x80000000UL, 0x80000000UL, 0}, /* -0 under +0 */
    {0x80000000UL, 0x00000000UL, 0x80000000UL, 0},
    {0x00000000UL, 0x00000000UL, 0x00000000UL, 0},
    {0x3f800000UL, 0x7fc00000UL, 0x7fc00000UL, 0},
    {0x40000000UL, 0x40400000UL, 0x40000000UL, 0},
    {0xc0400000UL, 0xc0000000UL, 0xc0400000UL, 0},
    {0xff800000UL, 0x7f800000UL, 0xff800000UL, 0},
};

static const AVM_PROGMEM struct math_case maximum_mag_cases[] = {
    {0xc0400000UL, 0x40000000UL, 0xc0400000UL, 0}, /* |-3| > |2| */
    {0x40000000UL, 0xc0400000UL, 0xc0400000UL, 0},
    {0xc0000000UL, 0x40000000UL, 0x40000000UL, 0}, /* tie: maximum(-2, 2) = 2 */
    {0x40000000UL, 0xc0000000UL, 0x40000000UL, 0},
    {0x00000000UL, 0x80000000UL, 0x00000000UL, 0}, /* tie on zeros keeps +0 */
    {0x7fc00000UL, 0x3f800000UL, 0x7fc00000UL, 0}, /* NaN propagates */
    {0xff800000UL, 0x3f800000UL, 0xff800000UL, 0},
};

static const AVM_PROGMEM struct math_case minimum_mag_cases[] = {
    {0xc0400000UL, 0x40000000UL, 0x40000000UL, 0}, /* |2| < |-3| */
    {0x40000000UL, 0xc0400000UL, 0x40000000UL, 0},
    {0xc0000000UL, 0x40000000UL, 0xc0000000UL, 0}, /* tie: minimum(-2, 2) = -2 */
    {0x40000000UL, 0xc0000000UL, 0xc0000000UL, 0},
    {0x00000000UL, 0x80000000UL, 0x80000000UL, 0}, /* tie on zeros keeps -0 */
    {0x7fc00000UL, 0x3f800000UL, 0x7fc00000UL, 0},
};

static const AVM_PROGMEM struct math_case maximum_num_cases[] = {
    {0x3f800000UL, 0x7fc00000UL, 0x3f800000UL, 0}, /* the number wins over NaN */
    {0x7fc00000UL, 0xc0000000UL, 0xc0000000UL, 0},
    {0x7fc00000UL, 0x7fc00000UL, 0x7fc00000UL, 0}, /* two NaNs give NaN */
    {0x00000000UL, 0x80000000UL, 0x00000000UL, 0},
    {0xff800000UL, 0x7fc00000UL, 0xff800000UL, 0},
    {0x7fa00000UL, 0x40400000UL, 0x40400000UL, 0}, /* sNaN still yields the number */
};

static const AVM_PROGMEM struct math_case minimum_num_cases[] = {
    {0x3f800000UL, 0x7fc00000UL, 0x3f800000UL, 0},
    {0x7fc00000UL, 0xc0000000UL, 0xc0000000UL, 0},
    {0x7fc00000UL, 0x7fc00000UL, 0x7fc00000UL, 0},
    {0x00000000UL, 0x80000000UL, 0x80000000UL, 0},
    {0x40000000UL, 0x40400000UL, 0x40000000UL, 0},
};

static const AVM_PROGMEM struct math_case maximum_mag_num_cases[] = {
    {0x7fc00000UL, 0x3f800000UL, 0x3f800000UL, 0},
    {0xc0400000UL, 0x40000000UL, 0xc0400000UL, 0},
    {0xc0000000UL, 0x40000000UL, 0x40000000UL, 0}, /* tie: maximum_num(-2, 2) = 2 */
    {0x7fc00000UL, 0x7fc00000UL, 0x7fc00000UL, 0},
    {0x00000000UL, 0x80000000UL, 0x00000000UL, 0},
};

static const AVM_PROGMEM struct math_case minimum_mag_num_cases[] = {
    {0x7fc00000UL, 0x3f800000UL, 0x3f800000UL, 0},
    {0xc0400000UL, 0x40000000UL, 0x40000000UL, 0},
    {0x40000000UL, 0xc0000000UL, 0xc0000000UL, 0}, /* tie: minimum_num(2, -2) = -2 */
    {0x7fc00000UL, 0x7fc00000UL, 0x7fc00000UL, 0},
    {0x00000000UL, 0x80000000UL, 0x80000000UL, 0},
};

#define COUNT(a) (sizeof(a) / sizeof((a)[0]))

int avm_test_main(void)
{
    if (check_binary(fmaximumf, maximum_cases, COUNT(maximum_cases))) return 1;
    if (check_binary(fminimumf, minimum_cases, COUNT(minimum_cases))) return 2;
    if (check_binary(fmaximum_magf, maximum_mag_cases, COUNT(maximum_mag_cases))) return 3;
    if (check_binary(fminimum_magf, minimum_mag_cases, COUNT(minimum_mag_cases))) return 4;
    if (check_binary(fmaximum_numf, maximum_num_cases, COUNT(maximum_num_cases))) return 5;
    if (check_binary(fminimum_numf, minimum_num_cases, COUNT(minimum_num_cases))) return 6;
    if (check_binary(fmaximum_mag_numf, maximum_mag_num_cases, COUNT(maximum_mag_num_cases))) return 7;
    if (check_binary(fminimum_mag_numf, minimum_mag_num_cases, COUNT(minimum_mag_num_cases))) return 8;

    /* The double and long double forms share the binary32 values. */
    union { float f; uint32_t u; } r;
    r.f = (float)fmaximum((double)from_bits(0x00000000UL), (double)from_bits(0x80000000UL));
    if (r.u != 0x00000000UL) return 9;
    r.f = (float)fminimuml((long double)from_bits(0x00000000UL), (long double)from_bits(0x80000000UL));
    if (r.u != 0x80000000UL) return 10;
    r.f = (float)fmaximum_num((double)from_bits(0x7fc00000UL), (double)from_bits(0xc0000000UL));
    if (r.u != 0xc0000000UL) return 11;
    return 0;
}
