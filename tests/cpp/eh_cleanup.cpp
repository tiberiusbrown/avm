// Stage 2 cleanup fixture. Automatic objects with destructors sit in frames that a
// throw crosses. Each cleanup landing pad runs its destructors and resumes with
// _Unwind_Resume, and the catch-all handler runs last. The eh_ prefix keeps the
// fixture out of the ordinary C++ matrix, and avm_eh_cleanup_run builds it with
// -fexceptions and selects it by name.
//
// Every destructor appends its tag to a log, so each scenario checks the exact
// order and count of destructions. Scenarios that must terminate instead live in
// their own fixtures, because a terminated program cannot report its results. A
// thrown class needs a typeinfo whose bitcode the LTO build cannot read back, so the
// exception-object scenario is in eh_cleanup_object.cpp, which has no LTO build.

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

// Destructors and the catch bodies append to this log in the order they run.
volatile int log_entries[16];
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

struct Guard {
    int tag;

    ~Guard() { log_append(tag); }
};

// Throws its value when it is nonzero, so the call never folds away.
__attribute__((noinline)) void throw_value(int value) {
    if (value)
        throw value;
}

// Returns its value, or throws it when it is nonzero, for use in an initializer.
__attribute__((noinline)) int throw_or_value(int value) {
    if (value)
        throw value;
    return value;
}

// A: a single cleanup. The frame that owns the object has no handler, so its
// landing pad only destroys the object and resumes unwinding.
__attribute__((noinline)) void single_frame(int value) {
    Guard g{1};
    throw_value(value);
}

__attribute__((noinline)) int single_cleanup() {
    log_reset();
    try {
        single_frame(1);
    } catch (...) {
        const int tags[] = {1};
        return log_is(1, tags) ? 1 : 0;
    }
    return 0;
}

// B: the demonstration in three frames. The throwing frame destroys its own
// object, then each caller destroys its object, and the outermost handler runs
// last. The destruction order is 3, 2, 1.
__attribute__((noinline)) void leaf() {
    Guard g3{3};
    throw 42;
}

__attribute__((noinline)) void middle() {
    Guard g2{2};
    leaf();
}

__attribute__((noinline)) void outer() {
    Guard g1{1};
    middle();
}

__attribute__((noinline)) int demonstration() {
    log_reset();
    try {
        outer();
    } catch (...) {
        const int tags[] = {3, 2, 1};
        return log_is(3, tags) ? 1 : 0;
    }
    return 0;
}

// D: several objects in one frame. They are destroyed in reverse construction
// order, and each exactly once.
__attribute__((noinline)) void several_frame(int value) {
    Guard a{21};
    Guard b{22};
    Guard c{23};
    throw_value(value);
}

__attribute__((noinline)) int several_objects() {
    log_reset();
    try {
        several_frame(1);
    } catch (...) {
        const int tags[] = {23, 22, 21};
        return log_is(3, tags) ? 1 : 0;
    }
    return 0;
}

// E: an object constructed on one branch only. Both branches throw, so only the
// object built on the first branch is destroyed.
__attribute__((noinline)) void conditional_frame(int which) {
    if (which) {
        Guard g{31};
        throw_value(which);
    } else {
        throw_value(which + 1);
    }
}

__attribute__((noinline)) int conditional_object(int which) {
    log_reset();
    try {
        conditional_frame(which);
    } catch (...) {
        return log_count == (which ? 1 : 0) && (!which || log_entries[0] == 31) ? 1 : 0;
    }
    return 0;
}

// F: partial construction. The base and the first member are complete when the
// second member's initializer throws. The constructor destroys the two completed
// subobjects in reverse order, and the object's own destructor never runs.
struct Base {
    int tag;

    ~Base() { log_append(tag); }
};

struct Partial : Base {
    Guard first;
    Guard second;

    __attribute__((noinline)) explicit Partial(int value)
        : Base{41}, first{42}, second{throw_or_value(value)} {}
};

__attribute__((noinline)) int partial_construction(int value) {
    log_reset();
    try {
        Partial p(value);
    } catch (...) {
        const int tags[] = {42, 41};
        return log_is(2, tags) ? 1 : 0;
    }
    return 0;
}

// G: nested scopes. The inner handler is the nearest, so the inner object is
// destroyed before it runs. The outer object is destroyed when the inner handler
// returns out of the outer try block.
__attribute__((noinline)) int nested_handlers(int value) {
    log_reset();
    try {
        Guard outer{61};
        try {
            Guard inner{62};
            throw_value(value);
        } catch (...) {
            log_append(63);
            return 1;
        }
    } catch (...) {
        return 2;
    }
    return 0;
}

// The outer handler is selected when the throw comes after the inner try block.
// Its object is destroyed before the handler body runs.
__attribute__((noinline)) int nested_outer(int value) {
    log_reset();
    try {
        Guard outer{64};
        try {
            log_append(65);
        } catch (...) {
            return 3;
        }
        throw_value(value);
    } catch (...) {
        return 4;
    }
    return 0;
}

