// Types and entry points shared by eh_pointer_cross_unit.cpp and its unit. The derived class is
// defined here, so both translation units name the same descriptors, and only the unit throws
// the pointer. Right lies at a nonzero offset, so the converted pointer is adjusted.
#ifndef EH_POINTER_CONVERSION_H
#define EH_POINTER_CONVERSION_H

struct PBase {
    int base;
};

struct PRight {
    int right;
};

struct PDerived : PBase, PRight {
    int derived;
};

// Throws a pointer to the unit's object of type PDerived. The unit owns the object.
void eh_pointer_throw_derived();

// Returns the address of the unit's object, so the caller can compare its converted pointers.
void *eh_pointer_object_address();

#endif
