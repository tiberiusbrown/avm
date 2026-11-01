// Types that the RTTI identity fixture throws from two translation units. Shared
// has an inline destructor, so each unit that throws it emits the same descriptor
// as a linkonce_odr definition, and the linker must keep exactly one. Distinct has
// the same layout but a different name, so it must keep its own descriptor.
#ifndef AVM_TESTS_EH_RTTI_IDENTITY_H
#define AVM_TESTS_EH_RTTI_IDENTITY_H

// Defined by the main unit, which owns the log that the destructors write.
void eh_identity_append(int tag);

struct Shared {
    int tag;
    Shared(int t) : tag(t) {}
    ~Shared() { eh_identity_append(tag); }
};

struct Distinct {
    int tag;
    Distinct(int t) : tag(t) {}
    ~Distinct() { eh_identity_append(tag); }
};

// Defined by the second unit. It throws Shared and has no handler of its own.
void eh_identity_throw_shared(int tag);

#endif // AVM_TESTS_EH_RTTI_IDENTITY_H
