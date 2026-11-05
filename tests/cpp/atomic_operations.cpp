// C++ atomic types and operations on AVM's value representations. One and two-byte
// integers, and four-byte integers, are lock-free. Eight-byte integers use the runtime
// helpers. RAM pointers are two bytes. Code and program-memory pointers are three bytes and
// use the generic helpers. The state lives at file scope because the guest stack is 256 bytes.
#include <atomic>
#include <cstdint>
#include <type_traits>

#include <avm/pgmspace.h>

extern "C" int avm_test_main(void);

// The lock-free properties follow docs/arch.md section 57.1.
static_assert(ATOMIC_BOOL_LOCK_FREE == 2 && ATOMIC_CHAR_LOCK_FREE == 2);
static_assert(ATOMIC_SHORT_LOCK_FREE == 2 && ATOMIC_INT_LOCK_FREE == 2);
static_assert(ATOMIC_LONG_LOCK_FREE == 2 && ATOMIC_POINTER_LOCK_FREE == 2);
static_assert(ATOMIC_LLONG_LOCK_FREE == 1);
static_assert(std::atomic<std::int8_t>::is_always_lock_free);
static_assert(std::atomic<std::int16_t>::is_always_lock_free);
static_assert(std::atomic<std::int32_t>::is_always_lock_free);
static_assert(std::atomic<int *>::is_always_lock_free);
static_assert(!std::atomic<std::int64_t>::is_always_lock_free);
static_assert(sizeof(std::atomic<std::int64_t>) == 8);
static_assert(sizeof(void (*)()) == 3);
// libc++ pads an atomic whose value is three bytes, so only the value width is required.
static_assert(sizeof(std::atomic<void (*)()>) >= sizeof(void (*)()));
static_assert(sizeof(const char AVM_PROGMEM *) == 3);
static_assert(std::is_same_v<std::atomic_int, std::atomic<int>>);
static_assert(std::is_same_v<std::atomic_uint_least16_t, std::atomic<std::uint_least16_t>>);
static_assert(std::is_same_v<std::atomic_int_fast8_t, std::atomic<std::int_fast8_t>>);
static_assert(std::memory_order_relaxed != std::memory_order_seq_cst);
static_assert(std::memory_order_acquire != std::memory_order_release);

static std::atomic<std::int8_t> byte_value;
static std::atomic<std::uint16_t> half_value;
static std::atomic<std::int32_t> word_value;
static std::atomic<std::int64_t> long_value;
static std::atomic<int *> pointer_value;
static std::atomic<void (*)()> code_value;
static std::atomic<const char AVM_PROGMEM *> program_value;
static std::atomic<bool> flag_value;
static std::atomic_flag flag = ATOMIC_FLAG_INIT;

static int ram_target[2] = {100, 200};
static const char AVM_PROGMEM program_text[] = "flash";
static int code_calls;

static void code_target() {
    ++code_calls;
}

// One-byte atomics: stores, exchange, compare-exchange, fetch operations, and operators.
static int check_one_byte() {
    // One byte: stores, exchange, weak and strong compare-exchange, fetch operations, and
    // operators, with signed values.
    byte_value.store(10);
    if (byte_value.load() != 10)
        return 1;
    if (byte_value.exchange(-3) != 10 || byte_value.load() != -3)
        return 2;
    std::int8_t expected = 5;
    if (byte_value.compare_exchange_strong(expected, 1) || expected != -3)
        return 3;
    expected = -3;
    while (!byte_value.compare_exchange_weak(expected, 1)) {
        if (expected != -3)
            return 4;
    }
    if (byte_value.fetch_add(4) != 1 || byte_value.load() != 5)
        return 5;
    if (byte_value.fetch_sub(6) != 5 || byte_value.load() != -1)
        return 6;
    if (byte_value.fetch_and(0x0F) != -1 || byte_value.load() != 0x0F)
        return 7;
    if (byte_value.fetch_or(0x40) != 0x0F || byte_value.load() != 0x4F)
        return 8;
    if (byte_value.fetch_xor(0x0F) != 0x4F || byte_value.load() != 0x40)
        return 9;
    if (byte_value++ != 0x40 || --byte_value != 0x40)
        return 10;
    byte_value += 2;
    byte_value -= 1;
    byte_value |= 0x02;
    byte_value &= 0x43;
    byte_value ^= 0x40;
    if (byte_value != 0x03)
        return 11;

    return 0;
}

// Two-byte atomics: wrap-around in both directions, and compare-exchange.
static int check_two_bytes() {
    // Two bytes: wrap-around in both directions.
    half_value.store(65535);
    if (half_value.fetch_add(2) != 65535 || half_value.load() != 1)
        return 12;
    if (half_value.fetch_sub(2) != 1 || half_value.load() != 65535)
        return 13;
    std::uint16_t want = 65535;
    if (!half_value.compare_exchange_strong(want, 9) || half_value.load() != 9)
        return 14;

    return 0;
}

// Four-byte atomics: exchange and fetch-add with wrap-around.
static int check_four_bytes() {
    // Four bytes.
    word_value.store(0x12345678);
    if (word_value.exchange(-1) != 0x12345678 || word_value.load() != -1)
        return 15;
    if (word_value.fetch_add(0x10000) != -1 || word_value.load() != 0xFFFF)
        return 16;

    return 0;
}

