// A pointer conversion whose qualification chain has nine levels, one more than the runtime walks.
// The thrown type is a chain of int pointers, and the catch is a chain of const pointers, so the
// types differ and the walk must descend the chain. Past eight levels the walk cannot prove the
// conversion, so the throw fails rather than match, and the handler is not run. The output is the
// halt report.
#include <avm.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);

// The runtime's halt spins, so the harness would wait for its time limit. Report the termination,
// then break, as the termination fixtures do.
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

namespace {

typedef int *P1;
typedef P1 *P2;
typedef P2 *P3;
typedef P3 *P4;
typedef P4 *P5;
typedef P5 *P6;
typedef P6 *P7;
typedef P7 *P8;
typedef P8 *P9;

// Every level of the catch type is const-qualified, so each level is a legal qualification of
// the thrown level, and the walk descends to the limit rather than failing on a level.
typedef int *const Q1;
typedef Q1 *const Q2;
typedef Q2 *const Q3;
typedef Q3 *const Q4;
typedef Q4 *const Q5;
typedef Q5 *const Q6;
typedef Q6 *const Q7;
typedef Q7 *const Q8;
typedef Q8 *const Q9;

__attribute__((noinline)) void throw_nine_levels(P9 value) {
    throw value;
}

__attribute__((noinline)) int catch_nine_levels(P9 value) {
    try {
        throw_nine_levels(value);
    } catch (Q9 q) {
        return q != nullptr ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    int leaf = 1;
    int *one = &leaf;
    P2 two = &one;
    P3 three = &two;
    P4 four = &three;
    P5 five = &four;
    P6 six = &five;
    P7 seven = &six;
    P8 eight = &seven;
    P9 nine = &eight;
    catch_nine_levels(nine);
    return 0;
}
