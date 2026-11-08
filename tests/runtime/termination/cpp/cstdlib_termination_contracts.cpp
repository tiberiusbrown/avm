// C++ contracts of the termination and registration functions in <cstdlib>.
// The fixture links only registration calls, so it returns instead of terminating.
#include <cstdlib>
#include <type_traits>

extern "C" int avm_test_main(void);

// Each of these functions is noexcept in std, including the C-linkage names that
// <cstdlib> brings into the std namespace.
static_assert(noexcept(std::abort()));
static_assert(noexcept(std::exit(0)));
static_assert(noexcept(std::_Exit(0)));
static_assert(noexcept(std::quick_exit(0)));
static_assert(noexcept(std::atexit(nullptr)));
static_assert(noexcept(std::at_quick_exit(nullptr)));

static_assert(std::is_same_v<decltype(&std::atexit), int (*)(void (*)()) noexcept>);
static_assert(std::is_same_v<decltype(&std::at_quick_exit), int (*)(void (*)()) noexcept>);

// Clang keeps [[noreturn]] in the function type, so the type of abort is not compared
// directly. A value-returning path that ends in std::abort() needs no return statement
// only when abort is [[noreturn]], and -Werror rejects the function otherwise.
static int abort_path(int value) {
    if (value != 0)
        return value;
    std::abort();
}

static void registered_at_exit() {}
static void registered_at_quick_exit() {}

extern "C" int avm_test_main(void) {
    if (abort_path(7) != 7)
        return 1;
    if (std::atexit(registered_at_exit) != 0)
        return 2;
    if (std::at_quick_exit(registered_at_quick_exit) != 0)
        return 3;
    return 0;
}
