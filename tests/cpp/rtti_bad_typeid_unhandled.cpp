// The fixture evaluates side-effecting operands of polymorphic typeid on purpose, and
// Clang warns about exactly that. The warning is silenced for this file only.
#pragma clang diagnostic ignored "-Wpotentially-evaluated-expression"
// A null polymorphic typeid with no handler on any frame. The std::bad_typeid
// throw must terminate through the existing unhandled-exception path, before any
// further code runs. The output is the U marker, then the halt report.
#include <avm.h>
#include <avm/runtime.h>
#include <typeinfo>

extern "C" int avm_test_main(void);

// The runtime's halt spins, so the harness would wait for its time limit. Report
// the termination, then break, as the other unhandled fixtures do.
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

namespace {

struct Base {
    virtual ~Base() = default;
};

__attribute__((noinline)) Base *null_base() {
    return nullptr;
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('U');
    (void)typeid(*null_base());
    avm_debug_putc('X');
    return 0;
}
