// Rethrow of the standard exceptions that the runtime throws itself. The first handler is
// std::exception, which rethrows, and the second handler is the exact standard class. The
// class and its what() text must be the original ones, and the one exception object must
// be destroyed and freed once. The fixture is built with -frtti and -fexceptions.
//
// The typeid operand is evaluated on purpose, and Clang warns about that. The warning is
// silenced for this file only.
#pragma clang diagnostic ignored "-Wpotentially-evaluated-expression"

#include <exception>
#include <stdint.h>
#include <string.h>
#include <typeinfo>

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

struct Base {
    virtual ~Base() = default;
};

struct Derived : Base {};

struct Other : Base {};

Other other_object;

// The operands come from noinline functions, so the null check and the failed cast run
// at run time. Each records that it ran, so a rethrow cannot re-evaluate the operand.
__attribute__((noinline)) Base *null_base(int *count) {
    ++*count;
    return nullptr;
}

__attribute__((noinline)) Base *other_base(int *count) {
    ++*count;
    return &other_object;
}

// A null operand of polymorphic typeid throws std::bad_typeid. The std::exception handler
// rethrows it, and the std::bad_typeid handler then matches the original object.
__attribute__((noinline)) int typeid_rethrow() {
    int count = 0;
    try {
        try {
            (void)typeid(*null_base(&count));
        } catch (const std::exception &e) {
            if (strcmp(e.what(), "std::bad_typeid") != 0)
                return 0;
            throw;
        }
    } catch (const std::bad_typeid &caught) {
        return count == 1 && strcmp(caught.what(), "std::bad_typeid") == 0 ? 1 : 0;
    }
    return 0;
}

// A failed reference dynamic_cast throws std::bad_cast. The std::exception handler
// rethrows it, and the std::bad_cast handler matches the original object.
__attribute__((noinline)) int cast_rethrow() {
    int count = 0;
    try {
        try {
            Derived &derived = dynamic_cast<Derived &>(*other_base(&count));
            (void)derived;
            return 0;
        } catch (const std::exception &e) {
            if (strcmp(e.what(), "std::bad_cast") != 0)
                return 0;
            throw;
        }
    } catch (const std::bad_cast &caught) {
        return count == 1 && strcmp(caught.what(), "std::bad_cast") == 0 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(typeid_rethrow() == 1);
    expect(cast_rethrow() == 1);
    return failures == 0 ? 0 : 1;
}
