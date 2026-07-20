#ifndef AVM_RUNTIME_MATH_H
#define AVM_RUNTIME_MATH_H

#ifdef __cplusplus
extern "C" {
#endif

float sinf(float x);
float cosf(float x);
float atan2f(float y, float x);
float tanf(float x);
float expf(float x);
float logf(float x);
float log2f(float x);
float log10f(float x);
float powf(float x, float y);
float hypotf(float x, float y);
float fmodf(float x, float y);

#ifdef __cplusplus
} // extern "C"
#endif

/*
 * Ordinary call syntax lowers directly to the target builtin and therefore
 * does not depend on inlining or LTO. A function-like macro does not expand
 * for &sinf or (sinf)(x), so those forms continue to use the real function
 * definitions in libavm.a.
 *
 * Define AVM_MATH_NO_BUILTIN_MACROS before including this header to request
 * ordinary calls explicitly. AVM_MATH_IMPLEMENTATION is reserved for the
 * runtime source that defines the addressable wrappers.
 */
#if !defined(AVM_MATH_IMPLEMENTATION) && \
    !defined(AVM_MATH_NO_BUILTIN_MACROS)
#define sinf(x)      __avm_sinf((x))
#define cosf(x)      __avm_cosf((x))
#define atan2f(y, x) __avm_atan2f((y), (x))
#define tanf(x)      __avm_tanf((x))
#define expf(x)      __avm_expf((x))
#define logf(x)      __avm_logf((x))
#define log2f(x)     __avm_log2f((x))
#define log10f(x)    __avm_log10f((x))
#define powf(x, y)   __avm_powf((x), (y))
#define hypotf(x, y) __avm_hypotf((x), (y))
#define fmodf(x, y)  __avm_fmodf((x), (y))
#endif

#endif // AVM_RUNTIME_MATH_H