// Eight-byte atomics, which use the runtime helpers. Comparisons cover every byte.
static int check_eight_bytes() {
    // Eight bytes use the runtime helpers, and comparisons cover every byte.
    long_value.store(0x1122334455667788LL);
    if (long_value.load() != 0x1122334455667788LL)
        return 17;
    if (long_value.exchange(0x0102030405060708LL) != 0x1122334455667788LL)
        return 18;
    std::int64_t wanted = 0x0102030405060708LL;
    if (!long_value.compare_exchange_strong(wanted, 0x7000000000000001LL))
        return 19;
    wanted = 0x0102030405060708LL;   // differs from the stored value only in the high byte
    if (long_value.compare_exchange_strong(wanted, 0) || wanted != 0x7000000000000001LL)
        return 20;
    if (long_value.fetch_add(0x0000000100000001LL) != 0x7000000000000001LL)
        return 21;
    if (long_value.fetch_sub(1) != 0x7000000100000002LL)
        return 22;
    if (long_value.fetch_and(0x00000000FFFFFFFFLL) != 0x7000000100000001LL)
        return 23;
    if (long_value.fetch_or(0x0000000100000000LL) != 0x00000001LL)
        return 24;
    if (long_value.fetch_xor(0x0000000100000000LL) != 0x0000000100000001LL)
        return 25;
    if (long_value.load() != 0x00000001LL)
        return 26;

    return 0;
}

// RAM pointers are two bytes, so they are lock-free.
static int check_ram_pointer() {
    // A RAM pointer is two bytes, so it is lock-free.
    pointer_value.store(&ram_target[0]);
    if (pointer_value.fetch_add(1) != &ram_target[0] || pointer_value.load() != &ram_target[1])
        return 27;
    if (pointer_value.fetch_sub(1) != &ram_target[1] || *pointer_value.load() != 100)
        return 28;

    return 0;
}

// Code pointers are three bytes, so they use the generic helpers.
static int check_code_pointer() {
    // A code pointer is three bytes and is used through the generic helpers.
    code_value.store(code_target);
    if (code_value.load() != code_target)
        return 29;
    code_value.load()();
    void (*previous)() = code_value.exchange(nullptr);
    if (previous != code_target || code_value.load() != nullptr || code_calls != 1)
        return 30;

    return 0;
}

// Program-memory pointers are three bytes, and the object reads through the pointer.
static int check_program_pointer() {
    // A program-memory pointer is three bytes, and its object reads through the pointer.
    program_value.store(program_text);
    if (program_value.load()[0] != 'f' || program_value.load()[4] != 'h')
        return 31;
    if (program_value.exchange(nullptr) != program_text || program_value.load() != nullptr)
        return 32;

    return 0;
}

// Booleans and atomic_flag.
static int check_flag() {
    // Booleans and atomic_flag.
    flag_value.store(true);
    if (!flag_value.exchange(false) || flag_value.load())
        return 33;
    if (flag.test_and_set() || !flag.test_and_set())
        return 34;
    flag.clear();
    if (flag.test())
        return 35;

    return 0;
}

// atomic_ref updates the referenced object.
static int check_atomic_ref() {
    // atomic_ref updates the object itself.
    int plain = 5;
    std::atomic_ref<int> ref(plain);
    ref.fetch_add(3);
    if (plain != 8 || ref.load() != 8)
        return 36;
    int ref_expected = 8;
    if (!ref.compare_exchange_strong(ref_expected, 9) || plain != 9)
        return 37;

    return 0;
}

// Free functions, explicit memory orders, and fences.
static int check_free_functions() {
    // Free functions, explicit orders, and fences.
    std::atomic_store(&word_value, 7);
    if (std::atomic_load(&word_value) != 7)
        return 38;
    if (std::atomic_exchange(&word_value, 9) != 7 || word_value.load() != 9)
        return 39;
    std::int32_t free_expected = 9;
    if (!std::atomic_compare_exchange_strong(&word_value, &free_expected, 10))
        return 40;
    if (std::atomic_fetch_add(&word_value, 1) != 10)
        return 41;
    if (std::atomic_fetch_or_explicit(&word_value, 0x100, std::memory_order_acq_rel) != 11)
        return 42;
    if (std::atomic_load_explicit(&word_value, std::memory_order_acquire) != 0x10B)
        return 43;
    std::atomic_store_explicit(&word_value, 0, std::memory_order_release);
    std::atomic_thread_fence(std::memory_order_seq_cst);
    std::atomic_signal_fence(std::memory_order_acquire);
    if (word_value.load(std::memory_order_relaxed) != 0)
        return 44;
    return 0;
}

extern "C" int avm_test_main(void) {
    if (int status = check_one_byte())
        return status;
    if (int status = check_two_bytes())
        return status;
    if (int status = check_four_bytes())
        return status;
    if (int status = check_eight_bytes())
        return status;
    if (int status = check_ram_pointer())
        return status;
    if (int status = check_code_pointer())
        return status;
    if (int status = check_program_pointer())
        return status;
    if (int status = check_flag())
        return status;
    if (int status = check_atomic_ref())
        return status;
    if (int status = check_free_functions())
        return status;
    return 0;
}
