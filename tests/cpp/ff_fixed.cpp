#define avm_test_main ff_common_main
#include "../c/ff_fixed.c"
#undef avm_test_main
static_assert(sizeof(float) == 4, "binary32");
__attribute__((noinline)) float ff_cpp_casts(int a, unsigned b, long c) {
    return static_cast<float>(a) + static_cast<float>(b) +
           static_cast<float>(static_cast<long>(static_cast<float>(c)));
}
extern "C" int avm_test_main(void) {
    volatile int a = -3;
    volatile unsigned b = 5;
    volatile long c = 7;
    return ff_cpp_casts(a,b,c) == 9.0f ? ff_common_main() : 1;
}
