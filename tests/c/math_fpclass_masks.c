/* Exhaust all 1,024 immediate masks against an independent bit oracle.
   Groups keep O0 stack frames small; the normal C test matrix runs all six
   optimization levels. No floating comparison is used by the oracle. */
#include "math_test.h"
#define CHECK_MASK(m) if (!!__builtin_isfpclass(x, (m)) != !!(cls & (m))) return 1
#define CHECK_GROUP(n) static __attribute__((noinline)) int group_##n(float x, unsigned cls) { \
    CHECK_MASK((n)*32+0); \
    CHECK_MASK((n)*32+1); \
    CHECK_MASK((n)*32+2); \
    CHECK_MASK((n)*32+3); \
    CHECK_MASK((n)*32+4); \
    CHECK_MASK((n)*32+5); \
    CHECK_MASK((n)*32+6); \
    CHECK_MASK((n)*32+7); \
    CHECK_MASK((n)*32+8); \
    CHECK_MASK((n)*32+9); \
    CHECK_MASK((n)*32+10); \
    CHECK_MASK((n)*32+11); \
    CHECK_MASK((n)*32+12); \
    CHECK_MASK((n)*32+13); \
    CHECK_MASK((n)*32+14); \
    CHECK_MASK((n)*32+15); \
    CHECK_MASK((n)*32+16); \
    CHECK_MASK((n)*32+17); \
    CHECK_MASK((n)*32+18); \
    CHECK_MASK((n)*32+19); \
    CHECK_MASK((n)*32+20); \
    CHECK_MASK((n)*32+21); \
    CHECK_MASK((n)*32+22); \
    CHECK_MASK((n)*32+23); \
    CHECK_MASK((n)*32+24); \
    CHECK_MASK((n)*32+25); \
    CHECK_MASK((n)*32+26); \
    CHECK_MASK((n)*32+27); \
    CHECK_MASK((n)*32+28); \
    CHECK_MASK((n)*32+29); \
    CHECK_MASK((n)*32+30); \
    CHECK_MASK((n)*32+31); \
    return 0; }
CHECK_GROUP(0)
CHECK_GROUP(1)
CHECK_GROUP(2)
CHECK_GROUP(3)
CHECK_GROUP(4)
CHECK_GROUP(5)
CHECK_GROUP(6)
CHECK_GROUP(7)
CHECK_GROUP(8)
CHECK_GROUP(9)
CHECK_GROUP(10)
CHECK_GROUP(11)
CHECK_GROUP(12)
CHECK_GROUP(13)
CHECK_GROUP(14)
CHECK_GROUP(15)
CHECK_GROUP(16)
CHECK_GROUP(17)
CHECK_GROUP(18)
CHECK_GROUP(19)
CHECK_GROUP(20)
CHECK_GROUP(21)
CHECK_GROUP(22)
CHECK_GROUP(23)
CHECK_GROUP(24)
CHECK_GROUP(25)
CHECK_GROUP(26)
CHECK_GROUP(27)
CHECK_GROUP(28)
CHECK_GROUP(29)
CHECK_GROUP(30)
CHECK_GROUP(31)

int avm_test_main(void) {
    static const AVM_PROGMEM uint32_t inputs[]={
        0,1,0xffff,0x10000,0x007fffffUL,0x00800000UL,0x00800001UL,
        0x3f800000UL,0x7f7fffffUL,0x7f800000UL,0x7f800001UL,
        0x7f807fffUL,0x7f810000UL,0x7fbfffffUL,0x7fc00000UL,0x7fc00001UL,0x7fffffffUL};
    for (unsigned sign=0;sign<2;++sign) {
        for (unsigned i=0;i<sizeof(inputs)/sizeof(inputs[0]);++i) {
            uint32_t a=inputs[i], bits=a|((uint32_t)sign<<31);
            unsigned cls;
            if (a>0x7f800000UL) cls=(a&0x00400000UL) ? 2 : 1;
            else if (a==0x7f800000UL) cls=sign ? 4 : 512;
            else if (!a) cls=sign ? 32 : 64;
            else if (a<0x00800000UL) cls=sign ? 16 : 128;
            else cls=sign ? 8 : 256;
            volatile float x=from_bits(bits);
            if(group_0(x,cls)) return 1;
            if(group_1(x,cls)) return 1;
            if(group_2(x,cls)) return 1;
            if(group_3(x,cls)) return 1;
            if(group_4(x,cls)) return 1;
            if(group_5(x,cls)) return 1;
            if(group_6(x,cls)) return 1;
            if(group_7(x,cls)) return 1;
            if(group_8(x,cls)) return 1;
            if(group_9(x,cls)) return 1;
            if(group_10(x,cls)) return 1;
            if(group_11(x,cls)) return 1;
            if(group_12(x,cls)) return 1;
            if(group_13(x,cls)) return 1;
            if(group_14(x,cls)) return 1;
            if(group_15(x,cls)) return 1;
            if(group_16(x,cls)) return 1;
            if(group_17(x,cls)) return 1;
            if(group_18(x,cls)) return 1;
            if(group_19(x,cls)) return 1;
            if(group_20(x,cls)) return 1;
            if(group_21(x,cls)) return 1;
            if(group_22(x,cls)) return 1;
            if(group_23(x,cls)) return 1;
            if(group_24(x,cls)) return 1;
            if(group_25(x,cls)) return 1;
            if(group_26(x,cls)) return 1;
            if(group_27(x,cls)) return 1;
            if(group_28(x,cls)) return 1;
            if(group_29(x,cls)) return 1;
            if(group_30(x,cls)) return 1;
            if(group_31(x,cls)) return 1;
        }
    }
    return 0;
}
