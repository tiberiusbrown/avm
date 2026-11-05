#include <avm.h>
#include <math.h>
#include <errno.h>
#include <limits.h>
#include <stdint.h>
#include "test_hex_output.h"
#ifndef __cplusplus
#include <tgmath.h>
#define CHECK_TYPE(expr, type) _Static_assert(_Generic((expr), type: 1, default: 0), "wrong generic type")
CHECK_TYPE(sinpi(1.0f), float);
CHECK_TYPE(log2p1(1.0L), long double);
CHECK_TYPE(powr(1.0f, 2.0), double);
CHECK_TYPE(rootn(1.0f, 2LL), float);
#define CHECK_UNARY(name) CHECK_TYPE(name(1.0f), float); CHECK_TYPE(name(1.0L), long double)
CHECK_UNARY(sinpi); CHECK_UNARY(cospi); CHECK_UNARY(tanpi); CHECK_UNARY(asinpi);
CHECK_UNARY(acospi); CHECK_UNARY(atanpi); CHECK_UNARY(exp10); CHECK_UNARY(exp10m1);
CHECK_UNARY(exp2m1); CHECK_UNARY(logp1); CHECK_UNARY(log2p1); CHECK_UNARY(log10p1); CHECK_UNARY(rsqrt);
CHECK_TYPE(atan2pi(1.0f, 1.0L), long double);
CHECK_TYPE(pown(1.0f, 1LL), float); CHECK_TYPE(compoundn(1.0L, 1), long double);
#endif
static uint32_t bits(float x) { union { float f; uint32_t u; } v={x}; return v.u; }
static int near(float x, float y) { return fabsf(x-y) <= 0.00001f * fmaxf(1.0f, fabsf(y)); }
#define CLOSE(a,b) do { float value=(a); if (!near(value,(b))) { test_line16("line", __LINE__); test_line32("actual", bits(value)); return 1; } } while (0)
#define EXACT(a,b) do { if (bits(a) != bits(b)) { test_line16("line", __LINE__); return 1; } } while (0)
#define BAD(a) do { if (!isnan(a)) { test_line16("line", __LINE__); return 1; } } while (0)

/* Taking addresses tests all linkable types and the long long parameter ABI. */
#define TEST1(name, arg) do { \
 float (*volatile f)(float)=name##f; double (*volatile d)(double)=name; \
 long double (*volatile l)(long double)=name##l; \
 EXACT(f(arg),(float)d(arg)); EXACT(f(arg),(float)l(arg)); } while (0)
#define TEST2(name, a, b) do { \
 float (*volatile f)(float,float)=name##f; double (*volatile d)(double,double)=name; \
 long double (*volatile l)(long double,long double)=name##l; \
 EXACT(f(a,b),(float)d(a,b)); EXACT(f(a,b),(float)l(a,b)); } while (0)
#define TESTN(name, a, n) do { \
 float (*volatile f)(float,long long)=name##f; double (*volatile d)(double,long long)=name; \
 long double (*volatile l)(long double,long long)=name##l; \
 EXACT(f(a,n),(float)d(a,n)); EXACT(f(a,n),(float)l(a,n)); } while (0)
