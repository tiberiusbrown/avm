#include "math_test.h"

/* Endpoint anchoring prevents backward jumps at the interval and reciprocal
   transitions. Check both public entry points on adjacent binary32 inputs. */
static const AVM_PROGMEM uint32_t centers[]={
    0x3e800000UL,0x3f000000UL,0x3f400000UL,
    0x3f800000UL,0x40000000UL,0x40800000UL
};
int avm_test_main(void)
{
    for (uint8_t i=0;i<sizeof(centers)/sizeof(centers[0]);++i) {
        float previous=-1.0f, previous2=-1.0f;
        for (int d=-8;d<=8;++d) {
            float x=from_bits(centers[i]+d);
            float a=atanf(x),b=atan2f(x,1.0f);
            if (a<previous || b<previous2) return 1;
            previous=a;
            previous2=b;
        }
    }
    return 0;
}
