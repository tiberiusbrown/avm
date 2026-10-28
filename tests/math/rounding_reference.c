#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

float avm_reference_floorf(float);
float avm_reference_ceilf(float);
float avm_reference_roundf(float);
float avm_reference_truncf(float);

static int compare(const char *name, uint32_t input, float actual, float expected)
{
    uint32_t a, b;
    memcpy(&a, &actual, sizeof(a));
    memcpy(&b, &expected, sizeof(b));
    if (a == b || (isnan(actual) && isnan(expected)))
        return 0;
    printf("%s(%08lx): actual %08lx expected %08lx\n", name,
           (unsigned long)input, (unsigned long)a, (unsigned long)b);
    return 1;
}

static int check(uint32_t bits)
{
    float x;
    memcpy(&x, &bits, sizeof(x));
    return compare("floorf", bits, avm_reference_floorf(x), (float)floor((double)x)) ||
           compare("ceilf", bits, avm_reference_ceilf(x), (float)ceil((double)x)) ||
           compare("roundf", bits, avm_reference_roundf(x), (float)round((double)x)) ||
           compare("truncf", bits, avm_reference_truncf(x), (float)trunc((double)x));
}

static int check_both_signs(uint32_t bits)
{
    return check(bits) || check(bits | UINT32_C(0x80000000));
}

int main(void)
{
    /* Sample both sides of the 16-bit split and the final fractional bit. */
    static const unsigned sampled_exponents[] = {6, 7, 22};
    for (unsigned i = 0; i < sizeof(sampled_exponents) /
                                  sizeof(sampled_exponents[0]); ++i) {
        uint32_t base = (sampled_exponents[i] + UINT32_C(127)) << 23;
        for (uint32_t mantissa = 0; mantissa < UINT32_C(0x800000); mantissa += 521)
            if (check_both_signs(base | mantissa)) return 1;
        if (check_both_signs(base | UINT32_C(0x7fffff))) return 1;
    }

    /* For every exponent, vary the high and low words independently. Include
     * exact integers, ties and their neighbors, and carries into the exponent. */
    static const uint32_t fractions[] = {
        0, 1, 0x7fff, 0x8000, 0xffff, 0x10000, 0x10001,
        0x3fffff, 0x400000, 0x400001, 0x7effff, 0x7f0000, 0x7fffff
    };
    for (uint32_t exponent = 0; exponent < 256; ++exponent) {
        uint32_t base = exponent << 23;
        for (unsigned i = 0; i < sizeof(fractions) / sizeof(fractions[0]); ++i)
            if (check_both_signs(base | fractions[i])) return 1;
        for (uint32_t high = 0; high < 128; ++high) {
            if (check_both_signs(base | (high << 16)) ||
                check_both_signs(base | (high << 16) | UINT32_C(0xffff))) return 1;
        }
        if (exponent >= 127 && exponent < 150) {
            uint32_t half = UINT32_C(1) << (149 - exponent);
            if (check_both_signs(base | (half - 1)) ||
                check_both_signs(base | half) ||
                check_both_signs(base | (half + 1))) return 1;
        }
    }

    uint32_t random = UINT32_C(0x12345678);
    for (unsigned i = 0; i < 20000; ++i) {
        random = random * UINT32_C(1664525) + UINT32_C(1013904223);
        if (check(random)) return 1;
    }
    puts("All four rounding kernels matched host double results: sampled mantissas "
         "at exponents 6, 7 and 22 with both signs, all exponent boundaries, "
         "and 20,000 random inputs.");
    return 0;
}
