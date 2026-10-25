/* Small-stack Payne-Hanek reduction for binary32, round-to-nearest.
 * The 256-bit 2/pi expansion is the one used by fdlibm (see ef_rem_pio2.c).
 * A 24-by-256-bit integer product leaves at least 128 fractional bits even
 * for FLT_MAX. Retaining 64 of them is ample for a binary32 remainder and
 * its correction. All scratch is automatic; guest math remains reentrant.
 */
#include "fdlibm.h"

static uint32_t product_word(const uint8_t *p, int bit)
{
    int i = bit >> 3;
    int shift = bit & 7;
    uint32_t word = (uint32_t)p[i] | ((uint32_t)p[i+1] << 8) |
                    ((uint32_t)p[i+2] << 16) | ((uint32_t)p[i+3] << 24);
    word >>= shift;
    if (shift) word |= (uint32_t)p[i+4] << (32-shift);
    return word;
}

static inline void multiply_invpio2(uint32_t mantissa, uint8_t product[35])
{
    uint8_t m0 = (uint8_t)mantissa;
    uint8_t m1 = (uint8_t)(mantissa >> 8);
    uint8_t m2 = (uint8_t)(mantissa >> 16);
    uint16_t carry = 0;
    /* Expanded constant digits avoid program-memory coefficient loads and
       keep every multiply within 8 by 8 bits. Column i uses digits i, i-1,
       and i-2 of the little-endian 2/pi expansion. Split the sum to avoid
       overflowing a 16-bit word: carry <= 767, lo <= 1532, and the next
       carry <= 3*254 + (1532 >> 8) = 767. */
#ifdef __AVM__
    /* Keep each column's products local. Hoisting all 96 multiplies at once
       otherwise spills enough live words to exceed the guest stack limit.
       This register dependency emits no instructions. */
#define REDUCE_BARRIER() __asm__("" : "+r"(m0), "+r"(m1), "+r"(m2), "+r"(carry))
#else
#define REDUCE_BARRIER() ((void)0)
#endif
#define REDUCE_COLUMN(i, d0, d1, d2) do { \
        uint16_t a = (uint16_t)m0 * (d0); \
        uint16_t b = (uint16_t)m1 * (d1); \
        uint16_t c = (uint16_t)m2 * (d2); \
        uint16_t lo = carry + (uint16_t)(uint8_t)a + \
                      (uint16_t)(uint8_t)b + (uint16_t)(uint8_t)c; \
        product[i] = (uint8_t)lo; \
        carry = (a >> 8) + (b >> 8) + (c >> 8) + (lo >> 8); \
        REDUCE_BARRIER(); \
    } while (0)
    REDUCE_COLUMN(0,  0x61U, 0,     0);
    REDUCE_COLUMN(1,  0xc5U, 0x61U, 0);
    REDUCE_COLUMN(2,  0xbbU, 0xc5U, 0x61U);
    REDUCE_COLUMN(3,  0xdeU, 0xbbU, 0xc5U);
    REDUCE_COLUMN(4,  0xabU, 0xdeU, 0xbbU);
    REDUCE_COLUMN(5,  0x63U, 0xabU, 0xdeU);
    REDUCE_COLUMN(6,  0x51U, 0x63U, 0xabU);
    REDUCE_COLUMN(7,  0xfeU, 0x51U, 0x63U);
    REDUCE_COLUMN(8,  0x41U, 0xfeU, 0x51U);
    REDUCE_COLUMN(9,  0x90U, 0x41U, 0xfeU);
    REDUCE_COLUMN(10, 0x43U, 0x90U, 0x41U);
    REDUCE_COLUMN(11, 0x3cU, 0x43U, 0x90U);
    REDUCE_COLUMN(12, 0x99U, 0x3cU, 0x43U);
    REDUCE_COLUMN(13, 0x95U, 0x99U, 0x3cU);
    REDUCE_COLUMN(14, 0x62U, 0x95U, 0x99U);
    REDUCE_COLUMN(15, 0xdbU, 0x62U, 0x95U);
    REDUCE_COLUMN(16, 0xc0U, 0xdbU, 0x62U);
    REDUCE_COLUMN(17, 0xddU, 0xc0U, 0xdbU);
    REDUCE_COLUMN(18, 0x34U, 0xddU, 0xc0U);
    REDUCE_COLUMN(19, 0xf5U, 0x34U, 0xddU);
    REDUCE_COLUMN(20, 0xd1U, 0xf5U, 0x34U);
    REDUCE_COLUMN(21, 0x57U, 0xd1U, 0xf5U);
    REDUCE_COLUMN(22, 0x27U, 0x57U, 0xd1U);
    REDUCE_COLUMN(23, 0xfcU, 0x27U, 0x57U);
    REDUCE_COLUMN(24, 0x29U, 0xfcU, 0x27U);
    REDUCE_COLUMN(25, 0x15U, 0x29U, 0xfcU);
    REDUCE_COLUMN(26, 0x44U, 0x15U, 0x29U);
    REDUCE_COLUMN(27, 0x4eU, 0x44U, 0x15U);
    REDUCE_COLUMN(28, 0x6eU, 0x4eU, 0x44U);
    REDUCE_COLUMN(29, 0x83U, 0x6eU, 0x4eU);
    REDUCE_COLUMN(30, 0xf9U, 0x83U, 0x6eU);
    REDUCE_COLUMN(31, 0xa2U, 0xf9U, 0x83U);
    REDUCE_COLUMN(32, 0,     0xa2U, 0xf9U);
    REDUCE_COLUMN(33, 0,     0,     0xa2U);
