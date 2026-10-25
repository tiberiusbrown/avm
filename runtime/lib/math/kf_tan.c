#include "tan_kernel.h"

float __kernel_tanf(float x, float y, int iy)
{
    return avm_tan_kernel(x, y, iy);
}
