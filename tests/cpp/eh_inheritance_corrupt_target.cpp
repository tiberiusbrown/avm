// The target of the RTTI corruption verifier. The image runs unchanged, and then with
// single RTTI fields patched. Each patch must end the throw without running the
// handler. The normal output is P. A failed throw reports H, as the termination
// fixtures do, so the override below prints it and breaks.
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

struct Left {
    int left;
    Left(int v) : left(v) {}
};

struct Right {
    int right;
    Right(int v) : right(v) {}
};

struct Pair : Left, Right {
    int derived;
    Pair(int l, int r, int d) : Left(l), Right(r), derived(d) {}
};

__attribute__((noinline)) void throw_pair() {
    throw Pair(11, 22, 33);
}

__attribute__((noinline)) int catch_right() {
    try {
        throw_pair();
    } catch (Right &value) {
        return value.right == 22 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    return catch_right() == 1 ? 0 : 1;
}
