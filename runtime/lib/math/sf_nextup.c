#include "fdlibm.h"

/* Successor and predecessor on the binary32 ordering. Zeros step to the least
   subnormal of the requested sign. Infinities saturate at themselves, and NaNs
   are quieted with their payload and sign preserved. */
float nextupf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a > 0x7f800000UL) { SET_FLOAT_WORD(x, u | 0x00400000UL); return x; }
    if (u == 0x7f800000UL) return x;
    if (a == 0) { SET_FLOAT_WORD(x, 0x00000001UL); return x; }
    SET_FLOAT_WORD(x, (u & 0x80000000UL) ? u - 1UL : u + 1UL);
    return x;
}

float nextdownf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a > 0x7f800000UL) { SET_FLOAT_WORD(x, u | 0x00400000UL); return x; }
    if (u == 0xff800000UL) return x;
    if (a == 0) { SET_FLOAT_WORD(x, 0x80000001UL); return x; }
    SET_FLOAT_WORD(x, (u & 0x80000000UL) ? u + 1UL : u - 1UL);
    return x;
}
