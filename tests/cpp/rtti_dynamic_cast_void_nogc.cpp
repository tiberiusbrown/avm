// dynamic_cast<void *> in a program without RTTI. The fixture is compiled with -fno-rtti and
// -fno-exceptions, so no class descriptor is emitted, and each polymorphic vtable keeps a null
// RTTI entry. A cast to void* needs only the offset-to-top, so the image must link without
// __dynamic_cast, without the RTTI hierarchy, and without the mixed-RTTI check. The
// verifier links it both with and without section garbage collection.
#include <stdint.h>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

namespace {

struct Left {
    virtual ~Left() = default;
    int left_value;
};

struct Right {
    virtual ~Right() = default;
    int right_value;
};

struct Both : Left, Right {};

Both both_object;

// Each cast is a noinline function, and it receives its operand through a volatile pointer, so
// the optimizer cannot fold the result into a constant.
__attribute__((noinline)) void *primary_to_void(Left *left) {
    return dynamic_cast<void *>(left);
}

__attribute__((noinline)) void *secondary_to_void(Right *right) {
    return dynamic_cast<void *>(right);
}

__attribute__((noinline)) const void *const_secondary_to_void(const Right *right) {
    return dynamic_cast<const void *>(right);
}

__attribute__((noinline)) void *null_to_void(Right *right) {
    return dynamic_cast<void *>(right);
}

} // namespace

extern "C" int avm_test_main(void) {
    // The compiler-generated base adjustment gives a secondary-base pointer, and the primary base
    // needs no adjustment. Both must yield the complete object.
    Left *volatile primary = &both_object;
    Right *volatile secondary = &both_object;
    const Right *volatile const_secondary = &both_object;
    Right *volatile none = nullptr;

    void *complete = &both_object;
    CHECK(primary_to_void(primary) == complete);
    CHECK(secondary_to_void(secondary) == complete);
    CHECK(const_secondary_to_void(const_secondary) == complete);
    CHECK(null_to_void(none) == nullptr);

    // The secondary pointer lies past the primary base, so it differs from the complete object.
    CHECK(static_cast<void *>(static_cast<Right *>(&both_object)) != complete);

    test_puts("rtti-dynamic-cast-void-nogc=ok\n");
    return 0;
}
