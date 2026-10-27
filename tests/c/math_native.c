#include "math_test.h"

/* Exercise exported C ABI, direct LLVM operations, and the overlapping
   remainder/quadrant results with other float values live at every -O level. */
static __attribute__((noinline)) float reduce(float x, int *q, float live)
{
    float r = __builtin_avm_rempio2(x, q);
    return r + live;
}
#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
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
