// Exact typed matching with descriptors above program address 0xFFFF. The image
// places .rodata above the 16-bit range, and the descriptors of Far and of the
// fundamental types live there. Each catch compares the full 24-bit address, so a
// lost high byte would match the wrong clause or none at all. The distractor
// catches come first, so a match must be the exact one.
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
    Far(int t) : tag(t) {}
    ~Far() { log_append(tag); }
};

struct Near {
    int tag;
};

__attribute__((noinline)) int throw_far_exact(int tag) {
    log_count = 0;
    try {
        Far value{tag};
        throw value;
    } catch (Near &) {
        return 1;
    } catch (const Far &caught) {
        log_append(90);
        return caught.tag == tag ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int throw_int_exact() {
    try {
        throw 1234;
    } catch (char) {
        return 1;
    } catch (int v) {
        return v == 1234 ? 2 : 3;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(throw_far_exact(7) == 2);
    // The destructor of the local runs during unwinding, the catch body logs 90,
    // and the exception object is destroyed when the catch ends.
    expect(log_count == 3 && log_entries[0] == 7 && log_entries[1] == 90 &&
           log_entries[2] == 7);
    expect(throw_int_exact() == 2);
    return failures == 0 ? 0 : 1;
}
