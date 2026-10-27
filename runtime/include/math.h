#ifndef _AVM_RUNTIME_MATH_H
#define _AVM_RUNTIME_MATH_H

#ifdef __cplusplus
extern "C" {
#endif

float sqrtf(float x);
float sinf(float x);
float cosf(float x);
void sincosf(float x, float *sine, float *cosine);
float atan2f(float y, float x);
float tanf(float x);
float expf(float x);
float logf(float x);
float log2f(float x);
float log10f(float x);
float powf(float x, float y);
float hypotf(float x, float y);
float fmodf(float x, float y);
/* avr-libc extended multiply/add precision, rounded once at the end. */
float fmaf(float x, float y, float z);
float atanf(float x);
float fabsf(float x);
float copysignf(float x, float y);
float scalbnf(float x, int n);
float truncf(float x);
float floorf(float x);
float ceilf(float x);
float roundf(float x);
float fminf(float x, float y);
float fmaxf(float x, float y);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // AVM_RUNTIME_MATH_H
