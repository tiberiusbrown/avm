#include <avm/runtime.h>
#include <typeinfo>

// Compiler-generated vtables can refer to these functions even when the
// corresponding invalid call path is never taken.
extern "C" __attribute__((weak, noreturn)) void __cxa_pure_virtual(void) {
    avm_halt();
}

extern "C" __attribute__((weak, noreturn)) void __cxa_deleted_virtual(void) {
    avm_halt();
}

// The header declares the type_info destructor virtual but does not define it.
// Static typeid never destroys a type_info, so the destructor only has to exist
// for the ABI symbols that refer to it.
namespace std {
type_info::~type_info() noexcept = default;
} // namespace std
