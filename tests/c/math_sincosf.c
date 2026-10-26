/* Independent 100-digit mathematical values, including exact signs. */
#include "math_test.h"
static const AVM_PROGMEM struct math_case cases[] = {
    {0x00000000UL,0x3f800000UL,0x00000000UL,0},
    {0x80000000UL,0x3f800000UL,0x80000000UL,0},
    {0x00000001UL,0x3f800000UL,0x00000001UL,1},
    {0x80000001UL,0x3f800000UL,0x80000001UL,1},
    {0x007fffffUL,0x3f800000UL,0x007fffffUL,1},
    {0x00800000UL,0x3f800000UL,0x00800000UL,1},
    {0x7f800000UL,0xffc00000UL,0xffc00000UL,0},
    {0xff800000UL,0xffc00000UL,0xffc00000UL,0},
    {0x7fc12345UL,0xffc00000UL,0xffc00000UL,0},
    {0x7fa12345UL,0xffc00000UL,0xffc00000UL,0},
    {0x7f7fffffUL,0x3f5a5f96UL,0xbf0599b3UL,1},
    {0xff7fffffUL,0x3f5a5f96UL,0x3f0599b3UL,1},
    {0x3e800000UL,0x3f780aa5UL,0x3e7d5777UL,1},
    {0xbe800000UL,0x3f780aa5UL,0xbe7d5777UL,1},
    {0x3f000000UL,0x3f60a940UL,0x3ef57744UL,1},
    {0xbf000000UL,0x3f60a940UL,0xbef57744UL,1},
    {0x3f400000UL,0x3f3b4ff6UL,0x3f2e7fe1UL,1},
    {0xbf400000UL,0x3f3b4ff6UL,0xbf2e7fe1UL,1},
    {0x3f800000UL,0x3f0a5140UL,0x3f576aa4UL,1},
    {0xbf800000UL,0x3f0a5140UL,0xbf576aa4UL,1},
    {0x3fc00000UL,0x3d90deaaUL,0x3f7f5bd5UL,1},
    {0xbfc00000UL,0x3d90deaaUL,0xbf7f5bd5UL,1},
    {0x40000000UL,0xbed51133UL,0x3f68c7b7UL,1},
    {0xc0000000UL,0xbed51133UL,0xbf68c7b7UL,1},
    {0x40400000UL,0xbf7d7026UL,0x3e1081c3UL,1},
    {0xc0400000UL,0xbf7d7026UL,0xbe1081c3UL,1},
    {0x40800000UL,0xbf275530UL,0xbf41bdcfUL,1},
    {0xc0800000UL,0xbf275530UL,0x3f41bdcfUL,1},
    {0x40a00000UL,0x3e913c2cUL,0xbf757c10UL,1},
    {0xc0a00000UL,0x3e913c2cUL,0x3f757c10UL,1},
    {0x41000000UL,0xbe14fdf6UL,0x3f7d4695UL,1},
    {0xc1000000UL,0xbe14fdf6UL,0xbf7d4695UL,1},
    {0x41800000UL,0xbf75292cUL,0xbe936810UL,1},
    {0xc1800000UL,0xbf75292cUL,0x3e936810UL,1},
    {0x43000000UL,0xbf31619fUL,0x3f3895edUL,1},
    {0xc3000000UL,0xbf31619fUL,0xbf3895edUL,1},
    {0x49742400UL,0x3f6fcefdUL,0xbeb33259UL,1},
    {0xc9742400UL,0x3f6fcefdUL,0x3eb33259UL,1},
    {0x60ad78ecUL,0x3f411723UL,0x3f281569UL,1},
    {0xe0ad78ecUL,0x3f411723UL,0xbf281569UL,1},
};
int avm_test_main(void) {
    for (uint16_t i=0;i<sizeof(cases)/sizeof(cases[0]);++i) {
        float s,c;
        sincosf(from_bits(cases[i].a),&s,&c);
        if (check_accuracy_result(s,cases[i].expected,cases[i].tolerance,i,AVM_SIN) ||
            check_accuracy_result(c,cases[i].b,cases[i].tolerance,i,AVM_COS)) return 1;
    }
    return 0;
}
