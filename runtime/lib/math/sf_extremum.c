#include "fdlibm.h"

static inline float avm_quiet_nan(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    SET_FLOAT_WORD(x, u | 0x00400000UL);
    return x;
}

/* NaN operands are rare, so their selection stays out of line. The numeric
   forms return the number when exactly one operand is a NaN. The IEEE forms
   propagate a NaN. */
static __attribute__((noinline, cold)) float
avm_extremum_nan(float x, float y, int numeric)
{
    uint32_t ux, uy;
    GET_FLOAT_WORD(ux, x);
    GET_FLOAT_WORD(uy, y);
    uint32_t ax = ux & 0x7fffffffUL, ay = uy & 0x7fffffffUL;
    if (!numeric) return ax > 0x7f800000UL ? avm_quiet_nan(x) : avm_quiet_nan(y);
    if (ax > 0x7f800000UL && ay > 0x7f800000UL) return avm_quiet_nan(x);
    return ax > 0x7f800000UL ? y : x;
}

/* Magnitude forms choose by absolute value, and ties use the ordinary extremum,
   so +0 is above -0. */
static __attribute__((always_inline)) inline float
avm_extremum(float x, float y, int maximum, int magnitude, int numeric)
{
    uint32_t ux, uy;
    GET_FLOAT_WORD(ux, x);
    GET_FLOAT_WORD(uy, y);
    uint32_t ax = ux & 0x7fffffffUL, ay = uy & 0x7fffffffUL;
    if (AVM_MATH_UNLIKELY(ax > 0x7f800000UL || ay > 0x7f800000UL)) return avm_extremum_nan(x, y, numeric);
    if (magnitude && ax != ay) return ((ax > ay) == (maximum != 0)) ? x : y;
    if (!(ax | ay)) {
        SET_FLOAT_WORD(x, maximum ? (ux & uy) : (ux | uy));
        return x;
    }
    if (maximum) return x > y ? x : y;
    return x < y ? x : y;
}

float fmaximumf(float x, float y)
{
    return avm_extremum(x, y, 1, 0, 0);
}

float fminimumf(float x, float y)
{
    return avm_extremum(x, y, 0, 0, 0);
}

float fmaximum_magf(float x, float y)
{
    return avm_extremum(x, y, 1, 1, 0);
}

float fminimum_magf(float x, float y)
{
    return avm_extremum(x, y, 0, 1, 0);
}

float fmaximum_numf(float x, float y)
{
    return avm_extremum(x, y, 1, 0, 1);
}

float fminimum_numf(float x, float y)
{
    return avm_extremum(x, y, 0, 0, 1);
}

float fmaximum_mag_numf(float x, float y)
{
    return avm_extremum(x, y, 1, 1, 1);
}

float fminimum_mag_numf(float x, float y)
{
    return avm_extremum(x, y, 0, 1, 1);
}
