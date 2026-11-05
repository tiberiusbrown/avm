#include "math/fdlibm.h"
#include "math/sin_kernel.h"
#include "math/cos_kernel.h"

#define PI 0x1.921fb6p1f
#define INV_PI 0x1.45f306p-2f
#define LN2 0x1.62e43p-1f
#define LN10 0x1.26bb1cp1f

/* Reduce in half-turns before multiplying by pi. Binary32 integers and
   half-integers remain exact even when x is too large for radian reduction. */
static float pi_reduce(float x, unsigned *quadrant)
{
    float a = avm_math_abs(x);
    if (a >= 0x1p23f) {
        uint32_t u; GET_FLOAT_WORD(u, a);
        *quadrant = a < 0x1p24f ? (unsigned)(u & 1U) * 2U : 0;
        return 0.0f;
    }
    uint32_t n = (uint32_t)(2.0f*a);
    float r = a - 0.5f*(float)n;
    if (r > 0.25f) { ++n; r -= 0.5f; }
    *quadrant = (unsigned)(n & 3U);
    return r*PI;
}
/* These odd functions can produce a subnormal or zero from nonzero input. */
static float small_result(float x, float result)
{
    if (AVM_MATH_UNLIKELY(avm_math_magnitude(x) != 0 &&
                          avm_math_magnitude(result) < 0x00800000UL)) errno=ERANGE;
    return result;
}
static float pi_invalid(float x)
{
    if (avm_math_inf(x)) { errno = EDOM; return NAN; }
    return x+x;
}
float sinpif(float x)
{
    if (!avm_math_finite(x)) return pi_invalid(x);
    unsigned q; float r=pi_reduce(x,&q);
    if (r == 0.0f && !(q&1U)) return __builtin_copysignf(0.0f,x);
    float z=(q&1U) ? avm_cos_kernel(r) : avm_sin_kernel(r);
    return small_result(x, avm_math_flip_sign(z, ((q&2U)!=0) ^ (avm_math_high_word(x)>>15)));
}
float cospif(float x)
{
    if (!avm_math_finite(x)) return pi_invalid(x);
    unsigned q; float r=pi_reduce(x,&q);
    if (r == 0.0f && (q&1U)) return 0.0f;
    float z=(q&1U) ? avm_sin_kernel(r) : avm_cos_kernel(r);
    return avm_math_flip_sign(z, (q==1U || q==2U));
}
float tanpif(float x)
{
    if (!avm_math_finite(x)) return pi_invalid(x);
    unsigned q; float r=pi_reduce(x,&q);
    unsigned sign=avm_math_high_word(x)>>15;
    if (r == 0.0f) {
        if (q&1U) { errno=ERANGE; return avm_math_flip_sign(INFINITY, (q==3U)^sign); }
        return avm_math_flip_sign(0.0f, (q==2U)^sign);
    }
    float s=avm_sin_kernel(r), c=avm_cos_kernel(r);
    return small_result(x, avm_math_flip_sign((q&1U) ? -c/s : s/c, sign));
}
float asinpif(float x) { return small_result(x,asinf(x)*INV_PI); }
float acospif(float x) { return acosf(x)*INV_PI; }
float atanpif(float x) { return small_result(x,atanf(x)*INV_PI); }
float atan2pif(float y, float x) { return atan2f(y,x)*INV_PI; }

float exp10f(float x)
{
    if (avm_math_finite(x) && x > 40.0f) return expf(100.0f);
    if (avm_math_finite(x) && x < -50.0f) return expf(-120.0f);
    return expf(x*LN10);
}
float exp10m1f(float x)
{
    if (avm_math_finite(x) && x > 40.0f) return expf(100.0f);
    if (x < -50.0f) return -1.0f;
    return small_result(x,expm1f(x*LN10));
}
float exp2m1f(float x)
{
    if (avm_math_finite(x) && x > 128.0f) return expf(100.0f);
    if (x < -150.0f) return -1.0f;
    return small_result(x,expm1f(x*LN2));
}
float logp1f(float x) { return small_result(x,log1pf(x)); }
float log2p1f(float x) { return small_result(x,log1pf(x)*0x1.715476p0f); }
float log10p1f(float x) { return small_result(x,log1pf(x)*0x1.bcb7b2p-2f); }

