#include "narrow_kernel.h"
#include <math.h>

/* On AVM, double and long double share binary32. Each operation below is one
   correctly rounded binary32 operation, so the narrow result equals the value
   of the operation in its own type. */

float fadd(double x, double y)
{
    return avm_narrow_result2((float)(x + y), (float)x, (float)y);
}

float faddl(long double x, long double y)
{
    return avm_narrow_result2((float)(x + y), (float)x, (float)y);
}

double daddl(long double x, long double y)
{
    return (double)avm_narrow_result2((float)(x + y), (float)x, (float)y);
}

float fsub(double x, double y)
{
    return avm_narrow_result2((float)(x - y), (float)x, (float)y);
}

float fsubl(long double x, long double y)
{
    return avm_narrow_result2((float)(x - y), (float)x, (float)y);
}

double dsubl(long double x, long double y)
{
    return (double)avm_narrow_result2((float)(x - y), (float)x, (float)y);
}

float fmul(double x, double y)
{
    return avm_narrow_result2((float)(x * y), (float)x, (float)y);
}

float fmull(long double x, long double y)
{
    return avm_narrow_result2((float)(x * y), (float)x, (float)y);
}

double dmull(long double x, long double y)
{
    return (double)avm_narrow_result2((float)(x * y), (float)x, (float)y);
}

float fdiv(double x, double y)
{
    return avm_narrow_result2((float)(x / y), (float)x, (float)y);
}

float fdivl(long double x, long double y)
{
    return avm_narrow_result2((float)(x / y), (float)x, (float)y);
}

double ddivl(long double x, long double y)
{
    return (double)avm_narrow_result2((float)(x / y), (float)x, (float)y);
}

/* fmaf performs the single rounding and reports its own domain and range errors. */
float ffma(double x, double y, double z)
{
    return fmaf((float)x, (float)y, (float)z);
}

float ffmal(long double x, long double y, long double z)
{
    return fmaf((float)x, (float)y, (float)z);
}

double dfmal(long double x, long double y, long double z)
{
    return (double)fmaf((float)x, (float)y, (float)z);
}

/* sqrtf reports its own domain errors and needs no range check. */
float fsqrt(double x)
{
    return sqrtf((float)x);
}

float fsqrtl(long double x)
{
    return sqrtf((float)x);
}

double dsqrtl(long double x)
{
    return (double)sqrtf((float)x);
}
