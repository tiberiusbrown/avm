// std::bad_cast and __cxa_bad_cast. The failed reference cast of a dynamic_cast calls
// __cxa_bad_cast, which throws through the ordinary AVM exception ABI. The object is
// compiled with -fexceptions, so its frame carries the unwind information that a
// propagating throw needs. It is compiled with -frtti, so the class's vtable and
// descriptor are valid for a typed catch and for a dynamic typeid through a
// std::exception reference.
#include <typeinfo>

namespace std {

bad_cast::bad_cast() noexcept = default;

bad_cast::~bad_cast() noexcept = default;

const char *bad_cast::what() const noexcept { return "std::bad_cast"; }

} // namespace std

// Called by the caller of a dynamic_cast to a reference type when the cast fails. The
// call is emitted as a potentially throwing call, so an enclosing handler can catch it.
extern "C" [[noreturn]] void __cxa_bad_cast() {
    throw std::bad_cast();
}