static float domain(void) { errno=EDOM; return NAN; }
float pownf(float x, long long n)
{
    if (!n) return issignalingf_inline(x) ? x+x : 1.0f;
    unsigned neg=(avm_math_high_word(x)>>15) && (n&1);
    float z=powf(avm_math_abs(x),(float)n);
    return avm_math_flip_sign(z,neg);
}
float powrf(float x, float y)
{
    if (avm_math_nan(x) || avm_math_nan(y)) return x+y;
    if (x < 0.0f || ((x == 0.0f || avm_math_inf(x)) && y == 0.0f) ||
        (x == 1.0f && avm_math_inf(y))) return domain();
    return powf(avm_math_abs(x),y);
}
float rootnf(float x, long long n)
{
    if (!n) return domain();
    if (avm_math_nan(x)) return x+x;
    unsigned odd=(unsigned)(n&1);
    if (x < 0.0f && !odd) return domain();
    unsigned neg=(avm_math_high_word(x)>>15) && odd;
    float a=avm_math_abs(x), z;
    if (n==1) z=a;
    else if (n==-1) z=powf(a,-1.0f);
    else if (n==2) z=sqrtf(a);
    else if (n==3) z=cbrtf(a);
    else if (a==0.0f || avm_math_inf(a)) z=powf(a,n<0 ? -1.0f : 1.0f);
    else z=powf(a,1.0f/(float)n);
    return avm_math_flip_sign(z,neg);
}
float compoundnf(float x, long long n)
{
    if (x < -1.0f) return domain();
    if (!n) return issignalingf_inline(x) ? x+x : 1.0f;
    if (avm_math_nan(x)) return x+x;
    if (x == -1.0f || avm_math_inf(x)) return pownf(1.0f+x,n);
    if (n==1) return 1.0f+x;
    if (avm_math_abs(x) >= 0.0625f && n >= -128 && n <= 128) {
        /* Exponentiation by squaring avoids magnifying log approximation
           error. Compensate for rounding 1+x before exponentiation. */
        float base=1.0f+x, correction=x-(base-1.0f);
        unsigned exponent=(unsigned)(n < 0 ? -n : n);
        float factor=n < 0 ? 1.0f/base : base, z=1.0f;
        do {
            if (exponent&1U) z*=factor;
            exponent>>=1;
            if (exponent) factor*=factor;
        } while (exponent);
        if (z!=0.0f && avm_math_finite(z))
            z *= 1.0f+((float)n*correction)/base;
        return avm_math_check_range(z);
    }
    if (x >= -0.5f && x <= 1.0f) {
        /* log(1+x) = 2*atanh(x/(2+x)); this short fpoly keeps
           logarithm error small when n magnifies it. */
        float t=x/(2.0f+x), z=t*t;
        float p=AVM_FPOLY8(z,0x1.111112p-4f,0x1.3b13b2p-4f,
                           0x1.745d18p-4f,0x1.c71c72p-4f,0x1.24924ap-3f,
                           0.2f,0x1.555556p-2f,1.0f);
        float nf=(float)n, nt=nf*t, scale=2.0f*p, y=nt*scale;
        float remainder=avm_native_fma(-t,2.0f,x);
        remainder=avm_native_fma(-t,x,remainder)/(2.0f+x);
        float error=avm_native_fma(nt,scale,-y);
        error += avm_native_fma(nf,t,-nt)*scale;
        error += (2.0f*nf*remainder)/(1.0f-z);
        float result=expf(y);
        if (result!=0.0f && avm_math_finite(result)) result*=1.0f+error;
        return result;
    }
    return expf((float)n*log1pf(x));
}
float rsqrtf(float x)
{
    if (x==0.0f) { errno=ERANGE; return __builtin_copysignf(INFINITY,x); }
    return 1.0f/sqrtf(x);
}

/* All AVM real floating types use the same binary32 representation. */
#define WRAP1(name) \
 double name(double x) { return (double)name##f((float)x); } \
 long double name##l(long double x) { return (long double)name##f((float)x); }
#define WRAP2(name) \
 double name(double x,double y) { return (double)name##f((float)x,(float)y); } \
 long double name##l(long double x,long double y) { return (long double)name##f((float)x,(float)y); }
#define WRAPN(name) \
 double name(double x,long long n) { return (double)name##f((float)x,n); } \
 long double name##l(long double x,long long n) { return (long double)name##f((float)x,n); }
WRAP1(sinpi) WRAP1(cospi) WRAP1(tanpi) WRAP1(asinpi) WRAP1(acospi) WRAP1(atanpi)
WRAP2(atan2pi)
WRAP1(exp10) WRAP1(exp10m1) WRAP1(exp2m1) WRAP1(logp1) WRAP1(log2p1) WRAP1(log10p1)
WRAPN(pown) WRAP2(powr) WRAPN(rootn) WRAPN(compoundn) WRAP1(rsqrt)
