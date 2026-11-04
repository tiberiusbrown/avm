// dynamic_cast inside constructors and destructors, for the operands the standard defines. Each
// operand has the static type of the class being constructed or destroyed, or of one of its bases.
// The dynamic type is then the class in progress: a constructor of a base sees the base, and a
// destructor sees the class that it is destroying. The results are recorded inside each function
// body, and the test reads them after the object's lifetime.
#include <stdint.h>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

namespace {

struct CMid;
struct CDerived;
struct CSide;

// The results recorded by each function body.
bool base_ctor_no_mid = false;
bool base_dtor_no_mid = false;
bool mid_ctor_self = false;
bool mid_dtor_self = false;
bool side_ctor_no_derived = false;
bool derived_ctor_side = false;
bool derived_ctor_cross = false;
bool derived_dtor_side = false;

struct CBase {
    CBase();
    virtual ~CBase();
    int base_value;
};

struct CMid : CBase {
    CMid();
    virtual ~CMid();
    int mid_value;
};

struct CSide {
    CSide();
    virtual ~CSide();
    int side_value;
};

struct CDerived : CMid, CSide {
    CDerived();
    virtual ~CDerived();
    int derived_value;
};

// The base constructor sees the base as its dynamic type, so the most-derived class is not found.
CBase::CBase() : base_value(1) {
    CBase *self = this;
    base_ctor_no_mid = dynamic_cast<CMid *>(self) == nullptr;
}

// The base destructor runs last, when the dynamic type is the base again.
CBase::~CBase() {
    CBase *self = this;
    base_dtor_no_mid = dynamic_cast<CMid *>(self) == nullptr;
}

// Inside the middle constructor, the subobject's own class is the target, and it is found.
CMid::CMid() : CBase(), mid_value(2) {
    CBase *self = this;
    mid_ctor_self = dynamic_cast<CMid *>(self) == this;
}

CMid::~CMid() {
    CBase *self = this;
    mid_dtor_self = dynamic_cast<CMid *>(self) == this;
}

// The secondary base sees itself as its dynamic type, so the derived class is not found.
CSide::CSide() : side_value(3) {
    CSide *self = this;
    side_ctor_no_derived = dynamic_cast<CDerived *>(self) == nullptr;
}

CSide::~CSide() {}

// Once every base is built, the derived constructor's dynamic type is the derived class. A
// downcast from the secondary base reaches the complete object, and a cross-cast from the
// primary chain reaches the other base.
CDerived::CDerived() : CMid(), CSide(), derived_value(4) {
    CSide *side = this;
    CBase *base = this;
    derived_ctor_side = dynamic_cast<CDerived *>(side) == this;
    derived_ctor_cross = dynamic_cast<CSide *>(base) == side;
}

CDerived::~CDerived() {
    CSide *side = this;
    derived_dtor_side = dynamic_cast<CDerived *>(side) == this;
}

__attribute__((noinline)) int check_lifetime() {
    {
        CDerived object;
        CHECK(object.derived_value == 4);
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    if (check_lifetime() != 0)
        return 1;
    CHECK(base_ctor_no_mid);
    CHECK(base_dtor_no_mid);
    CHECK(mid_ctor_self);
    CHECK(mid_dtor_self);
    CHECK(side_ctor_no_derived);
    CHECK(derived_ctor_side);
    CHECK(derived_ctor_cross);
    CHECK(derived_dtor_side);

    test_puts("rtti-dynamic-cast-ctor=ok\n");
    return 0;
}
