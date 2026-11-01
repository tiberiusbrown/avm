// Exception header fields above program address 0xFFFF. The thrown class has a
// nontrivial destructor that the linker places above the 16-bit data-address
// range, and its descriptor lies in the upper part of program flash. The header
// stores the destructor and the descriptor as 24-bit program addresses. Losing
// the high byte of either would send the destructor to the wrong address, so the
// destructor must run for this test to pass. The descriptor's high byte is checked
// by tests/debug/eh_rtti_verify.py, which reads the captured header.

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

volatile int log_entries[4];
volatile int log_count;

__attribute__((always_inline)) inline void log_append(int tag) {
    log_entries[log_count] = tag;
    log_count = log_count + 1;
}

struct Far {
    int tag;
    ~Far();
};

// The linker places this destructor above 0xFFFF.
__attribute__((noinline, section(".high_far_text"))) Far::~Far() {
    log_append(tag);
}

__attribute__((noinline)) int throw_far(int tag) {
    log_count = 0;
    try {
        Far value{tag};
        throw value;
    } catch (...) {
        log_append(90);
    }
    return log_count == 3 && log_entries[0] == tag && log_entries[1] == 90 &&
                   log_entries[2] == tag
               ? 1
               : 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(throw_far(7) == 1);
    return failures == 0 ? 0 : 1;
}
