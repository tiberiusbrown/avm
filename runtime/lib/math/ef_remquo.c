#include "remainder_kernel.h"

float remquof(float x, float y, int *quotient)
{
    return avm_remainder(x, y, quotient, 1);
}
