// The walk holds eight descriptor levels. Nine levels of single inheritance put the
// base at level nine, which the walk cannot reach. A walk past its depth cannot prove
// that the base is unique, so the throw fails rather than match, and the handler is
// not run. The output is the U marker, then the halt report.
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

struct L0 { int v; };
struct L1 : L0 {};
struct L2 : L1 {};
struct L3 : L2 {};
struct L4 : L3 {};
struct L5 : L4 {};
struct L6 : L5 {};
struct L7 : L6 {};
struct L8 : L7 {};

__attribute__((noinline)) void throw_nine_levels() {
    L8 thrown;
    thrown.v = 3;
    throw thrown;
}

__attribute__((noinline)) int catch_base_nine_down() {
    try {
        throw_nine_levels();
    } catch (L0 &base) {
        return base.v == 3 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('U');
    catch_base_nine_down();
    avm_debug_putc('X');
    return 0;
}
