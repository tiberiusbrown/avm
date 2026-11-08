#include "math_test.h"
#include <errno.h>

/* Exercise exported C ABI, direct LLVM operations, and the overlapping
   remainder/quadrant results with other float values live at every -O level. */
static __attribute__((noinline)) float reduce(float x, int *q, float live)
{
    float r = __builtin_avm_rempio2(x, q);
    return r + live;
}
static uint32_t word(float x)
{
    union { float f; uint32_t u; } value = {x};
    return value.u;
}

static __attribute__((noinline)) int trig_reconstruction(void)
{
    /* Both signs around quadrant boundaries, plus tiny and large arguments.
       Standalone and paired entry points must reconstruct identical results. */
    static const AVM_PROGMEM uint32_t inputs[] = {
        0, 1, 0x007fffffUL, 0x00800000UL,
        0x3f490fdaUL, 0x3f490fdbUL, 0x3f490fdcUL,
        0x3fc90fdaUL, 0x3fc90fdbUL, 0x3fc90fdcUL,
        0x40490fdaUL, 0x40490fdbUL, 0x40490fdcUL,
        0x4096cbe3UL, 0x4096cbe4UL, 0x4096cbe5UL,
        0x40c90fdaUL, 0x40c90fdbUL, 0x40c90fdcUL,
        0x3f800000UL, 0x40000000UL, 0x40800000UL, 0x41000000UL,
        0x47800000UL, 0x5f123456UL, 0x7f7fffffUL
    };
    float (*volatile sine)(float) = sinf;
    float (*volatile cosine)(float) = cosf;
    void (*volatile paired)(float, float *, float *) = sincosf;
    for (unsigned i=0; i<sizeof(inputs)/sizeof(inputs[0]); ++i) {
        float x = from_bits(inputs[i]);
        errno = 71;
        float s = sine(x), c = cosine(x), ps, pc;
        paired(x, &ps, &pc);
        if (word(s) != word(ps) || word(c) != word(pc) || errno != 71) return 1;
        float ns = sine(-x), nc = cosine(-x);
        paired(-x, &ps, &pc);
        if (word(ns) != word(ps) || word(nc) != word(pc) || errno != 71 ||
            word(ns) != (word(s)^0x80000000UL) || word(nc) != word(c)) return 2;
    }
    return 0;
}

#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
    if (trig_reconstruction()) return 1;
    volatile float one = 0x1.000002p0f, three = 3.0f, minus_three = -3.0f;
    if (check_result(fmaf(one, three, minus_three), 0x34c00000UL, 0, 0)) return 1;
    if (check_result(__builtin_fmaf(one, three, minus_three), 0x34c00000UL, 0, 1)) return 1;
    float (*volatile fma_call)(float, float, float) = fmaf;
    if (check_result(fma_call(one, three, minus_three), 0x34c00000UL, 0, 10)) return 1;
    volatile float x = 6.25f, live = 0.125f;
    int q = -1;
    float r = reduce(x, &q, live);
    if (q != 0 || check_result(r, 0x3dbc0958UL, 0, 2)) return 1;
    if (x != 6.25f || live != 0.125f) return 1;
    x = -6.25f;
    r = reduce(x, &q, live);
    if (q != 0 || check_result(r, 0x3e21fb54UL, 0, 3)) return 1;
    x = 1.5f;
    if (check_result(__builtin_truncf(x),0x3f800000UL,0,4) ||
        check_result(__builtin_floorf(x),0x3f800000UL,0,5) ||
        check_result(__builtin_ceilf(x),0x40000000UL,0,6) ||
        check_result(__builtin_roundf(x),0x40000000UL,0,7) ||
        check_result(__builtin_sqrtf(three*three),0x40400000UL,0,8) ||
        check_result(__builtin_fmodf(x,one),0x3efffffcUL,0,9)) return 1;
    return 0;
}
