// Virtual base conversions are not matched. A VirtualDerived object thrown past a
// catch of its virtual base finds no handler, so the unwinder terminates before any
// catch runs. The virtual base's RTTI entry is never read as an object offset. The
// output is the U marker, then the halt report.
#include <avm.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);

// The runtime's halt spins, so the harness would wait for its time limit. Report
// the termination, then break, as the termination fixtures do.
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

namespace {

struct VirtualBase {
    int vb;
    VirtualBase(int v) : vb(v) {}
};

struct VirtualDerived : virtual VirtualBase {
    int vd;
    VirtualDerived(int v) : VirtualBase(v), vd(v + 1) {}
};

__attribute__((noinline)) void throw_virtual() {
    throw VirtualDerived(5);
}

__attribute__((noinline)) int catch_virtual_base() {
    try {
        throw_virtual();
    } catch (VirtualBase &) {
        return 1;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('U');
    catch_virtual_base();
    avm_debug_putc('X');
    return 0;
}
