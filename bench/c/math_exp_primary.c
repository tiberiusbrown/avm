#include <math.h>
#include <stdint.h>
static volatile float input=-0.3465736f, result;
int avm_test_main(void) {
    float sum=0;
    __avm_debug_break();
    for(uint8_t i=0;i<32;++i) sum+=expf(input+(float)i*0.022f);
    result=sum;
    __avm_debug_break();
    return 0;
}
