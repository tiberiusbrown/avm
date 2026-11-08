// A terminate handler that throws does not return to terminate. The exception escapes the
// noexcept terminate, which calls terminate again, and that nested call aborts. The fixture
// overrides avm_halt so the handler's marker and the abort report both appear.
#include <avm.h>
#include <avm/runtime.h>
#include <exception>

extern "C" int avm_test_main(void);

extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

namespace {

void throwing_handler() {
    avm_debug_putc('T');
    throw 1;
}

} // namespace

extern "C" int avm_test_main(void) {
    std::set_terminate(throwing_handler);
    std::terminate();
}