// H: a combined landing pad. The always_inline helper puts its object's cleanup
// into the try block at -O0, and clang's landing pad then carries both the cleanup
// flag and the catch-all clause. The optimizer may fold the pad into a catch-only
// one, and that is the same destruction either way.
__attribute__((always_inline)) inline void combined_guarded_call(int value) {
    Guard g{81};
    throw_value(value);
}

__attribute__((noinline)) int combined_pad(int value) {
    log_reset();
    try {
        combined_guarded_call(value);
    } catch (...) {
        const int tags[] = {81};
        return log_is(1, tags) ? 1 : 0;
    }
    return 0;
}

// I: a long chain of cleanup-bearing frames. The innermost frame destroys its
// object first, and the outer frames destroy theirs in turn. The second frame
// owns two objects, so its pair is destroyed in reverse order.
__attribute__((noinline)) void chain_four(int value) {
    Guard g{104};
    throw_value(value);
}

__attribute__((noinline)) void chain_three(int value) {
    Guard g{103};
    chain_four(value);
}

__attribute__((noinline)) void chain_two(int value) {
    Guard a{102};
    Guard b{92};
    chain_three(value);
}

__attribute__((noinline)) int chain_cleanups(int value) {
    log_reset();
    try {
        chain_two(value);
    } catch (...) {
        const int tags[] = {104, 103, 92, 102};
        return log_is(4, tags) ? 1 : 0;
    }
    return 0;
}

// J: the same scopes without a throw run their ordinary destructors at the end
// of each block, with no resume and no handler.
__attribute__((noinline)) void normal_frame(int value) {
    Guard g{121};
    if (value > 100)
        throw_value(value);
}

__attribute__((noinline)) int normal_execution(int value) {
    log_reset();
    {
        Guard a{111};
        Guard b{112};
        if (value)
            log_append(113);
    }
    normal_frame(value);
    const int tags[] = {113, 112, 111, 121};
    return log_is(4, tags) ? 1 : 0;
}

// N: a cleanup reached from a call with stack arguments. The call passes eight
// 16-bit arguments, so its outgoing bytes are released by the landing pad. The
// destructor reads its own object through the frame, which holds only if the
// landing SP is correct.
__attribute__((noinline)) void eight_arguments(int a, int b, int c, int d, int e,
                                               int f, int g, int h) {
    if (a + b + c + d + e + f + g + h > 0)
        throw h;
}

__attribute__((noinline)) void stack_argument_frame(int seed) {
    Guard g{151};
    eight_arguments(seed, seed + 1, seed + 2, seed + 3, seed + 4, seed + 5,
                    seed + 6, seed + 7);
}

__attribute__((noinline)) int stack_argument_cleanup(int seed) {
    log_reset();
    try {
        stack_argument_frame(seed);
    } catch (...) {
        const int tags[] = {151};
        return log_is(1, tags) ? 1 : 0;
    }
    return 0;
}

// O: a dynamic-stack frame. The frame is r3-based because of the runtime-sized
// alloca, and its cleanup must see the allocation as it was written. The
// destructor checks each byte through a pointer that it holds.
struct Dynamic {
    volatile unsigned char *block;
    int count;
    int tag;

    ~Dynamic() {
        bool intact = true;
        for (int i = 0; i < count; ++i)
            if (block[i] != static_cast<unsigned char>(i * 5 + 1))
                intact = false;
        log_append(intact ? tag : tag + 100);
    }
};

volatile int dynamic_input = 12;

__attribute__((noinline)) void dynamic_frame(int count) {
    volatile unsigned char *buffer =
        static_cast<volatile unsigned char *>(__builtin_alloca(count));
    for (int i = 0; i < count; ++i)
        buffer[i] = static_cast<unsigned char>(i * 5 + 1);
    Dynamic d{buffer, count, 161};
    eight_arguments(count, 2, 3, 4, 5, 6, 7, 8);
}

__attribute__((noinline)) int dynamic_cleanup() {
    log_reset();
    const int count = dynamic_input;
    try {
        dynamic_frame(count);
    } catch (...) {
        const int tags[] = {161};
        return log_is(1, tags) ? 1 : 0;
    }
    return 0;
}

// A call with five arguments passes one of them on the stack, so its outgoing
// argument bytes are two. The landing pad must release exactly those bytes.
__attribute__((noinline)) void five_arguments(int a, int b, int c, int d, int e) {
    if (a + b + c + d + e > 0)
        throw e;
}

__attribute__((noinline)) void five_argument_frame(int seed) {
    Guard g{191};
    five_arguments(seed, seed + 1, seed + 2, seed + 3, seed + 4);
}

