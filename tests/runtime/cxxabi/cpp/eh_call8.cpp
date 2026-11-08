// Stage 1 call8 coverage. The throwing callee is defined before its caller, and
// the call sits near the start of the caller. The linker shortens a call to the
// two-byte call8 form when its target lies within an 8-bit displacement, so the
// throw crosses a relaxed call8. The call record must hold that call's return PC,
// and the handler in the same frame must resume with the call's SP.

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

__attribute__((noinline)) void throw_near(int value) {
    if (value > 0)
        throw value;
}

__attribute__((noinline)) int near_caller(int value) {
    try {
        throw_near(value);
    } catch (...) {
        return 1;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(near_caller(3) == 1);
    expect(near_caller(0) == 0);
    return failures == 0 ? 0 : 1;
}
