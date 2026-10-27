#ifndef AVM_REMAINDER_KERNEL_H
#define AVM_REMAINDER_KERNEL_H
#include "fdlibm.h"

/* All reduction operands are nonnegative and non-NaN. IEEE word ordering
   then replaces a floating comparison with a native integer comparison. */
static __attribute__((always_inline)) inline int avm_positive_ge(float x, float y)
{
    uint32_t a, b;
    GET_FLOAT_WORD(a, x);
    GET_FLOAT_WORD(b, y);
    return a >= b;
}

static __attribute__((always_inline)) inline float
avm_remainder(float x, float y, int *quotient, int quotient_bits)
{
    uint32_t ux, uy;
    GET_FLOAT_WORD(ux, x);
    GET_FLOAT_WORD(uy, y);
    uint32_t ax = ux & 0x7fffffffUL, ay = uy & 0x7fffffffUL;
    if (quotient_bits) *quotient = 0;
    if (ax > 0x7f800000UL || ay > 0x7f800000UL) return x+y;
    if (ax == 0x7f800000UL || !ay) {
        SET_FLOAT_WORD(x, 0x7fc00000UL);
        return x;
    }
    if (ay == 0x7f800000UL) return x;
    SET_FLOAT_WORD(x, ax);
    SET_FLOAT_WORD(y, ay);

    /* Scaling by a power of two is exact, including subnormals. If it
       overflows, fmod(finite, infinity) simply returns its first operand.
       Retain only the quotient bits needed for parity / remquo's low 3. */
    float r = fmodf(x, y*(quotient_bits ? 8.0f : 2.0f));
    unsigned q = 0;
    if (quotient_bits) {
        float p = y*4.0f;
        if (avm_positive_ge(r, p)) { r -= p; q = 4; }
        p = y*2.0f;
        if (avm_positive_ge(r, p)) { r -= p; q += 2; }
    }
    if (quotient_bits ? avm_positive_ge(r, y) : r >= y) { r -= y; ++q; }
    /* Comparing r with y-r avoids rounding y/2 to zero for odd subnormal
       divisors. All performed remainder subtractions are exact (Sterbenz). */
    float complement = y-r;
    int adjust;
    if (quotient_bits) {
        uint32_t ur, uc;
        GET_FLOAT_WORD(ur, r);
        GET_FLOAT_WORD(uc, complement);
        adjust = ur > uc || (ur == uc && (q & 1));
    } else {
        /* The smaller parity-only path measured faster using native FCMP;
           remquo benefits from retaining its already-live integer words. */
        adjust = r > complement || (r == complement && (q & 1));
    }
    if (adjust) {
        r -= y;
        ++q;
    }
    if (quotient_bits) {
        int low = (int)(q & 7);
        *quotient = (ux ^ uy) >> 31 ? -low : low;
    }
    GET_FLOAT_WORD(ax, r);
    SET_FLOAT_WORD(r, ax ^ (ux & 0x80000000UL));
    return r;
}
#endif
