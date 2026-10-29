#include <complex.h>
#include <stdarg.h>
#define IMPL(T,S) \
__extension__ T complex abi_##S(int a,T complex z,int b) { return __builtin_complex((T)(__real__ z+a),(T)(__imag__ z-b)); } \
__extension__ T complex var_##S(int n,...) { va_list ap;T complex z;va_start(ap,n);z=va_arg(ap,T complex);va_end(ap);return z; }
IMPL(float,f)
IMPL(double,d)
IMPL(long double,l)
