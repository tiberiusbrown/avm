#ifndef AVM_COMPLEX_INTERNAL_H
#define AVM_COMPLEX_INTERNAL_H
#include <complex.h>
#include <math.h>
#include <stdint.h>
#define CX(re, im) __builtin_complex((float)(re), (float)(im))
#define CX_PI 3.14159265358979323846f
#define CX_PI_2 1.57079632679489661923f
#define CX_LN2 0.69314718055994530942f
static inline uint32_t cx_bits(float x) { union { float f; uint32_t u; } v={x}; return v.u; }
static inline float cx_flip(float x) { union { float f; uint32_t u; } v={x}; v.u^=0x80000000UL; return v.f; }
/* An exact zero factor stays a signed zero even if the other factor overflows. */
static inline float cx_product(float a,float b) {
    if (a==0 && isinf(b)) return copysignf(0,a)*copysignf(1,b);
    if (b==0 && isinf(a)) return copysignf(0,b)*copysignf(1,a);
    return a*b;
}
/* exp(x)*t without premature overflow, with exact trigonometric zeros. */
static inline float cx_exp_product(float x,float t) {
    if(t==0) return t;
    if(x>80 && x<=192) {
        float e=expf(0.25f*x);
        return (((t*e)*e)*e)*e;
    }
    return expf(x)*t;
}
static __attribute__((always_inline)) inline float complex cx_exp(float complex z) {
    float x=__real__ z,y=__imag__ z,s,c;
    if(y==0) return CX(expf(x),y);
    if(!isfinite(y)) {
        if(x==-INFINITY) return CX(0,copysignf(0,y));
        if(x==INFINITY) return CX(INFINITY,NAN);
        return CX(NAN,NAN);
    }
    sincosf(y,&s,&c);
    return CX(cx_exp_product(x,c),cx_exp_product(x,s));
}
#endif
