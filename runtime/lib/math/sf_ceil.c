/* sf_ceil.c -- float version of s_ceil.c.
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

float ceilf(float x)
{
#ifdef __AVM__
    register float value __asm__("q2") = x;
    __asm__("fceil" : "+r"(value));
    return value;
#else
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint16_t hi = (uint16_t)(bits >> 16);
    uint16_t lo = (uint16_t)bits;
    int e = (int)((hi & 0x7fffu) >> 7) - 127;

    if (e < 0) {
        /* Preserve both zeros; other positive values round to +1. */
        if (!(hi & 0x8000u) && (hi || lo))
            hi = 0x3f80u;
        else
            hi &= 0x8000u;
        lo = 0;
    } else if (e < 7) {
        uint16_t mask = 0x007fu >> e;
        if (!((hi & mask) | lo)) return x;
        if (!(hi & 0x8000u)) hi += mask + 1u;
        hi &= (uint16_t)~mask;
        lo = 0;
    } else if (e < 23) {
        uint16_t mask = 0xffffu >> (e - 7);
        if (!(lo & mask)) return x;
        if (!(hi & 0x8000u)) {
            /* This also handles e == 7, when the increment is a whole word. */
            lo = (uint16_t)((lo | mask) + 1u);
            hi += lo == 0;
        } else {
            lo &= (uint16_t)~mask;
        }
    } else {
        return e == 128 ? x + x : x;
    }
    SET_FLOAT_WORD(x, ((uint32_t)hi << 16) | lo);
    return x;
#endif
}

