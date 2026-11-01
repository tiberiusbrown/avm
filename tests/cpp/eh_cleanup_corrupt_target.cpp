// Target for the corrupted cleanup-metadata runs. The throw goes from leaf through
// middle into protected_frame. leaf and middle each own an object whose destructor
// prints its digit, so the valid run prints 3 and then 2 as the cleanup pads run,
// and then C from the catch. unrelated has its own catch-all, which prints U. It
// runs before the throw and never sees the exception.
//
// The runner in tests/debug/eh_corruption_verify.py --cleanup mutates the AVEH3
// block of this image. A corrupted run must end cleanly: it prints the halt report
// after whatever destructors ran, and it prints neither C, P, nor U.
#include <avm.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);

extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

namespace {

struct Mark {
    char digit;

    ~Mark() { avm_debug_putc(digit); }
};

__attribute__((noinline)) void leaf() {
    Mark mark{'3'};
    throw 5;
}

__attribute__((noinline)) void middle() {
    Mark mark{'2'};
    leaf();
}

__attribute__((noinline)) int protected_frame() {
    try {
        middle();
    } catch (...) {
        avm_debug_putc('C');
        return 1;
    }
    return 0;
}

// The flag is volatile, so the optimizer keeps unrelated and its records in the
// image. The flag is 0 at run time, so unrelated returns without throwing.
volatile int unrelated_input = 0;

__attribute__((noinline)) int unrelated() {
    try {
        if (unrelated_input == 0)
            return 0;
        throw 9;
    } catch (...) {
        avm_debug_putc('U');
        return 1;
    }
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('T');
    unrelated();
    protected_frame();
    return 0;
}
