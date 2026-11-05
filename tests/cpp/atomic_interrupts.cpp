// Atomic read-modify-write operations on eight-byte and two-byte values while the timer
// interrupts run. An interrupt handler never touches guest memory, so every operation must be
// counted exactly once. The loop runs until clock() has advanced by at least five milliseconds,
// which shows that interrupts ran between the operations, and each total is then checked exactly.
#include <atomic>
#include <cstdint>
#include <time.h>

extern "C" int avm_test_main(void);

static std::atomic<std::uint64_t> wide;
static std::atomic<std::uint16_t> narrow;

extern "C" int avm_test_main(void) {
    wide.store(0);
    narrow.store(0);
    const clock_t start = clock();
    std::uint32_t iterations = 0;
    while (clock() - start < 5 && iterations < 200000) {
        wide.fetch_add(3);
        narrow.fetch_add(1);
        ++iterations;
    }
    if (clock() - start < 5)
        return 1;
    if (wide.load() != 3ull * iterations)
        return 2;
    if (narrow.load() != static_cast<std::uint16_t>(iterations))
        return 3;

    // Compare-exchange loops on the eight-byte value count the same way.
    std::uint64_t expected = wide.load();
    for (std::uint32_t round = 0; round < 1000; ++round) {
        while (!wide.compare_exchange_weak(expected, expected + 1)) {
        }
    }
    if (wide.load() != 3ull * iterations + 1000)
        return 4;
    return 0;
}
