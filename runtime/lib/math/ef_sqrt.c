/* ef_sqrtf.c -- float version of e_sqrt.c.
 * Conversion to float by Ian Lance Taylor, Cygnus Support, ian@cygnus.com.
 */

/*
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunPro, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice 
 * is preserved.
 * ====================================================
 */

#include "fdlibm.h"
#ifdef __AVM__
#include "native_math.h"
#endif

float __ieee754_sqrtf(float x)
{
#ifdef __AVM__
    return avm_native_sqrt(x);
#else
    /* Exact integer reference for the native restoring algorithm. No table. */
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffU;
    if (!a) return x;
    if (a > 0x7f800000U) { SET_FLOAT_WORD(x, u | 0x00400000U); return x; }
    if (u >> 31) { SET_FLOAT_WORD(x, 0x7fc00000U); return x; }
    if (a == 0x7f800000U) return x;
    int e = (int)(a >> 23) - 127;
    uint32_t m = a & 0x7fffffU;
    if (a >> 23) m |= 0x800000U;
    else { e = -126; while (!(m & 0x800000U)) { m <<= 1; --e; } }
    uint64_t n = (uint64_t)m << (23 + (e & 1));
    uint32_t root = 0;
    for (uint32_t bit = 0x800000U; bit; bit >>= 1) {
        uint32_t t = root | bit;
        if ((uint64_t)t * t <= n) root = t;
    }
    if (n - (uint64_t)root * root > root) ++root;
    int re = (e - (e & 1))/2 + 127;
    if (root == 0x1000000U) { root >>= 1; ++re; }
    SET_FLOAT_WORD(x, ((uint32_t)re << 23) | (root & 0x7fffffU));
    return x;
#endif
}
