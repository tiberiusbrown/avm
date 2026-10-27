/* Independent host libm checks for exact operations and deterministic sweeps
   of the new approximations. Production FPOLY/FMA models are linked unchanged. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include "accuracy_policy.h"
#include "reference_profile.h"
float avm_reference_ldexpf(float,int);
float avm_reference_frexpf(float,int *);
float avm_reference_modff(float,float *);
float avm_reference_nextafterf(float,float);
float avm_reference_exp2f(float);
float avm_reference_expm1f(float);
float avm_reference_log1pf(float);
float avm_reference_cbrtf(float);
float avm_reference_asinf(float);
float avm_reference_acosf(float);
static uint32_t bits(float x) { uint32_t u; memcpy(&u,&x,4); return u; }
static float value(uint32_t u) { float x; memcpy(&x,&u,4); return x; }
static uint32_t state=0x41564d26U;
static uint32_t random_word(void) { state^=state<<13; state^=state>>17; state^=state<<5; return state; }
static unsigned failures;
static int same(float a,float b) { return bits(a)==bits(b) || (isnan(a)&&isnan(b)); }
static void exact(float x,float y,int n)
{
    int a=99,b=99;
    float m=avm_reference_frexpf(x,&a), ref=frexpf(x,&b);
    /* Exponent zero for exceptional values is an AVM guarantee. */
    if (!isfinite(x)) b=0;
    float i,j;
    float f=avm_reference_modff(x,&i), g=modff(x,&j);
    if (!same(m,ref) || a!=b || !same(f,g) || !same(i,j) ||
        !same(avm_reference_ldexpf(x,n),ldexpf(x,n)) ||
        !same(avm_reference_nextafterf(x,y),nextafterf(x,y))) {
        if (failures++<8) printf("FAIL exact x=%08lx y=%08lx n=%d\n",(unsigned long)bits(x),(unsigned long)bits(y),n);
    }
}
struct stats { double absolute,relative; uint32_t ulp,worst_abs,worst_rel,worst_ulp; unsigned count; };
static struct stats stats[6];
static const char *names[]={"exp2f","expm1f","log1pf","cbrtf","asinf","acosf"};
static const enum avm_accuracy policies[]={AVM_EXP,AVM_EXPM1,AVM_LOG,AVM_CBRT,AVM_ATAN,AVM_ATAN};
static void approximate(unsigned n,float x,float a,double r)
{
    struct stats *s=&stats[n]; ++s->count;
    float rounded=(float)r;
    int ok;
    if (!isfinite(rounded) || !isfinite(a) || a==0 || rounded==0 || signbit(a)!=signbit(rounded))
        ok=same(a,rounded);
    else {
        uint32_t u=bits(a),v=bits(rounded),ulp=u>v?u-v:v-u;
        double absolute=fabs((double)a-r),relative=fabs(r)>=0x1p-126?absolute/fabs(r):0;
        if (absolute>s->absolute) { s->absolute=absolute; s->worst_abs=bits(x); }
        if (relative>s->relative) { s->relative=relative; s->worst_rel=bits(x); }
        if (ulp>s->ulp) { s->ulp=ulp; s->worst_ulp=bits(x); }
        ok=avm_accuracy_accept(policies[n],a,r,ulp);
    }
    if (!ok && failures++<8) printf("FAIL %s(%08lx): %08lx expected %08lx\n",names[n],(unsigned long)bits(x),(unsigned long)bits(a),(unsigned long)bits(rounded));
}
static void unary(float x)
{
    approximate(0,x,avm_reference_exp2f(x),exp2((double)x));
    approximate(1,x,avm_reference_expm1f(x),expm1((double)x));
    approximate(2,x,avm_reference_log1pf(x),log1p((double)x));
    approximate(3,x,avm_reference_cbrtf(x),cbrt((double)x));
    approximate(4,x,avm_reference_asinf(x),asin((double)x));
    approximate(5,x,avm_reference_acosf(x),acos((double)x));
}
int main(int argc,char **argv)
{
    int quick=reference_quick(argc,argv); if (quick<0) return 2;
    static const uint32_t special[]={0,0x80000000U,1,0x80000001U,0x007fffffU,
        0x00800000U,0x3f7fffffU,0x3f800000U,0x3f800001U,0xbf800000U,
        0x7f7fffffU,0xff7fffffU,0x7f800000U,0xff800000U,0x7fc12345U,0x7f812345U};
    for (unsigned i=0;i<sizeof(special)/sizeof(*special);++i) {
        unary(value(special[i]));
        for (unsigned j=0;j<sizeof(special)/sizeof(*special);++j)
            for (int n=-150;n<=128;++n) exact(value(special[i]),value(special[j]),n);
        exact(value(special[i]),0,INT_MIN); exact(value(special[i]),0,INT_MAX);
    }
    unsigned count=quick?4096:262144;
    for (unsigned i=0;i<count;++i) {
        float x=value(random_word()),y=value(random_word());
        exact(x,y,(int)(random_word()%800)-400);
        unary(x);
        /* Dense common domain, cancellation region, and both inverse-trig endpoints. */
        unary((float)((double)i/count*2-1));
    }
    for (unsigned e=0;e<255;++e) for (unsigned i=0;i<32;++i) {
        uint32_t u=(e<<23)|(i*0x42108U);
        unary(value(u)); unary(-value(u));
        exact(value(u),0,127-(int)e); exact(-value(u),value(1),-150+(int)e);
    }
    for (unsigned n=0;n<6;++n) {
        struct stats *s=&stats[n];
        printf("%s count=%u abs=%.9g at %08lx rel=%.9g at %08lx ULP=%lu at %08lx\n",
            names[n],s->count,s->absolute,(unsigned long)s->worst_abs,s->relative,
            (unsigned long)s->worst_rel,(unsigned long)s->ulp,(unsigned long)s->worst_ulp);
    }
    printf("C99 failures=%u\n",failures);
    return failures!=0;
}
