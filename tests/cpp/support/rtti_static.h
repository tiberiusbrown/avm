#ifndef AVM_TEST_RTTI_STATIC_H
#define AVM_TEST_RTTI_STATIC_H

#include <typeinfo>

// Both translation units that include this header define these types, so each
// descriptor is an inline-linkage object that the linker must keep only once.
struct SharedAlpha {
    int value;
};

struct SharedBeta : SharedAlpha {};

// A class with a key function has one descriptor, which the unit that defines the
// key function emits. The other units only refer to it.
struct SharedKeyed {
    virtual int value() const;
};

// The second translation unit returns its own static typeid of each type.
const std::type_info &unit_b_alpha();
const std::type_info &unit_b_beta();
const std::type_info &unit_b_keyed();

#endif
