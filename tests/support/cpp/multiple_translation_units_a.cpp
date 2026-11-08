#include "multiple_translation_units.h"

MultiBase::~MultiBase() = default;

__attribute__((noinline)) int multi_helper(int input) {
    return input * 3 + 1;
}

__attribute__((noinline)) int multi_dispatch(MultiBase* object, int input) {
    return object->step(input);
}
