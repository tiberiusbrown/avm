// std::bad_typeid and __cxa_bad_typeid. The throw uses the ordinary AVM exception
// ABI, so this object is compiled with -fexceptions, and its generated frame carries
// the unwind information that propagation through __cxa_bad_typeid needs. It is
// compiled with -frtti, so the class's vtable and descriptor are valid for a typed
// catch and for a dynamic typeid through a std::exception reference.
#include <typeinfo>

namespace std {

bad_typeid::bad_typeid() noexcept = default;

bad_typeid::~bad_typeid() noexcept = default;

const char *bad_typeid::what() const noexcept { return "std::bad_typeid"; }

} // namespace std

// Called when typeid is applied to a null pointer dereference. The call is emitted
// as a potentially throwing call, so an enclosing handler can catch the exception.
extern "C" [[noreturn]] void __cxa_bad_typeid() {
    throw std::bad_typeid();
}
