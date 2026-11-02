// Virtual base catches. A catch of a virtual base finds the base subobject through the
// vptr of the subobject that holds the virtual edge, so each case compares the handler's
// reference with the address that the compiler's static_cast computes for the same object.
// The cases cover direct, nested, diamond, secondary-vptr, and mixed hierarchies, catches
// by value and by const reference, inaccessible paths, ambiguous bases, clause order, and
// cleanups that run before a virtual base catch.
extern "C" int avm_test_main(void);

// Several handlers below name a base before its derived class, or a base pointer before
// a derived pointer. The order is the point of the test, so the warning is disabled.
#pragma clang diagnostic ignored "-Wexceptions"

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

volatile int log_entries[16];
volatile int log_count;

__attribute__((always_inline)) inline void log_append(int tag) {
    log_entries[log_count] = tag;
    log_count = log_count + 1;
}

// The address of the most recently constructed thrown object.
void *constructed;

struct Unrelated {
    int u;
};

struct Logger {
    int tag;
    Logger(int t) : tag(t) {}
    ~Logger() { log_append(tag); }
};

// A: a direct virtual base at the end of its derived class. B: the same base after a
// nonvirtual base, so the derived class has data and a base ahead of the virtual base.
struct Base {
    int value;
};

struct Derived : virtual Base {
    int other;
    Derived(int v, int o) : Base{v}, other(o) { constructed = this; }
};

struct Filler {
    int fill;
};

struct Preceded : Filler, virtual Base {
    int tail;
    Preceded(int f, int v, int t) : Base{v}, Filler{f}, tail(t) { constructed = this; }
};

__attribute__((noinline)) void throw_derived() {
    throw Derived(17, 3);
}

__attribute__((noinline)) void throw_preceded() {
    throw Preceded(2, 19, 4);
}

