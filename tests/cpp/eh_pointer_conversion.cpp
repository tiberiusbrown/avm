// Pointer conversions in typed catches. A thrown pointer matches a catch of a pointer type that
// it converts to: a derived pointer to a public base pointer, a qualified pointer, a pointer to
// void, a function pointer that drops noexcept, and a null pointer from std::nullptr_t. Each
// case compares the handler's pointer with the address that the compiler's own conversion
// computes. A catch of a non-const pointer by reference matches only the exact pointer type, and
// it binds to the thrown pointer object. The cases cover fallbacks for private, protected,
// ambiguous, and qualification-removing conversions, and cleanups that run before a converted
// catch.
#include <avm/pgmspace.h>

extern "C" int avm_test_main(void);

// Several handlers below name a base before its derived class, or a pointer before a
// conversion of it. The order is the point of the test, so the warning is disabled.
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

// Logs its tag when it is destroyed, so cleanup order can be checked.
struct Logger {
    int tag;
    Logger(int t) : tag(t) {}
    ~Logger() { log_append(tag); }
};

// A nonvirtual base at offset zero, and a second base at offset two.
struct Left {
    int a;
};
struct Right {
    int b;
};
struct Pair : Left, Right {
    int tail;
};

// A three-level chain of nonvirtual bases.
struct Level1 {
    int l1;
};
struct Level2 : Level1 {
    int l2;
};
struct Level3 : Level2 {
    int l3;
};

// A virtual base, a derived class that holds it, and a diamond that shares it.
struct VBase {
    int vb;
};
struct VDerived : virtual VBase {
    int vd;
    VDerived(int v, int d) : VBase{v}, vd(d) {}
};
struct Shared {
    int sh;
};
struct DLeft : virtual Shared {
    int dl;
    DLeft(int s, int d) : Shared{s}, dl(d) {}
};
struct DRight : virtual Shared {
    int dr;
    DRight(int d) : Shared{0}, dr(d) {}
};
struct Diamond : DLeft, DRight {
    int dd;
    Diamond(int s, int l, int r, int d) : Shared{s}, DLeft(s, l), DRight(r), dd(d) {}
};

// Pre is not dynamic, so WithVirtual, a dynamic base with a virtual base, has a secondary
// vptr inside Secondary. The virtual base is found through that vptr.
struct Pre {
    int p;
};
struct WithVirtual : virtual VBase {
    int wv;
    WithVirtual(int v, int w) : VBase{v}, wv(w) {}
};
struct Secondary : Pre, WithVirtual {
    int s;
    Secondary(int p, int v, int w, int t) : Pre{p}, WithVirtual(v, w), s(t) {}
};

// Bases that a derived class names as private or protected, which a pointer cannot convert to.
struct Hidden {
    int h;
};
struct PrivateDer : private Hidden {
    int pd;
    PrivateDer(int h, int d) : Hidden{h}, pd(d) {}
};
struct ProtectedDer : protected Hidden {
    int pt;
    ProtectedDer(int h, int d) : Hidden{h}, pt(d) {}
};

// Two distinct Level1 subobjects, so a conversion to Level1 * is ambiguous.
struct AmbLeft : Level1 {
    int al;
};
struct AmbRight : Level1 {
    int ar;
};
struct Ambiguous : AmbLeft, AmbRight {
    int am;
};

const int AVM_PROGMEM program_table[2] = {4, 6};

void nothrow_fn() noexcept {
    log_append(42);
}

void plain_fn() {
    log_append(43);
}

// A: a derived class pointer converts to its first base, which is the same address.
__attribute__((noinline)) int direct_base() {
    Level2 object{{1}, 2};
    try {
        throw &object;
    } catch (Level1 *p) {
        return p == static_cast<Level1 *>(&object) && p->l1 == 1 ? 1 : 0;
    }
    return 0;
}

// B: a second base sits at a nonzero offset, so the converted pointer is adjusted.
__attribute__((noinline)) int second_base() {
    Pair object{{1}, {2}, 3};
    try {
        throw &object;
    } catch (Right *r) {
        expect(static_cast<void *>(r) != static_cast<void *>(&object));
        return r == static_cast<Right *>(&object) && r->b == 2 ? 1 : 0;
    }
    return 0;
}

