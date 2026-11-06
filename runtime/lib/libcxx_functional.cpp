// The AVM subset of libc++'s functional runtime. The upstream translation unit
// also instantiates a 32/64-bit hash algorithm, while AVM's size_t is 16 bits.
#include <functional>

_LIBCPP_BEGIN_NAMESPACE_STD
_LIBCPP_BEGIN_EXPLICIT_ABI_ANNOTATIONS

bad_function_call::~bad_function_call() noexcept {}

const char* bad_function_call::what() const noexcept { return "std::bad_function_call"; }

_LIBCPP_END_EXPLICIT_ABI_ANNOTATIONS
_LIBCPP_END_NAMESPACE_STD
