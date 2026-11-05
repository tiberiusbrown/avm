#include "fdlibm.h"

/* Every binary32 encoding is canonical, so the value is copied unchanged.
   A signaling NaN is stored as its quiet form. The result is always produced. */
int canonicalizef(float *cx, const float *x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, *x);
    if ((u & 0x7fffffffUL) > 0x7f800000UL) u |= 0x00400000UL;
    SET_FLOAT_WORD(*cx, u);
    return 0;
}
