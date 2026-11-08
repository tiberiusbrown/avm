#include <tgmath.h>
#include "../../../codegen/c/test_hex_output.h"

#define TYPE(expr, type) __builtin_types_compatible_p(__typeof__(expr), type)
#define ASSERT_TYPE(expr, type) _Static_assert(TYPE(expr, type), #expr " has the wrong type")
#define CHECK_REAL(name) \
    ASSERT_TYPE(name(1.f), float); ASSERT_TYPE(name(1.), double); \
    ASSERT_TYPE(name(1.L), long double); ASSERT_TYPE(name(1), double)
#define CHECK_BINARY(name) \
    ASSERT_TYPE(name(1.f, 2.f), float); ASSERT_TYPE(name(1.f, 2), double); \
    ASSERT_TYPE(name(1., 2.f), double); ASSERT_TYPE(name(1.L, 2.f), long double); \
    ASSERT_TYPE(name(1.f, 2.L), long double)
#define CHECK_FROM(name) \
    ASSERT_TYPE(name(1.f, 0, 8U), float); ASSERT_TYPE(name(1., 0, 8U), double); \
    ASSERT_TYPE(name(1.L, 0, 8U), long double); ASSERT_TYPE(name(1, 0, 8U), double)
CHECK_FROM(fromfp); CHECK_FROM(ufromfp); CHECK_FROM(fromfpx); CHECK_FROM(ufromfpx);
ASSERT_TYPE(fromfp(1.f, 0L, 8UL), float);
ASSERT_TYPE(ufromfpx(1.L, 0, 8U), long double);
CHECK_REAL(nextup); CHECK_REAL(nextdown); CHECK_REAL(roundeven);
ASSERT_TYPE(llogb(1.f), long); ASSERT_TYPE(llogb(1.), long);
ASSERT_TYPE(llogb(1.L), long); ASSERT_TYPE(llogb(1), long);
CHECK_BINARY(fmaximum); CHECK_BINARY(fminimum);
CHECK_BINARY(fmaximum_mag); CHECK_BINARY(fminimum_mag);
CHECK_BINARY(fmaximum_num); CHECK_BINARY(fminimum_num);
CHECK_BINARY(fmaximum_mag_num); CHECK_BINARY(fminimum_mag_num);
#define CHECK_NARROW2(f, d) \
    ASSERT_TYPE(f(1.f, 2.f), float); ASSERT_TYPE(f(1., 2), float); \
    ASSERT_TYPE(f(1.L, 2.f), float); ASSERT_TYPE(f(1.f, 2.L), float); \
    ASSERT_TYPE(d(1.f, 2.f), double); ASSERT_TYPE(d(1.L, 2), double)
CHECK_NARROW2(fadd, dadd); CHECK_NARROW2(fsub, dsub);
CHECK_NARROW2(fmul, dmul); CHECK_NARROW2(fdiv, ddiv);
ASSERT_TYPE(fsqrt(1.f), float); ASSERT_TYPE(fsqrt(1.L), float);
ASSERT_TYPE(dsqrt(1.f), double); ASSERT_TYPE(dsqrt(1.L), double);
ASSERT_TYPE(ffma(1.f, 2., 3), float); ASSERT_TYPE(ffma(1.f, 2., 3.L), float);
ASSERT_TYPE(dfma(1.f, 2., 3), double); ASSERT_TYPE(dfma(1.L, 2.f, 3), double);

