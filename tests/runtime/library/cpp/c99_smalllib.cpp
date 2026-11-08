extern "C" int avm_test_main(void);
#include "../c/c99_smalllib.c"

template<class T> void assertion_template(T value) { assert(value == 1); }
template void assertion_template<int>(int);
