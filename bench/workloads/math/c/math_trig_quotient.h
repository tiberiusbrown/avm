#include <math.h>
#include <stdint.h>
static volatile float inputs[32] = {
  1, 2, 6.2831853f, 10, 100, 1000, 10000, 30000,
  1, 2, 6.2831853f, 10, 100, 1000, 10000, 30000,
  1, 2, 6.2831853f, 10, 100, 1000, 10000, 30000,
  1, 2, 6.2831853f, 10, 100, 1000, 10000, 30000};
static volatile uint32_t result;
int avm_test_main(void) {
    uint32_t sum=0;
    __avm_debug_break();
    for (uint8_t i=0; i<32; ++i) {
#if QUOTIENT_VARIANT == 0
        uint32_t n=((uint32_t)(inputs[i]*0x1.45f306p0f)+1UL)>>1;
#elif QUOTIENT_VARIANT == 1
        uint16_t doubled=(uint16_t)(inputs[i]*0x1.45f306p0f);
        uint16_t n=(uint16_t)(doubled+1U)>>1;
#else
        uint32_t n=(uint32_t)(inputs[i]*0x1.45f306p-1f+0.5f);
#endif
        sum+=n;
    }
    result=sum;
    __avm_debug_break();
    return 0;
}
