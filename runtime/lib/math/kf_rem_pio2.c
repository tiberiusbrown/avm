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

int __kernel_rem_pio2f(float x, float *y)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t mantissa = (bits & 0x007fffffUL) | 0x00800000UL;
    int point = 406 - (int)((bits >> 23) & 255);
    uint8_t product[35];
    uint32_t carry = 0;
    /* Expanded constant digits avoid program-memory coefficient loads and
       let constant-multiply lowering specialize each byte product. */
#define REDUCE_DIGIT(i, digit) do { \
        uint32_t t = mantissa * (digit) + carry; \
        product[i] = (uint8_t)t; carry = t >> 8; \
    } while (0)
    REDUCE_DIGIT(0, 0x61UL);
    REDUCE_DIGIT(1, 0xc5UL);
    REDUCE_DIGIT(2, 0xbbUL);
    REDUCE_DIGIT(3, 0xdeUL);
    REDUCE_DIGIT(4, 0xabUL);
    REDUCE_DIGIT(5, 0x63UL);
    REDUCE_DIGIT(6, 0x51UL);
    REDUCE_DIGIT(7, 0xfeUL);
    REDUCE_DIGIT(8, 0x41UL);
    REDUCE_DIGIT(9, 0x90UL);
    REDUCE_DIGIT(10, 0x43UL);
    REDUCE_DIGIT(11, 0x3cUL);
    REDUCE_DIGIT(12, 0x99UL);
    REDUCE_DIGIT(13, 0x95UL);
    REDUCE_DIGIT(14, 0x62UL);
    REDUCE_DIGIT(15, 0xdbUL);
    REDUCE_DIGIT(16, 0xc0UL);
    REDUCE_DIGIT(17, 0xddUL);
    REDUCE_DIGIT(18, 0x34UL);
    REDUCE_DIGIT(19, 0xf5UL);
    REDUCE_DIGIT(20, 0xd1UL);
    REDUCE_DIGIT(21, 0x57UL);
    REDUCE_DIGIT(22, 0x27UL);
    REDUCE_DIGIT(23, 0xfcUL);
    REDUCE_DIGIT(24, 0x29UL);
    REDUCE_DIGIT(25, 0x15UL);
    REDUCE_DIGIT(26, 0x44UL);
    REDUCE_DIGIT(27, 0x4eUL);
    REDUCE_DIGIT(28, 0x6eUL);
    REDUCE_DIGIT(29, 0x83UL);
    REDUCE_DIGIT(30, 0xf9UL);
    REDUCE_DIGIT(31, 0xa2UL);
#undef REDUCE_DIGIT
    product[32] = (uint8_t)carry;
    product[33] = (uint8_t)(carry >> 8);
    product[34] = (uint8_t)(carry >> 16);
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
    const float pi_hi = 0x1.921fb4p0f;
    const float pi_lo = 0x1.4442d2p-24f;
    const float pi_a = 0x1.920000p0f;
    const float pi_b = 0x1.fb4000p-12f;
    float r = fraction*pi_hi;
    float tail = ((fh*pi_a-r) + fh*pi_b + fl*pi_a) + fl*pi_b;
    tail += fraction*pi_lo + correction*pi_hi;
    float head = r+tail;
    float rest = (r-head)+tail;
    if (round_up != (int)(bits >> 31)) { head = -head; rest = -rest; }
    y[0] = head;
    y[1] = rest;
    return bits >> 31 ? -quadrant : quadrant;
}
