#ifndef AVM_TEST_SUPPORT_RTTI_POLYMORPHIC_H
#define AVM_TEST_SUPPORT_RTTI_POLYMORPHIC_H

// Classes shared by the cross-unit polymorphic typeid fixture. A class with a key
// function has its vtable and descriptor emitted only in the unit that defines that
// function. The inline classes have their vtables and descriptors emitted in each
// unit that uses them, so those descriptors must merge into one.
namespace rtti_poly {

struct Shared {
    virtual ~Shared();
    virtual int value() const;
};

struct SharedDerived : Shared {
    ~SharedDerived() override;
    int value() const override;
};

struct Inline {
    virtual ~Inline() = default;
    int tag = 0;
};

struct InlineDerived : Inline {
    int extra = 0;
};

// The unit owns each object. The caller sees it only through a base reference.
Shared &make_shared_derived();
const Inline &make_inline_derived();

} // namespace rtti_poly

#endif
