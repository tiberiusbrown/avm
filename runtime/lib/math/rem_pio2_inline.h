#ifndef AVM_REM_PIO2_INLINE_H
#define AVM_REM_PIO2_INLINE_H
#include "fdlibm.h"

static __attribute__((always_inline)) inline float avm_rem_pio2f(float x, int *quadrant)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t magnitude = bits & 0x7fffffffUL;
    *quadrant = 0;
    if (magnitude <= 0x3f490fdaUL) return x;
    if (magnitude >= 0x7f800000UL) return x-x;
    float a = __builtin_fabsf(x), r;
    int n;
    if (magnitude < 0x4016cbe4UL) {
        /* Sterbenz subtraction is exact; this split also resolves pi/2's
           immediate float neighbors without a quotient conversion. */
        r = (a-0x1.921fb4p0f)-0x1.4442d2p-24f;
        n = 1;
    } else if (magnitude <= 0x47c35000UL) {
        /* Through 100000, n <= 63662 and 201*n < 2^24. Thus n*(201/128)
           is exact. The conversion domain is positive and < 127326.
           The rounded multiply may overestimate at a half-integer edge. */
        uint32_t doubled = (uint32_t)(a*0x1.45f306p0f);
        uint32_t nearest = (doubled+1UL)>>1;
        float fn = (float)nearest;
        r = (a-fn*0x1.92p0f)-fn*0x1.fb5444p-12f;
        n = (int)(nearest & 3UL);
        if (r > 0x1.921fb6p-1f) {
            ++n;
            r = (r-0x1.921fb4p0f)-0x1.4442d2p-24f;
        } else if (r < -0x1.921fb6p-1f) {
            --n;
            r = (r+0x1.921fb4p0f)+0x1.4442d2p-24f;
        }
        uint32_t rb;
        GET_FLOAT_WORD(rb, r);
        /* A relative cancellation guard protects reciprocal tan near poles.
           Compare exponents without another float multiply. */
        if ((rb & 0x7fffffffUL) < magnitude-(21UL<<23)) {
            if (nearest <= 128UL) {
                /* All high products are exact for this small quotient. This
                   cold third split protects 2*pi and the first pole neighbors
                   without entering the integer window reducer. */
                r = ((a-fn*0x1.921fp0f)-fn*0x1.6a88p-17f)-fn*0x1.0b4612p-34f;
            } else {
                return __kernel_rem_pio2f(x, quadrant);
            }
        }
    } else {
        return __kernel_rem_pio2f(x, quadrant);
    }
    if (bits>>31) { r=-r; n=-n; }
    *quadrant = n;
    return r;
}
#endif
