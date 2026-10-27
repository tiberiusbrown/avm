#include "math_test.h"

static int category(uint32_t u)
{
    uint32_t a = u & 0x7fffffffUL;
    return a > 0x7f800000UL ? FP_NAN : a == 0x7f800000UL ? FP_INFINITE :
        !a ? FP_ZERO : a < 0x00800000UL ? FP_SUBNORMAL : FP_NORMAL;
}

#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
    static const AVM_PROGMEM uint32_t words[] = {0,1,0x007fffffUL,0x00800000UL,
        0x3f800000UL,0x7f7fffffUL,0x7f800000UL,0x7fc12345UL,0x7f812345UL};
    for (unsigned s=0; s<2; ++s) for (unsigned i=0; i<9; ++i) {
        uint32_t u=words[i]|((uint32_t)s<<31);
        volatile float x=from_bits(u);
        int c=category(u);
        if (fpclassify(x)!=c || !!isfinite(x)!=(c!=FP_NAN && c!=FP_INFINITE) ||
            !!isinf(x)!=(c==FP_INFINITE) || !!isnan(x)!=(c==FP_NAN) ||
            !!isnormal(x)!=(c==FP_NORMAL) || !!signbit(x)!=s) return 1;
        /* Double and long double are binary32 on AVM; retain their type. */
        volatile double d=x;
        volatile long double l=x;
        if (fpclassify(d)!=c || fpclassify(l)!=c || !!signbit(l)!=s) return 2;
        for (unsigned j=0; j<9; ++j) {
            volatile float y=from_bits(words[j]);
            int unordered=c==FP_NAN || category(words[j])==FP_NAN;
            if (!!isunordered(x,y)!=unordered || !!isgreater(x,y)!=(!unordered && x>y) ||
                !!isgreaterequal(x,y)!=(!unordered && x>=y) ||
                !!isless(x,y)!=(!unordered && x<y) ||
                !!islessequal(x,y)!=(!unordered && x<=y) ||
                !!islessgreater(x,y)!=(!unordered && x!=y)) return 3;
        }
    }
    int i=0, j=0;
    if (fpclassify(i++)!=FP_ZERO || i!=1) return 4;
    if (!isfinite(i++) || i!=2) return 4;
    if (isinf(i++) || i!=3) return 4;
    if (isnan(i++) || i!=4) return 4;
    if (!isnormal(i++) || i!=5) return 4;
    if (signbit(i++) || i!=6) return 4;
    if (!isgreater(i++,j++) || i!=7 || j!=1) return 5;
    if (!isgreaterequal(i++,j++) || i!=8 || j!=2) return 5;
    if (isless(i++,j++) || i!=9 || j!=3) return 5;
    if (islessequal(i++,j++) || i!=10 || j!=4) return 5;
    if (!islessgreater(i++,j++) || i!=11 || j!=5) return 5;
    if (isunordered(i++,j++) || i!=12 || j!=6) return 5;
    volatile double d=0.5;
    if (!isless(0,d) || !isgreater(d,-1) || !isfinite(-7L)) return 6;
    return 0;
}
