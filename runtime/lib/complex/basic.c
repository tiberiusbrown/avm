#include "complex_internal.h"
float crealf(float complex z) { return __real__ z; }
float cimagf(float complex z) { return __imag__ z; }
float complex conjf(float complex z) { return CX(__real__ z,cx_flip(__imag__ z)); }
float complex cprojf(float complex z) {
    if(isinf(__real__ z)||isinf(__imag__ z)) return CX(INFINITY,copysignf(0,__imag__ z));
    return z;
}
float cabsf(float complex z) { return hypotf(__real__ z,__imag__ z); }
float cargf(float complex z) { return atan2f(__imag__ z,__real__ z); }
