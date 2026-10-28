#include "fdlibm.h"
#include "c99_poly.h"

float expm1f(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a <= 0x3f800000UL) {
        /* The same unity-anchored polynomial handles tiny inputs. Only errno
           reporting needs a separate zero/subnormal distinction. */
        uint16_t high = avm_math_high(x);
        if (AVM_MATH_UNLIKELY(high < 0x0080U)) {
            if (high || (uint16_t)u) errno = ERANGE;
        }
        return x*avm_expm1_small(x);
    }
    if (u > 0x80000000UL) return __avm_expf_noerrno(x) - 1.0f;
    return expf(x) - 1.0f;
}
