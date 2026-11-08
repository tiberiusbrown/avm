#include <complex.h>
#include <math.h>
#include <stdint.h>
#define CX(T,X,Y) __builtin_complex((T)(X),(T)(Y))
#define TEST(T,S) \
__extension__ extern T complex abi_##S(int,T complex,int); \
__extension__ extern T complex var_##S(int,...); \
__extension__ static __attribute__((noinline)) int layout_##S(void) { \
 volatile T a=3,b=4;T complex z=CX(T,a,b),w=CX(T,1,-2); \
 struct { char c;T complex z; } obj={1,CX(T,3,4)}; \
 static T complex saved=CX(T,-0.0,INFINITY); \
 T complex array[2]={z,w}; T const *parts=(T const *)&obj.z; \
 if(sizeof(z)!=8 || sizeof(obj)!=9 || parts[0]!=3 || parts[1]!=4)return 1; \
 if(!signbit(__real__ saved)||!isinf(__imag__ saved))return 2; \
 return array[0]!=z||array[1]!=w; } \
__extension__ static __attribute__((noinline)) int calls_##S(void) { \
 volatile T a=3,b=4;T complex z=CX(T,a,b),v; \
 T complex (*volatile fp)(int,T complex,int)=abi_##S; \
 v=fp(2,z,1);if(__real__ v!=5||__imag__ v!=3)return 1; \
 v=var_##S(0,z);return v!=z; } \
__extension__ static __attribute__((noinline)) int mul_##S(void) { \
 volatile T a=3,b=4;T complex z=CX(T,a,b),w=CX(T,1,-2),v=z*w; \
 return __real__ v!=11||__imag__ v!= -2; } \
__extension__ static __attribute__((noinline)) int div_##S(void) { \
 volatile T a=3,b=4;T complex z=CX(T,a,b),w=CX(T,1,-2),v=z/w; \
 return fabsf((float)__real__ v+1)>1e-6f||fabsf((float)__imag__ v-2)>1e-6f; } \
__extension__ static __attribute__((noinline)) int arith_##S(void) { \
 volatile T a=3,b=4;T complex z=CX(T,a,b),w=CX(T,1,-2); \
 return z+w!=CX(T,4,2)||z-w!=CX(T,2,6)||-z!=CX(T,-3,-4)||+z!=z; } \
__extension__ static __attribute__((noinline)) int convert_##S(void) { \
 volatile T a=3;T complex v=a;if(__real__ v!=3||__imag__ v!=0)return 1; \
 v=CX(T,-0.0,-0.0);return !signbit(__real__ v)||!signbit(__imag__ v); } \
static int test_##S(void) { return layout_##S()||calls_##S()||mul_##S()||div_##S()||arith_##S()||convert_##S(); }
TEST(float,f)
TEST(double,d)
TEST(long double,l)
__extension__ _Static_assert(!__builtin_types_compatible_p(float complex,double complex),"distinct types");
__extension__ _Static_assert(!__builtin_types_compatible_p(double complex,long double complex),"distinct types");
__extension__ extern float complex __mulsc3(float,float,float,float);
__extension__ extern float complex __divsc3(float,float,float,float);
__extension__ static __attribute__((noinline)) int helper_sc3(void) {
    float complex (*volatile m)(float,float,float,float)=__mulsc3;
    float complex (*volatile d)(float,float,float,float)=__divsc3;
    volatile float a=1,b=2,c=3,e=4;
    float complex z=m(a,b,c,e);
    if(__real__ z!= -5||__imag__ z!=10)return 1;
    z=d(c,e,a,b);
    return fabsf((float)__real__ z-2.2f)>1e-6f||fabsf((float)__imag__ z+0.4f)>1e-6f;
}
__extension__ extern double complex __muldc3(double,double,double,double);
__extension__ extern double complex __divdc3(double,double,double,double);
__extension__ static __attribute__((noinline)) int helper_dc3(void) {
    double complex (*volatile m)(double,double,double,double)=__muldc3;
    double complex (*volatile d)(double,double,double,double)=__divdc3;
    volatile double a=1,b=2,c=3,e=4;
    double complex z=m(a,b,c,e);
    if(__real__ z!= -5||__imag__ z!=10)return 1;
    z=d(c,e,a,b);
    return fabsf((float)__real__ z-2.2f)>1e-6f||fabsf((float)__imag__ z+0.4f)>1e-6f;
}
__extension__ extern long double complex __mulxc3(long double,long double,long double,long double);
__extension__ extern long double complex __divxc3(long double,long double,long double,long double);
__extension__ static __attribute__((noinline)) int helper_xc3(void) {
    long double complex (*volatile m)(long double,long double,long double,long double)=__mulxc3;
    long double complex (*volatile d)(long double,long double,long double,long double)=__divxc3;
    volatile long double a=1,b=2,c=3,e=4;
    long double complex z=m(a,b,c,e);
    if(__real__ z!= -5||__imag__ z!=10)return 1;
    z=d(c,e,a,b);
    return fabsf((float)__real__ z-2.2f)>1e-6f||fabsf((float)__imag__ z+0.4f)>1e-6f;
}

__extension__ _Static_assert(__builtin_types_compatible_p(__typeof__(_Complex_I),float complex),"I type");
__extension__ static int imaginary_unit(void) { static float complex z=I;return __real__ z!=0||__imag__ z!=1; }
__extension__ int avm_test_main(void) {
 volatile float complex a=CX(float,-0.0,-0.0);double complex b=a;long double complex c=b;
 if(!signbit(__real__ c)||!signbit(__imag__ c))return 1;
 return imaginary_unit()||test_f()||test_d()||test_l()||helper_sc3()||helper_dc3()||helper_xc3();
}
