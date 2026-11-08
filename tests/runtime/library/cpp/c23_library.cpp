#if __cplusplus < 202302L
#error "AVM C++ compilation must use C++23 by default"
#endif

#ifndef __cpp_size_t_suffix
#error "C++23 feature-test macros are not enabled"
#endif

#ifndef __cpp_if_consteval
#error "C++23 feature-test macros are not enabled"
#endif

#include <version>
#include <stdbit.h>
#include <string.h>
#include <stdlib.h>

extern "C" int avm_test_main() {
    char data[4] = {};
    bool (*single)(unsigned int) = stdc_has_single_bit_ui;
    return !single(8) || single(9) ||
        stdc_bit_floor_ull(9) != 8 ||
        memccpy(data, "abc", 'b', 3) != data + 2 ||
        memset_explicit(data, 0, 4) != data ||
        data[0] || data[1] || memalignment(nullptr);
}
