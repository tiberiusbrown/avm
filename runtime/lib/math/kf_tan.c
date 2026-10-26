#include "tan_kernel.h"

float __kernel_tanf(float x, int reciprocal)
{
    return avm_tan_kernel(x, reciprocal);
}
