// dynamic_cast over complete-object hierarchies. Successful casts compare the result with
// the address that a static_cast or an object's address names, so the expected adjustment
// is computed by the compiler, never by the runtime's own algorithm. A failed pointer cast
// returns null.
#include <stdint.h>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

namespace {

struct Base {
    virtual ~Base() = default;
    int base_value = 0;
};

struct Derived : Base {
    int derived_value = 0;
};

struct Unrelated : Base {};

// Two polymorphic bases, so Both has a nonzero secondary-base adjustment.
struct Left {
    virtual ~Left() = default;
    int left_value = 0;
};

struct Right {
    virtual ~Right() = default;
    int right_value = 0;
};

struct Both : Left, Right {};

// A virtual base shared by two branches, and a derived class that uses both branches.
struct V {
    virtual ~V() = default;
    int v_value = 0;
};

struct L : virtual V {};
struct R : virtual V {};
struct D : L, R {};

// Repeated nonvirtual base X, one copy inside A and one inside B.
struct X {
    virtual ~X() = default;
    int x_value = 0;
};

struct A : X {};
struct B : X {};
struct RP : A, B {};

// C1 and C2 each hold an X, so CC holds two distinct X subobjects. Y is unrelated to X, and
// Mix derives from CC and Y. A Y pointer is cast to X at run time, so the two X subobjects
// make that cast ambiguous.
struct C1 : X {};
struct C2 : X {};
struct CC : C1, C2 {};
struct Y {
    virtual ~Y() = default;
    int y_value = 0;
};
struct Mix : CC, Y {};

// Two A subobjects, each of which holds the one shared virtual V.
struct SV {
    virtual ~SV() = default;
    int sv_value = 0;
};

struct SA : virtual SV {};
struct SB : SA {};
struct SC : SA {};
struct SD : SB, SC {};

// A private polymorphic base. A pointer to it is available only inside the class.
struct PL {
    virtual ~PL() = default;
    int pl_value = 0;
};

struct PR {
    virtual ~PR() = default;
    int pr_value = 0;
};

struct PrivateSource : private PL, public PR {
    PL *as_left() { return this; }
};

// A public and a private base, so one of the two is inaccessible from outside.
struct MixedAccess : Left, private Right {};

// A third base that does not derive from V, so a cast from it to V is a run-time cast. The two
// paths from DZ to the shared V are one subobject, so that cast is not ambiguous.
struct Z {
    virtual ~Z() = default;
    int z_value = 0;
};

struct DZ : L, R, Z {};

// PMid publicly contains Left, and PTop inherits PMid privately. A downcast to PMid still finds the
// subobject, because the candidate publicly contains the source.
struct PMid : Left {
    PMid *self() { return this; }
};

struct PTop : private PMid, Right {
    Left *as_left() { return static_cast<PMid *>(this); }
    PMid *as_mid() { return this; }
};

// A final class, which the optimizer may treat as an exact type at O2.
struct Final final : Base {};

Derived derived_object;
Unrelated unrelated_object;
Both both_object;
D d_object;
RP rp_object;
Mix mix_object;
SD sd_object;
PrivateSource private_source_object;
MixedAccess mixed_object;
Final final_object;
DZ dz_object;
PTop ptop_object;

// A. Downcasts from a base pointer and from a base reference.
__attribute__((noinline)) int check_downcast_pointer() {
    Base *b = &derived_object;
    CHECK(dynamic_cast<Derived *>(b) == &derived_object);
    CHECK(dynamic_cast<Derived *>(b) == static_cast<Derived *>(&derived_object));
    CHECK(dynamic_cast<Unrelated *>(b) == nullptr);

    // A base pointer to an object of another derived type is a failed cast.
    Base *u = &unrelated_object;
    CHECK(dynamic_cast<Derived *>(u) == nullptr);
    CHECK(dynamic_cast<Unrelated *>(u) == &unrelated_object);
    return 0;
}

__attribute__((noinline)) int check_downcast_reference() {
    Base &br = derived_object;
    Derived &dr = dynamic_cast<Derived &>(br);
    CHECK(&dr == &derived_object);
    return 0;
}

// B. A cast to void* yields the complete object for every subobject pointer.
__attribute__((noinline)) int check_void_complete_object() {
    Right *r = static_cast<Right *>(&both_object);
    Left *l = static_cast<Left *>(&both_object);
    CHECK(dynamic_cast<void *>(r) == static_cast<void *>(&both_object));
    CHECK(dynamic_cast<void *>(l) == static_cast<void *>(&both_object));
    const Right *cr = r;
    CHECK(dynamic_cast<const void *>(cr) == static_cast<const void *>(&both_object));
    return 0;
}

// C. Cross-casts between the two bases of a multiple-inheritance object.
__attribute__((noinline)) int check_multiple_inheritance() {
    Left *l = &both_object;
    Right *r_from_left = dynamic_cast<Right *>(l);
    CHECK(r_from_left == static_cast<Right *>(&both_object));
    CHECK(r_from_left != nullptr);

    Right *r = static_cast<Right *>(&both_object);
    Left *l_from_right = dynamic_cast<Left *>(r);
    CHECK(l_from_right == static_cast<Left *>(&both_object));
    return 0;
}

// D. A virtual base reaches the most-derived object, and a sibling branch is reached by a cast.
__attribute__((noinline)) int check_virtual_base() {
    V *v = static_cast<V *>(&d_object);
    CHECK(dynamic_cast<D *>(v) == &d_object);
    CHECK(dynamic_cast<L *>(v) == static_cast<L *>(&d_object));

    L *l = static_cast<L *>(&d_object);
    CHECK(dynamic_cast<R *>(l) == static_cast<R *>(&d_object));
    return 0;
}

// E. Repeated nonvirtual bases keep their identities. A copy of X in A and a copy in B are
// different subobjects, so a cast to X from A's pointer is ambiguous.
__attribute__((noinline)) int check_repeated_bases() {
    X *xa = static_cast<X *>(static_cast<A *>(&rp_object));
    X *xb = static_cast<X *>(static_cast<B *>(&rp_object));
    CHECK(xa != xb);
    CHECK(dynamic_cast<A *>(xa) == static_cast<A *>(&rp_object));
    CHECK(dynamic_cast<B *>(xb) == static_cast<B *>(&rp_object));
    CHECK(dynamic_cast<RP *>(xa) == &rp_object);
    CHECK(dynamic_cast<A *>(xb) == static_cast<A *>(&rp_object));

    // A is derived from X, and it has exactly one X subobject, so the compiler applies the cast
    // as an upcast. The result is that X subobject, which the runtime is not asked to choose.
    A *a = static_cast<A *>(&rp_object);
    CHECK(dynamic_cast<X *>(a) == static_cast<X *>(a));
    return 0;
}

// E2. A cast from an unrelated polymorphic base is a run-time cast. Two X subobjects make the
// cast to X ambiguous, while the unique CC is found, and an X subobject selects its own C2.
__attribute__((noinline)) int check_runtime_repeated_bases() {
    Mix *mix = &mix_object;
    Y *y = static_cast<Y *>(mix);
    CHECK(dynamic_cast<X *>(y) == nullptr);
    CHECK(dynamic_cast<CC *>(y) == static_cast<CC *>(mix));

    X *x1 = static_cast<X *>(static_cast<C1 *>(mix));
    CHECK(dynamic_cast<C2 *>(x1) == static_cast<C2 *>(mix));
    CHECK(dynamic_cast<C1 *>(x1) == static_cast<C1 *>(mix));
    return 0;
}

// F. Two destination subobjects share one virtual source, so the downcast is ambiguous.
__attribute__((noinline)) int check_shared_virtual_ambiguous() {
    SV *shared = static_cast<SV *>(static_cast<SA *>(static_cast<SB *>(&sd_object)));
    CHECK(dynamic_cast<SA *>(shared) == nullptr);
    CHECK(dynamic_cast<SD *>(shared) == &sd_object);
    return 0;
}

// G. A private base is not a valid source for a cross-cast.
__attribute__((noinline)) int check_private_source() {
    PL *pl = private_source_object.as_left();
    CHECK(dynamic_cast<PR *>(pl) == nullptr);
    return 0;
}

// H. An inaccessible target is not returned.
__attribute__((noinline)) int check_inaccessible_target() {
    Left *l = static_cast<Left *>(&mixed_object);
    CHECK(dynamic_cast<Right *>(l) == nullptr);
    return 0;
}

// I. Null sources yield null for every cast kind.
__attribute__((noinline)) int check_null_source() {
    Base *none = nullptr;
    CHECK(dynamic_cast<Derived *>(none) == nullptr);
    CHECK(dynamic_cast<void *>(none) == nullptr);
    return 0;
}

// J. A cast to an effectively final class returns the object when the dynamic type matches.
__attribute__((noinline)) int check_final_class() {
    Base *b = &final_object;
    CHECK(dynamic_cast<Final *>(b) == &final_object);
    CHECK(dynamic_cast<Derived *>(b) == nullptr);
    return 0;
}

// K. Two paths to one virtual base are one subobject. The cast from Z is a cross-cast, and the
// two paths reach the same V, so the result is that V and not an ambiguous null.
__attribute__((noinline)) int check_virtual_diamond() {
    Z *z = static_cast<Z *>(&dz_object);
    CHECK(dynamic_cast<V *>(z) == static_cast<V *>(&dz_object));
    return 0;
}

// L. A const-qualified cross-cast gives the same adjusted subobject.
__attribute__((noinline)) int check_const_cross() {
    const Right *right = static_cast<const Right *>(&both_object);
    CHECK(dynamic_cast<const Left *>(right) == static_cast<const Left *>(&both_object));
    return 0;
}

// M. A downcast to a class that the complete object inherits privately finds the subobject,
// because the candidate publicly contains the source.
__attribute__((noinline)) int check_private_candidate() {
    Left *left = ptop_object.as_left();
    CHECK(dynamic_cast<PMid *>(left) == ptop_object.as_mid());
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    if (check_downcast_pointer() != 0)
        return 1;
    if (check_downcast_reference() != 0)
        return 1;
    if (check_void_complete_object() != 0)
        return 1;
    if (check_multiple_inheritance() != 0)
        return 1;
    if (check_virtual_base() != 0)
        return 1;
    if (check_repeated_bases() != 0)
        return 1;
    if (check_runtime_repeated_bases() != 0)
        return 1;
    if (check_shared_virtual_ambiguous() != 0)
        return 1;
    if (check_private_source() != 0)
        return 1;
    if (check_inaccessible_target() != 0)
        return 1;
    if (check_null_source() != 0)
        return 1;
    if (check_final_class() != 0)
        return 1;
    if (check_virtual_diamond() != 0)
        return 1;
    if (check_const_cross() != 0)
        return 1;
    if (check_private_candidate() != 0)
        return 1;

    test_puts("rtti-dynamic-cast=ok\n");
    return 0;
}
