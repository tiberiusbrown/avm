// std::set_terminate and std::terminate: the installed handler runs in place of the default
// handler, and it must not return. The fixture overrides avm_halt so the handler's marker and
// the halt report both appear on the serial output.
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

void handler() {
    avm_debug_putc('T');
    avm_halt();
}

} // namespace

extern "C" int avm_test_main(void) {
    // The default handler is never null, and set_terminate returns the handler it replaces.
    if (std::get_terminate() == nullptr)
        return 1;
    std::terminate_handler previous = std::set_terminate(handler);
    if (std::get_terminate() != handler)
        return 2;
    std::set_terminate(previous);
    if (std::get_terminate() != previous)
        return 3;
    std::set_terminate(handler);
    std::terminate();
}