// C: a transitive base, which is several levels above the thrown class.
__attribute__((noinline)) int transitive_base() {
    Level3 object{{{1}, 2}, 3};
    try {
        throw &object;
    } catch (Level1 *p) {
        return p == static_cast<Level1 *>(&object) ? 1 : 0;
    }
    return 0;
}

// D: a virtual base, found through the vptr of the thrown object.
__attribute__((noinline)) int virtual_base() {
    VDerived object(5, 6);
    try {
        throw &object;
    } catch (VBase *p) {
        return p == static_cast<VBase *>(&object) && p->vb == 5 ? 1 : 0;
    }
    return 0;
}

// E: a shared virtual base reached by two paths is one unique subobject.
__attribute__((noinline)) int diamond_shared() {
    Diamond object(7, 8, 9, 10);
    try {
        throw &object;
    } catch (Shared *p) {
        return p == static_cast<Shared *>(&object) && p->sh == 7 ? 1 : 0;
    }
    return 0;
}

// F: the virtual base lies behind a secondary vptr, which the conversion must read.
__attribute__((noinline)) int secondary_vptr() {
    Secondary object(1, 2, 3, 4);
    try {
        throw &object;
    } catch (VBase *p) {
        expect(p == static_cast<VBase *>(static_cast<WithVirtual *>(&object)));
        return p == static_cast<VBase *>(&object) ? 1 : 0;
    }
    return 0;
}

