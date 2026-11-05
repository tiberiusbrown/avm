// std::exception_ptr, std::current_exception, std::rethrow_exception, and the
// out-of-line members of std::nested_exception, over the AVM exception header.
//
// The header's reference count is the only ownership state. An exception_ptr holds one
// reference to the thrown object, and the handler and an in-flight throw hold another
// (see eh_cxa.c). rethrow_exception passes its parameter's reference to the rethrow,
// so its parameter must be destroyed during unwinding. That destruction needs a landing
// pad, which is why this object is compiled with -fexceptions.
#include <exception>

extern "C" {
void *__cxa_current_primary_exception(void) noexcept;
void __cxa_increment_exception_refcount(void *object) noexcept;
void __cxa_decrement_exception_refcount(void *object) noexcept;
// Rethrows a non-null object that an exception_ptr holds. It is a shim, so it never
// returns, and the rethrow takes the call site as its unwinding origin.
[[noreturn]] void __avm_rethrow_primary_exception(void *object);
}

namespace std {

exception_ptr::exception_ptr(const exception_ptr &other) noexcept : __ptr_(other.__ptr_) {
    __cxa_increment_exception_refcount(__ptr_);
}

exception_ptr &exception_ptr::operator=(const exception_ptr &other) noexcept {
    if (__ptr_ != other.__ptr_) {
        __cxa_increment_exception_refcount(other.__ptr_);
        __cxa_decrement_exception_refcount(__ptr_);
        __ptr_ = other.__ptr_;
    }
    return *this;
}

exception_ptr::~exception_ptr() noexcept { __cxa_decrement_exception_refcount(__ptr_); }

exception_ptr exception_ptr::__from_native_exception_pointer(void *object) noexcept {
    exception_ptr ptr;
    ptr.__ptr_ = object;
    __cxa_increment_exception_refcount(ptr.__ptr_);
    return ptr;
}

// The primary exception already holds the reference that the new exception_ptr keeps.
exception_ptr current_exception() noexcept {
    exception_ptr ptr;
    ptr.__ptr_ = __cxa_current_primary_exception();
    return ptr;
}

[[noreturn]] void rethrow_exception(exception_ptr p) {
    if (p.__ptr_ == nullptr)
        terminate();
    __avm_rethrow_primary_exception(p.__ptr_);
}

nested_exception::nested_exception() noexcept : __ptr_(current_exception()) {}

nested_exception::~nested_exception() noexcept {}

void nested_exception::rethrow_nested() const {
    if (__ptr_ == nullptr)
        terminate();
    rethrow_exception(__ptr_);
}

} // namespace std
