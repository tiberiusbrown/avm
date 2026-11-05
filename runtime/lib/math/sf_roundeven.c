#include "rint_kernel.h"

/* Ties-to-even is the runtime's fixed binary32 rounding mode, so roundeven
   shares the rint kernel. Zeros keep their sign, and NaNs stay NaN. */
float roundevenf(float x)
{
    return avm_rint(x);
}
