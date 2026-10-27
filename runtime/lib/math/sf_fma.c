/* AVM uses avr-libc flt40_t multiply/add precision with one final rounding. */
#include "fdlibm.h"
#ifndef __AVM__
#include "native_math.h"
#endif
float fmaf(float x, float y, float z)
{
#ifdef __AVM__
    register float a __asm__("q2") = x;
    register float b __asm__("q3") = y;
    register float c __asm__("q0") = z;
    __asm__("fma" : "+r"(a) : "r"(b), "r"(c));
    return a;
#else
    return avm_native_fma(x, y, z);
#endif
}
