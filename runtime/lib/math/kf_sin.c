#include "sin_kernel.h"

float __kernel_sinf(float x)
{
    return avm_sin_kernel(x);
}
