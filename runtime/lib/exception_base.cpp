// The out-of-line members of std::exception. This object is compiled with -frtti,
// so its vtable names a valid RTTI descriptor, which a dynamic typeid reads through
// a std::exception reference. The object is extracted from libavm.a only when a
// program refers to a standard exception class.
#include <exception>

namespace std {

exception::~exception() noexcept = default;

const char *exception::what() const noexcept { return "std::exception"; }

} // namespace std
