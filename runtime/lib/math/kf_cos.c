#include "cos_kernel.h"

float __kernel_cosf(float x, float y)
{
    return avm_cos_kernel(x, y);
}
