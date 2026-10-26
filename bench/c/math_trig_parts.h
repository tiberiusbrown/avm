/* Focused final-path costs, 32 iterations including loads/loop/accumulation. */
#include <math.h>
#include <stdint.h>
#include "../../runtime/lib/math/trig_poly.h"
static volatile float inputs[32];
static volatile uint32_t counts[32];
static volatile float result;
int avm_test_main(void) {
    for (uint8_t i=0;i<32;++i) {
#if TRIG_PART == 0
        counts[i]=(uint32_t)(i+1)*199;
        inputs[i]=(float)counts[i]*1.5707963f+0.25f;
#elif TRIG_PART == 1
        inputs[i]=(float)((int)i-16)*0.0625f;
#else
        inputs[i]=(float)((int)i-16)*0.046875f;
#endif
    }
    float sum=0;
    __avm_debug_break();
    for (uint8_t i=0;i<32;++i) {
        float x=inputs[i];
#if TRIG_PART == 0
        float fn=(float)counts[i];
        sum+=(x-fn*0x1.92p0f)-fn*0x1.fb5444p-12f;
#elif TRIG_PART == 1
        int n=0;
        if (x>0x1.921fb6p-1f) { ++n; x=(x-0x1.921fb4p0f)-0x1.4442d2p-24f; }
        else if (x < -0x1.921fb6p-1f) { --n; x=(x+0x1.921fb4p0f)+0x1.4442d2p-24f; }
        sum+=x+(float)n;
#else
        float z=x*x;
        sum+=x*avm_sin_polynomial(z)+avm_cos_polynomial(z);
#endif
    }
    result=sum;
    __avm_debug_break();
    return 0;
}