__attribute__((noinline)) int catch_direct_base() {
    try {
        throw_derived();
    } catch (Base &b) {
        expect(&b == static_cast<Base *>(static_cast<Derived *>(constructed)));
        expect(static_cast<void *>(&b) != constructed);
        return b.value == 17 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_direct_base_const() {
    try {
        throw_derived();
    } catch (const Base &b) {
        expect(&b == static_cast<const Base *>(static_cast<const Derived *>(constructed)));
        return b.value == 17 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_preceded_base() {
    try {
        throw_preceded();
    } catch (Base &b) {
        expect(&b == static_cast<Base *>(static_cast<Preceded *>(constructed)));
        return b.value == 19 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_derived_exact() {
    try {
        throw_derived();
    } catch (Derived &d) {
        expect(&d == constructed);
        return d.other == 3 ? 1 : 0;
    }
    return 0;
}

// D: a shared virtual base in a diamond. Both paths reach the same subobject, so the catch
// matches once, and the two static_casts to it name the same address.
struct Shared {
    int value;
    Shared(int v) : value(v) {}
};

struct Left : virtual Shared {
    int left;
    Left(int l) : Shared(0), left(l) {}
};

struct Right : virtual Shared {
    int right;
    Right(int r) : Shared(0), right(r) {}
};

struct Diamond : Left, Right {
    int top;
    Diamond(int s, int l, int r, int t) : Shared(s), Left(l), Right(r), top(t) {
        constructed = this;
    }
};

__attribute__((noinline)) void throw_diamond() {
    throw Diamond(29, 5, 6, 7);
}

__attribute__((noinline)) int catch_diamond_shared() {
    try {
        throw_diamond();
    } catch (Shared &s) {
        expect(&s == static_cast<Shared *>(static_cast<Diamond *>(constructed)));
        expect(static_cast<Shared *>(static_cast<Left *>(
                   static_cast<Diamond *>(constructed))) == &s);
        expect(static_cast<Shared *>(static_cast<Right *>(
                   static_cast<Diamond *>(constructed))) == &s);
        return s.value == 29 ? 1 : 0;
    }
    return 0;
}

// E: nested virtual inheritance. Other2 is the primary base, so Mid2 lies at a nonzero
// offset with its own vptr. Top3 reaches Core through Mid2 and Mid1, so the nonvirtual edges
// add their offsets, and Mid1's virtual edge adds its displacement.
struct Other2 {
    int o;
    Other2() : o(0) {}
    virtual int id() { return o; }
};

struct Core {
    int core;
    Core(int c) : core(c) {}
};

struct Mid1 : virtual Core {
    int m1;
    Mid1(int m) : Core(0), m1(m) {}
};

struct Mid2 : Mid1 {
    int m2;
    Mid2(int m) : Core(0), Mid1(m), m2(m + 1) {}
};

struct Top3 : Other2, Mid2 {
    int top;
    Top3(int c, int m) : Core(c), Mid2(m), top(c + m) { constructed = this; }
};

__attribute__((noinline)) void throw_top3() {
    throw Top3(41, 8);
}

__attribute__((noinline)) int catch_nested_core() {
    try {
        throw_top3();
    } catch (Core &c) {
        expect(&c == static_cast<Core *>(static_cast<Top3 *>(constructed)));
        return c.core == 41 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_nested_mid1() {
    try {
        throw_top3();
    } catch (Mid1 &m) {
        expect(&m == static_cast<Mid1 *>(static_cast<Top3 *>(constructed)));
        return m.m1 == 8 ? 1 : 0;
    }
    return 0;
}

// F: a secondary subobject with its own vptr. Primary is the primary base, so Secondary is
// not at offset zero, and its vptr is not the complete object's. The virtual base offset
// must come from Secondary's vptr.
struct Primary {
    int first;
    virtual int value() { return first; }
};

struct Secondary : virtual Shared {
    int second;
    Secondary(int s) : Shared(0), second(s) {}
};

struct SecondaryDerived : Primary, Secondary {
    int third;
    SecondaryDerived(int s, int v, int t) : Shared(v), Secondary(s), third(t) {
        constructed = this;
    }
};

__attribute__((noinline)) void throw_secondary() {
    throw SecondaryDerived(12, 34, 56);
}

__attribute__((noinline)) int catch_secondary_shared() {
    try {
        throw_secondary();
    } catch (Shared &s) {
        expect(&s == static_cast<Shared *>(static_cast<SecondaryDerived *>(constructed)));
        expect(static_cast<void *>(static_cast<Secondary *>(
                   static_cast<SecondaryDerived *>(constructed))) != constructed);
        return s.value == 34 ? 1 : 0;
    }
    return 0;
}

// G: a nonvirtual edge with a nonzero offset, followed by a virtual edge. Chain2 is the
// second dynamic base, so it lies past Other2 with its own vptr. Its base Left2 is primary
// in Chain2, and Left2's virtual edge to Shared runs through Chain2's vptr. The adjustment
// is Chain2's offset plus Left2's displacement to Shared.
struct Left2 : virtual Shared {
    int l;
    Left2(int v) : Shared(0), l(v) {}
};

struct Chain2 : Left2 {
    int c;
    Chain2(int v) : Shared(0), Left2(v), c(v + 1) {}
};

struct MixedDerived : Other2, Chain2 {
    int m;
    MixedDerived(int v) : Shared(v + 100), Chain2(v), m(v + 2) { constructed = this; }
};

__attribute__((noinline)) void throw_mixed() {
    throw MixedDerived(7);
}

__attribute__((noinline)) int catch_mixed_shared() {
    try {
        throw_mixed();
    } catch (Shared &s) {
        expect(&s == static_cast<Shared *>(static_cast<MixedDerived *>(constructed)));
        return s.value == 107 ? 1 : 0;
    }
    return 0;
}

// H: a virtual base caught by value. The copy is made from the base subobject, and the
// catch parameter and the complete object are each destroyed once.
struct Payload;

const Payload *copy_source;
int copies;
const void *destroyed_at[4];
int destructions;
const void *holder_destructed_at;
int holder_destructions;

struct Payload {
    int value;
    Payload(int v) : value(v) {}
    Payload(const Payload &other) : value(other.value) {
        copy_source = &other;
        ++copies;
    }
    ~Payload() { destroyed_at[destructions++] = this; }
};

struct Holder : virtual Payload {
    int extra;
    Holder(int v) : Payload(v), extra(v + 1) { constructed = this; }
    ~Holder() {
        holder_destructed_at = this;
        ++holder_destructions;
    }
};

__attribute__((noinline)) void throw_holder(int v) {
    throw Holder(v);
}

__attribute__((noinline)) const Payload *holder_payload() {
    return static_cast<const Payload *>(static_cast<const Holder *>(constructed));
}

__attribute__((noinline)) int catch_payload_by_value() {
    copies = 0;
    destructions = 0;
    holder_destructions = 0;
    const void *parameter = nullptr;
    int result = 0;
    try {
        throw_holder(21);
    } catch (Payload copy) {
        parameter = &copy;
        result = copy.value == 21 && copy_source == holder_payload() ? 1 : 0;
    }
    expect(copies == 1);
    expect(destructions == 2);
    expect(destroyed_at[0] == parameter);
    expect(destroyed_at[1] == holder_payload());
    expect(holder_destructions == 1 && holder_destructed_at == constructed);
    return result;
}

// I: a private virtual base does not match through its only path, and the catch-all after
// it is reached. J: a protected one is the same.
struct PrivateVirtual : private virtual Shared {
    int p;
    PrivateVirtual(int v) : Shared(v), p(v + 1) {}
};

struct ProtectedVirtual : protected virtual Shared {
    int q;
    ProtectedVirtual(int v) : Shared(v), q(v + 1) {}
};

__attribute__((noinline)) void throw_private_virtual() {
    throw PrivateVirtual(33);
}

__attribute__((noinline)) void throw_protected_virtual() {
    throw ProtectedVirtual(44);
}

__attribute__((noinline)) int catch_private_virtual() {
    try {
        throw_private_virtual();
    } catch (Shared &) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

__attribute__((noinline)) int catch_protected_virtual() {
    try {
        throw_protected_virtual();
    } catch (Shared &) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// K: one shared virtual base, reached through a public path and a private path. The public
// path makes the base accessible, so the catch matches.
struct PublicPath : virtual Shared {
    int a;
    PublicPath() : Shared(0), a(1) {}
};

struct PrivatePath : private virtual Shared {
    int b;
    PrivatePath() : Shared(0), b(2) {}
};

struct BothPaths : PublicPath, PrivatePath {
    int c;
    BothPaths(int v) : Shared(v), PublicPath(), PrivatePath(), c(3) { constructed = this; }
};

__attribute__((noinline)) void throw_both_paths() {
    throw BothPaths(52);
}

__attribute__((noinline)) int catch_both_paths() {
    try {
        throw_both_paths();
    } catch (Shared &s) {
        expect(&s == static_cast<Shared *>(static_cast<BothPaths *>(constructed)));
        return s.value == 52 ? 1 : 0;
    }
    return 0;
}

// L: a virtual Plain and a nonvirtual Plain in one object are two subobjects. The catch
// of Plain does not match, and the catch-all after it does. Clang warns that the direct
// Plain is inaccessible through ambiguity, which is the shape under test.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winaccessible-base"
struct Plain {
    int x = 0;
};

struct VirtualPlain : virtual Plain {
    int y = 2;
};

struct MixedPlain : VirtualPlain, Plain {
    int z = 4;
    MixedPlain() { constructed = this; }
};
#pragma clang diagnostic pop

__attribute__((noinline)) void throw_mixed_plain() {
    throw MixedPlain();
}

__attribute__((noinline)) int catch_ambiguous_plain() {
    try {
        throw_mixed_plain();
    } catch (Plain &) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// M: the first matching clause wins. Base precedes Derived, so Base is taken, and the
// reversed order reaches the exact Derived clause.
__attribute__((noinline)) int base_clause_first() {
    try {
        throw_derived();
    } catch (Unrelated &) {
        return 1;
    } catch (Base &) {
        return 2;
    } catch (Derived &) {
        return 3;
    } catch (...) {
        return 4;
    }
    return 0;
}

__attribute__((noinline)) int derived_clause_first() {
    try {
        throw_derived();
    } catch (Unrelated &) {
        return 1;
    } catch (Derived &) {
        return 3;
    } catch (Base &) {
        return 2;
    } catch (...) {
        return 4;
    }
    return 0;
}

// N: an intermediate frame has a local and a typed catch that cannot match. The local is
// destroyed during unwinding, and the outer virtual base catch then takes the exception.
__attribute__((noinline)) void middle_nonmatch() {
    Logger local(7);
    try {
        throw_derived();
    } catch (Unrelated &) {
        log_append(1);
    }
}

__attribute__((noinline)) int cleanup_across_virtual_base() {
    try {
        middle_nonmatch();
    } catch (Base &b) {
        log_append(9);
        return b.value == 17 ? 1 : 0;
    }
    return 0;
}

// O: a nonvirtual base with a nonzero offset still matches exactly as before.
struct NvLeft {
    int l;
};

struct NvRight {
    int r;
};

struct NvPair : NvLeft, NvRight {
    int p;
    NvPair(int l, int r, int p_value) : NvLeft{l}, NvRight{r}, p(p_value) {
        constructed = this;
    }
};

__attribute__((noinline)) void throw_nv_pair() {
    throw NvPair(11, 22, 33);
}

__attribute__((noinline)) int catch_nonvirtual_regression() {
    try {
        throw_nv_pair();
    } catch (NvRight &r) {
        expect(&r == static_cast<NvRight *>(static_cast<NvPair *>(constructed)));
        return r.r == 22 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(catch_direct_base() == 1);
    expect(catch_direct_base_const() == 1);
    expect(catch_preceded_base() == 1);
    expect(catch_derived_exact() == 1);

    expect(catch_diamond_shared() == 1);
    expect(catch_nested_core() == 1);
    expect(catch_nested_mid1() == 1);
    expect(catch_secondary_shared() == 1);
    expect(catch_mixed_shared() == 1);

    expect(catch_payload_by_value() == 1);

    expect(catch_private_virtual() == 2);
    expect(catch_protected_virtual() == 2);
    expect(catch_both_paths() == 1);
    expect(catch_ambiguous_plain() == 2);

    expect(base_clause_first() == 2);
    expect(derived_clause_first() == 3);

    log_count = 0;
    expect(cleanup_across_virtual_base() == 1);
    expect(log_count == 2 && log_entries[0] == 7 && log_entries[1] == 9);

    expect(catch_nonvirtual_regression() == 1);
    return failures == 0 ? 0 : 1;
}
