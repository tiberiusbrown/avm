#include "fdlibm.h"
#include "c99_poly.h"

float cbrtf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (!a || a >= 0x7f800000UL) return x+x;
    int e = (int)(a >> 23)-127;
    if (a < 0x00800000UL) {
        x *= 0x1p24f;
        GET_FLOAT_WORD(a, x);
        a &= 0x7fffffffUL;
        e = (int)(a >> 23)-151;
    }
    SET_FLOAT_WORD(x, (a & 0x007fffffUL) | 0x3f800000UL);
    int q = (e+150)/3-50;
    int r = e-3*q;
    float y = avm_cbrt_poly(x-1.5f);
    if (r) y *= r == 1 ? 0x1.428a3p0f : 0x1.965feap0f;
    GET_FLOAT_WORD(a, y);
    a += (uint32_t)q << 23;
    SET_FLOAT_WORD(y, a | (u & 0x80000000UL));
    return y;
}
