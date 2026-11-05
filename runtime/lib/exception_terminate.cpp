// std::terminate, std::set_terminate, std::get_terminate, and std::uncaught_exceptions.
//
// AVM has no concurrent observer of the handler slot, so the slot is a plain object. The
// default handler calls abort(). terminate calls the installed handler, and abort() follows
// when the handler returns, as the standard requires. A handler that throws reaches the
// landing pad that terminate's noexcept contract adds, and that pad calls terminate again.
// The guard turns that nested call into an immediate abort.
#include <exception>
#include <stdlib.h>

extern "C" int __cxa_uncaught_exceptions(void) noexcept;

namespace {

void default_terminate_handler() { abort(); }

// Null selects the default handler, so static initialization needs no code.
std::terminate_handler installed_handler = nullptr;

bool terminating = false;

} // namespace

namespace std {

terminate_handler get_terminate() noexcept {
    return installed_handler ? installed_handler : &default_terminate_handler;
}

terminate_handler set_terminate(terminate_handler handler) noexcept {
    terminate_handler previous = get_terminate();
    installed_handler = handler;
    return previous;
}

[[noreturn]] void terminate() noexcept {
    if (terminating)
        abort();
    terminating = true;
    get_terminate()();
    abort();
}

int uncaught_exceptions() noexcept { return __cxa_uncaught_exceptions(); }

} // namespace std
