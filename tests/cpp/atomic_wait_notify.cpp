// C++ atomic waiting and notification. Every wait below sees a value that already differs from the
// expected one, so it returns on its first poll. A wait on a value that still matched would return
// only after an interrupt changed the value, so the fixture never makes one. Notifications have no
// waiter to wake, so they only have to link and run.
#include <atomic>
#include <cstdint>

extern "C" int avm_test_main(void);

static std::atomic<int> counter;
static std::atomic<std::int64_t> wide;
static std::atomic<int *> pointer_value;
static std::atomic_flag ready = ATOMIC_FLAG_INIT;
static int target;

extern "C" int avm_test_main(void) {
    counter.store(1);
    counter.wait(0);
    counter.wait(0, std::memory_order_acquire);
    std::atomic_wait(&counter, 0);
    std::atomic_wait_explicit(&counter, 0, std::memory_order_relaxed);

    counter.notify_one();
    counter.notify_all();
    std::atomic_notify_one(&counter);
    std::atomic_notify_all(&counter);
    if (counter.load() != 1)
        return 1;

    wide.store(-5);
    wide.wait(0);
    std::atomic_wait(&wide, 3);
    wide.notify_all();
    if (wide.load() != -5)
        return 2;

    pointer_value.store(&target);
    pointer_value.wait(nullptr);
    pointer_value.notify_one();
    if (pointer_value.load() != &target)
        return 3;

    ready.test_and_set();
    ready.wait(false);
    ready.wait(false, std::memory_order_acquire);
    ready.notify_one();
    ready.notify_all();
    if (!ready.test())
        return 4;

    // A value that changes between wait calls is observed by the next wait.
    counter.store(7);
    counter.wait(1);
    if (counter.load() != 7)
        return 5;
    return 0;
}
