#include "log_kernel.h"

float log1pf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a < 0x33800000UL) return x;
    if (a <= 0x3d800000UL) {
        /* Degree-five alternating series on [-1/16,1/16]. */
        float p = AVM_FPOLY4(x, 0.2f, -0.25f, 1.0f/3, -0.5f);
        return x + (x*x)*p;
    }
    /* Outside the cancellation region the existing engine's accuracy budget
       also covers rounding of 1+x. Its special path handles x<=-1 and NaN. */
    return avm_log_kernel(1.0f+x);
}
