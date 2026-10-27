#include <avm/runtime.h>
#include <avm/pgmspace.h>
#include <stdint.h>

/* LLD coalesces the compiler's five-byte local slots and optional atexit
 * capacity into one LIFO. Plain C needs only packed code pointers and the
 * atexit count. Absolute layout constants occupy no guest RAM. */
typedef void (*callback)(void);
_Static_assert(sizeof(callback) == 3, "AVM callbacks must remain packed 24-bit pointers");
extern uint8_t __avm_local_dtor_slots_start[], __avm_local_dtor_slots_end[];
extern uint8_t __avm_termination_slots_end[];
extern const char __avm_termination_entry_size;
extern uint8_t *__avm_termination_next;
extern uint16_t __avm_termination_phase;
extern uint8_t __avm_atexit_count __attribute__((weak));
extern const callback AVM_PROGMEM __fini_array_start[], __fini_array_end[];

static int mixed(void) {
    return (uintptr_t)&__avm_termination_entry_size == 5;
}

static uint8_t *next(void) {
    return __avm_termination_next ? __avm_termination_next
                                 : __avm_local_dtor_slots_start;
}

static void append(callback destroy, uint8_t is_exit) {
    uint8_t *entry = next();
    if (entry == __avm_termination_slots_end)
        avm_halt();
    *(callback *)entry = destroy;
    *(uint16_t *)(entry + 3) = (__avm_termination_phase << 1) | is_exit;
    __avm_termination_next = entry + 5;
}

/* Keep the registration boundary visible to stack metadata, including LTO. */
__attribute__((noinline))
void __avm_register_local_dtor(callback destroy, void *slot) {
    /* The caller's slot reference keeps its reserved capacity alive under GC. */
    (void)slot;
    append(destroy, 0);
}

void __avm_register_exit_callback(callback destroy) {
    if (mixed())
        append(destroy, 1);
    else
        ((callback *)__avm_local_dtor_slots_start)[__avm_atexit_count] = destroy;
}

/* A fini-array position is a stable construction phase across translation
 * units and init priorities. Passing code pointers keeps the compiler ABI
 * independent of final array placement and also handles early exit. */
static uint16_t phase_of(callback destroy) {
    const callback AVM_PROGMEM *entry = __fini_array_start;
    while (entry != __fini_array_end) {
        if (*entry++ == destroy)
            return (uint16_t)(entry - __fini_array_start);
    }
    avm_halt();
}

void __avm_note_global_ctor(callback destroy) {
    __avm_termination_phase = phase_of(destroy);
}

void __avm_run_local_dtors(void) {
    if (!mixed()) {
        if (&__avm_atexit_count)
            while (__avm_atexit_count) {
                callback destroy = ((callback *)__avm_local_dtor_slots_start)
                    [--__avm_atexit_count];
                __builtin_avm_stack_dispatch(destroy, 2);
            }
        return;
    }
    /* Explicit exit with only nonlocal objects has no dynamic table/pointer. */
    if ((uintptr_t)__avm_termination_slots_end ==
        (uintptr_t)__avm_local_dtor_slots_start)
        return;
    while (next() != __avm_local_dtor_slots_start) {
        uint8_t *entry = next() - 5;
        uint16_t tag = *(uint16_t *)(entry + 3);
        if ((tag >> 1) < __avm_termination_phase)
            break;
        callback destroy = *(callback *)entry;
        /* Consume before calling: new registrations may reuse this slot. */
        __avm_termination_next = entry;
        if (tag & 1)
            --__avm_atexit_count;
        __builtin_avm_stack_dispatch(destroy, 2);
    }
}

int __avm_before_global_dtor(callback destroy) {
    uint16_t phase = phase_of(destroy);
    if (phase > __avm_termination_phase)
        return 0; /* Construction had not completed when exit was called. */
    __avm_termination_phase = phase;
    __avm_run_local_dtors();
    __avm_termination_phase = phase - 1;
    return 1;
}
