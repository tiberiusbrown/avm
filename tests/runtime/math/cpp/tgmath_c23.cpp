#include <tgmath.h>
#ifdef fromfp
#error C generic macros must not be defined in C++
#endif
#ifdef fmaximum
#error C generic macros must not be defined in C++
#endif
#ifdef fadd
#error C generic macros must not be defined in C++
#endif
#ifdef dadd
#error C generic macros must not be defined in C++
#endif
extern "C" int avm_test_main(void)
{
    float (*volatile add)(double, double)=&fadd;
    double (*volatile maximum)(double, double)=&fmaximum;
    return add(1.,2.) != 3.f || maximum(1.,2.) != 2.;
}
