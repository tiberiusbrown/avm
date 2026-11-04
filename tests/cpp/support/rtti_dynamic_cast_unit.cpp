// The support unit for the cross-unit dynamic_cast fixture. The key functions of the shared
// hierarchy are defined here, so the vtables and class descriptors are emitted once, in this
// object, and the fixture's own object links to them.
#include "rtti_dynamic_cast.h"

namespace rtti_dc {

Base::~Base() = default;
Left::~Left() = default;
Right::~Right() = default;
V::~V() = default;
L::~L() = default;
R::~R() = default;

namespace {

Derived unit_derived;
Both unit_both;
D unit_d;

} // namespace

Base *derived_as_base() { return &unit_derived; }
Derived *derived_object() { return &unit_derived; }
Both *both_object() { return &unit_both; }
Left *both_as_left() { return &unit_both; }
D *d_object() { return &unit_d; }
V *d_as_v() { return &unit_d; }
L *d_as_l() { return &unit_d; }

} // namespace rtti_dc
