#include <stdint.h>
#include <string.h>
#include <typeinfo>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

// std::type_info is a vptr and a 24-bit program-space name pointer, so it is six
// bytes with byte alignment.
static_assert(sizeof(std::type_info) == 6);
static_assert(alignof(std::type_info) == 1);

// This fixture is built with -frtti. Its types are named only through static
// typeid, so each type has one descriptor and one name.
struct Alpha {};
struct Beta {};
struct Gamma : Alpha {};
struct Delta : Alpha, Beta {};
struct RttiPoly {
    virtual int value() const { return 5; }
};

// A constant typeid initializer must hold the same flash alias that typeid returns
// in a function. The verifier reads this reference from the packed image.
const std::type_info &global_alpha = typeid(Alpha);

// The side effect must not run, because typeid does not evaluate an operand
// whose type is not polymorphic. External linkage keeps produce from being
// reported as unused, since the operand is never emitted.
int calls = 0;

int produce() {
    ++calls;
    return 7;
}

namespace {
// A type in an anonymous namespace has a descriptor with internal linkage, which
// typeid aliases in the same way as a global type.
struct Anonymous {
    int tag;
};

__attribute__((noinline)) uint16_t address_of(const void *p) {
    return (uint16_t)(uintptr_t)p;
}

// Returns the index of the first name in the table that compares equal to the
// argument, so the ordering checks can refer to the types by position.
const std::type_info *sample(unsigned index) {
    switch (index) {
    case 0: return &typeid(Alpha);
    case 1: return &typeid(Beta);
    case 2: return &typeid(Gamma);
    case 3: return &typeid(Delta);
    case 4: return &typeid(RttiPoly);
    default: return &typeid(int);
    }
}
}

extern "C" int avm_test_main() {
    // A. Fundamental types.
    const std::type_info &i = typeid(int);
    const std::type_info &u = typeid(unsigned int);
    const std::type_info &ll = typeid(long long);
    const std::type_info &f = typeid(float);
    const std::type_info &v = typeid(void);
    CHECK(i == typeid(int));
    CHECK(&i == &typeid(int));
    CHECK(i != u);
    CHECK(i != ll);
    CHECK(i != f);
    CHECK(i != v);
    CHECK(u != ll);
    CHECK(ll != f);
    CHECK(f != v);
    CHECK(strlen(v.name()) > 0);

    // B. Class types.
    CHECK(typeid(Alpha) == typeid(Alpha));
    CHECK(typeid(Alpha) != typeid(Beta));
    CHECK(typeid(Beta) != typeid(Gamma));

    // C. Inheritance does not convert a static typeid to a base type.
    CHECK(typeid(Gamma) != typeid(Alpha));
    CHECK(typeid(Delta) != typeid(Alpha));
    CHECK(typeid(Delta) != typeid(Beta));
    CHECK(typeid(Gamma) == typeid(Gamma));
    CHECK(typeid(RttiPoly) == typeid(RttiPoly));

    // D. Pointer and function types.
    CHECK(typeid(int *) == typeid(int *));
    CHECK(typeid(int *) != typeid(const int *));
    CHECK(typeid(void (*)()) == typeid(void (*)()));
    CHECK(typeid(void (*)()) != typeid(int *));

    // E. Top-level cv-qualifiers and references are not part of the type.
    const int ci = 1;
    int &ri = const_cast<int &>(ci);
    CHECK(typeid(const int) == typeid(int));
    CHECK(typeid(int &) == typeid(int));
    CHECK(typeid(const int &) == typeid(int));
    CHECK(typeid(ci) == typeid(int));
    CHECK(typeid(ri) == typeid(int));

    CHECK(&global_alpha == &typeid(Alpha));
    CHECK(global_alpha == typeid(Alpha));

    // F. Names are readable from flash, and they are stable.
    const char *name = typeid(Alpha).name();
    CHECK(address_of(name) >= 0x0B00u);
    CHECK(strlen(name) == 6);
    CHECK(strcmp(name, "5Alpha") == 0);
    CHECK(typeid(Alpha).name() == name);
    CHECK(strcmp(typeid(Alpha).name(), "5Alpha") == 0);
    CHECK(strcmp(typeid(int).name(), "i") == 0);
    CHECK(strcmp(typeid(int *).name(), "Pi") == 0);
    CHECK(strcmp(typeid(const int *).name(), "PKi") == 0);

    // G. Equal types have equal hash codes. Different types need not differ.
    CHECK(typeid(Alpha).hash_code() == typeid(Alpha).hash_code());
    CHECK(typeid(Gamma).hash_code() == typeid(Gamma).hash_code());
    CHECK(typeid(Alpha) == typeid(Alpha));

    // H. before() is an irreflexive, asymmetric, transitive ordering.
    const unsigned count = 6;
    for (unsigned a = 0; a < count; ++a) {
        CHECK(!sample(a)->before(*sample(a)));
        for (unsigned b = 0; b < count; ++b) {
            if (a == b)
                continue;
            const bool ab = sample(a)->before(*sample(b));
            const bool ba = sample(b)->before(*sample(a));
            CHECK(ab != ba);
            CHECK(ab == sample(a)->before(*sample(b)));
            for (unsigned c = 0; c < count; ++c) {
                if (ab && sample(b)->before(*sample(c)))
                    CHECK(sample(a)->before(*sample(c)));
            }
        }
    }

    // I. Operands of nonpolymorphic typeid expressions are not evaluated.
    const std::type_info &t = typeid(produce());
    CHECK(t == typeid(int));
    CHECK(calls == 0);
    RttiPoly poly;
    const std::type_info &pt = typeid(poly);
    CHECK(pt == typeid(RttiPoly));

    // J. Nothing above allocates. The image links without a heap object, and
    // every query returns its descriptor and name in place.
    CHECK(strcmp(typeid(Delta).name(), "5Delta") == 0);
    CHECK(strcmp(typeid(Anonymous).name(), "N12_GLOBAL__N_19AnonymousE") == 0);
    CHECK(typeid(Anonymous) == typeid(Anonymous));
    CHECK(typeid(Anonymous) != typeid(Alpha));

    test_puts("rtti-static=ok\n");
    return 0;
}
