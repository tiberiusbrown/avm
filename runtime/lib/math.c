#include "math/fdlibm.h"
#include "math/log_kernel.h"

float log2f(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    if (u == 0x3f800000UL) return 0.0f;
    if (u >= 0x7f800000UL || !(u & 0x7fffffffUL)) return avm_log_kernel(x);
    int exponent = 0;
    if (u < 0x00800000UL) {
        x *= 0x1p25f;
        GET_FLOAT_WORD(u, x);
        exponent = -25;
    }
    exponent += (int)(u >> 23) - 127;
    u = (u & 0x007fffffUL) | 0x3f800000UL;
    /* Reduce around one, avoiding cancellation on either side of one. */
    if (u > 0x3fb504f3UL) { u -= 0x00800000UL; ++exponent; }
    SET_FLOAT_WORD(x, u);
    return (float)exponent + avm_log_kernel(x) * 0x1.715476p0f;
}

float fminf(float x, float y)
{
    uint32_t a, b;
    GET_FLOAT_WORD(a, x);
    GET_FLOAT_WORD(b, y);
    if (FLT_UWORD_IS_NAN(a & 0x7fffffffUL)) return y;
    if (FLT_UWORD_IS_NAN(b & 0x7fffffffUL)) return x;
    if (((a | b) & 0x7fffffffUL) == 0) { SET_FLOAT_WORD(x, a | b); return x; }
    return x < y ? x : y;
}

float fmaxf(float x, float y)
{
    uint32_t a, b;
    GET_FLOAT_WORD(a, x);
    GET_FLOAT_WORD(b, y);
    if (FLT_UWORD_IS_NAN(a & 0x7fffffffUL)) return y;
    if (FLT_UWORD_IS_NAN(b & 0x7fffffffUL)) return x;
    if (((a | b) & 0x7fffffffUL) == 0) { SET_FLOAT_WORD(x, a & b); return x; }
    return x > y ? x : y;
}
