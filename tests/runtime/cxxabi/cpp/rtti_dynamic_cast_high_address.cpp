// dynamic_cast with high-address vtables. The link places each vtable in .rodata at 0x10000 or
// above, so every vptr in this fixture exceeds 0xFFFF. The descriptors stay in the RTTI window.
// A cast from a secondary base reads the offset-to-top at the secondary vptr, and a cast through
// a virtual base reads its displacement from the high vtable.
#include <stdint.h>

#include "../../../codegen/c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

namespace {

struct HLeft {
    virtual ~HLeft() = default;
    virtual int left() const;
    int l_value;
};

int HLeft::left() const { return 2; }

struct HRight {
    virtual ~HRight() = default;
    virtual int right() const;
    int r_value;
};

int HRight::right() const { return 3; }

struct HDerived : HLeft, HRight {
    int d_value;
};

struct HV {
    virtual ~HV() = default;
    virtual int v() const;
    int v_value;
};

int HV::v() const { return 5; }

struct HL : virtual HV {
    virtual int lv() const;
    int lv_value;
};

int HL::lv() const { return 6; }

struct HR : virtual HV {
    virtual int rv() const;
    int rv_value;
};

int HR::rv() const { return 7; }

struct HD : HL, HR {
    int hd_value;
};

HDerived derived_object;
HD d_object;

uint32_t vptr_of(const void *object) {
    const unsigned char *bytes = static_cast<const unsigned char *>(object);
    return (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}

} // namespace

extern "C" int avm_test_main(void) {
    HRight *right = static_cast<HRight *>(&derived_object);
    HLeft *left = static_cast<HLeft *>(&derived_object);
    CHECK(static_cast<void *>(right) != static_cast<void *>(&derived_object));

    // Every vptr lies above 0xFFFF, and the secondary vptr differs from the primary one.
    CHECK(vptr_of(&derived_object) > 0xffffu);
    CHECK(vptr_of(right) > 0xffffu);
    CHECK(vptr_of(right) != vptr_of(&derived_object));

    // The secondary pointer reaches the complete object through its high vptr.
    CHECK(dynamic_cast<HDerived *>(right) == &derived_object);
    CHECK(dynamic_cast<void *>(right) == static_cast<void *>(&derived_object));
    CHECK(dynamic_cast<HLeft *>(right) == left);
    CHECK(dynamic_cast<HRight *>(left) == right);

    // A virtual base reaches the most-derived object, and a sibling is found across the
    // virtual base. The displacements come from the high vtables.
    HV *v = static_cast<HV *>(&d_object);
    CHECK(vptr_of(v) > 0xffffu);
    CHECK(dynamic_cast<HD *>(v) == &d_object);
    HL *hl = static_cast<HL *>(&d_object);
    CHECK(dynamic_cast<HR *>(hl) == static_cast<HR *>(&d_object));

    test_puts("rtti-dynamic-cast-high=ok\n");
    return 0;
}
