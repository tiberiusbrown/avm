#ifndef _AVM_RUNTIME_COMPLEX_H
#define _AVM_RUNTIME_COMPLEX_H

#define complex _Complex
#define _Complex_I (__extension__ __builtin_complex(0.0f, 1.0f))
#define I _Complex_I

#ifdef __cplusplus
extern "C" {
#endif
__extension__ float _Complex cacosf(float _Complex);
__extension__ float _Complex casinf(float _Complex);
__extension__ float _Complex catanf(float _Complex);
__extension__ float _Complex ccosf(float _Complex);
__extension__ float _Complex csinf(float _Complex);
__extension__ float _Complex ctanf(float _Complex);
__extension__ float _Complex cacoshf(float _Complex);
__extension__ float _Complex casinhf(float _Complex);
__extension__ float _Complex catanhf(float _Complex);
__extension__ float _Complex ccoshf(float _Complex);
__extension__ float _Complex csinhf(float _Complex);
__extension__ float _Complex ctanhf(float _Complex);
__extension__ float _Complex cexpf(float _Complex);
__extension__ float _Complex clogf(float _Complex);
__extension__ float cabsf(float _Complex);
__extension__ float _Complex cpowf(float _Complex, float _Complex);
__extension__ float _Complex csqrtf(float _Complex);
__extension__ float cargf(float _Complex);
__extension__ float cimagf(float _Complex);
__extension__ float crealf(float _Complex);
__extension__ float _Complex conjf(float _Complex);
__extension__ float _Complex cprojf(float _Complex);
__extension__ double _Complex cacos(double _Complex);
__extension__ double _Complex casin(double _Complex);
__extension__ double _Complex catan(double _Complex);
__extension__ double _Complex ccos(double _Complex);
__extension__ double _Complex csin(double _Complex);
__extension__ double _Complex ctan(double _Complex);
__extension__ double _Complex cacosh(double _Complex);
__extension__ double _Complex casinh(double _Complex);
__extension__ double _Complex catanh(double _Complex);
__extension__ double _Complex ccosh(double _Complex);
__extension__ double _Complex csinh(double _Complex);
__extension__ double _Complex ctanh(double _Complex);
__extension__ double _Complex cexp(double _Complex);
__extension__ double _Complex clog(double _Complex);
__extension__ double cabs(double _Complex);
__extension__ double _Complex cpow(double _Complex, double _Complex);
__extension__ double _Complex csqrt(double _Complex);
__extension__ double carg(double _Complex);
__extension__ double cimag(double _Complex);
__extension__ double creal(double _Complex);
__extension__ double _Complex conj(double _Complex);
__extension__ double _Complex cproj(double _Complex);
__extension__ long double _Complex cacosl(long double _Complex);
__extension__ long double _Complex casinl(long double _Complex);
__extension__ long double _Complex catanl(long double _Complex);
__extension__ long double _Complex ccosl(long double _Complex);
__extension__ long double _Complex csinl(long double _Complex);
__extension__ long double _Complex ctanl(long double _Complex);
__extension__ long double _Complex cacoshl(long double _Complex);
__extension__ long double _Complex casinhl(long double _Complex);
__extension__ long double _Complex catanhl(long double _Complex);
__extension__ long double _Complex ccoshl(long double _Complex);
__extension__ long double _Complex csinhl(long double _Complex);
__extension__ long double _Complex ctanhl(long double _Complex);
__extension__ long double _Complex cexpl(long double _Complex);
__extension__ long double _Complex clogl(long double _Complex);
__extension__ long double cabsl(long double _Complex);
__extension__ long double _Complex cpowl(long double _Complex, long double _Complex);
__extension__ long double _Complex csqrtl(long double _Complex);
__extension__ long double cargl(long double _Complex);
__extension__ long double cimagl(long double _Complex);
__extension__ long double creall(long double _Complex);
__extension__ long double _Complex conjl(long double _Complex);
__extension__ long double _Complex cprojl(long double _Complex);

#ifdef __cplusplus
}
#endif
#endif
