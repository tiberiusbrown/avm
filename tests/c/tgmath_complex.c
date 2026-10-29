#include <tgmath.h>
#define TYPE(E,T) __extension__ _Static_assert(__builtin_types_compatible_p(__typeof__(E),T),#E)
#define CHECK(N) \
TYPE(N((float complex)1),float complex); \
TYPE(N((double complex)1),double complex); \
TYPE(N((long double complex)1),long double complex)
CHECK(acos);CHECK(asin);CHECK(atan);CHECK(acosh);CHECK(asinh);CHECK(atanh);
CHECK(cos);CHECK(sin);CHECK(tan);CHECK(cosh);CHECK(sinh);CHECK(tanh);
CHECK(exp);CHECK(log);CHECK(sqrt);
TYPE(pow((float complex)1,2),double complex);
TYPE(pow(1.0f,(float complex)2),float complex);
TYPE(pow((double complex)1,2.0L),long double complex);
TYPE(fabs((float complex)1),float);
TYPE(fabs((long double complex)1),long double);
TYPE(creal(1.0f),float);TYPE(cimag(1),double);TYPE(carg(1.0L),long double);
TYPE(conj(1),double complex);TYPE(cproj(1.0f),float complex);
__extension__ static __attribute__((noinline)) int unary(void) {
 int a=0;float complex z=__builtin_complex(3.0f,4.0f);
 return fabs((++a,z))!=5||a!=1;
}
__extension__ static __attribute__((noinline)) int binary(void) {
 int a=0,b=0;float complex z=__builtin_complex(3.0f,4.0f);
 z=pow((++a,1.0f),(++b,z));
 return a!=1||b!=1||crealf(z)!=1||cimagf(z)!=0;
}
__extension__ static __attribute__((noinline)) int real_inputs(void) {
 if(creal(3)!=3||cimag(3)!=0||carg(1)!=0)return 1;
 return creal(conj(2.0f))!=2;
}
int avm_test_main(void) {return unary()||binary()||real_inputs();}
