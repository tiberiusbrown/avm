// The fixture evaluates side-effecting operands of polymorphic typeid on purpose, and
// Clang warns about exactly that. The warning is silenced for this file only.
#pragma clang diagnostic ignored "-Wpotentially-evaluated-expression"

#include <stdint.h>
#include <typeinfo>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

// This fixture is built with -frtti. Each polymorphic typeid below reads the vptr of
// the subobject it names, so the result is the complete object's dynamic type, found
// from the RTTI slot in program space. The static operand's type is not returned.
// Each property is checked in its own function, so the static stack bound is the
// largest of them rather than the sum of their locals at O0.
namespace {

// A. Base references and pointers, and the most-derived type.
struct Base {
    virtual ~Base() = default;
};

struct Derived : Base {};

// The callee is not inlined, so only the operand's static type is known at the call.
__attribute__((noinline)) const std::type_info &inspect(Base &value) {
    return typeid(value);
}

// D. An intermediate derived class. A is a separate root, so its helpers take A.
struct A {
    virtual ~A() = default;
};
struct B : A {};
struct C : B {};

__attribute__((noinline)) const std::type_info &inspect_a(A &value) {
    return typeid(value);
}

__attribute__((noinline)) const std::type_info &inspect_pointer(A *value) {
    return typeid(*value);
}

// E. A secondary polymorphic base at a nonzero offset, with its own vptr.
struct Left {
    virtual ~Left() = default;
    int left;
};

struct Right {
    virtual ~Right() = default;
    int right;
};

struct LeftRight : Left, Right {};

// F. A virtual diamond with a polymorphic shared base.
struct VBase {
    virtual ~VBase() = default;
    int vb;
};

struct VLeft : virtual VBase {
    int vl;
};

struct VRight : virtual VBase {
    int vr;
};

struct VDiamond : VLeft, VRight {
    int vd;
};

// G. A polymorphic base with a nonzero offset, which has a virtual base of its own.
struct GTail {
    virtual ~GTail() = default;
    int t;
};

struct GBase {
    virtual ~GBase() = default;
    int b;
};

struct GMiddle : virtual GBase {
    virtual ~GMiddle() = default;
    int m;
};

struct GDerived : GTail, GMiddle {
    int g;
};

// I. The operand is evaluated once when it is polymorphic.
__attribute__((noinline)) Base &counted_base(int *count, Base &value) {
    ++*count;
    return value;
}

// J. The operand of a nonpolymorphic typeid is not evaluated.
struct Plain {
    int p;
};

int plain_calls = 0;
Plain plain_object = {5};

// The operand is unevaluated, so this function is never called, and it is not emitted.
__attribute__((noinline, unused)) Plain &plain_reference() {
    ++plain_calls;
    return plain_object;
}

// Construction and destruction. Each constructor and destructor records the dynamic
// type that typeid(*this) reports, in the order the calls occur.
const std::type_info *seen[16];
unsigned seen_count = 0;

__attribute__((noinline)) void note(const std::type_info &type) {
    seen[seen_count++] = &type;
}

struct CBase {
    CBase() { note(typeid(*this)); }
    virtual ~CBase() { note(typeid(*this)); }
    virtual int value() const { return 1; }
};

struct CDerived : CBase {
    CDerived() { note(typeid(*this)); }
    ~CDerived() override { note(typeid(*this)); }
    int value() const override { return 2; }
};

// A secondary polymorphic base is constructed at a nonzero offset. Its constructor
// reads its own vptr, not the primary base's, so the note must name SRight.
struct SLeft {
    SLeft() { note(typeid(*this)); }
    virtual ~SLeft() { note(typeid(*this)); }
};

struct SRight {
    SRight() { note(typeid(*this)); }
    virtual ~SRight() { note(typeid(*this)); }
};

struct SBoth : SLeft, SRight {
    SBoth() { note(typeid(*this)); }
    ~SBoth() override { note(typeid(*this)); }
};

// A virtual base is constructed through the most-derived class's construction VTT,
// and each construction vtable names the class under construction.
struct VCBase {
    VCBase() { note(typeid(*this)); }
    virtual ~VCBase() { note(typeid(*this)); }
};

struct VCLeft : virtual VCBase {
    VCLeft() { note(typeid(*this)); }
    ~VCLeft() override { note(typeid(*this)); }
};

struct VCRight : virtual VCBase {
    VCRight() { note(typeid(*this)); }
    ~VCRight() override { note(typeid(*this)); }
};

struct VCTop : VCLeft, VCRight {
    VCTop() { note(typeid(*this)); }
    ~VCTop() override { note(typeid(*this)); }
};

// A constructor can use a noinline helper, which performs the lookup on the object
// it receives rather than on a compile-time-known expression.
struct HelperCtor {
    HelperCtor() { note(inspect_helper(*this)); }
    virtual ~HelperCtor() = default;
    __attribute__((noinline)) static const std::type_info &
    inspect_helper(const HelperCtor &value) {
        return typeid(value);
    }
};

struct HelperDerived : HelperCtor {};

// A. A reference to Base names the most-derived object. B. A nonnull Base pointer.
// C. The static type differs from the dynamic type.
__attribute__((noinline)) int check_base_references() {
    Derived derived;
    Base &base = derived;
    const std::type_info &t = typeid(base);
    CHECK(&t == &typeid(Derived));
    CHECK(t == typeid(Derived));

    Base *pointer = &derived;
    CHECK(typeid(*pointer) == typeid(Derived));
    CHECK(&typeid(*pointer) == &typeid(Derived));

    CHECK(typeid(Base) != typeid(Derived));
    CHECK(typeid(base) == typeid(Derived));
    CHECK(typeid(base) != typeid(Base));

    // Through a const reference, the top-level qualifier does not change the answer.
    const Base &const_base = derived;
    CHECK(typeid(const_base) == typeid(Derived));
    return 0;
}

// H. The result follows the object, not the static operand. Distinct derived types
// through one noinline function must give distinct results. D. An intermediate class.
__attribute__((noinline)) int check_dynamic_types() {
    Derived derived;
    C c_object;
    B b_object;
    A &a_of_c = c_object;
    A &a_of_b = b_object;
    Base &base = derived;
    CHECK(&inspect(base) == &typeid(Derived));
    CHECK(&inspect(derived) == &typeid(Derived));
    CHECK(&inspect_a(c_object) == &typeid(C));
    CHECK(&inspect_a(b_object) == &typeid(B));
    CHECK(&inspect_a(c_object) != &inspect_a(b_object));
    CHECK(&inspect_pointer(&c_object) == &typeid(C));
    CHECK(&typeid(a_of_c) == &typeid(C));
    CHECK(&typeid(a_of_b) == &typeid(B));
    CHECK(typeid(a_of_c) != typeid(B));
    return 0;
}

// E. A nonzero-offset secondary base. Its address differs from the complete object's,
// so its own vptr supplies the answer.
__attribute__((noinline)) int check_secondary_base() {
    LeftRight lr;
    Right &right = lr;
    CHECK(static_cast<void *>(&right) != static_cast<void *>(&lr));
    CHECK(typeid(right) == typeid(LeftRight));
    CHECK(&typeid(right) == &typeid(LeftRight));
    Left &left = lr;
    CHECK(typeid(left) == typeid(LeftRight));
    return 0;
}

// F. A virtual diamond, queried through the shared virtual base and both paths.
__attribute__((noinline)) int check_virtual_diamond() {
    VDiamond diamond;
    VBase &shared = diamond;
    VLeft &via_left = diamond;
    VRight &via_right = diamond;
    CHECK(typeid(shared) == typeid(VDiamond));
    CHECK(typeid(via_left) == typeid(VDiamond));
    CHECK(typeid(via_right) == typeid(VDiamond));
    CHECK(&typeid(shared) == &typeid(VDiamond));
    return 0;
}

// G. A polymorphic base with a nonzero offset, in a mixed virtual hierarchy.
__attribute__((noinline)) int check_mixed_virtual() {
    GDerived gd;
    GMiddle &middle = gd;
    GBase &gbase = gd;
    CHECK(static_cast<void *>(&middle) != static_cast<void *>(&gd));
    CHECK(typeid(middle) == typeid(GDerived));
    CHECK(typeid(gbase) == typeid(GDerived));
    CHECK(&typeid(middle) == &typeid(GDerived));
    return 0;
}

// I. A polymorphic operand is evaluated once. J. A nonpolymorphic operand is not.
// K. Static typeid is unchanged for statically known complete objects.
__attribute__((noinline)) int check_evaluation_and_static() {
    Derived derived;
    C c_object;
    int evaluations = 0;
    CHECK(&typeid(counted_base(&evaluations, derived)) == &typeid(Derived));
    CHECK(evaluations == 1);

    CHECK(plain_calls == 0);

    CHECK(&typeid(derived) == &typeid(Derived));
    CHECK(&typeid(c_object) == &typeid(C));
    return 0;
}

// Each constructor and destructor body notes the type that typeid reports. The notes
// are checked in the order the calls occur.
__attribute__((noinline)) int check_construction() {
    seen_count = 0;
    {
        CDerived object;
        CHECK(object.value() == 2);
    }
    CHECK(seen_count == 4);
    CHECK(seen[0] == &typeid(CBase));
    CHECK(seen[1] == &typeid(CDerived));
    CHECK(seen[2] == &typeid(CDerived));
    CHECK(seen[3] == &typeid(CBase));
    return 0;
}

__attribute__((noinline)) int check_secondary_construction() {
    seen_count = 0;
    {
        SBoth object;
        (void)object;
    }
    CHECK(seen_count == 6);
    CHECK(seen[0] == &typeid(SLeft));
    CHECK(seen[1] == &typeid(SRight));
    CHECK(seen[2] == &typeid(SBoth));
    CHECK(seen[3] == &typeid(SBoth));
    CHECK(seen[4] == &typeid(SRight));
    CHECK(seen[5] == &typeid(SLeft));
    return 0;
}

__attribute__((noinline)) int check_virtual_base_construction() {
    seen_count = 0;
    {
        VCTop object;
        (void)object;
    }
    CHECK(seen_count == 8);
    CHECK(seen[0] == &typeid(VCBase));
    CHECK(seen[1] == &typeid(VCLeft));
    CHECK(seen[2] == &typeid(VCRight));
    CHECK(seen[3] == &typeid(VCTop));
    CHECK(seen[4] == &typeid(VCTop));
    CHECK(seen[5] == &typeid(VCRight));
    CHECK(seen[6] == &typeid(VCLeft));
    CHECK(seen[7] == &typeid(VCBase));
    return 0;
}

__attribute__((noinline)) int check_helper_construction() {
    seen_count = 0;
    {
        HelperDerived object;
        (void)object;
    }
    CHECK(seen_count == 1);
    CHECK(seen[0] == &typeid(HelperCtor));
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    if (check_base_references() != 0)
        return 1;
    if (check_dynamic_types() != 0)
        return 1;
    if (check_secondary_base() != 0)
        return 1;
    if (check_virtual_diamond() != 0)
        return 1;
    if (check_mixed_virtual() != 0)
        return 1;
    if (check_evaluation_and_static() != 0)
        return 1;
    if (check_construction() != 0)
        return 1;
    if (check_secondary_construction() != 0)
        return 1;
    if (check_virtual_base_construction() != 0)
        return 1;
    if (check_helper_construction() != 0)
        return 1;

    test_puts("rtti-polymorphic=ok\n");
    return 0;
}
