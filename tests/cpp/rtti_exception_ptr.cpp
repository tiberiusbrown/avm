// RTTI builds take the typeid-driven path of std::make_exception_ptr, and rethrow_if_nested
// uses dynamic_cast on polymorphic types. The fixture is built with -frtti and -fexceptions.
#include <exception>

extern "C" int avm_test_main(void);

namespace {

struct Failure {
    explicit Failure(int v) : value(v) {}
    virtual ~Failure() {}
    int value;
};

struct Derived : Failure {
    Derived(int v, int e) : Failure(v), extra(e) {}
    int extra;
};

} // namespace

extern "C" int avm_test_main(void) {
    std::exception_ptr made = std::make_exception_ptr(Derived(4, 5));
    if (!made)
        return 1;
    try {
        std::rethrow_exception(made);
    } catch (Derived &d) {
        if (d.value != 4 || d.extra != 5)
            return 2;
    }
    try {
        std::rethrow_exception(made);
    } catch (Failure &f) {
        if (f.value != 4)
            return 3;
    }

    // rethrow_if_nested finds the nested exception through the polymorphic static type.
    try {
        try {
            throw Failure(1);
        } catch (Failure &) {
            std::throw_with_nested(Failure(2));
        }
    } catch (Failure &outer) {
        if (outer.value != 2)
            return 4;
        try {
            std::rethrow_if_nested(outer);
        } catch (Failure &inner) {
            if (inner.value != 1)
                return 5;
        }
    }

    // An exception that wraps nothing is not rethrown.
    try {
        std::rethrow_if_nested(Failure(6));
    } catch (...) {
        return 6;
    }
    return 0;
}
