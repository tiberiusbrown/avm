// std::bad_alloc and std::bad_array_new_length. The allocation functions throw bad_alloc
// through the AVM exception ABI, and std::allocator throws bad_array_new_length. Their key
// function is the destructor, so this object emits the RTTI and vtables for both classes.
// It is compiled with -frtti and -fexceptions, like the other standard exception objects.
#include <new>

namespace std {

bad_alloc::bad_alloc() noexcept {}

bad_alloc::~bad_alloc() noexcept {}

const char *bad_alloc::what() const noexcept { return "std::bad_alloc"; }

bad_array_new_length::bad_array_new_length() noexcept {}

bad_array_new_length::~bad_array_new_length() noexcept {}

const char *bad_array_new_length::what() const noexcept { return "std::bad_array_new_length"; }

} // namespace std
