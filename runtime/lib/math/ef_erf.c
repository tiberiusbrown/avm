#include "fdlibm.h"
#include "fpoly.h"

#define AVM_ERF_SMALL_LIMIT 0x3fa00000UL
#define AVM_ERF_SATURATION  0x40800000UL
#define AVM_ERFC_ZERO_LIMIT 0x41300000UL

static inline float avm_erf_ratio(float z)
{
    return AVM_FPOLY7(z, 0x1.05f998p-14f, -0x1.8618eap-11f,
        0x1.4ef85cp-8f, -0x1.b72a56p-6f, 0x1.ce1d68p-4f,
        -0x1.8126c6p-2f, 0x1.20dd74p+0f);
}

static inline float avm_erfc_tail_ratio(float t)
{
    return AVM_FPOLY7(t, -0x1.15569cp+0f, 0x1.327abep+1f,
        -0x1.a9d91ap+0f, -0x1.53a3a2p-4f, 0x1.08a0e4p-2f,
        0x1.21a1f2p-1f, 0x1.20d858p-1f);
}

/* Positive finite inputs only; intermediate underflow must preserve errno. */
static __attribute__((noinline)) float avm_erfc_positive_tail(float x)
{
    float t = 1.0f / (1.0f + x);
    float scale = t * avm_erfc_tail_ratio(t);
    return scale * __avm_expf_noerrno(-x*x);
}

float erff(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t magnitude = bits & 0x7fffffffUL;
    uint32_t sign = bits >> 31;
    if (AVM_MATH_UNLIKELY(magnitude >= 0x7f800000UL)) {
        if (magnitude > 0x7f800000UL) return x+x;
        return sign ? -1.0f : 1.0f;
    }
    if (AVM_MATH_UNLIKELY(magnitude == 0)) return x;
    if (magnitude >= AVM_ERF_SATURATION) return sign ? -1.0f : 1.0f;
    if (magnitude < AVM_ERF_SMALL_LIMIT) {
        float result = x * avm_erf_ratio(x*x);
        if (AVM_MATH_UNLIKELY(magnitude < 0x00800000UL)) {
            GET_FLOAT_WORD(bits, result);
            if ((bits & 0x7f800000UL) == 0) errno = ERANGE;
        }
        return result;
    }
    float positive;
    SET_FLOAT_WORD(positive, magnitude);
    float t = avm_erfc_positive_tail(positive);
    return sign ? t-1.0f : 1.0f-t;
}

float erfcf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t magnitude = bits & 0x7fffffffUL;
    uint32_t sign = bits >> 31;
    if (AVM_MATH_UNLIKELY(magnitude >= 0x7f800000UL)) {
        if (magnitude > 0x7f800000UL) return x+x;
        return sign ? 2.0f : 0.0f;
    }
    if (AVM_MATH_UNLIKELY(magnitude == 0)) return 1.0f;
    if (sign && magnitude >= AVM_ERF_SATURATION) return 2.0f;
    if (AVM_MATH_UNLIKELY(!sign && magnitude >= AVM_ERFC_ZERO_LIMIT)) {
        errno = ERANGE;
        return 0.0f;
    }
    if (magnitude < AVM_ERF_SMALL_LIMIT)
        return 1.0f - x * avm_erf_ratio(x*x);
    float positive;
    SET_FLOAT_WORD(positive, magnitude);
    float t = avm_erfc_positive_tail(positive);
    if (sign) return 2.0f-t;
    GET_FLOAT_WORD(bits, t);
    if (AVM_MATH_UNLIKELY((bits & 0x7f800000UL) == 0)) errno = ERANGE;
    return t;
}
