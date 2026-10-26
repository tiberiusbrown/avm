/* Matched 32-call probes. TRIG_PROBE selects a measurement, not production
   behavior. Integer and float sinks stay independent; no quadrant conversion.
   The empty dependencies make identity outputs opaque without volatile traffic
   in the loop. The noinline identity preserves the real reducer's ABI. */
#include "../../runtime/lib/math/rem_pio2_inline.h"
#include <math.h>
#include "math_trig_probe_inputs.h"

static volatile float remainder_result;
static volatile uint32_t quadrant_result;
#if TRIG_PROBE == 1
static __attribute__((noinline)) float identity(float x, int *quadrant)
{
    int zero=0;
    __asm__("" : "+r"(x), "+r"(zero));
    *quadrant=zero;
    return x;
}
#endif
int avm_test_main(void)
{
    float sum=0;
    uint32_t quadrants=0;
    __avm_debug_break();
    for (uint8_t i=0; i<32; ++i) {
        float x=probe_inputs[i&7], r;
        int n=0;
#if TRIG_PROBE == 0
        r=x;
        __asm__("" : "+r"(r), "+r"(n));
#elif TRIG_PROBE == 1
        r=identity(x,&n);
#elif TRIG_PROBE == 2
        r=__ieee754_rem_pio2f(x,&n);
#elif TRIG_PROBE == 3
        r=avm_rem_pio2f(x,&n);
#elif TRIG_PROBE == 4
        n=(int)((((uint32_t)(__builtin_fabsf(x)*0x1.45f306p0f))+1UL)>>1);
        r=x;
#elif TRIG_PROBE == 5
        /* Quotients precomputed outside the timing interval. */
        n=probe_quotients[i&7];
        float fn=(float)n;
        r=(__builtin_fabsf(x)-fn*0x1.92p0f)-fn*0x1.fb5444p-12f;
#elif TRIG_PROBE == 6
        /* x is already a provisional remainder, including boundary repairs. */
        r=x;
        if (r>0x1.921fb6p-1f) { ++n; r=(r-0x1.921fb4p0f)-0x1.4442d2p-24f; }
        else if (r < -0x1.921fb6p-1f) { --n; r=(r+0x1.921fb4p0f)+0x1.4442d2p-24f; }
#elif TRIG_PROBE == 7
        n=probe_quotients[i&7];
        float fn=(float)n;
        r=((__builtin_fabsf(x)-fn*0x1.921fp0f)-fn*0x1.6a88p-17f)-fn*0x1.0b4612p-34f;
#elif TRIG_PROBE == 8
        r=__kernel_rem_pio2f(x,&n);
#elif TRIG_PROBE == 9
        r=sinf(x);
#elif TRIG_PROBE == 10
        r=cosf(x);
#elif TRIG_PROBE == 11
        r=tanf(x);
#elif TRIG_PROBE == 12
        float s,c;
        sincosf(x,&s,&c);
        r=s+c;
#elif TRIG_PROBE == 13
        r=probe_remainders[i&7];
        uint32_t xb,rb;
        GET_FLOAT_WORD(xb,x);
        GET_FLOAT_WORD(rb,r);
        n=(rb&0x7fffffffUL)<(xb&0x7fffffffUL)-(21UL<<23);
#elif TRIG_PROBE == 14
        (void)x;
        r=probe_remainders[i&7];
        __asm__("" : "+r"(n));
#endif
        sum+=r;
        quadrants+=(unsigned)n&3u;
    }
    remainder_result=sum;
    quadrant_result=quadrants;
    __avm_debug_break();
    return 0;
}