// G: a private base does not convert, so the catch-all takes the exception.
__attribute__((noinline)) int private_base() {
    PrivateDer object(1, 2);
    try {
        throw &object;
    } catch (Hidden *) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// H: a protected base does not convert either.
__attribute__((noinline)) int protected_base() {
    ProtectedDer object(1, 2);
    try {
        throw &object;
    } catch (Hidden *) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// I: a base that occurs twice is ambiguous, so it does not convert.
__attribute__((noinline)) int ambiguous_base() {
    Ambiguous object{{{1}, 2}, {{3}, 4}, 5};
    try {
        throw &object;
    } catch (Level1 *) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// J: qualifications may be added to the pointee.
__attribute__((noinline)) int add_const() {
    int value = 3;
    try {
        throw &value;
    } catch (const int *p) {
        return *p == 3 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int add_volatile() {
    int value = 3;
    try {
        throw &value;
    } catch (volatile int *p) {
        return *p == 3 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int add_const_volatile() {
    int value = 3;
    try {
        throw &value;
    } catch (const volatile int *p) {
        return *p == 3 ? 1 : 0;
    }
    return 0;
}

// K: a qualification is never removed, so the const pointee does not match.
__attribute__((noinline)) int remove_const() {
    const int value = 4;
    try {
        throw &value;
    } catch (int *) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// L: a base conversion with an added qualification.
__attribute__((noinline)) int base_and_const() {
    Pair object{{1}, {2}, 3};
    try {
        throw &object;
    } catch (const Right *r) {
        return r == static_cast<const Right *>(&object) && r->b == 2 ? 1 : 0;
    }
    return 0;
}

// M: nested qualification follows the decomposition rule. Only added qualifications at
// every level above a changed one are legal.
__attribute__((noinline)) int nested_removed() {
    int value = 1;
    int *inner = &value;
    int **outer = &inner;
    try {
        throw outer;
    } catch (const int **) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

__attribute__((noinline)) int nested_const_inner() {
    int value = 1;
    int *inner = &value;
    int **outer = &inner;
    try {
        throw outer;
    } catch (const int *const *p) {
        return **p == 1 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int nested_const_middle() {
    int value = 1;
    int *inner = &value;
    int **outer = &inner;
    try {
        throw outer;
    } catch (int *const *p) {
        return **p == 1 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int nested_remove_qualifier() {
    const int value = 1;
    const int *inner = &value;
    const int **outer = &inner;
    try {
        throw outer;
    } catch (int **) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// N: an object pointer converts to void *, and the qualifiers must be kept.
__attribute__((noinline)) int int_to_void() {
    int value = 1;
    try {
        throw &value;
    } catch (void *p) {
        return p == static_cast<void *>(&value) ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int const_int_to_const_void() {
    const int value = 1;
    try {
        throw &value;
    } catch (const void *p) {
        return p == static_cast<const void *>(&value) ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int const_int_to_void() {
    const int value = 1;
    try {
        throw &value;
    } catch (void *) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

__attribute__((noinline)) int class_to_void() {
    Pair object{{1}, {2}, 3};
    try {
        throw &object;
    } catch (void *p) {
        return p == static_cast<void *>(&object) ? 1 : 0;
    }
    return 0;
}

// O: a noexcept function pointer converts to the potentially throwing type, and the 24-bit
// address is preserved.
__attribute__((noinline)) int noexcept_removed() {
    void (*fp)() noexcept = &nothrow_fn;
    try {
        throw fp;
    } catch (void (*f)()) {
        return f == &nothrow_fn ? 1 : 0;
    }
    return 0;
}

// The reverse conversion adds noexcept, which is not allowed.
__attribute__((noinline)) int noexcept_added() {
    void (*fp)() = &plain_fn;
    try {
        throw fp;
    } catch (void (*)() noexcept) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// The exact function pointer type still matches exactly.
__attribute__((noinline)) int function_exact() {
    void (*fp)() = &plain_fn;
    try {
        throw fp;
    } catch (void (*f)()) {
        return f == &plain_fn ? 1 : 0;
    }
    return 0;
}

// P: std::nullptr_t converts to any pointer type, and the value is null.
__attribute__((noinline)) int nullptr_to_int() {
    try {
        throw nullptr;
    } catch (int *p) {
        return p == nullptr ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int nullptr_to_base() {
    try {
        throw nullptr;
    } catch (const Right *p) {
        return p == nullptr ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int nullptr_to_void() {
    try {
        throw nullptr;
    } catch (void *p) {
        return p == nullptr ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int nullptr_to_function() {
    try {
        throw nullptr;
    } catch (void (*f)()) {
        return f == nullptr ? 1 : 0;
    }
    return 0;
}

// An integer zero is not a null pointer, so it does not match a pointer catch.
__attribute__((noinline)) int zero_is_not_pointer() {
    try {
        throw 0;
    } catch (int *) {
        return 1;
    } catch (int v) {
        return v == 0 ? 2 : 3;
    }
    return 0;
}

// Q: a null derived pointer converts to a base pointer, and stays null.
__attribute__((noinline)) int null_derived() {
    Pair *object = nullptr;
    try {
        throw object;
    } catch (Left *p) {
        return p == nullptr ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int null_virtual() {
    VDerived *object = nullptr;
    try {
        throw object;
    } catch (VBase *p) {
        return p == nullptr ? 1 : 0;
    }
    return 0;
}

// R: a non-const pointer caught by reference matches its exact type, and the reference aliases
// the thrown pointer object.
__attribute__((noinline)) int exact_pointer_reference() {
    Pair object{{1}, {2}, 3};
    Pair other{{4}, {5}, 6};
    try {
        throw &object;
    } catch (Pair *&r) {
        bool aliased = r == &object;
        r = &other;
        return aliased && r == &other ? 1 : 0;
    }
    return 0;
}

// S: a catch of a base pointer by mutable reference does not match a derived pointer, so the
// next clause takes the exception.
__attribute__((noinline)) int illegal_mutable_reference() {
    Pair object{{1}, {2}, 3};
    try {
        throw &object;
    } catch (Left *&) {
        return 3;
    } catch (Pair *q) {
        return q == &object ? 1 : 2;
    }
    return 0;
}

// T: a const pointer reference binds to the converted value, which stays valid through the
// handler.
__attribute__((noinline)) int converted_const_reference() {
    Pair object{{1}, {2}, 3};
    try {
        throw &object;
    } catch (Right *const &r) {
        volatile int spacer = 0;
        spacer = spacer + 1;
        return r == static_cast<Right *>(&object) && r->b == 2 ? 1 : 0;
    }
    return 0;
}

// U: the first clause that matches wins, so the order of the clauses decides.
__attribute__((noinline)) int first_conversion_wins() {
    Pair object{{1}, {2}, 3};
    try {
        throw &object;
    } catch (const Left *) {
        return 1;
    } catch (Pair *) {
        return 2;
    } catch (...) {
        return 3;
    }
    return 0;
}

__attribute__((noinline)) int exact_first_wins() {
    Pair object{{1}, {2}, 3};
    try {
        throw &object;
    } catch (Pair *) {
        return 1;
    } catch (const Left *) {
        return 2;
    } catch (...) {
        return 3;
    }
    return 0;
}

// V: a frame with a destructor and a nonmatching pointer clause runs its cleanup before an outer
// converted catch takes the exception.
__attribute__((noinline)) void throw_pair_pointer(Pair *p) {
    throw p;
}

__attribute__((noinline)) void middle_frame(Pair *p) {
    Logger local(7);
    try {
        throw_pair_pointer(p);
    } catch (int *) {
        log_append(1);
    }
}

__attribute__((noinline)) int cleanup_then_converted() {
    Pair object{{1}, {2}, 3};
    try {
        middle_frame(&object);
    } catch (const Left *p) {
        log_append(9);
        return p == static_cast<const Left *>(&object) ? 1 : 0;
    }
    return 0;
}

// W: exact pointer catches keep their behavior for data, program, and function pointers, and
// for pointer-to-member values.
__attribute__((noinline)) int exact_data_pointer() {
    int value = 5;
    try {
        throw &value;
    } catch (char *) {
        return 1;
    } catch (int *p) {
        return *p == 5 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int exact_program_pointer() {
    const int AVM_PROGMEM *q = &program_table[1];
    try {
        throw q;
    } catch (int *) {
        return 1;
    } catch (const int AVM_PROGMEM *p) {
        return *p == 6 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int exact_member_pointer() {
    int Pair::*pm = &Pair::tail;
    try {
        throw pm;
    } catch (int *) {
        return 1;
    } catch (int Pair::*q) {
        return q == &Pair::tail ? 1 : 0;
    }
    return 0;
}

// A pointer to a class that does not derive from the catch type does not convert.
__attribute__((noinline)) int unrelated_class() {
    Hidden object{4};
    try {
        throw &object;
    } catch (Left *) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(direct_base() == 1);
    expect(second_base() == 1);
    expect(transitive_base() == 1);
    expect(virtual_base() == 1);
    expect(diamond_shared() == 1);
    expect(secondary_vptr() == 1);
    expect(private_base() == 2);
    expect(protected_base() == 2);
    expect(ambiguous_base() == 2);

    expect(add_const() == 1);
    expect(add_volatile() == 1);
    expect(add_const_volatile() == 1);
    expect(remove_const() == 2);
    expect(base_and_const() == 1);

    expect(nested_removed() == 2);
    expect(nested_const_inner() == 1);
    expect(nested_const_middle() == 1);
    expect(nested_remove_qualifier() == 2);

    expect(int_to_void() == 1);
    expect(const_int_to_const_void() == 1);
    expect(const_int_to_void() == 2);
    expect(class_to_void() == 1);

    expect(noexcept_removed() == 1);
    expect(noexcept_added() == 2);
    expect(function_exact() == 1);

    expect(nullptr_to_int() == 1);
    expect(nullptr_to_base() == 1);
    expect(nullptr_to_void() == 1);
    expect(nullptr_to_function() == 1);
    expect(zero_is_not_pointer() == 2);

    expect(null_derived() == 1);
    expect(null_virtual() == 1);

    expect(exact_pointer_reference() == 1);
    expect(illegal_mutable_reference() == 1);
    expect(converted_const_reference() == 1);

    expect(first_conversion_wins() == 1);
    expect(exact_first_wins() == 1);

    log_count = 0;
    expect(cleanup_then_converted() == 1);
    expect(log_count == 2 && log_entries[0] == 7 && log_entries[1] == 9);

    expect(exact_data_pointer() == 1);
    expect(exact_program_pointer() == 1);
    expect(exact_member_pointer() == 1);
    expect(unrelated_class() == 2);
    return failures == 0 ? 0 : 1;
}
