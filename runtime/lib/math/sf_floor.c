/* sf_floor.c -- float version of s_floor.c.
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

/*
 * floorf(x)
 * Return x rounded toward -inf to integral value
 * Method:
 *	Bit twiddling.
 * Exception:
 *	Inexact flag raised if x not equal to floorf(x).
 */

#include "fdlibm.h"

float floorf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint16_t hi = (uint16_t)(bits >> 16);
    uint16_t lo = (uint16_t)bits;
    int e = (int)((hi & 0x7fffu) >> 7) - 127;

    if (e < 0) {
        /* Preserve negative zero; other negative values round to -1. */
        if ((hi & 0x8000u) && ((hi & 0x7fffu) || lo))
            hi = 0xbf80u;
        else
            hi &= 0x8000u;
        lo = 0;
    } else if (e < 7) {
        uint16_t mask = 0x007fu >> e;
        if (!((hi & mask) | lo)) return x;
        if (hi & 0x8000u) hi += mask + 1u;
        hi &= (uint16_t)~mask;
        lo = 0;
    } else if (e < 23) {
        uint16_t mask = 0xffffu >> (e - 7);
        if (!(lo & mask)) return x;
        if (hi & 0x8000u) {
            /* Set the discarded bits before adding, so e == 7 also carries
             * correctly without trying to represent 0x10000 in a word. */
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
}

