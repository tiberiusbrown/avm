#include <math.h>
#include <stdint.h>
static volatile uint32_t inputs[32] = {
    1,2,0x7ffffe,0x7fffff,0x800000,0x800001,0x01000000,0x10000000,
    0x20000000,0x30000000,0x3e800000,0x3f000000,0x3f3504df,0x3f3504e0,0x3f3504e1,0x3f7fffff,
    0x3f800000,0x3f800001,0x3fb504df,0x3fb504e0,0x3fb504e1,0x40000000,0x40800000,0x41000000,
    0x45000000,0x50000000,0x60000000,0x70000000,0x7e800000,0x7f000000,0x7f7ffffe,0x7f7fffff
};
static volatile float result;
int avm_test_main(void) {
    float sum=0;
    __avm_debug_break();
    for (uint8_t i=0;i<32;++i) {
        union {uint32_t u;float f;} x={inputs[i]};
        sum += log2f(x.f);
    }
    result=sum;
    __avm_debug_break();
    return 0;
}
