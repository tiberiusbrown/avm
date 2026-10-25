#include <stdint.h>
#include <stdio.h>
#include <string.h>

/* Exercise the production byte product without exposing a runtime test API. */
#include "../../runtime/lib/math/kf_rem_pio2.c"

static void reference_product(uint32_t mantissa, uint8_t product[35])
{
    /* The same 256-bit 2/pi expansion, grouped into independent 32-bit limbs.
       A 64-bit accumulator holds each full product and its incoming carry. */
    static const uint32_t digits[8] = {
        0xdebbc561U, 0xfe5163abU, 0x3c439041U, 0xdb629599U,
        0xf534ddc0U, 0xfc2757d1U, 0x4e441529U, 0xa2f9836eU
    };
    uint64_t carry = 0;
    for (unsigned i = 0; i < 8; ++i) {
        uint64_t t = (uint64_t)mantissa * digits[i] + carry;
        for (unsigned j = 0; j < 4; ++j)
            product[4*i+j] = (uint8_t)(t >> (8*j));
        carry = t >> 32;
    }
    for (unsigned j = 0; j < 3; ++j)
        product[32+j] = (uint8_t)(carry >> (8*j));
}

int main(void)
{
    for (uint32_t m = 0x800000U; m < 0x1000000U; ++m) {
        uint8_t actual[35], expected[35];
        multiply_invpio2(m, actual);
        reference_product(m, expected);
        if (memcmp(actual, expected, sizeof(actual)) != 0) {
            printf("2/pi product mismatch for mantissa %06lx\n", (unsigned long)m);
            return 1;
        }
    }
    puts("All 8,388,608 normalized binary32 mantissas matched the full 280-bit reference product.");
    return 0;
}
