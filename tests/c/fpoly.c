#include <stdint.h>
#include "../../runtime/lib/math/fpoly.h"
static volatile float input = 2.0f;
int avm_test_main(void)
{
    float x = input;
    float a = AVM_FPOLY3(x, 2.0f, -3.0f, 4.0f);
    float b = AVM_FPOLY5(x*x, 1.0f, 2.0f, 3.0f, 4.0f, 5.0f);
    float c = AVM_FPOLY3(x+1.0f, 1.0f, 0.0f, -1.0f);
    return a == 6.0f && b == 453.0f && c == 8.0f ? 0 : 1;
}
