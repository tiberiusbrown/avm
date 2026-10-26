#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "reference_profile.h"
#include "rem_pio2_reference_kernel.c"
#include "../../runtime/lib/math/kf_rem_pio2.c"

static double maximum;
static uint32_t worst;
static unsigned long long cases;
static unsigned long long quadrant_mismatches, large_quadrant_mismatches;

static int check(uint32_t bits)
{
    float x;
    memcpy(&x, &bits, 4);
    int q;
    float r = __ieee754_rem_pio2f(x, &q);
    ++cases;
    if (!isfinite(x)) return !isnan(r);
    if (x == 0) { uint32_t u; memcpy(&u, &r, 4); return u != bits || q != 0; }
    if (fabs(r) > 0.785401) {
        printf("remainder out of interval @ %08lx: %.9g\n", (unsigned long)bits, r);
        return 1;
    }
    double s=sin((double)r), c=cos((double)r), actual_s, actual_c;
    switch (q&3) {
    case 0: actual_s=s; actual_c=c; break;
    case 1: actual_s=c; actual_c=-s; break;
    case 2: actual_s=-s; actual_c=-c; break;
    default: actual_s=-c; actual_c=s; break;
    }
    double error=fmax(fabs(actual_s-sin((double)x)),fabs(actual_c-cos((double)x)));
    int reference_quadrant=(int)floor(atan2(sin((double)x),cos((double)x))*0.63661977236758134308+0.5);
    if ((reference_quadrant&3)!=(q&3)) {
        ++quadrant_mismatches;
        if (fabs(x)>100000) ++large_quadrant_mismatches;
    }
    if (error>maximum) { maximum=error; worst=bits; }
    if (error>3e-6) {
        printf("reduction quality failure @ %08lx: error %.12g q %d r %.9g\n",
               (unsigned long)bits,error,q,r);
        return 1;
    }
    return 0;
}

int main(int argc, char **argv)
{
    int quick=reference_quick(argc,argv);
    if (quick<0) return 2;
    /* Exact uint64 arithmetic checks every normalized mantissa in full mode,
       with coefficients cycled across all exponent windows. */
    for (uint32_t m=0x800000; m<0x1000000; m += quick ? 4093 : 1) {
        struct avm_reduce_window w=avm_reduce_windows[m&127];
        uint64_t p0=(uint64_t)m*w.low;
        uint64_t p1=(uint64_t)m*w.middle+(p0>>32);
        uint64_t p2=(uint64_t)m*w.high+(p1>>32);
        uint8_t actual[7], expected[7]={(uint8_t)(p0>>24),
            (uint8_t)p1,(uint8_t)(p1>>8),(uint8_t)(p1>>16),(uint8_t)(p1>>24),
            (uint8_t)p2,(uint8_t)(p2>>8)};
        avm_reduce_product(m,w,actual,1);
        if (memcmp(actual,expected,7)) {
            printf("window product failure @ %06lx\n", (unsigned long)m);
            return 1;
        }
        struct avm_reduce_window narrow={(w.low>>16)|(w.middle<<16),
            (w.middle>>16)|((uint32_t)w.high<<16),0};
        p0=(uint64_t)m*narrow.low;
        p1=(uint64_t)m*narrow.middle+(p0>>32);
        uint8_t expected32[5]={(uint8_t)(p0>>24),(uint8_t)p1,
            (uint8_t)(p1>>8),(uint8_t)(p1>>16),(uint8_t)(p1>>24)};
        avm_reduce_product(m,narrow,actual,0);
        if (memcmp(actual,expected32,5)) {
            printf("32-bit window product failure @ %06lx\n", (unsigned long)m);
            return 1;
        }
        uint32_t u=(((m%128)+127)<<23)|(m&0x7fffff);
        if (check(u) || check(u|0x80000000U)) return 1;
    }
    for (unsigned e=0;e<256;++e) {
        static const uint32_t fractions[]={0,1,0x1ffff,0x20000,0x3fffff,0x400000,0x7ffffe,0x7fffff};
        for (unsigned i=0;i<sizeof(fractions)/sizeof(*fractions);++i) {
            uint32_t u=(e<<23)|fractions[i];
            if (check(u) || check(u|0x80000000U)) return 1;
        }
    }
    /* pi/2 cancellation, quotient half-integers and both cutoff edges. */
    for (unsigned n=1;n<=83444;n+=quick ? 127 : 1) {
        for (unsigned phase=0;phase<2;++phase) {
            float center=(float)((n+phase*0.5)*1.57079632679489661923);
            uint32_t u; memcpy(&u,&center,4);
            for (int d=-2;d<=2;++d)
                if (check(u+d) || check((u+d)|0x80000000U)) return 1;
        }
    }
    for (uint32_t u=0x47fffff8;u<=0x48000008;++u)
        if (check(u) || check(u|0x80000000U)) return 1;
    for (uint32_t u=0x47c34ff8;u<=0x47c35008;++u)
        if (check(u) || check(u|0x80000000U)) return 1;
    printf("%llu independent reduction checks; max sin/cos reconstruction error %.12g @ %08lx (%s).\n",
           cases,maximum,(unsigned long)worst,quick ? "quick" : "full");
    printf("Nearest-quadrant differences: %llu total, %llu above fast cutoff (interval seam differences remain subject to quality bound).\n",
           quadrant_mismatches,large_quadrant_mismatches);
    return 0;
}
