#include <stdio.h>
static int (*volatile call)(const char *, const char *, ...) = sscanf;
static volatile char result_sink;
int avm_test_main(void) {
    char value[8];
    __avm_debug_break();
    for(unsigned char i = 0; i < 32; ++i) {
        call("scanner123", "%7[a-z]", value);
        result_sink = value[0];
    }
    __avm_debug_break();
    return 0;
}
