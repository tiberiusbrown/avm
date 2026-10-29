#include <stdio.h>
static int (*volatile call)(const char *, const char *, ...) = sscanf;
static volatile long result_sink;
int avm_test_main(void) {
    long value;
    __avm_debug_break();
    for(unsigned char i = 0; i < 32; ++i) {
        call("-123456789", "%ld", &value);
        result_sink = value;
    }
    __avm_debug_break();
    return 0;
}
