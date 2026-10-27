#include "fdlibm.h"

float ldexpf(float x, int exponent)
{
    return scalbnf(x, exponent);
}

float frexpf(float x, int *exponent)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    *exponent = 0;
    if (!a || a >= 0x7f800000UL) return x;
    int e = (int)(a >> 23);
    if (!e) {
        /* Bounded normalization avoids a 23-iteration loop for tiny inputs. */
        e = 1;
        if (a < 0x00000100UL) { a <<= 16; e -= 16; }
        if (a < 0x00010000UL) { a <<= 8; e -= 8; }
        if (a < 0x00100000UL) { a <<= 4; e -= 4; }
        if (a < 0x00400000UL) { a <<= 2; e -= 2; }
        if (a < 0x00800000UL) { a <<= 1; --e; }
    }
    *exponent = e - 126;
    SET_FLOAT_WORD(x, (u & 0x80000000UL) | (a & 0x007fffffUL) | 0x3f000000UL);
    return x;
}

float modff(float x, float *integer_part)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    float zero;
    SET_FLOAT_WORD(zero, u & 0x80000000UL);
    int e = (int)(a >> 23) - 127;
    if (e < 0) { *integer_part = zero; return x; }
    if (e >= 23) {
        *integer_part = x;
        return a > 0x7f800000UL ? x+x : zero;
    }
    /* Build the mask in native words: a variable uint32_t shift otherwise
       becomes two guest shift-helper calls after LLVM's mask simplification. */
    uint16_t high, low;
    if (e < 7) { high = (uint16_t)(0x7fU >> e); low = 0xffffU; }
    else { high = 0; low = (uint16_t)(0xffffU >> (e-7)); }
    uint32_t mask = ((uint32_t)high << 16) | low;
    SET_FLOAT_WORD(*integer_part, u & ~mask);
    if (!(u & mask)) return zero;
    /* Sterbenz subtraction is exact, including negative fractions. */
    return x - *integer_part;
}

float nextafterf(float x, float y)
{
    uint32_t a, b;
    GET_FLOAT_WORD(a, x);
    GET_FLOAT_WORD(b, y);
    if ((a & 0x7fffffffUL) > 0x7f800000UL ||
        (b & 0x7fffffffUL) > 0x7f800000UL) return x+y;
    if (x == y) return y;
    if (!(a & 0x7fffffffUL)) a = (b & 0x80000000UL) | 1UL;
    else if ((x < y) == !(a >> 31)) ++a;
    else --a;
    SET_FLOAT_WORD(x, a);
    return x;
}
