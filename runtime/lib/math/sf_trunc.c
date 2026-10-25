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

float truncf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint16_t hi = (uint16_t)(bits >> 16);
    uint16_t lo = (uint16_t)bits;
    int e = (int)((hi & 0x7fffu) >> 7) - 127;

    if (e < 0) {
        hi &= 0x8000u;
        lo = 0;
    } else if (e < 7) {
        uint16_t mask = 0x007fu >> e;
        hi &= (uint16_t)~mask;
        lo = 0;
    } else if (e < 23) {
        uint16_t mask = 0xffffu >> (e - 7);
        lo &= (uint16_t)~mask;
    } else {
        return e == 128 ? x + x : x;
    }
    SET_FLOAT_WORD(x, ((uint32_t)hi << 16) | lo);
    return x;
}

