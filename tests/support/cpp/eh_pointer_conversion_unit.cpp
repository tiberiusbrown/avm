// The unit side of eh_pointer_cross_unit.cpp. It owns the object and throws a pointer to it,
// so the exception is caught in another translation unit by a converted pointer.
#include "eh_pointer_conversion.h"

namespace {

PDerived unit_object{{1}, {2}, 3};

} // namespace

__attribute__((noinline)) void eh_pointer_throw_derived() {
    throw &unit_object;
}

void *eh_pointer_object_address() {
    return &unit_object;
}