__attribute__((noinline)) int five_argument_cleanup(int seed) {
    log_reset();
    try {
        five_argument_frame(seed);
    } catch (...) {
        const int tags[] = {191};
        return log_is(1, tags) ? 1 : 0;
    }
    return 0;
}

// P: relaxed calls. near_throw sits next to its caller, so LLD shortens that
// call to call8. far_throw is separated from its caller by filler code, so its
// call stays call16. Each cleanup is entered through a relaxed call.
__attribute__((noinline)) void near_throw(int value) {
    throw_value(value);
}

__attribute__((noinline)) void near_frame(int value) {
    Guard g{171};
    near_throw(value);
}

__attribute__((noinline)) int near_relaxed(int value) {
    log_reset();
    try {
        near_frame(value);
    } catch (...) {
        const int tags[] = {171};
        return log_is(1, tags) ? 1 : 0;
    }
    return 0;
}

// far_frame calls the filler before it calls far_throw. Clang emits an internal
// function where it is first referenced, so the filler lands between the two, and
// the call from far_frame to far_throw is too long for call8 after linking.
__attribute__((noinline)) void far_throw(int value);

volatile int scratch_input[16];

__attribute__((noinline)) int filler(volatile int *scratch);

__attribute__((noinline)) void far_frame(int value) {
    Guard g{181};
    filler(scratch_input);
    far_throw(value);
}

// Filler between the caller and far_throw. Its volatile operations keep every
// instruction.
__attribute__((noinline)) int filler(volatile int *scratch) {
    scratch[0] = scratch[1] + 1;
    scratch[1] = scratch[2] + 2;
    scratch[2] = scratch[3] + 3;
    scratch[3] = scratch[4] + 4;
    scratch[4] = scratch[5] + 5;
    scratch[5] = scratch[6] + 6;
    scratch[6] = scratch[7] + 7;
    scratch[7] = scratch[8] + 8;
    scratch[8] = scratch[9] + 9;
    scratch[9] = scratch[10] + 10;
    scratch[10] = scratch[11] + 11;
    scratch[11] = scratch[12] + 12;
    scratch[12] = scratch[13] + 13;
    scratch[13] = scratch[14] + 14;
    scratch[14] = scratch[15] + 15;
    scratch[15] = scratch[0] + 16;
    scratch[0] = scratch[1] + 17;
    scratch[1] = scratch[2] + 18;
    scratch[2] = scratch[3] + 19;
    scratch[3] = scratch[4] + 20;
    scratch[4] = scratch[5] + 21;
    scratch[5] = scratch[6] + 22;
    scratch[6] = scratch[7] + 23;
    scratch[7] = scratch[8] + 24;
    scratch[8] = scratch[9] + 25;
    scratch[9] = scratch[10] + 26;
    scratch[10] = scratch[11] + 27;
    scratch[11] = scratch[12] + 28;
    scratch[12] = scratch[13] + 29;
    scratch[13] = scratch[14] + 30;
    scratch[14] = scratch[15] + 31;
    scratch[15] = scratch[0] + 32;
    scratch[0] = scratch[1] + 33;
    scratch[1] = scratch[2] + 34;
    scratch[2] = scratch[3] + 35;
    scratch[3] = scratch[4] + 36;
    scratch[4] = scratch[5] + 37;
    scratch[5] = scratch[6] + 38;
    scratch[6] = scratch[7] + 39;
    scratch[7] = scratch[8] + 40;
    scratch[8] = scratch[9] + 41;
    scratch[9] = scratch[10] + 42;
    scratch[10] = scratch[11] + 43;
    scratch[11] = scratch[12] + 44;
    scratch[12] = scratch[13] + 45;
    scratch[13] = scratch[14] + 46;
    scratch[14] = scratch[15] + 47;
    scratch[15] = scratch[0] + 48;
    return scratch[0];
}

__attribute__((noinline)) void far_throw(int value) {
    throw_value(value);
}

__attribute__((noinline)) int far_relaxed(int value) {
    log_reset();
    try {
        far_frame(value);
    } catch (...) {
        const int tags[] = {181};
        return log_is(1, tags) ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(demonstration() == 1);
    expect(single_cleanup() == 1);
    expect(several_objects() == 1);
    expect(conditional_object(1) == 1);
    expect(conditional_object(0) == 1);
    expect(partial_construction(7) == 1);
    expect(nested_handlers(5) == 1 && log_count == 3 && log_entries[2] == 61);
    expect(nested_outer(5) == 4 && log_count == 2 && log_entries[1] == 64);
    expect(combined_pad(9) == 1);
    expect(chain_cleanups(11) == 1);
    expect(normal_execution(1) == 1);
    expect(stack_argument_cleanup(1) == 1);
    expect(five_argument_cleanup(1) == 1);
    expect(dynamic_cleanup() == 1);
    expect(near_relaxed(13) == 1);
    expect(far_relaxed(17) == 1);
    return failures == 0 ? 0 : 1;
}
