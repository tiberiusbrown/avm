#include <tgmath.h>
#include <tgmath.h>

/* Representation sizes coincide on AVM; check language types, not sizeof. */
#define TYPE(expr, T) __builtin_types_compatible_p(__typeof__(expr), T)
#define CHECK_UNARY_TYPE(name, result) \
    __extension__ _Static_assert(TYPE(name(1.0f), result), "float " #name); \
    __extension__ _Static_assert(TYPE(name(1.0), result), "double " #name); \
    __extension__ _Static_assert(TYPE(name(1.0L), result), "long double " #name); \
    __extension__ _Static_assert(TYPE(name(1), result), "integer " #name)
#define CHECK_REAL_TYPE(name) \
    __extension__ _Static_assert(TYPE(name(1.0f), float), "float " #name); \
    __extension__ _Static_assert(TYPE(name(1.0), double), "double " #name); \
    __extension__ _Static_assert(TYPE(name(1.0L), long double), "long double " #name); \
    __extension__ _Static_assert(TYPE(name(1), double), "integer " #name)
CHECK_REAL_TYPE(acos);
CHECK_REAL_TYPE(asin);
CHECK_REAL_TYPE(atan);
CHECK_REAL_TYPE(acosh);
CHECK_REAL_TYPE(asinh);
CHECK_REAL_TYPE(atanh);
CHECK_REAL_TYPE(cos);
CHECK_REAL_TYPE(sin);
CHECK_REAL_TYPE(tan);
CHECK_REAL_TYPE(cosh);
CHECK_REAL_TYPE(sinh);
CHECK_REAL_TYPE(tanh);
CHECK_REAL_TYPE(exp);
CHECK_REAL_TYPE(log);
CHECK_REAL_TYPE(sqrt);
CHECK_REAL_TYPE(fabs);
CHECK_REAL_TYPE(cbrt);
CHECK_REAL_TYPE(ceil);
CHECK_REAL_TYPE(erf);
CHECK_REAL_TYPE(erfc);
CHECK_REAL_TYPE(exp2);
CHECK_REAL_TYPE(expm1);
CHECK_REAL_TYPE(floor);
CHECK_REAL_TYPE(lgamma);
CHECK_REAL_TYPE(log10);
CHECK_REAL_TYPE(log1p);
CHECK_REAL_TYPE(log2);
CHECK_REAL_TYPE(logb);
CHECK_REAL_TYPE(nearbyint);
CHECK_REAL_TYPE(rint);
CHECK_REAL_TYPE(round);
CHECK_REAL_TYPE(tgamma);
CHECK_REAL_TYPE(trunc);
CHECK_UNARY_TYPE(ilogb, int);
CHECK_UNARY_TYPE(lrint, long);
CHECK_UNARY_TYPE(lround, long);
CHECK_UNARY_TYPE(llrint, long long);
CHECK_UNARY_TYPE(llround, long long);
#define CHECK_BINARY_TYPE(name) \
    __extension__ _Static_assert(TYPE(name(1.0f, 2.0f), float), "float " #name); \
    __extension__ _Static_assert(TYPE(name(1.0f, 2), double), "integer rank " #name); \
    __extension__ _Static_assert(TYPE(name(1, 2.0f), double), "integer first " #name); \
    __extension__ _Static_assert(TYPE(name(1.0, 2.0f), double), "double rank " #name); \
    __extension__ _Static_assert(TYPE(name(1.0L, 2.0), long double), "long double " #name); \
    __extension__ _Static_assert(TYPE(name(1.0f, 2.0L), long double), "long double second " #name)
CHECK_BINARY_TYPE(pow);
CHECK_BINARY_TYPE(atan2);
CHECK_BINARY_TYPE(copysign);
CHECK_BINARY_TYPE(fdim);
CHECK_BINARY_TYPE(fmax);
CHECK_BINARY_TYPE(fmin);
CHECK_BINARY_TYPE(fmod);
CHECK_BINARY_TYPE(hypot);
CHECK_BINARY_TYPE(nextafter);
CHECK_BINARY_TYPE(remainder);
__extension__ _Static_assert(TYPE(fma(1.f, 2.f, 3.f), float), "fma float");
__extension__ _Static_assert(TYPE(fma(1.f, 2.f, 3), double), "fma integer");
__extension__ _Static_assert(TYPE(fma(1.f, 2.L, 3.), long double), "fma long double");
__extension__ _Static_assert(TYPE(fma(1.L, 2.f, 3.f), long double), "fma first");
__extension__ _Static_assert(TYPE(fma(1.f, 2.f, 3.L), long double), "fma third");
__extension__ _Static_assert(TYPE(nexttoward(1.f, 2.L), float), "nexttoward fixed direction");
__extension__ _Static_assert(TYPE(nexttoward(1, 2.L), double), "nexttoward integer");
__extension__ _Static_assert(TYPE(nexttoward(1.L, 2.L), long double), "nexttoward long double");
__extension__ _Static_assert(TYPE(frexp(1.f, (int *)0), float), "frexp pointer");
__extension__ _Static_assert(TYPE(remquo(1.f, 2.f, (int *)0), float), "remquo pointer");
__extension__ _Static_assert(TYPE(remquo(1.f, 2, (int *)0), double), "remquo integer");
__extension__ _Static_assert(TYPE(remquo(1.L, 2.f, (int *)0), long double), "remquo long double");
#define CHECK_SCALE_TYPE(name) \
    __extension__ _Static_assert(TYPE(name(1.f, 2L), float), "fixed exponent " #name); \
    __extension__ _Static_assert(TYPE(name(1, 2), double), "integer " #name); \
    __extension__ _Static_assert(TYPE(name(1.L, 2), long double), "long double " #name)
CHECK_SCALE_TYPE(ldexp);
CHECK_SCALE_TYPE(scalbn);
CHECK_SCALE_TYPE(scalbln);
enum sample { one = 1 };
__extension__ _Static_assert(TYPE(sqrt(one), double), "enum");
__extension__ _Static_assert(TYPE(sqrt((_Bool)1), double), "bool");
__extension__ _Static_assert(TYPE(sqrt((unsigned long long)1), double), "unsigned long long");
__extension__ _Static_assert(TYPE(sqrt((const volatile float)1), float), "qualifiers");

#define RUN_UNARY(name) do { \
    if (name(f) != (name##f)(f)) return __LINE__; \
    if (name(d) != (name)(d)) return __LINE__; \
    if (name(l) != (name##l)(l)) return __LINE__; \
} while (0)
#define RUN_BINARY(name) do { \
    if (name(f, g) != (name##f)(f, g)) return __LINE__; \
    if (name(d, g) != (name)(d, (double)g)) return __LINE__; \
    if (name(f, l) != (name##l)((long double)f, l)) return __LINE__; \
} while (0)

/* Bound each test's O0 frame to fit AVM's 256-byte stack. */
#define DEFINE_UNARY(name) \
    static __attribute__((noinline)) int test_##name(void) { \
        volatile float f = 1.f; \
        volatile double d = 1.; \
        volatile long double l = 1.L; \
        RUN_UNARY(name); \
        return 0; \
    }
#define DEFINE_BINARY(name) \
    static __attribute__((noinline)) int test_##name(void) { \
        volatile float f = 1.f, g = 0.5f; \
        volatile double d = 1.; \
        volatile long double l = 1.L; \
        RUN_BINARY(name); \
        return 0; \
    }
DEFINE_UNARY(acos)
DEFINE_UNARY(asin)
DEFINE_UNARY(atan)
DEFINE_UNARY(acosh)
DEFINE_UNARY(asinh)
DEFINE_UNARY(atanh)
DEFINE_UNARY(cos)
DEFINE_UNARY(sin)
DEFINE_UNARY(tan)
DEFINE_UNARY(cosh)
DEFINE_UNARY(sinh)
DEFINE_UNARY(tanh)
DEFINE_UNARY(exp)
DEFINE_UNARY(log)
DEFINE_UNARY(sqrt)
DEFINE_UNARY(fabs)
DEFINE_UNARY(cbrt)
DEFINE_UNARY(ceil)
DEFINE_UNARY(erf)
DEFINE_UNARY(erfc)
DEFINE_UNARY(exp2)
DEFINE_UNARY(expm1)
DEFINE_UNARY(floor)
DEFINE_UNARY(lgamma)
DEFINE_UNARY(log10)
DEFINE_UNARY(log1p)
DEFINE_UNARY(log2)
DEFINE_UNARY(logb)
DEFINE_UNARY(nearbyint)
DEFINE_UNARY(rint)
DEFINE_UNARY(round)
DEFINE_UNARY(tgamma)
DEFINE_UNARY(trunc)
DEFINE_UNARY(ilogb)
DEFINE_UNARY(lrint)
DEFINE_UNARY(lround)
DEFINE_UNARY(llrint)
DEFINE_UNARY(llround)
DEFINE_BINARY(pow)
DEFINE_BINARY(atan2)
DEFINE_BINARY(copysign)
DEFINE_BINARY(fdim)
DEFINE_BINARY(fmax)
DEFINE_BINARY(fmin)
DEFINE_BINARY(fmod)
DEFINE_BINARY(hypot)
DEFINE_BINARY(nextafter)
DEFINE_BINARY(remainder)

static __attribute__((noinline)) int test_special(void)
{
    volatile float f = 1.0f, g = 0.5f;
    volatile double d = 1.0;
    volatile long double l = 1.0L;
    int exponent, quotient, count = 0;
    if (frexp(f, &exponent) != 0.5f || exponent != 1) return 1;
    if (frexp(d, &exponent) != 0.5 || exponent != 1) return 2;
    if (frexp(l, &exponent) != 0.5L || exponent != 1) return 3;
    if (ldexp(f, 2L) != 4.f || scalbn(d, 2) != 4. || scalbln(l, 2L) != 4.L) return 4;
    if (fma(f, g, l) != 1.5L || fma(f, 2, g) != 2.5) return 5;
    if (remquo(f, g, &quotient) != 0.f || quotient != 2) return 6;
    if (nexttoward(f, 2.L) != (nexttowardf)(f, 2.L)) return 7;
    if (nexttoward(d, 2.L) != (nexttoward)(d, 2.L)) return 8;
    if (nexttoward(l, 2.L) != (nexttowardl)(l, 2.L)) return 9;
    if (sqrt((++count, f)) != 1.f || count != 1) return 10;
    int a = 0, b = 0, c = 0;
    if (pow((++a, f), (++b, g)) != 1.f || a != 1 || b != 1) return 11;
    if (fma((++a, f), (++b, g), (++c, d)) != 1.5 || a != 2 || b != 2 || c != 1) return 12;
    if (frexp((++a, f), (++b, &exponent)) != 0.5f || a != 3 || b != 3) return 13;
    if (remquo((++a, f), (++b, g), (++c, &quotient)) != 0.f || a != 4 || b != 4 || c != 2) return 14;
    if (nexttoward((++a, f), (++b, 2.L)) != (nexttowardf)(f, 2.L) || a != 5 || b != 5) return 15;
    if (sqrt(9) != 3.0 || pow(2.f, 3) != 8.0 || sqrt(9.L) != 3.L) return 16;
    if (!signbit(fabs(-0.f) * -1.f) || !isnan(sqrt(-f))) return 17;
    /* modf is deliberately not a type-generic macro in C99. */
#ifdef modf
#error modf must not be a type-generic macro
#endif
    return 0;
}

int avm_test_main(void)
{
    if (test_acos()) return __LINE__;
    if (test_asin()) return __LINE__;
    if (test_atan()) return __LINE__;
    if (test_acosh()) return __LINE__;
    if (test_asinh()) return __LINE__;
    if (test_atanh()) return __LINE__;
    if (test_cos()) return __LINE__;
    if (test_sin()) return __LINE__;
    if (test_tan()) return __LINE__;
    if (test_cosh()) return __LINE__;
    if (test_sinh()) return __LINE__;
    if (test_tanh()) return __LINE__;
    if (test_exp()) return __LINE__;
    if (test_log()) return __LINE__;
    if (test_sqrt()) return __LINE__;
    if (test_fabs()) return __LINE__;
    if (test_cbrt()) return __LINE__;
    if (test_ceil()) return __LINE__;
    if (test_erf()) return __LINE__;
    if (test_erfc()) return __LINE__;
    if (test_exp2()) return __LINE__;
    if (test_expm1()) return __LINE__;
    if (test_floor()) return __LINE__;
    if (test_lgamma()) return __LINE__;
    if (test_log10()) return __LINE__;
    if (test_log1p()) return __LINE__;
    if (test_log2()) return __LINE__;
    if (test_logb()) return __LINE__;
    if (test_nearbyint()) return __LINE__;
    if (test_rint()) return __LINE__;
    if (test_round()) return __LINE__;
    if (test_tgamma()) return __LINE__;
    if (test_trunc()) return __LINE__;
    if (test_ilogb()) return __LINE__;
    if (test_lrint()) return __LINE__;
    if (test_lround()) return __LINE__;
    if (test_llrint()) return __LINE__;
    if (test_llround()) return __LINE__;
    if (test_pow()) return __LINE__;
    if (test_atan2()) return __LINE__;
    if (test_copysign()) return __LINE__;
    if (test_fdim()) return __LINE__;
    if (test_fmax()) return __LINE__;
    if (test_fmin()) return __LINE__;
    if (test_fmod()) return __LINE__;
    if (test_hypot()) return __LINE__;
    if (test_nextafter()) return __LINE__;
    if (test_remainder()) return __LINE__;
    return test_special();
}
