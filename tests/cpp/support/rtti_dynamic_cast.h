// The class hierarchy shared by the cross-unit dynamic_cast fixture and its support unit.
// Each class's key function is defined in rtti_dynamic_cast_unit.cpp, so every vtable and
// class descriptor is emitted there, and the fixture reaches the objects through the functions
// declared below.
#ifndef AVM_TEST_RTTI_DYNAMIC_CAST_H
#define AVM_TEST_RTTI_DYNAMIC_CAST_H

namespace rtti_dc {

struct Base {
    virtual ~Base();
    int base_value;
};

struct Derived : Base {
    int derived_value;
};

struct Left {
    virtual ~Left();
    int left_value;
};

struct Right {
    virtual ~Right();
    int right_value;
};

struct Both : Left, Right {};

struct V {
    virtual ~V();
    int v_value;
};

struct L : virtual V {
    virtual ~L();
};

struct R : virtual V {
    virtual ~R();
};

struct D : L, R {};

// The objects live in the support unit. Each function returns the address of one of them.
Base *derived_as_base();
Derived *derived_object();
Both *both_object();
Left *both_as_left();
D *d_object();
V *d_as_v();
L *d_as_l();

} // namespace rtti_dc

#endif // AVM_TEST_RTTI_DYNAMIC_CAST_H
