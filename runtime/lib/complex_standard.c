#include <complex.h>

/* Distinct C types share the AVM binary32 representation. */
double _Complex cacos(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=cacosf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex casin(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=casinf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex catan(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=catanf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex ccos(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=ccosf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex csin(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=csinf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex ctan(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=ctanf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex cacosh(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=cacoshf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex casinh(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=casinhf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex catanh(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=catanhf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex ccosh(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=ccoshf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex csinh(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=csinhf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex ctanh(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=ctanhf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex cexp(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=cexpf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex clog(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=clogf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double cabs(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    return (double)cabsf(a);
}
double _Complex cpow(double _Complex z,double _Complex w) {return (double _Complex)cpowf((float _Complex)z,(float _Complex)w);}
double _Complex csqrt(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=csqrtf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double carg(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    return (double)cargf(a);
}
double cimag(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    return (double)cimagf(a);
}
double creal(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    return (double)crealf(a);
}
double _Complex conj(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=conjf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
double _Complex cproj(double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=cprojf(a);
    return __builtin_complex((double)__real__ r,(double)__imag__ r);
}
long double _Complex cacosl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=cacosf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex casinl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=casinf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex catanl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=catanf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex ccosl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=ccosf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex csinl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=csinf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex ctanl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=ctanf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex cacoshl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=cacoshf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex casinhl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=casinhf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex catanhl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=catanhf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex ccoshl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=ccoshf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex csinhl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=csinhf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex ctanhl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=ctanhf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex cexpl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=cexpf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex clogl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=clogf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double cabsl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    return (long double)cabsf(a);
}
long double _Complex cpowl(long double _Complex z,long double _Complex w) {return (long double _Complex)cpowf((float _Complex)z,(float _Complex)w);}
long double _Complex csqrtl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=csqrtf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double cargl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    return (long double)cargf(a);
}
long double cimagl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    return (long double)cimagf(a);
}
long double creall(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    return (long double)crealf(a);
}
long double _Complex conjl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=conjf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
long double _Complex cprojl(long double _Complex z) {
    float _Complex a=__builtin_complex((float)__real__ z,(float)__imag__ z);
    float _Complex r=cprojf(a);
    return __builtin_complex((long double)__real__ r,(long double)__imag__ r);
}
