// Cleanup and lifetime around a rethrow. Every destructor and handler appends a tag to
// a log, so each scenario checks the exact order. The original exception has a
// destructor, which runs once, after the last handler ends. A catch-by-value parameter
// is a separate copy, and its destructor is not the exception's destructor.
extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

volatile int log_entries[24];
volatile int log_count;

__attribute__((always_inline)) inline void log_reset() { log_count = 0; }

__attribute__((always_inline)) inline void log_append(int tag) {
    log_entries[log_count] = tag;
    log_count = log_count + 1;
}

// True when the log holds exactly the count tags that follow.
bool log_is(int count, const int *tags) {
    if (log_count != count)
        return false;
    for (int i = 0; i < count; ++i)
        if (log_entries[i] != tags[i])
            return false;
    return true;
}

// Logs its tag when it is destroyed. Automatic objects of this type are cleanup frames.
struct Guard {
    int tag;
    explicit Guard(int t) : tag(t) {}
    ~Guard() { log_append(tag); }
};

// The thrown object. A copy is marked, so its destructor logs 61 and the exception's
// destructor logs 90. The copy constructor logs 50, which makes a by-value catch visible.
struct Tracked {
    int value;
    bool copy;
    explicit Tracked(int v) : value(v), copy(false) {}
    Tracked(const Tracked &other) : value(other.value), copy(true) { log_append(50); }
    ~Tracked() { log_append(copy ? 61 : 90); }
};

// A thrown class without a destructor. Its header carries no destructor, so the release
// and the final end of catch only free the object.
struct Plain {
    int value;
};

// S1: the exact sequence from the spec. The first handler owns a cleanup object, throws
// the exception again, and the cleanup object dies before the second handler runs. The
// exception dies after the second handler ends.
__attribute__((noinline)) int ordered_sequence() {
    try {
        try {
            throw Tracked(1);
        } catch (const Tracked &first) {
            Guard cleanup(10);
            log_append(20);
            (void)first;
            throw;
        }
    } catch (const Tracked &second) {
        log_append(30);
        return second.value == 1 ? 1 : 0;
    }
    return 0;
}

// S2: several cleanup frames between the handlers. The rethrow comes from a helper that
// its caller reaches through a second frame. Each frame's destructor runs once, inner
// before outer, and the caller's handler is entered only after all of them.
__attribute__((noinline)) void deep_rethrow() {
    Guard inner(21);
    throw;
}

__attribute__((noinline)) void middle_frame() {
    Guard outer(22);
    deep_rethrow();
}

__attribute__((noinline)) int several_frames() {
    try {
        try {
            throw Tracked(2);
        } catch (const Tracked &) {
            Guard catch_guard(23);
            middle_frame();
        }
    } catch (const Tracked &second) {
        log_append(31);
        return second.value == 2 ? 1 : 0;
    }
    return 0;
}

// S3: a catch by value. The by-value copy is destroyed when the rethrow unwinds its catch
// body, and the original exception is still alive then. The handler that follows sees the
// original value.
__attribute__((noinline)) int by_value_rethrow() {
    try {
        try {
            throw Tracked(3);
        } catch (Tracked copy) {
            if (copy.value != 3)
                return 0;
            throw;
        }
    } catch (const Tracked &second) {
        log_append(32);
        return second.value == 3 ? 1 : 0;
    }
    return 0;
}

// S6: the second handler takes the exception by value. The copy is made after the release,
// from the object that the rethrow kept, and its destructor runs at the end of the handler,
// before the exception is destroyed.
__attribute__((noinline)) int by_value_second() {
    try {
        try {
            throw Tracked(6);
        } catch (const Tracked &) {
            throw;
        }
    } catch (Tracked copy) {
        log_append(35);
        return copy.value == 6 ? 1 : 0;
    }
    return 0;
}

// S4: a thrown object without a destructor, rethrown through a catch-all handler. The
// catch-all rethrows, and the typed handler sees the object.
__attribute__((noinline)) int plain_catch_all_rethrow() {
    try {
        try {
            throw Plain{4};
        } catch (...) {
            Guard guard(24);
            throw;
        }
    } catch (const Plain &p) {
        log_append(33);
        return p.value == 4 ? 1 : 0;
    }
    return 0;
}

// S5: a rethrow whose second handler is catch-all, after a catch-by-reference handler.
__attribute__((noinline)) int catch_all_second() {
    try {
        try {
            throw Tracked(5);
        } catch (const Tracked &) {
            throw;
        }
    } catch (...) {
        log_append(34);
        return 1;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    static const int ordered[] = {20, 10, 30, 90};
    log_reset();
    expect(ordered_sequence() == 1);
    expect(log_is(4, ordered));

    // The innermost frame unwinds first: deep_rethrow, middle_frame, then the catch body.
    static const int frames[] = {21, 22, 23, 31, 90};
    log_reset();
    expect(several_frames() == 1);
    expect(log_is(5, frames));

    // The by-value copy is made at the catch, and its destructor runs during the rethrow,
    // before the second handler. The exception is destroyed after the second handler.
    static const int by_value[] = {50, 61, 32, 90};
    log_reset();
    expect(by_value_rethrow() == 1);
    expect(log_is(4, by_value));

    // The copy is made after the release, and its destructor runs before the exception's.
    static const int by_value_after[] = {50, 35, 61, 90};
    log_reset();
    expect(by_value_second() == 1);
    expect(log_is(4, by_value_after));

    static const int plain[] = {24, 33};
    log_reset();
    expect(plain_catch_all_rethrow() == 1);
    expect(log_is(2, plain));

    // The catch-all handler logs first, and the exception dies when it ends.
    static const int all[] = {34, 90};
    log_reset();
    expect(catch_all_second() == 1);
    expect(log_is(2, all));

    return failures == 0 ? 0 : 1;
}
