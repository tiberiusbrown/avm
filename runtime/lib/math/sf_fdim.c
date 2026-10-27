#include "fdlibm.h"
float fdimf(float x, float y)
{
    uint32_t a, b;
    GET_FLOAT_WORD(a, x);
    GET_FLOAT_WORD(b, y);
    if ((a & 0x7fffffffUL) > 0x7f800000UL ||
        (b & 0x7fffffffUL) > 0x7f800000UL) return x+y;
    return x > y ? x-y : 0.0f;
}
