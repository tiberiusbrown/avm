/* Exact host-libm references for binary32 operations. Production objects
   include the native fmod model and do not use host division for remquo. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include "reference_profile.h"
float avm_reference_nextafterf(float,float);
float avm_reference_fdimf(float,float);
float avm_reference_remainderf(float,float);
float avm_reference_remquof(float,float,int *);
float avm_reference_nearbyintf(float);
float avm_reference_rintf(float);
long avm_reference_lrintf(float);
long avm_reference_lroundf(float);
long long avm_reference_llrintf(float);
long long avm_reference_llroundf(float);
float avm_reference_nanf(const char *);
int avm_reference_ilogbf(float);
float avm_reference_logbf(float);
float avm_reference_fmaxmagf(float,float);
float avm_reference_fminmagf(float,float);
static uint32_t bits(float x) { uint32_t u; memcpy(&u,&x,4); return u; }
static float value(uint32_t u) { float x; memcpy(&x,&u,4); return x; }
static uint32_t state=0x41564d26U;
static uint32_t random_word(void) { state^=state<<13; state^=state>>17; state^=state<<5; return state; }
static unsigned failures, pairs, unaries;
static void compare(const char *name,float x,float y,float actual,float expected)
{
    if (bits(actual)==bits(expected) ||
        (isnan(actual) && isnan(expected) && (bits(actual)&0x400000U))) return;
    if (failures++<12) printf("FAIL %s(%08lx,%08lx): %08lx expected %08lx\n",
        name,(unsigned long)bits(x),(unsigned long)bits(y),
        (unsigned long)bits(actual),(unsigned long)bits(expected));
}
static int snan(uint32_t u) { return (u&0x7fffffffU)>0x7f800000U && !(u&0x400000U); }
static float magnitude_reference(float x,float y,int maximum)
{
    uint32_t a=bits(x),b=bits(y);
    if (snan(a)||snan(b)) return NAN;
    if (isnan(x)) return y;
    if (isnan(y)) return x;
    if (fabs((double)x)==fabs((double)y)) {
        if (x==0 && y==0) return value(maximum ? a&b : a|b);
        return (float)(maximum ? fmax((double)x,y) : fmin((double)x,y));
    }
    return (fabs((double)x)>fabs((double)y))==maximum ? x : y;
}
static void binary(float x,float y)
{
    ++pairs;
    compare("nextafterf",x,y,avm_reference_nextafterf(x,y),nextafterf(x,y));
    compare("fdimf",x,y,avm_reference_fdimf(x,y),(float)fdim((double)x,y));
    compare("remainderf",x,y,avm_reference_remainderf(x,y),(float)remainder((double)x,y));
    int q=99,qr=99;
    float r=avm_reference_remquof(x,y,&q);
    double rr=remquo((double)x,y,&qr);
    compare("remquof",x,y,r,(float)rr);
    int invalid=!isfinite(x)||isnan(y)||y==0||isinf(y);
    int low=q<0?-q:q, ref=qr<0?-qr:qr;
    if ((invalid && q!=0) || (!invalid &&
        ((low&7)!=(ref&7) || (q!=0 && ((q<0)!=((bits(x)^bits(y))>>31)))))) {
        if (failures++<12) printf("FAIL remquo quotient %08lx %08lx: %d expected low %d\n",
            (unsigned long)bits(x),(unsigned long)bits(y),q,qr);
    }
    compare("fmaxmagf",x,y,avm_reference_fmaxmagf(x,y),magnitude_reference(x,y,1));
    compare("fminmagf",x,y,avm_reference_fminmagf(x,y),magnitude_reference(x,y,0));
}
static void unary(float x)
{
    ++unaries;
    double ri=nearbyint((double)x),ra=round((double)x);
    compare("rintf",x,0,avm_reference_rintf(x),(float)ri);
    compare("nearbyintf",x,0,avm_reference_nearbyintf(x),(float)ri);
    long li=isfinite(ri)&&ri>=-0x1p31&&ri<0x1p31 ? (long)ri : (-2147483647L-1);
    long la=isfinite(ra)&&ra>=-0x1p31&&ra<0x1p31 ? (long)ra : (-2147483647L-1);
    long long lli=isfinite(ri)&&ri>=-0x1p63&&ri<0x1p63 ? (long long)ri : LLONG_MIN;
    long long lla=isfinite(ra)&&ra>=-0x1p63&&ra<0x1p63 ? (long long)ra : LLONG_MIN;
    if (avm_reference_lrintf(x)!=li || avm_reference_lroundf(x)!=la ||
        avm_reference_llrintf(x)!=lli || avm_reference_llroundf(x)!=lla) {
        if (failures++<12) printf("FAIL integer rounding %08lx\n",(unsigned long)bits(x));
    }
    int e=isnan(x)?INT_MIN:isinf(x)?INT_MAX:x==0?INT_MIN:ilogb((double)x);
    if (avm_reference_ilogbf(x)!=e) {
        if (failures++<12) printf("FAIL ilogb %08lx\n",(unsigned long)bits(x));
    }
    compare("logbf",x,0,avm_reference_logbf(x),(float)logb((double)x));
}
int main(int argc,char **argv)
{
    /* --quick remains a compatibility alias for the same sampling policy. */
    if (reference_quick(argc, argv) < 0) return 2;
    static const uint32_t special[]={0,0x80000000U,1,0x80000001U,3,0x007fffffU,
        0x00800000U,0x3effffffU,0x3f000000U,0x3f000001U,0x3f800000U,0xbf800000U,
        0x3fc00000U,0x40200000U,0x4affffffU,0x4b000000U,0x4effffffU,0x4f000000U,
        0xcf000000U,0x5effffffU,0x5f000000U,0xdf000000U,0x7dffffffU,0x7e000000U,
        0x7effffffU,0x7f000000U,0x7f7fffffU,0x7f800000U,0xff800000U,
        0x7fc12345U,0xffc12345U,0x7f812345U,0xff812345U};
    for (unsigned i=0;i<sizeof(special)/sizeof(*special);++i) {
        unary(value(special[i]));
        for (unsigned j=0;j<sizeof(special)/sizeof(*special);++j)
            binary(value(special[i]),value(special[j]));
    }
    unsigned count=4096;
    for (unsigned i=0;i<count;++i) {
        float x=value(random_word()),y=value(random_word());
        unary(x); binary(x,y);
        x=(float)((double)i/count*65536-32768);
        unary(x);
        binary(x,1.625f);
    }
    for (unsigned e=0;e<255;++e) for (unsigned i=0;i<32;++i) {
        uint32_t u=(e<<23)|(i*0x42108U);
        for (unsigned sign=0;sign<2;++sign) {
            float x=value(u|(sign<<31)); unary(x);
            binary(x,value(1)); binary(x,value(3));
            binary(x,value(0x7f7fffffU)); binary(x,-x);
        }
    }
    /* Every small integer tie and its two neighboring binary32 values. */
    for (int n=-32768;n<32768;++n) {
        uint32_t u=bits((float)n+0.5f);
        unary(value(u-1)); unary(value(u)); unary(value(u+1));
    }
    for (unsigned n=0;n<23;++n) {
        uint32_t u=1U<<n;
        unary(value(u)); unary(-value(u));
    }
    static const char *tags[]={"","0","123","0x123","invalid","18446744073709551616"};
    float (*volatile make_nan)(const char *)=avm_reference_nanf;
    for (unsigned i=0;i<sizeof(tags)/sizeof(*tags);++i) {
        float x=make_nan(tags[i]);
        if (!isnan(x)||!(bits(x)&0x400000U)) ++failures;
    }
    printf("Exact math: %u unary inputs, %u binary pairs; failures=%u\n",unaries,pairs,failures);
    return failures!=0;
}
