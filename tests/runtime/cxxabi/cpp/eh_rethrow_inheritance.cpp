// Rethrow with inheritance and pointer conversions. The second handler matches the
// original thrown type, so each rethrow recomputes the base subobject or the converted
// pointer that its own handler receives. The thrown object is never moved. Identity is
// checked through static_cast back to the complete object, so no offset is assumed.
#include <cstddef>

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

// Single nonvirtual inheritance.
struct NA {
    int a;
    explicit NA(int v) : a(v) {}
    virtual ~NA() {}
};

struct NB : NA {
    int b;
    NB(int av, int bv) : NA(av), b(bv) {}
};

// Multiple inheritance. MB is a secondary base, so its subobject lies at a nonzero offset.
struct MA {
    int ma;
    explicit MA(int v) : ma(v) {}
    virtual ~MA() {}
};

struct MB {
    int mb;
    explicit MB(int v) : mb(v) {}
    virtual ~MB() {}
};

struct MD : MA, MB {
    int md;
    MD(int a, int b, int d) : MA(a), MB(b), md(d) {}
};

// Virtual inheritance. VBase is shared by both paths, and its offset comes from the
// vptr of the object.
struct VBase {
    int vb;
    explicit VBase(int v) : vb(v) {}
    virtual ~VBase() {}
};

struct VL : virtual VBase {
    int vl;
    VL(int base, int l) : VBase(base), vl(l) {}
};

struct VR : virtual VBase {
    int vr;
    VR(int base, int r) : VBase(base), vr(r) {}
};

struct VD : VL, VR {
    int vd;
    VD(int base, int l, int r, int d) : VBase(base), VL(base, l), VR(base, r), vd(d) {}
};

// The complete objects and the subobject addresses that the first handler saw.
const NB *nonvirtual_object_seen = nullptr;
const MD *multiple_object_seen = nullptr;
const VBase *shared_base_seen = nullptr;

// N1: a base reference, rethrown to the derived handler. The derived handler sees the
// complete object at the address of the thrown object.
__attribute__((noinline)) int nonvirtual_rethrow() {
    try {
        try {
            throw NB(3, 4);
        } catch (const NA &base) {
            if (base.a != 3)
                return 0;
            nonvirtual_object_seen = static_cast<const NB *>(&base);
            throw;
        }
    } catch (const NB &derived) {
        return derived.a == 3 && derived.b == 4 && &derived == nonvirtual_object_seen ? 1 : 0;
    }
    return 0;
}

// M1: a secondary base (MB, adjusted) rethrown to the primary base (MA, adjustment zero).
// The second adjustment is computed again from the original type, not from the first.
__attribute__((noinline)) int secondary_then_primary() {
    try {
        try {
            throw MD(1, 2, 3);
        } catch (const MB &secondary) {
            if (secondary.mb != 2)
                return 0;
            multiple_object_seen = static_cast<const MD *>(&secondary);
            throw;
        }
    } catch (const MA &primary) {
        return primary.ma == 1 && static_cast<const MA *>(multiple_object_seen) == &primary
                   ? 1
                   : 0;
    }
    return 0;
}

// M2: the reverse order. The primary base (MA) is caught first, and the secondary base
// (MB) is matched by the rethrow, which gives the adjusted subobject.
__attribute__((noinline)) int primary_then_secondary() {
    try {
        try {
            throw MD(4, 5, 6);
        } catch (const MA &primary) {
            if (primary.ma != 4)
                return 0;
            multiple_object_seen = static_cast<const MD *>(&primary);
            throw;
        }
    } catch (const MB &secondary) {
        return secondary.mb == 5 && static_cast<const MB *>(multiple_object_seen) == &secondary
                   ? 1
                   : 0;
    }
    return 0;
}

// V1: two virtual-base paths of one object. The second handler names the shared virtual
// base directly, so its address must be the one the first handler saw through VR.
__attribute__((noinline)) int virtual_shared_rethrow() {
    try {
        try {
            throw VD(9, 1, 2, 3);
        } catch (const VR &right) {
            if (right.vr != 2)
                return 0;
            shared_base_seen = static_cast<const VBase *>(&right);
            throw;
        }
    } catch (const VBase &shared) {
        return shared.vb == 9 && &shared == shared_base_seen ? 1 : 0;
    }
    return 0;
}

// P1: a qualification conversion. The first handler takes const int *, and the rethrow
// gives the exact int * handler the original pointer value.
__attribute__((noinline)) int qualification_rethrow() {
    int value = 17;
    int *thrown = &value;
    try {
        try {
            throw thrown;
        } catch (const int *qualified) {
            if (qualified != &value)
                return 0;
            throw;
        }
    } catch (int *exact) {
        return exact == &value && *exact == 17 ? 1 : 0;
    }
    return 0;
}

// P2: a derived pointer converted to a base pointer, which adjusts it, then rethrown to
// void *. The void * handler must receive the original derived pointer value, not the
// adjusted base pointer that the first handler's conversion formed.
__attribute__((noinline)) int base_pointer_then_void() {
    MD object(7, 8, 9);
    MD *thrown = &object;
    try {
        try {
            throw thrown;
        } catch (MB *converted) {
            if (converted != static_cast<MB *>(&object))
                return 0;
            throw;
        }
    } catch (void *any) {
        return any == static_cast<void *>(&object) ? 1 : 0;
    }
    return 0;
}

// P3: a std::nullptr_t thrown and rethrown. The second handler is a pointer handler, and
// a null pointer conversion gives it the null value.
__attribute__((noinline)) int nullptr_rethrow() {
    try {
        try {
            throw nullptr;
        } catch (std::nullptr_t) {
            throw;
        }
    } catch (int *p) {
        return p == nullptr ? 1 : 0;
    }
    return 0;
}

// C1: a catch-all handler rethrows a derived object, and the base handler that follows
// matches the original type's base subobject.
__attribute__((noinline)) int catch_all_then_base() {
    try {
        try {
            throw NB(11, 12);
        } catch (...) {
            throw;
        }
    } catch (const NA &base) {
        return base.a == 11 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(nonvirtual_rethrow() == 1);
    expect(secondary_then_primary() == 1);
    expect(primary_then_secondary() == 1);
    expect(virtual_shared_rethrow() == 1);
    expect(qualification_rethrow() == 1);
    expect(base_pointer_then_void() == 1);
    expect(nullptr_rethrow() == 1);
    expect(catch_all_then_base() == 1);
    return failures == 0 ? 0 : 1;
}
