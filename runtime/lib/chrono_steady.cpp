// std::chrono::steady_clock::now() for AVM. The clock is the millisecond counter behind
// clock(), which counts from runtime startup and wraps modulo 2^32 milliseconds, after about
// 49.7 days. The counter never decreases between wraps and needs no calendar, so the wrap is
// the only break in monotonicity. libc++ takes high_resolution_clock from this class when
// _LIBCPP_HAS_MONOTONIC_CLOCK is set.
//
// Only the steady-clock header is included. The full <chrono> header needs 32-bit int for its
// calendar types, which AVM does not provide, so it cannot be compiled here.
#include <__chrono/steady_clock.h>
#include <time.h>

namespace std {
namespace chrono {

steady_clock::time_point steady_clock::now() noexcept {
    const rep milliseconds = static_cast<rep>(clock());
    return time_point(duration(milliseconds * 1000000));
}

} // namespace chrono
} // namespace std
