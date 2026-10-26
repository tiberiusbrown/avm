#include "cos_kernel.h"

float __kernel_cosf(float x)
{
    return avm_cos_kernel(x);
}
