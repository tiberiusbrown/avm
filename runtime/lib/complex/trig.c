#include "complex_internal.h"
float complex csinf(float complex z) {
    float complex w=csinhf(CX(-__imag__ z,__real__ z));
    return CX(__imag__ w,isinf(__imag__ z)&&!isfinite(__real__ z)?INFINITY:-__real__ w);
}
float complex ccosf(float complex z) { return ccoshf(CX(-__imag__ z,__real__ z)); }
float complex ctanf(float complex z) {
    float complex w=ctanhf(CX(-__imag__ z,__real__ z));
    return CX(__imag__ w,-__real__ w);
}
