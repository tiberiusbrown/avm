#include "sin_kernel.h"

float __kernel_sinf(float x, float y, int iy)
{
    return avm_sin_kernel(x, y, iy);
}
