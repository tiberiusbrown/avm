// Public nonvirtual base catches. A catch of a base type matches a thrown class when
// that base is one subobject, reached only by public edges, and the handler binds to
// that subobject. A nonzero offset therefore selects a different part of the object.
// Ambiguous and inaccessible bases do not match, and a virtual base is not converted
// at all, which eh_inheritance_virtual_unhandled covers. Each thrown object is built
// by its own constructor, which records its address, so an identity check can compare
// a handler's reference with the subobject of the object that was actually thrown.
extern "C" int avm_test_main(void);

// Several handlers below name a base before its derived class, or a base pointer
// before a derived pointer. The warning reports exactly that order, and the order is
// the point of the test, so the warning is disabled for this file.
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

struct Logger {
    int tag;
    Logger(int t) : tag(t) {}
    ~Logger() { log_append(tag); }
};

struct Base {
    int value;
};

struct Derived : Base {
    int other;
};

struct Unrelated {
    int u;
};

__attribute__((noinline)) void throw_derived() {
    throw Derived{{17}, 3};
}

// A: a direct public base, caught by reference.
__attribute__((noinline)) int catch_direct_base() {
    try {
        throw_derived();
    } catch (Base &b) {
        return b.value == 17 ? 1 : 0;
    }
    return 0;
}

// B: a single-inheritance chain. The base is three levels below the thrown class.
struct A {
    int a;
    A(int v) : a(v) {}
};

struct B : A {
    int b;
    B(int av, int bv) : A(av), b(bv) {}
};

struct C : B {
    int c;
    C(int av, int bv, int cv) : B(av, bv), c(cv) {}
};

__attribute__((noinline)) void throw_chain() {
    throw C(1, 2, 3);
}

__attribute__((noinline)) int catch_chain_base() {
    try {
        throw_chain();
    } catch (A &a) {
        return a.a == 1 ? 1 : 0;
    }
    return 0;
}

// B8: eight levels of single inheritance, which is the deepest walk that fits.
struct L0 { int v; };
struct L1 : L0 {};
struct L2 : L1 {};
struct L3 : L2 {};
struct L4 : L3 {};
struct L5 : L4 {};
struct L6 : L5 {};
struct L7 : L6 {};

__attribute__((noinline)) void throw_eight_levels() {
    L7 thrown;
    thrown.v = 29;
    throw thrown;
}

__attribute__((noinline)) int catch_eight_levels() {
    try {
        throw_eight_levels();
    } catch (L0 &base) {
        return base.v == 29 ? 1 : 0;
    }
    return 0;
}

// C: the second base of a class with two direct bases lies at offset two.
struct Left {
    int left;
    Left(int v) : left(v) {}
};

struct Right {
    int right;
    Right(int v) : right(v) {}
};

struct Pair : Left, Right {
    int derived;
    Pair(int l, int r, int d) : Left(l), Right(r), derived(d) { constructed = this; }
};

__attribute__((noinline)) void throw_pair() {
    throw Pair(11, 22, 33);
}

__attribute__((noinline)) int catch_second_base() {
    try {
        throw_pair();
    } catch (Right &value) {
        expect(&value == static_cast<Right *>(static_cast<Pair *>(constructed)));
        return value.right == 22 ? 1 : 0;
    }
    return 0;
}

// D: a nested hierarchy. Mid sits at offset two in Top, and Hi sits at offset two
// inside Mid, so Hi lies at offset four. The offsets along each path are summed.
struct Tag {
    int tag;
    Tag(int t) : tag(t) {}
};

struct Lo {
    int lo;
    Lo(int v) : lo(v) {}
};

struct Hi {
    int hi;
    Hi(int v) : hi(v) {}
};

struct Mid : Lo, Hi {
    int mid;
    Mid(int l, int h, int m) : Lo(l), Hi(h), mid(m) {}
};

struct Top : Tag, Mid {
    int top;
    Top(int t, int l, int h, int m, int tp) : Tag(t), Mid(l, h, m), top(tp) {
        constructed = this;
    }
};

__attribute__((noinline)) void throw_top() {
    throw Top(5, 6, 7, 8, 9);
}