#define CHECK(condition) do { if (!(condition)) { test_line16("line", __LINE__); return 1; } } while (0)
#define RUN_FROM(name) \
static __attribute__((noinline)) int run_##name(void) { \
    volatile float f=2.5f; volatile double d=2.5; volatile long double l=2.5L; \
    CHECK(name(f, FP_INT_TONEARESTFROMZERO, 8)==(name##f)(f, FP_INT_TONEARESTFROMZERO, 8)); \
    CHECK(name(d, FP_INT_TONEARESTFROMZERO, 8)==(name)(d, FP_INT_TONEARESTFROMZERO, 8)); \
    CHECK(name(l, FP_INT_TONEARESTFROMZERO, 8)==(name##l)(l, FP_INT_TONEARESTFROMZERO, 8)); \
    return 0; }
RUN_FROM(fromfp) RUN_FROM(ufromfp) RUN_FROM(fromfpx) RUN_FROM(ufromfpx)
#define RUN_ONE(name) \
static __attribute__((noinline)) int run_##name(void) { \
    volatile float f=1.5f; volatile double d=1.5; volatile long double l=1.5L; \
    CHECK(name(f)==(name##f)(f)); CHECK(name(d)==(name)(d)); \
    CHECK(name(l)==(name##l)(l)); return 0; }
RUN_ONE(llogb) RUN_ONE(nextup) RUN_ONE(nextdown) RUN_ONE(roundeven)
#define RUN_TWO(name) \
static __attribute__((noinline)) int run_##name(void) { \
    volatile float x=-2.f, y=3.f; volatile double d=3.; volatile long double l=3.L; \
    CHECK(name(x,y)==(name##f)(x,y)); CHECK(name(x,d)==(name)((double)x,d)); \
    CHECK(name(x,l)==(name##l)((long double)x,l)); return 0; }
RUN_TWO(fmaximum) RUN_TWO(fminimum) RUN_TWO(fmaximum_mag) RUN_TWO(fminimum_mag)
RUN_TWO(fmaximum_num) RUN_TWO(fminimum_num) RUN_TWO(fmaximum_mag_num) RUN_TWO(fminimum_mag_num)
#define RUN_NARROW2(f, d) \
static __attribute__((noinline)) int run_##f(void) { \
    volatile float x=6.f; volatile double y=2.; volatile long double z=2.L; \
    CHECK(f(x,y)==(f)((double)x,y)); CHECK(f(x,z)==(f##l)((long double)x,z)); \
    CHECK(d(x,y)==(d##l)((long double)x,(long double)y)); \
    CHECK(d(x,z)==(d##l)((long double)x,z)); return 0; }
RUN_NARROW2(fadd,dadd) RUN_NARROW2(fsub,dsub)
RUN_NARROW2(fmul,dmul) RUN_NARROW2(fdiv,ddiv)
static __attribute__((noinline)) int run_other_narrow(void)
{
    volatile float f=4.f; volatile double d=2.; volatile long double l=2.L;
    CHECK(fsqrt(f)==(fsqrt)(f)); CHECK(fsqrt(l)==(fsqrtl)(l));
    CHECK(dsqrt(f)==(dsqrtl)(f)); CHECK(dsqrt(l)==(dsqrtl)(l));
    CHECK(ffma(f,d,d)==(ffma)(f,d,d)); CHECK(ffma(f,d,l)==(ffmal)(f,d,l));
    CHECK(dfma(f,d,d)==(dfmal)(f,d,d)); CHECK(dfma(f,d,l)==(dfmal)(f,d,l));
    return 0;
}
static __attribute__((noinline)) int run_evaluation(void)
{
    int a=0, b=0, c=0;
    CHECK(fromfp((++a,2.5f), (++b,FP_INT_TONEAREST), (++c,8U)) == 2.f);
    CHECK(a==1 && b==1 && c==1);
    CHECK(fmaximum((++a,1.f), (++b,2.L))==2.L); CHECK(a==2 && b==2);
    CHECK(ffma((++a,2.f), (++b,3.), (++c,4.L))==10.f);
    CHECK(a==3 && b==3 && c==2);
    CHECK(dfma((++a,2.f), (++b,3.), (++c,4.L))==10.);
    CHECK(a==4 && b==4 && c==3);
    CHECK(nextup((++a,1.f))==(nextupf)(1.f)); CHECK(a==5);
    /* Function-like macros must be suppressible. */
    double (*volatile p)(double, int, unsigned int)=(fromfp);
    float (*volatile q)(double, double)=(fadd);
    CHECK(p(2.5,FP_INT_TONEAREST,8)==2. && q(1.,2.)==3.f);
    return 0;
}

/* Override only the l-suffixed identifiers after the real linkage tests above.
   Distinct return values expose the selected function even though all three
   floating types use the same target representation. */
static long probe_llogbf(float a) { (void)a; return 61L; }
static long probe_llogbl(long double a) { (void)a; return 62L; }
static float probe_f2(long double a,long double b) { (void)a; (void)b; return 42.f; }
static float probe_f3(long double a,long double b,long double c) { (void)a; (void)b; (void)c; return 43.f; }
static float probe_f1(long double a) { (void)a; return 44.f; }
static double probe_d2(long double a,long double b) { (void)a; (void)b; return 52.; }
static double probe_d3(long double a,long double b,long double c) { (void)a; (void)b; (void)c; return 53.; }
static double probe_d1(long double a) { (void)a; return 54.; }
#define llogbf probe_llogbf
#define llogbl probe_llogbl
#define faddl probe_f2
#define fsubl probe_f2
#define fmull probe_f2
#define fdivl probe_f2
#define ffmal probe_f3
#define fsqrtl probe_f1
#define daddl probe_d2
#define dsubl probe_d2
#define dmull probe_d2
#define ddivl probe_d2
#define dfmal probe_d3
#define dsqrtl probe_d1
static __attribute__((noinline)) int run_selection(void)
{
    volatile float f=2.f; volatile double d=2.; volatile long double l=2.L;
    CHECK(llogb(f)==61L && llogb(l)==62L && llogb(d)==(llogb)(d));
    CHECK(fadd(f,d)==4.f && fadd(l,f)==42.f && fadd(f,l)==42.f);
    CHECK(fsub(f,l)==42.f && fmul(l,f)==42.f && fdiv(f,l)==42.f);
    CHECK(fsqrt(f)==(fsqrt)(f) && fsqrt(l)==44.f);
    CHECK(ffma(l,f,d)==43.f && ffma(f,l,d)==43.f && ffma(f,d,l)==43.f);
    CHECK(dadd(f,d)==52. && dsub(f,d)==52. && dmul(f,d)==52. && ddiv(f,d)==52.);
    CHECK(dfma(f,d,f)==53. && dsqrt(f)==54.);
    return 0;
}
int avm_test_main(void)
{
    return run_fromfp() || run_ufromfp() || run_fromfpx() || run_ufromfpx() ||
        run_llogb() || run_nextup() || run_nextdown() || run_roundeven() ||
        run_fmaximum() || run_fminimum() || run_fmaximum_mag() || run_fminimum_mag() ||
        run_fmaximum_num() || run_fminimum_num() || run_fmaximum_mag_num() || run_fminimum_mag_num() ||
        run_fadd() || run_fsub() || run_fmul() || run_fdiv() || run_other_narrow() ||
        run_evaluation() || run_selection();
}
