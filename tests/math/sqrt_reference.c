#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

float avm_reference_sqrtf(float);
float avm_original_sqrtf(float);

static int compare(const char *reference, uint32_t input, float actual, float expected)
{
    uint32_t a, b;
    memcpy(&a, &actual, sizeof(a));
    memcpy(&b, &expected, sizeof(b));
    if (a == b || (isnan(actual) && isnan(expected))) return 0;
    printf("input %08lx actual %08lx %s %08lx\n", (unsigned long)input,
           (unsigned long)a, reference, (unsigned long)b);
    return 1;
}

static int check(uint32_t bits)
{
    float x;
    memcpy(&x, &bits, sizeof(x));
    float actual = avm_reference_sqrtf(x);
    return compare("original", bits, actual, avm_original_sqrtf(x)) ||
           compare("double sqrt", bits, actual, (float)sqrt((double)x));
}

int main(void)
{
    /* Every normalized mantissa and both exponent parities. This also
     * exhausts every interpolation interval, including both endpoints. */
    for (uint32_t bits = 0x3f800000; bits < 0x40800000; ++bits)
        if (check(bits)) return 1;

    for (uint32_t bits = 1; bits < 0x00800000; ++bits)
        if (check(bits)) return 1;

    /* Scaling is exact; still check every exponent at representative word,
     * lookup and rounding boundaries, with both signs and special values. */
    static const uint32_t fractions[] = {
        0, 1, 0x7ff, 0x800, 0x801, 0xffff, 0x10000,
        0x1ffff, 0x20000, 0x20001,
        0x3fffff, 0x400000, 0x400001, 0x7ff7ff, 0x7ff800, 0x7fffff
    };
    for (uint32_t exponent = 0; exponent < 256; ++exponent) {
        for (unsigned i = 0; i < sizeof(fractions) / sizeof(fractions[0]); ++i) {
            uint32_t bits = (exponent << 23) | fractions[i];
            if (check(bits) || check(bits | 0x80000000)) return 1;
        }
    }

    uint32_t state = 0x12345678;
    for (unsigned i = 0; i < 1000000; ++i) {
        state = state * 1664525u + 1013904223u;
        if (check(state)) return 1;
    }
    puts("All 16,777,216 normalized mantissa/parity inputs, all 8,388,607 positive "
         "subnormals, every exponent boundary, and 1,000,000 random bit patterns "
         "matched the original kernel and double sqrt (NaNs by classification).");
    return 0;
}
