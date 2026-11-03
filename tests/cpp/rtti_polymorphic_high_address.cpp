#include <stdint.h>
#include <typeinfo>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

// The link places each class's vtable in .rodata at 0x10000 or above, so every vptr in
// this fixture exceeds 0xFFFF. The descriptors stay in the flash window, so each typeid
// must read the full 24-bit RTTI slot and find a descriptor below 0xFA00. A query
// through the secondary base reads the secondary vptr, which is also above 0xFFFF.
namespace {

struct HLeft {
    virtual ~HLeft() = default;
    virtual int left() const;
    int l;
};

int HLeft::left() const { return 2; }

struct HRight {
    virtual ~HRight() = default;
    virtual int right() const;
    int r;
};

int HRight::right() const { return 3; }

struct HDerived : HLeft, HRight {
    int d;
};

uint32_t vptr_of(const void *object) {
    const unsigned char *bytes = static_cast<const unsigned char *>(object);
    return (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}

} // namespace

extern "C" int avm_test_main(void) {
    HDerived derived;
    HLeft &left = derived;
    HRight &right = derived;
    CHECK(static_cast<void *>(&right) != static_cast<void *>(&derived));

    const uint32_t primary = vptr_of(&derived);
    const uint32_t secondary = vptr_of(&right);
    CHECK(primary > 0xffffu);
    CHECK(secondary > 0xffffu);
    CHECK(secondary != primary);

    CHECK(typeid(left) == typeid(HDerived));
    CHECK(&typeid(left) == &typeid(HDerived));
    CHECK(typeid(right) == typeid(HDerived));
    CHECK(&typeid(right) == &typeid(HDerived));
    CHECK(right.right() == 3);
    CHECK(left.left() == 2);

    test_puts("rtti-polymorphic-high=ok\n");
    return 0;
}
