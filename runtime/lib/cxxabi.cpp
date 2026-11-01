#include <avm/runtime.h>
#include <cstddef>
#include <stdlib.h>

// Compiler-generated vtables can refer to these functions even when the
// corresponding invalid call path is never taken.
extern "C" __attribute__((weak, noreturn)) void __cxa_pure_virtual(void) {
    avm_halt();
}

extern "C" __attribute__((weak, noreturn)) void __cxa_deleted_virtual(void) {
    avm_halt();
}

// A virtual destructor emits a deleting destructor even for stack objects.
// These weak fallbacks satisfy that ABI reference without providing a heap.
__attribute__((weak)) void operator delete(void*) noexcept { avm_halt(); }
__attribute__((weak)) void operator delete[](void*) noexcept { avm_halt(); }
__attribute__((weak)) void operator delete(void*, std::size_t) noexcept {
    avm_halt();
}
__attribute__((weak)) void operator delete[](void*, std::size_t) noexcept {
    avm_halt();
}

// Reached when an exception cannot be handled. A catch body whose call may throw
// passes its exception to this function through __clang_call_terminate. The
// unwinder terminates with abort(), so this function does the same.
namespace std {
[[noreturn]] void terminate() noexcept { abort(); }
} // namespace std
