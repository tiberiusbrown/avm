/* Fixed identical caller workloads for reducer comparisons; 32 calls each. */
#include <math.h>
#include <stdint.h>
#if TRIG_DOMAIN == 0
static volatile float inputs[32] = {
    0.0f, -0.0f, 0x1p-149f, -0x1p-149f, 0.125f, -0.125f, 0.5f, -0.5f, 0x1.921fb4p-1f, -0x1.921fb4p-1f, 0.0f, -0.0f, 0x1p-149f, -0x1p-149f, 0.125f, -0.125f, 0.5f, -0.5f, 0x1.921fb4p-1f, -0x1.921fb4p-1f, 0.0f, -0.0f, 0x1p-149f, -0x1p-149f, 0.125f, -0.125f, 0.5f, -0.5f, 0x1.921fb4p-1f, -0x1.921fb4p-1f, 0.0f, -0.0f
};
#elif TRIG_DOMAIN == 1
static volatile float inputs[32] = {
    1.0f, -1.0f, 2.0f, -2.0f, 0x1.921fb6p2f, -0x1.921fb6p2f, 10.0f, -10.0f, 100.0f, -100.0f, 1000.0f, -1000.0f, 10000.0f, -10000.0f, 1.0f, -1.0f, 2.0f, -2.0f, 0x1.921fb6p2f, -0x1.921fb6p2f, 10.0f, -10.0f, 100.0f, -100.0f, 1000.0f, -1000.0f, 10000.0f, -10000.0f, 1.0f, -1.0f, 2.0f, -2.0f
};
#elif TRIG_DOMAIN == 2
static volatile float inputs[32] = {
    0x1.921fb4p0f, 0x1.921fb6p0f, 0x1.921fb8p0f, -0x1.921fb4p0f, -0x1.921fb6p0f, -0x1.921fb8p0f, 0x1.2d97c6p1f, 0x1.2d97c8p1f, 0x1.921fb4p2f, 0x1.921fb6p2f, 0x1.921fb8p2f, 0x1.921fb4p0f, 0x1.921fb6p0f, 0x1.921fb8p0f, -0x1.921fb4p0f, -0x1.921fb6p0f, -0x1.921fb8p0f, 0x1.2d97c6p1f, 0x1.2d97c8p1f, 0x1.921fb4p2f, 0x1.921fb6p2f, 0x1.921fb8p2f, 0x1.921fb4p0f, 0x1.921fb6p0f, 0x1.921fb8p0f, -0x1.921fb4p0f, -0x1.921fb6p0f, -0x1.921fb8p0f, 0x1.2d97c6p1f, 0x1.2d97c8p1f, 0x1.921fb4p2f, 0x1.921fb6p2f
};
#elif TRIG_DOMAIN == 3
static volatile float inputs[32] = {
    201.0f, 1024.0f, 10000.0f, 30000.0f, 50000.0f, 65535.0f, 100000.0f, 0x1.fffffep16f, 0x1p17f, 0x1.000002p17f, 0x1p20f, -0x1.000002p17f, 201.0f, 1024.0f, 10000.0f, 30000.0f, 50000.0f, 65535.0f, 100000.0f, 0x1.fffffep16f, 0x1p17f, 0x1.000002p17f, 0x1p20f, -0x1.000002p17f, 201.0f, 1024.0f, 10000.0f, 30000.0f, 50000.0f, 65535.0f, 100000.0f, 0x1.fffffep16f
};
#elif TRIG_DOMAIN == 4
static volatile float inputs[32] = {
    0x1.234568p16f, -0x1.234568p16f, 0x1.234568p32f, -0x1.234568p32f, 0x1.234568p48f, 0x1.234568p64f, 0x1.234568p80f, 0x1.234568p96f, 0x1.fffffep127f, -0x1.fffffep127f, 0x1.234568p16f, -0x1.234568p16f, 0x1.234568p32f, -0x1.234568p32f, 0x1.234568p48f, 0x1.234568p64f, 0x1.234568p80f, 0x1.234568p96f, 0x1.fffffep127f, -0x1.fffffep127f, 0x1.234568p16f, -0x1.234568p16f, 0x1.234568p32f, -0x1.234568p32f, 0x1.234568p48f, 0x1.234568p64f, 0x1.234568p80f, 0x1.234568p96f, 0x1.fffffep127f, -0x1.fffffep127f, 0x1.234568p16f, -0x1.234568p16f
};
#endif
static volatile float result;
int avm_test_main(void) {
    float sum=0;
    __avm_debug_break();
    for (uint8_t i=0; i<32; ++i) {
        float x=inputs[i];
#if TRIG_FUNCTION == 0
        sum += sinf(x);
#elif TRIG_FUNCTION == 1
        sum += cosf(x);
#elif TRIG_FUNCTION == 2
        sum += tanf(x);
#else
        float s,c; sincosf(x,&s,&c); sum += s+c;
#endif
    }
    result=sum;
    __avm_debug_break();
    return 0;
}
