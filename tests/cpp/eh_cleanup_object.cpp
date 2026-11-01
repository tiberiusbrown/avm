// Exception-object lifetime. The thrown class has a destructor that records an
// event, and the throw crosses a cleanup frame. The cleanup runs during unwinding,
// the catch body runs next, and the thrown object is destroyed once, when the catch
// ends. The eh_ prefix keeps the fixture in the exception matrix, and it is built
// at O0 and O2 only. The class's typeinfo is the one that the LTO build cannot read
// back, which is why eh_cleanup holds the other cleanup scenarios.

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

struct Guard {
    int tag;

    ~Guard() { log_append(tag); }
};

struct Thrown {
    int tag;

    ~Thrown() { log_append(tag); }
};

__attribute__((noinline)) void lifetime_frame() {
    Guard g{91};
    throw Thrown{92};
}

__attribute__((noinline)) int exception_lifetime() {
    log_count = 0;
    try {
        lifetime_frame();
    } catch (...) {
        log_append(93);
    }
    // The cleanup, the catch body, and then the thrown object's destruction.
    return log_count == 3 && log_entries[0] == 91 && log_entries[1] == 93 &&
                   log_entries[2] == 92
               ? 1
               : 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(exception_lifetime() == 1);
    return failures == 0 ? 0 : 1;
}
