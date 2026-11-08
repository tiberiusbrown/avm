#define avm_test_main avm_classify_common_main
#include "../c/math_c99_classify.c"
#undef avm_test_main

template<class T> static int classify_once(T value)
{
    unsigned calls=0;
    auto next=[&]() { ++calls; return value; };
    if (fpclassify(next())!=FP_NORMAL || calls!=1) return 1;
    if (!isfinite(next()) || calls!=2) return 1;
    if (isinf(next()) || calls!=3) return 1;
    if (isnan(next()) || calls!=4) return 1;
    if (!isnormal(next()) || calls!=5) return 1;
    if (signbit(next()) || calls!=6) return 1;
    return 0;
}

extern "C" int avm_test_main(void)
{
    int common=avm_classify_common_main();
    if (common) return common;
    if (classify_once(1.0f) || classify_once(1.0) || classify_once(1.0L)) return 10;
#if DBL_MANT_DIG > FLT_MANT_DIG
    if (classify_once(DBL_MIN) || classify_once(DBL_MAX)) return 11;
#endif
#if LDBL_MANT_DIG > FLT_MANT_DIG
    if (classify_once(LDBL_MIN) || classify_once(LDBL_MAX)) return 12;
#endif
    return 0;
}
