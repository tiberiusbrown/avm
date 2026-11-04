// A failed reference dynamic_cast with no handler on any frame. The std::bad_cast throw must
// terminate through the existing unhandled-exception path, before any further code runs. The
// output is the U marker, then the halt report.
#include <avm.h>
#include <avm/runtime.h>
#include <typeinfo>

extern "C" int avm_test_main(void);

// The runtime's halt spins, so the harness would wait for its time limit. Report the
// termination, then break, as the other unhandled fixtures do.
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

struct Derived : Base {};

struct Unrelated : Base {};

Unrelated unrelated_object;

__attribute__((noinline)) Base &unrelated_base() {
    return unrelated_object;
}

__attribute__((noinline)) Derived &as_derived(Base &value) {
    return dynamic_cast<Derived &>(value);
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('U');
    (void)as_derived(unrelated_base());
    avm_debug_putc('X');
    return 0;
}
