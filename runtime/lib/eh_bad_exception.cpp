// std::bad_exception. Its key function is the destructor, so this object emits the RTTI and
// vtable for the class. It is compiled with -frtti, like the other standard exception objects,
// and it is extracted from libavm.a only when a program names bad_exception.
#include <exception>

namespace std {

bad_exception::~bad_exception() noexcept {}

const char *bad_exception::what() const noexcept { return "std::bad_exception"; }

} // namespace std
