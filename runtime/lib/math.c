#include "math/fdlibm.h"
#include "math/log_kernel.h"

float log2f(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    if (u-1U >= 0x7f7fffffUL) return avm_log_special(x, u);
    int exponent;
    x = avm_log_normalize(x, u, &exponent);
    return (float)exponent + avm_log2_mantissa(x);
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
