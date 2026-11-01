// Target for the corrupted-metadata runs. The valid image prints TCP. The throw
// goes from leaf through middle into protected_frame, whose catch-all prints C.
// unrelated has its own catch-all, which prints U. It runs before the throw and
// never sees the exception, so a U in any corrupted run means a handler was
// entered in the wrong frame. The runner in tests/debug/eh_corruption_verify.py
// mutates the AVEH2 block of this image. A corrupted run must end cleanly with
// TCP or TH. TH is the halt report from avm_halt below.
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

// The count comes through a volatile, so middle keeps its dynamic allocation. That
// gives middle an r3-based CFA and a saved r3, which the corruption runs need. The
// allocation also stops the call from becoming a tail jump.
volatile unsigned count_input = 4;

__attribute__((noinline)) void leaf() {
    throw 5;
}

__attribute__((noinline)) void middle(unsigned count) {
    volatile unsigned char *block =
        static_cast<volatile unsigned char *>(__builtin_alloca(count));
    block[0] = 1;
    leaf();
}

__attribute__((noinline)) int protected_frame() {
    try {
        middle(count_input);
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
