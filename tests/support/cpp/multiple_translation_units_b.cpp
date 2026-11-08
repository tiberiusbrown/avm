#include "multiple_translation_units.h"

static int call_count;

__attribute__((noinline)) int MultiDerived::step(int input) const {
    ++call_count;
    return multi_helper(input) + 2;
}

int multi_call_count() { return call_count; }
