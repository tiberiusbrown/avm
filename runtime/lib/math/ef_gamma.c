#include "fdlibm.h"
#include "fpoly.h"

static inline float avm_gamma_base(float t)
{
    float p = AVM_FPOLY7(t, -0x1.2cee46p-5f, 0x1.4dac92p-3f,
        -0x1.563358p-2f, 0x1.c25fecp-2f, -0x1.f4973ap-2f,
        0x1.a553bap-2f, -0x1.278854p-1f);
    return 1.0f + (t * (1.0f - t)) * p;
}

static float avm_gamma_positive_small(float x)
{
    if (x < 1.0f) return avm_gamma_base(x) / x;
    float product = 1.0f;
    while (x >= 2.0f) { x -= 1.0f; product *= x; }
    return product * avm_gamma_base(x - 1.0f);
}

static inline float avm_lgamma_stirling(float x)
{
    float inv = 1.0f / x, z = inv * inv;
    float correction = inv * AVM_FPOLY3(z, 0x1.a01a02p-11f,
        -0x1.6c16c2p-9f, 0x1.555556p-4f);
    float logarithm = logf(x);
    /* Avoid overflowing x*log(x) before subtracting x when the final
       logarithmic gamma still fits. At this scale the smaller terms round
       away, but retain the same Stirling expression algebraically. */
    if (x >= 0x1p120f)
        return ((x - 0.5f) * (logarithm - 1.0f) - 0.5f)
             + 0x1.d67f1cp-1f + correction;
    return ((x - 0.5f) * logarithm - x) + 0x1.d67f1cp-1f + correction;
}

static inline float avm_gamma_sincpi(float z)
{
    return AVM_FPOLY6(z, -0x1.33816ap-9f, 0x1.ac6806p-6f,
        -0x1.86a8e4p-3f, 0x1.9f9cb4p-1f, -0x1.a51a66p+0f, 1.0f);
}

/* Only finite magnitudes below 2^23 reach this conversion. */
static float avm_gamma_reflection_factor(float a, uint32_t n)
{
    float f = a - (float)n;
    float d = f <= 0.5f ? f : 1.0f - f;
    return d * avm_gamma_sincpi(d*d);
}

static float avm_gamma_reflection_small(float a, float factor)
{
    float positive = a < 1.0f ? avm_gamma_base(a)
                             : avm_gamma_positive_small(1.0f + a);
    return (1.0f / factor) / positive;
}

static float avm_lgamma_reflection_large(float a, float factor)
{
    return -logf(factor) - avm_lgamma_stirling(1.0f + a);
}

static float avm_gamma_constant(uint32_t bits)
{
    float result;
    SET_FLOAT_WORD(result, bits);
    return result;
}

float lgammaf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t magnitude = bits & 0x7fffffffUL;
    if (magnitude > 0x7f800000UL) return x+x;
    if (magnitude == 0x7f800000UL) return avm_gamma_constant(0x7f800000UL);
    if (!magnitude) { errno = ERANGE; return avm_gamma_constant(0x7f800000UL); }
    if (!(bits >> 31)) {
        if (x == 1.0f || x == 2.0f) return 0.0f;
        if (x < 0x1p-17f) return -logf(x);
        if (x < 8.0f) return logf(avm_gamma_positive_small(x));
        /* First binary32 input whose logarithmic gamma rounds to infinity.
           Guard the boundary independently of rounded logf arithmetic. */
        if (bits >= 0x7c44af8eUL) {
            errno = ERANGE;
            return avm_gamma_constant(0x7f800000UL);
        }
        float result = avm_lgamma_stirling(x);
        GET_FLOAT_WORD(bits, result);
        if ((bits & 0x7fffffffUL) == 0x7f800000UL) errno = ERANGE;
        return result;
    }
    float a = -x;
    if (a < 0x1p-17f) return -logf(a);
    if (magnitude >= 0x4b000000UL) {
        errno = ERANGE; return avm_gamma_constant(0x7f800000UL);
    }
    uint32_t n = (uint32_t)a;
    if (a == (float)n) { errno = ERANGE; return avm_gamma_constant(0x7f800000UL); }
    float factor = avm_gamma_reflection_factor(a, n);
    if (a < 7.0f) return logf(avm_gamma_reflection_small(a, factor));
    return avm_lgamma_reflection_large(a, factor);
}

float tgammaf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t magnitude = bits & 0x7fffffffUL;
    if (magnitude > 0x7f800000UL) return x+x;
    if (bits == 0x7f800000UL) return x;
    if (bits == 0xff800000UL) { errno = EDOM; return avm_gamma_constant(0x7fc00000UL); }
    if (!magnitude) { errno = ERANGE; return avm_gamma_constant(bits | 0x7f800000UL); }
    if (magnitude < 0x37000000UL) {
        float result = 1.0f / x;
        GET_FLOAT_WORD(bits, result);
        if ((bits & 0x7fffffffUL) == 0x7f800000UL) errno = ERANGE;
        return result;
    }
    if (!(bits >> 31)) {
        if (x < 8.0f) return avm_gamma_positive_small(x);
        if (bits >= 0x420c2910UL) { errno = ERANGE; return __math_oflowf(0); }
        float result = __avm_expf_noerrno(avm_lgamma_stirling(x));
        GET_FLOAT_WORD(bits, result);
        if (bits == 0x7f800000UL) errno = ERANGE;
        return result;
    }
    float a = -x;
    if (magnitude >= 0x4b000000UL) {
        errno = EDOM; return avm_gamma_constant(0x7fc00000UL);
    }
    uint32_t n = (uint32_t)a;
    if (a == (float)n) { errno = EDOM; return avm_gamma_constant(0x7fc00000UL); }
    uint32_t sign = (n & 1) ? 0 : 0x80000000UL;
    if (a >= 43.0f) { errno = ERANGE; return avm_gamma_constant(sign); }
    float factor = avm_gamma_reflection_factor(a, n);
    float result;
    if (a < 7.0f) result = avm_gamma_reflection_small(a, factor);
    else {
        result = __avm_expf_noerrno(avm_lgamma_reflection_large(a, factor));
        GET_FLOAT_WORD(bits, result);
        if (bits < 0x00800000UL) errno = ERANGE;
    }
    GET_FLOAT_WORD(bits, result);
    return avm_gamma_constant(bits | sign);
}
