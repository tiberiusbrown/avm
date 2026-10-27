#ifndef AVM_REM_PIO2_INLINE_H
#define AVM_REM_PIO2_INLINE_H
#include "fdlibm.h"
#include "small_pio2.h"
#include "native_math.h"
/* The strict medium path is shared out of line to keep its live state out of
   tangent's common frame. Call only for finite 1024 < abs(x) <= 100000. */
float avm_rem_pio2f_medium(float, int *);

/* tangent is a compile-time caller policy: sine/cosine accept an absolute
   reduction error below 7.4e-6 through 128; reciprocal tangent needs the split
   multiples. No floating environment or public ABI is changed. */
static __attribute__((always_inline)) inline float avm_rem_pio2f_mode(float x, int *quadrant, int tangent)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t magnitude = bits & 0x7fffffffUL;
    if (magnitude <= 0x3f490fdaUL) { *quadrant=0; return x; }
    if (magnitude >= 0x7f800000UL) { *quadrant=0; return x-x; }
    /* The native constant differs from pi/2 by <6.078e-11. Through 128,
       n<=81, giving <4.924e-9 reduction error before final float rounding.
       Near tangent poles retain the strict guest split/window reduction. */
    if (magnitude <= 0x43000000UL) {
        int native_q;
        float native_r = avm_native_rempio2(x, &native_q);
        if (!tangent || __builtin_fabsf(native_r) >= 0x1p-12f) {
            *quadrant = native_q;
            return native_r;
        }
    }
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
        /* One quotient multiply, narrow conversion, and one reconstruction
           multiply/subtract. Only a zero provisional result needs the sign
           refinement below under the bounded absolute-error policy. */
        /* Sterbenz makes the high subtraction exact. A precomputed residual
           resolves pole neighbors with two subtractions and no quotient-to-
           float conversion or reconstruction multiplies. */
        if (magnitude <= 0x44800000UL) {
            uint16_t index=(((uint16_t)(a*0x1.45f306p0f))+1U)>>1;
            r=(a-avm_small_pio2[index].high)-avm_small_pio2[index].low;
            n=(int)(index&3U);
            uint32_t rb;
            GET_FLOAT_WORD(rb,r);
            if ((rb&0x7fffffffUL)>0x3f490fdbUL) {
                if (rb>>31) { --n; r=(r+0x1.921fb4p0f)+0x1.4442d2p-24f; }
                else { ++n; r=(r-0x1.921fb4p0f)-0x1.4442d2p-24f; }
            }
            if (bits>>31) { r=-r; n=-n; }
            *quadrant=n;
            return r;
        }
        if (tangent) return avm_rem_pio2f_medium(x,quadrant);
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
        /* Tangent has already entered the shared strict helper. The soft
           policy needs refinement only when the rounded split loses zero's
           side of the exact multiple. */
        if (!(rb&0x7fffffffUL)) {
            return __kernel_rem_pio2f(x, quadrant);
        }
    } else {
        return __kernel_rem_pio2f(x, quadrant);
    }
    if (bits>>31) { r=-r; n=-n; }
    *quadrant = n;
    return r;
}
static __attribute__((always_inline)) inline float avm_rem_pio2f(float x, int *q)
{ return avm_rem_pio2f_mode(x,q,1); }
#endif
