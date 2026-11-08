#include <algorithm>
#include <avm.h>
#include <avm/runtime.h>
#include <exception>
#include <execution>

namespace {

int values[2];

[[noreturn]] void terminated()
{
    avm_debug_putc('T');
    avm_debug_putc('\n');
    __avm_debug_break();
    avm_halt();
}

}

extern "C" int avm_test_main()
{
    std::set_terminate(terminated);
    try {
        // Even sequenced policy algorithms must terminate when user code
        // throws; the non-policy overload would propagate the exception.
        std::for_each(std::execution::seq, values, values + 2, [](int&) { throw 17; });
    } catch(...) {
        return 1;
    }
    return 2;
}
