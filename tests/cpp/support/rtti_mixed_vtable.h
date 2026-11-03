#ifndef AVM_TEST_SUPPORT_RTTI_MIXED_VTABLE_H
#define AVM_TEST_SUPPORT_RTTI_MIXED_VTABLE_H

// The polymorphic class of the mixed-RTTI vtable fixtures. A unit that creates a Derived
// emits its vtable under that unit's RTTI flag, so the -fno-rtti copy and the -frtti copy
// are COMDAT definitions of the same symbol, and the link chooses one of them. The
// typeid caller lives in its own unit, so only that unit makes the helper live.

namespace std {
class type_info;
}

namespace rtti_mixed_vtable {

struct Base {
    virtual ~Base() = default;
    virtual int value() const { return 1; }
};

struct Derived : Base {
    int value() const override { return 2; }
};

// The -fno-rtti unit and the -frtti unit each own one object, reached through a base
// reference.
const Base &nortti_object();
const Base &rtti_object();

// Returns typeid(base) for a polymorphic object. Defined only in the typeid unit.
const std::type_info &dynamic_type(const Base &base);

} // namespace rtti_mixed_vtable

#endif
