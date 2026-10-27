#include "remainder_kernel.h"

float remainderf(float x, float y)
{
    return avm_remainder(x, y, 0, 0);
}