struct c23_case { int op; float x, y; int n; float expected; };
#include "math_c23_cases.h"
static int samples(void)
{
    for (unsigned i=0; i<sizeof(c23_cases)/sizeof(c23_cases[0]); ++i) {
        const AVM_PROGMEM struct c23_case *c=&c23_cases[i];
        float x=c->x, y=c->y, value;
        switch (c->op) {
        case 0: value=sinpif(x); break; case 1: value=cospif(x); break;
        case 2: value=tanpif(x); break; case 3: value=asinpif(x); break;
        case 4: value=acospif(x); break; case 5: value=atanpif(x); break;
        case 6: value=atan2pif(x,y); break; case 7: value=exp10f(x); break;
        case 8: value=exp10m1f(x); break; case 9: value=exp2m1f(x); break;
        case 10: value=logp1f(x); break; case 11: value=log2p1f(x); break;
        case 12: value=log10p1f(x); break; case 13: value=pownf(x,c->n); break;
        case 14: value=powrf(x,y); break; case 15: value=rootnf(x,c->n); break;
        case 16: value=compoundnf(x,c->n); break; default: value=rsqrtf(x); break;
        }
        if (!(fabsf(value-c->expected) <= 0.00001f*fabsf(c->expected))) {
            test_line16("case",i); test_line16("op",c->op);
            test_line32("actual",bits(value)); test_line32("expected",bits(c->expected));
            return 1;
        }
    }
    return 0;
}
static __attribute__((noinline)) int checks_0(void)
{
    TEST1(sinpi,0.125f); TEST1(cospi,0.125f); TEST1(tanpi,0.125f);
    return 0;
}
static __attribute__((noinline)) int checks_1(void)
{
    TEST1(asinpi,0.125f); TEST1(acospi,0.125f); TEST1(atanpi,0.125f); TEST2(atan2pi,0.5f,-1.0f);
    return 0;
}
static __attribute__((noinline)) int checks_2(void)
{
    TEST1(exp10,0.125f); TEST1(exp10m1,0.125f); TEST1(exp2m1,0.125f);
    return 0;
}
static __attribute__((noinline)) int checks_3(void)
{
    TEST1(logp1,0.125f); TEST1(log2p1,0.125f); TEST1(log10p1,0.125f);
    return 0;
}
static __attribute__((noinline)) int checks_4(void)
{
    TESTN(pown,-2.0f,3); TEST2(powr,2.0f,0.25f); TESTN(rootn,-8.0f,3);
    return 0;
}
static __attribute__((noinline)) int checks_5(void)
{
    TESTN(compoundn,0.125f,3); TEST1(rsqrt,4.0f);
    return 0;
}
static __attribute__((noinline)) int checks_6(void)
{
    CLOSE(sinpif(0.25f),0.70710678f); CLOSE(cospif(0.25f),0.70710678f);
    return 0;
}
static __attribute__((noinline)) int checks_7(void)
{
    CLOSE(tanpif(0.125f),0.41421356f); CLOSE(sinpif(4194304.5f),1.0f);
    return 0;
}
static __attribute__((noinline)) int checks_8(void)
{
    EXACT(sinpif(-3.0f),-0.0f); EXACT(cospif(-0.5f),0.0f);
    return 0;
}
static __attribute__((noinline)) int checks_9(void)
{
    EXACT(cospif(8388609.0f),-1.0f); EXACT(tanpif(3.0f),-0.0f);
    return 0;
}
static __attribute__((noinline)) int checks_10(void)
{
    EXACT(tanpif(-3.0f),0.0f); EXACT(tanpif(0.5f),INFINITY);
    return 0;
}
static __attribute__((noinline)) int checks_11(void)
{
    EXACT(tanpif(-0.5f),-INFINITY); BAD(sinpif(INFINITY));
    return 0;
}
static __attribute__((noinline)) int checks_12(void)
{
    CLOSE(asinpif(0.5f),1.0f/6.0f); CLOSE(acospif(-0.5f),2.0f/3.0f);
    return 0;
}
static __attribute__((noinline)) int checks_13(void)
{
    CLOSE(atanpif(1.0f),0.25f); EXACT(atan2pif(-0.0f,-0.0f),-1.0f);
    return 0;
}
static __attribute__((noinline)) int checks_14(void)
{
    CLOSE(exp10f(3.0f),1000.0f); CLOSE(exp10m1f(0.00001f),0.0000230261f);
    return 0;
}
static __attribute__((noinline)) int checks_15(void)
{
    CLOSE(exp2m1f(-0.5f),-0.29289322f); CLOSE(logp1f(0.5f),0.40546511f);
    return 0;
}
static __attribute__((noinline)) int checks_16(void)
{
    CLOSE(log2p1f(3.0f),2.0f); CLOSE(log10p1f(99.0f),2.0f);
    return 0;
}
static __attribute__((noinline)) int checks_17(void)
{
    EXACT(log2p1f(-0.0f),-0.0f); EXACT(exp2m1f(-0.0f),-0.0f);
    return 0;
}
static __attribute__((noinline)) int checks_18(void)
{
    CLOSE(pownf(-2.0f,-3),-0.125f); EXACT(pownf(-1.0f,LLONG_MAX),-1.0f);
    return 0;
}
static __attribute__((noinline)) int checks_19(void)
{
    EXACT(pownf(-0.0f,-3),-INFINITY); BAD(powrf(-1.0f,2.0f)); BAD(powrf(0.0f,0.0f));
    return 0;
}
static __attribute__((noinline)) int checks_20(void)
{
    CLOSE(powrf(4.0f,0.5f),2.0f); CLOSE(rootnf(-32.0f,5),-2.0f);
    return 0;
}
static __attribute__((noinline)) int checks_21(void)
{
    EXACT(rootnf(-0.0f,-3),-INFINITY); BAD(rootnf(-1.0f,2)); BAD(rootnf(1.0f,0));
    return 0;
}
static __attribute__((noinline)) int checks_22(void)
{
    CLOSE(compoundnf(0.000001f,1000000),2.71828047f); BAD(compoundnf(-2.0f,0));
    return 0;
}
static __attribute__((noinline)) int checks_23(void)
{
    EXACT(compoundnf(-1.0f,-1),INFINITY); CLOSE(rsqrtf(4.0f),0.5f);
    return 0;
}
static __attribute__((noinline)) int checks_24(void)
{
    EXACT(rsqrtf(-0.0f),-INFINITY); BAD(rsqrtf(-1.0f));
    return 0;
}
static __attribute__((noinline)) int checks_25(void)
{
    errno=0; (void)powrf(-1.0f,2.0f); if (errno!=EDOM) { test_line16("line", __LINE__); return 1; }
    return 0;
}
static __attribute__((noinline)) int checks_26(void)
{
    errno=0; (void)tanpif(0.5f); if (errno!=ERANGE) { test_line16("line", __LINE__); return 1; }
    return 0;
}
static __attribute__((noinline)) int checks_27(void)
{
    errno=0; (void)sinpif(0x1p-149f); if (errno!=ERANGE) { test_line16("line", __LINE__); return 1; }
    return 0;
}
static int generic_checks(void)
{
#ifndef __cplusplus
    float x=0.25f; long long n=2;
    (void)sinpi(x++);
    if (x!=1.25f) return 1;
    (void)rootn(x++, n++);
    if (x!=2.25f || n!=3) return 1;
    (void)powr(x++, 2.0f);
    if (x!=3.25f) return 1;
#endif
    return 0;
}
#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
    return checks_0() || checks_1() || checks_2() || checks_3() || checks_4() || checks_5() || checks_6() || checks_7() || checks_8() || checks_9() || checks_10() || checks_11() || checks_12() || checks_13() || checks_14() || checks_15() || checks_16() || checks_17() || checks_18() || checks_19() || checks_20() || checks_21() || checks_22() || checks_23() || checks_24() || checks_25() || checks_26() || checks_27() || generic_checks() || samples();
}
