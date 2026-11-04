// dynamic_cast across translation units. The objects and their vtables come from the support
// unit, and the casts run here. Each result is compared with the address that the shared header's
// layout names, so the adjustment is the compiler's, not the runtime's. The support unit defines
// the key functions, so the class descriptors are unique, and each cast's identity depends on it.
#include <stdint.h>
#include <typeinfo>

#include "../c/test_hex_output.h"
#include "support/rtti_dynamic_cast.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

using namespace rtti_dc;

namespace {

// The descriptor that the support unit emits is the one this unit names.
__attribute__((noinline)) int check_identity() {
    Base *base = derived_as_base();
    CHECK(typeid(*base) == typeid(Derived));
    CHECK(&typeid(*base) == &typeid(Derived));
    return 0;
}

__attribute__((noinline)) int check_downcast() {
    Base *base = derived_as_base();
    CHECK(dynamic_cast<Derived *>(base) == derived_object());
    CHECK(dynamic_cast<void *>(base) == static_cast<void *>(derived_object()));
    return 0;
}

__attribute__((noinline)) int check_cross_cast() {
    Left *left = both_as_left();
    Both *both = both_object();
    CHECK(dynamic_cast<Right *>(left) == static_cast<Right *>(both));
    CHECK(dynamic_cast<Both *>(left) == both);

    Right *right = static_cast<Right *>(both);
    CHECK(dynamic_cast<Left *>(right) == static_cast<Left *>(both));
    return 0;
}

__attribute__((noinline)) int check_virtual_base() {
    V *v = d_as_v();
    CHECK(dynamic_cast<D *>(v) == d_object());
    L *l = d_as_l();
    CHECK(dynamic_cast<R *>(l) == static_cast<R *>(d_object()));
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    if (check_identity() != 0)
        return 1;
    if (check_downcast() != 0)
        return 1;
    if (check_cross_cast() != 0)
        return 1;
    if (check_virtual_base() != 0)
        return 1;

    test_puts("rtti-dynamic-cast-cross=ok\n");
    return 0;
}