__attribute__((noinline)) int catch_nested_hi() {
    try {
        throw_top();
    } catch (Hi &hi) {
        expect(&hi == static_cast<Hi *>(static_cast<Top *>(constructed)));
        return hi.hi == 7 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_nested_mid() {
    try {
        throw_top();
    } catch (Mid &mid) {
        expect(&mid == static_cast<Mid *>(static_cast<Top *>(constructed)));
        return mid.mid == 8 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_nested_lo() {
    try {
        throw_top();
    } catch (Lo &lo) {
        expect(&lo == static_cast<Lo *>(static_cast<Top *>(constructed)));
        return lo.lo == 6 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_nested_tag() {
    try {
        throw_top();
    } catch (Tag &tag) {
        expect(&tag == static_cast<Tag *>(static_cast<Top *>(constructed)));
        return tag.tag == 5 ? 1 : 0;
    }
    return 0;
}

// E: a catch by const reference binds to the base subobject.
__attribute__((noinline)) int catch_const_base() {
    try {
        throw_derived();
    } catch (const Base &b) {
        return b.value == 17 ? 1 : 0;
    }
    return 0;
}

// F: a catch by value copies from the base subobject. Counted sits at offset two in
// Offset, so a copy from the start of the object would read the Tag. Each destructor
// call records its object, so the catch parameter and the exception are told apart.
struct Counted;

const Counted *copy_source;
int copies;
const void *destroyed_at[4];
int destructions;

struct Counted {
    int value;
    Counted(int v) : value(v) {}
    Counted(const Counted &other) : value(other.value) {
        copy_source = &other;
        ++copies;
    }
    ~Counted() { destroyed_at[destructions++] = this; }
};

const void *offset_destructed_at;
int offset_destructions;

struct Offset : Tag, Counted {
    int extra;
    Offset(int v) : Tag(v), Counted(v), extra(v + 1) { constructed = this; }
    ~Offset() {
        offset_destructed_at = this;
        ++offset_destructions;
    }
};

__attribute__((noinline)) void throw_offset(int v) {
    throw Offset(v);
}

__attribute__((noinline)) const Counted *offset_base() {
    return static_cast<const Counted *>(static_cast<const Offset *>(constructed));
}

__attribute__((noinline)) int catch_base_by_value() {
    copies = 0;
    destructions = 0;
    offset_destructions = 0;
    const void *parameter = nullptr;
    int result = 0;
    try {
        throw_offset(21);
    } catch (Counted copy) {
        parameter = &copy;
        result = copy.value == 21 && copy_source == offset_base() ? 1 : 0;
    }
    expect(copies == 1);
    expect(destructions == 2);
    expect(destroyed_at[0] == parameter);
    expect(destroyed_at[1] == offset_base());
    expect(offset_destructions == 1 && offset_destructed_at == constructed);
    return result;
}

// G: a private base does not match, and the exact clause after it does.
struct PrivateBase {
    int p;
};

struct PrivateDerived : private PrivateBase {
    int d;
    PrivateDerived(int v) : d(v) {}
};

__attribute__((noinline)) void throw_private() {
    throw PrivateDerived(4);
}

__attribute__((noinline)) int catch_private_base() {
    try {
        throw_private();
    } catch (PrivateBase &) {
        return 1;
    } catch (PrivateDerived &d) {
        return d.d == 4 ? 2 : 3;
    }
    return 0;
}

// H: a protected base does not match either.
struct ProtectedBase {
    int p;
};

struct ProtectedDerived : protected ProtectedBase {
    int d;
    ProtectedDerived(int v) : d(v) {}
};

__attribute__((noinline)) void throw_protected() {
    throw ProtectedDerived(5);
}

__attribute__((noinline)) int catch_protected_base() {
    try {
        throw_protected();
    } catch (ProtectedBase &) {
        return 1;
    } catch (ProtectedDerived &d) {
        return d.d == 5 ? 2 : 3;
    }
    return 0;
}

// I: a path with one private edge and one public edge is inaccessible, whichever edge
// comes first. PublicOuter reaches its base through a public edge and then a private
// one, and PrivateOuter through a private edge and then a public one.
struct PrivateEdgeBase {
    int p;
};

struct PrivateEdgeMid : private PrivateEdgeBase {};

struct PublicOuter : PrivateEdgeMid {
    int x;
};

struct PublicEdgeBase {
    int p;
};

struct PublicEdgeMid : PublicEdgeBase {};

struct PrivateOuter : private PublicEdgeMid {
    int x;
};

__attribute__((noinline)) void throw_public_outer() {
    throw PublicOuter{};
}

__attribute__((noinline)) void throw_private_outer() {
    throw PrivateOuter{};
}

__attribute__((noinline)) int catch_public_outer() {
    try {
        throw_public_outer();
    } catch (PrivateEdgeBase &) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

__attribute__((noinline)) int catch_private_outer() {
    try {
        throw_private_outer();
    } catch (PublicEdgeBase &) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// J: a nonvirtual diamond. Derived holds two paths to DiamondBase, so the base is
// ambiguous and the clause does not match. The exact clause after it does.
struct DiamondBase {
    int x;
};

struct DiamondLeft : DiamondBase {};
struct DiamondRight : DiamondBase {};
struct DiamondDerived : DiamondLeft, DiamondRight {};

__attribute__((noinline)) void throw_diamond() {
    throw DiamondDerived{};
}

__attribute__((noinline)) int catch_diamond() {
    try {
        throw_diamond();
    } catch (DiamondBase &) {
        return 1;
    } catch (DiamondDerived &) {
        return 2;
    }
    return 0;
}

// K: two distinct occurrences of one base, reached through a public and a private
// edge. The public occurrence is not chosen alone, so the base is ambiguous.
struct RepeatedBase {
    int x;
};

struct RepeatedPublic : RepeatedBase {};
struct RepeatedPrivate : private RepeatedBase {};
struct RepeatedBoth : RepeatedPublic, RepeatedPrivate {};

__attribute__((noinline)) void throw_repeated() {
    throw RepeatedBoth{};
}

__attribute__((noinline)) int catch_repeated() {
    try {
        throw_repeated();
    } catch (RepeatedBase &) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// L: the first matching clause wins. Base precedes Derived, so Base is taken, and
// reversing the two makes the exact Derived clause win.
__attribute__((noinline)) int base_first() {
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

__attribute__((noinline)) int derived_first() {
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

// M: an intermediate frame has a local and a typed catch that cannot match. The
// local is destroyed during unwinding, and the outer base catch then takes the
// exception.
__attribute__((noinline)) void middle_nonmatch() {
    Logger local(7);
    try {
        throw_derived();
    } catch (Unrelated &) {
        log_append(1);
    }
}

__attribute__((noinline)) int cleanup_across_base() {
    try {
        middle_nonmatch();
    } catch (Base &b) {
        log_append(9);
        return b.value == 17 ? 1 : 0;
    }
    return 0;
}

// N: one landing pad holds a cleanup and a base catch. The local is destroyed before
// the handler body runs, and the handler sees the base subobject.
__attribute__((noinline)) int cleanup_then_base_catch() {
    try {
        Logger local(3);
        throw_derived();
    } catch (Base &b) {
        log_append(b.value + 10);
    }
    return 1;
}

// O: a virtual base is not converted, and the exact clause of the derived class still
// matches. The virtual base's RTTI entry is never read as an object offset.
struct VirtualBase {
    int vb;
    VirtualBase(int v) : vb(v) {}
};

struct VirtualDerived : virtual VirtualBase {
    int vd;
    VirtualDerived(int v) : VirtualBase(v), vd(v + 1) {}
};

__attribute__((noinline)) void throw_virtual() {
    throw VirtualDerived(5);
}

__attribute__((noinline)) int catch_virtual() {
    try {
        throw_virtual();
    } catch (VirtualBase &) {
        return 1;
    } catch (VirtualDerived &d) {
        return d.vd == 6 ? 2 : 3;
    }
    return 0;
}

// P: a pointer to a derived class is not converted to a pointer to its base. The
// thrown type is Derived *, which has only the exact match.
__attribute__((noinline)) int pointer_not_converted() {
    Derived local{{1}, 2};
    Derived *p = &local;
    try {
        throw p;
    } catch (Base *) {
        return 1;
    } catch (Derived *q) {
        return q == &local ? 2 : 3;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(catch_direct_base() == 1);
    expect(catch_chain_base() == 1);
    expect(catch_eight_levels() == 1);
    expect(catch_second_base() == 1);
    expect(catch_nested_hi() == 1);
    expect(catch_nested_mid() == 1);
    expect(catch_nested_lo() == 1);
    expect(catch_nested_tag() == 1);
    expect(catch_const_base() == 1);

    expect(catch_base_by_value() == 1);

    expect(catch_private_base() == 2);
    expect(catch_protected_base() == 2);
    expect(catch_public_outer() == 2);
    expect(catch_private_outer() == 2);
    expect(catch_diamond() == 2);
    expect(catch_repeated() == 2);

    expect(base_first() == 2);
    expect(derived_first() == 3);

    log_count = 0;
    expect(cleanup_across_base() == 1);
    expect(log_count == 2 && log_entries[0] == 7 && log_entries[1] == 9);

    log_count = 0;
    expect(cleanup_then_base_catch() == 1);
    expect(log_count == 2 && log_entries[0] == 3 && log_entries[1] == 27);

    expect(catch_virtual() == 2);
    expect(pointer_not_converted() == 2);
    return failures == 0 ? 0 : 1;
}
