#include "log_kernel.h"
#include "c99_poly.h"

float log1pf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    /* Unity-anchored log1p(x)/x fit also preserves subnormals and signed zero. */
    if (a <= 0x3e800000UL) return x*avm_log1p_small(x);
    /* Outside the cancellation region the existing engine's accuracy budget
       also covers rounding of 1+x. Its special path handles x<=-1 and NaN. */
    return avm_log_kernel(1.0f+x);
}