#undef REDUCE_COLUMN
#undef REDUCE_BARRIER
    product[34] = (uint8_t)carry;
}

int __kernel_rem_pio2f(float x, float *y)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t mantissa = (bits & 0x007fffffUL) | 0x00800000UL;
    int point = 406 - (int)((bits >> 23) & 255);
    uint8_t product[35];
    multiply_invpio2(mantissa, product);
    int index = point >> 3;
    int quadrant = product[index] >> (point & 7);
    if ((point & 7) == 7) quadrant |= (int)product[index+1] << 1;
    quadrant &= 3;
    uint32_t high = product_word(product, point-32);
    uint32_t low = product_word(product, point-64);
    int round_up = (high >> 31) != 0;
    if (round_up) {
        ++quadrant;
        high = ~high + (low == 0);
        low = 0UL - low;
    }

    /* Form the fractional remainder as a sum of two binary32 numbers. */
    float a = (float)(high >> 16) * 0x1p-16f;
    float b = (float)(high & 65535UL) * 0x1p-32f;
    float fraction = a + b;
    float correction = (a-fraction) + b;
    correction += (float)(low >> 16) * 0x1p-48f +
                  (float)(low & 65535UL) * 0x1p-64f;

    /* Dekker product error with 12-bit high parts, followed by the low
     * pi/2 correction. This preserves accuracy close to a multiple of pi/2.
     */
    uint32_t fraction_bits;
    GET_FLOAT_WORD(fraction_bits, fraction);
    float fh;
    SET_FLOAT_WORD(fh, fraction_bits & 0xfffff000UL);
    float fl = fraction-fh;
    float r = fraction*0x1.921fb4p0f;
    float tail = ((fh*0x1.920000p0f-r) + fh*0x1.fb4000p-12f +
                  fl*0x1.920000p0f) + fl*0x1.fb4000p-12f;
    tail += fraction*0x1.4442d2p-24f + correction*0x1.921fb4p0f;
    float head = r+tail;
    float rest = (r-head)+tail;
    if (round_up != (int)(bits >> 31)) { head = -head; rest = -rest; }
    y[0] = head;
    y[1] = rest;
    return bits >> 31 ? -quadrant : quadrant;
}
