// Stage 1 landing-pad regression for a frame whose CFA is r3-based. The handler
// frame has a live dynamic allocation, and each throwing call passes stack
// arguments. The landing pad must resume with the allocation intact and with
// the throwing call's outgoing argument bytes released exactly once.
//
// The two routes throw from calls with different outgoing argument sizes that
// share one catch-all handler. The inputs come through volatile objects so the
// compiler cannot fold the allocation size or the route.

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

volatile unsigned count_input = 24;
volatile int route_input = 1;
volatile int seed_input = 1;

// Eight arguments put four 16-bit values on the stack, so the call needs eight
// outgoing argument bytes. The arguments come from a volatile seed, so the
// compiler keeps them as stack arguments instead of folding the call away. The
// sum is positive for every seed the test passes, so the call always throws.
__attribute__((noinline)) void throw_eight(int a, int b, int c, int d, int e,
                                           int f, int g, int h) {
    if (a + b + c + d + e + f + g + h > 0)
        throw h;
}

// Five arguments put one 16-bit value on the stack, so the call needs two
// outgoing argument bytes.
__attribute__((noinline)) void throw_five(int a, int b, int c, int d, int e) {
    if (a + b + c + d + e > 0)
        throw e;
}

// The try region holds two throwing calls with different outgoing argument
// sizes. Both are covered by the same catch-all handler, which must release
// only the bytes of the call that actually threw.
__attribute__((noinline)) int dynamic_handler(unsigned count, int route) {
    volatile int sentinel = 0x3c3c;
    volatile unsigned char *block =
        static_cast<volatile unsigned char *>(__builtin_alloca(count));
    for (unsigned i = 0; i < count; ++i)
        block[i] = static_cast<unsigned char>(i * 5 + 1);

    int const seed = seed_input;
    try {
        if (route)
            throw_eight(seed, seed + 1, seed + 2, seed + 3, seed + 4, seed + 5,
                        seed + 6, seed + 7);
        else
            throw_five(seed, seed + 1, seed + 2, seed + 3, seed + 4);
    } catch (...) {
        for (unsigned i = 0; i < count; ++i)
            if (block[i] != static_cast<unsigned char>(i * 5 + 1))
                return 1;
        return sentinel == 0x3c3c ? 0 : 2;
    }
    return 3;
}

} // namespace

extern "C" int avm_test_main(void) {
    unsigned const count = count_input;
    int const route = route_input;

    expect(dynamic_handler(count, route) == 0);
    expect(dynamic_handler(count, 1 - route) == 0);
    expect(dynamic_handler(1, route) == 0);
    expect(dynamic_handler(13, 1 - route) == 0);
    return failures == 0 ? 0 : 1;
}
