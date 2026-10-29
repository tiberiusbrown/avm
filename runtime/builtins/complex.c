//===-- mulsc3.c - Implement __mulsc3 -------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements __mulsc3 for the compiler_rt library.
//
//===----------------------------------------------------------------------===//

/* Adapted for AVM: binary32 scalar core and typed wrappers. */
#include "../lib/complex/complex_internal.h"
static float cx_sign(float a,float b) {
    union { float f; uint32_t u; } x={a};
    x.u=(x.u&0x7fffffffUL)|(cx_bits(b)&0x80000000UL);return x.f;
}
// Returns: the product of a + ib and c + id

static __attribute__((always_inline)) inline float _Complex cx_mul(float __a, float __b, float __c, float __d) {
  float __ac = __a * __c;
  float __bd = __b * __d;
  float __ad = __a * __d;
  float __bc = __b * __c;
  float _Complex z;
  __real__ z = __ac - __bd;
  __imag__ z = __ad + __bc;
  if (isnan(__real__ z) && isnan(__imag__ z)) {
    int __recalc = 0;
    if (isinf(__a) || isinf(__b)) {
      __a = cx_sign(isinf(__a) ? 1 : 0, __a);
      __b = cx_sign(isinf(__b) ? 1 : 0, __b);
      if (isnan(__c))
        __c = cx_sign(0, __c);
      if (isnan(__d))
        __d = cx_sign(0, __d);
      __recalc = 1;
    }
    if (isinf(__c) || isinf(__d)) {
      __c = cx_sign(isinf(__c) ? 1 : 0, __c);
      __d = cx_sign(isinf(__d) ? 1 : 0, __d);
      if (isnan(__a))
        __a = cx_sign(0, __a);
      if (isnan(__b))
        __b = cx_sign(0, __b);
      __recalc = 1;
    }
    if (!__recalc && (isinf(__ac) || isinf(__bd) || isinf(__ad) ||
                      isinf(__bc))) {
      if (isnan(__a))
        __a = cx_sign(0, __a);
      if (isnan(__b))
        __b = cx_sign(0, __b);
      if (isnan(__c))
        __c = cx_sign(0, __c);
      if (isnan(__d))
        __d = cx_sign(0, __d);
      __recalc = 1;
    }
    if (__recalc) {
      __real__ z = INFINITY * (__a * __c - __b * __d);
      __imag__ z = INFINITY * (__a * __d + __b * __c);
    }
  }
  return z;
}

/* No archive back-reference to libavm: scaling is local scalar arithmetic.
   Normalize both operands, keeping numerator sums away from overflow too. */
static float cx_scale(float a,int n) {
    while(n>127) { a*=0x1p127f;n-=127; }
    while(n< -126) { a*=0x1p-126f;n+=126; }
    union { uint32_t u;float f; } p={(uint32_t)(n+127)<<23};
    return a*p.f;
}
static int cx_exponent(float a) {
    uint32_t u=cx_bits(a)&0x7fffffffUL;
    int e=(int)(u>>23)-127;
    if(e== -127 && u) { a*=0x1p24f;e=(int)((cx_bits(a)&0x7fffffffUL)>>23)-151; }
    return e;
}
static __attribute__((always_inline)) inline float _Complex cx_div(float a,float b,float c,float d) {
    float x,y,den;
    if(isfinite(a)&&isfinite(b)&&isfinite(c)&&isfinite(d)&&(c!=0||d!=0)) {
        float ma=(cx_bits(a)&0x7fffffffUL)>(cx_bits(b)&0x7fffffffUL)?a:b;
        float mc=(cx_bits(c)&0x7fffffffUL)>(cx_bits(d)&0x7fffffffUL)?c:d;
        int ea=cx_exponent(ma),ec=cx_exponent(mc);
        if(ea>60||ea< -60||ec>60||ec< -60) {
            a=cx_scale(a,-ea);b=cx_scale(b,-ea);
            c=cx_scale(c,-ec);d=cx_scale(d,-ec);
            den=c*c+d*d;
            return CX(cx_scale((a*c+b*d)/den,ea-ec),cx_scale((b*c-a*d)/den,ea-ec));
        }
        den=c*c+d*d;
        return CX((a*c+b*d)/den,(b*c-a*d)/den);
    }
    den=c*c+d*d;x=(a*c+b*d)/den;y=(b*c-a*d)/den;
    if(isnan(x)&&isnan(y)) {
        if(c==0&&d==0&&(!isnan(a)||!isnan(b))) {
            x=cx_sign(INFINITY,c)*a;y=cx_sign(INFINITY,c)*b;
        } else if((isinf(a)||isinf(b))&&isfinite(c)&&isfinite(d)) {
            a=cx_sign(isinf(a)?1:0,a);b=cx_sign(isinf(b)?1:0,b);
            x=INFINITY*(a*c+b*d);y=INFINITY*(b*c-a*d);
        } else if((isinf(c)||isinf(d))&&isfinite(a)&&isfinite(b)) {
            c=cx_sign(isinf(c)?1:0,c);d=cx_sign(isinf(d)?1:0,d);
            /* Scale huge finite numerators before the signed-zero recovery. */
            a*=0.25f;b*=0.25f;
            x=0*(a*c+b*d);y=0*(b*c-a*d);
        }
    }
    return CX(x,y);
}
float _Complex __mulsc3(float a,float b,float c,float d) {
    float _Complex z=cx_mul((float)a,(float)b,(float)c,(float)d);
    return __builtin_complex((float)__real__ z,(float)__imag__ z);
}
float _Complex __divsc3(float a,float b,float c,float d) {
    float _Complex z=cx_div((float)a,(float)b,(float)c,(float)d);
    return __builtin_complex((float)__real__ z,(float)__imag__ z);
}
double _Complex __muldc3(double a,double b,double c,double d) {
    float _Complex z=cx_mul((float)a,(float)b,(float)c,(float)d);
    return __builtin_complex((double)__real__ z,(double)__imag__ z);
}
double _Complex __divdc3(double a,double b,double c,double d) {
    float _Complex z=cx_div((float)a,(float)b,(float)c,(float)d);
    return __builtin_complex((double)__real__ z,(double)__imag__ z);
}
long double _Complex __mulxc3(long double a,long double b,long double c,long double d) {
    float _Complex z=cx_mul((float)a,(float)b,(float)c,(float)d);
    return __builtin_complex((long double)__real__ z,(long double)__imag__ z);
}
long double _Complex __divxc3(long double a,long double b,long double c,long double d) {
    float _Complex z=cx_div((float)a,(float)b,(float)c,(float)d);
    return __builtin_complex((long double)__real__ z,(long double)__imag__ z);
}
