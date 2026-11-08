#include <stdio.h>
static int (*volatile call)(const char *, const char *, ...) = sscanf;
static volatile float result_sink;
int avm_test_main(void) {
    float value;
    __avm_debug_break();
    for(unsigned char i = 0; i < 32; ++i) {
        call("-0x1.abcdefp-12", "%f", &value);
        result_sink = value;
    }
    __avm_debug_break();
    return 0;
}
