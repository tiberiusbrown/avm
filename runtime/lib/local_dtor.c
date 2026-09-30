#include <avm/runtime.h>
#include <stdint.h>

/* One five-byte slot is linked for each function-local static destructor. */
struct avm_local_dtor_entry {
    void (*destroy)(void);
    uint16_t global_phase;
} __attribute__((packed));

_Static_assert(sizeof(struct avm_local_dtor_entry) == 5,
               "AVM local destructor entries must be five bytes");

extern struct avm_local_dtor_entry __avm_local_dtor_slots_start[];
extern struct avm_local_dtor_entry __avm_local_dtor_slots_end[];

static struct avm_local_dtor_entry *next_slot =
    __avm_local_dtor_slots_start;
static uint16_t global_phase;

void __avm_register_local_dtor(void (*destroy)(void), void *slot) {
    /* The reference to slot keeps its storage alive under --gc-sections. */
    (void)slot;
    if (next_slot == __avm_local_dtor_slots_end)
        avm_halt();
    next_slot->destroy = destroy;
    next_slot->global_phase = global_phase;
    ++next_slot;
}

void __avm_note_global_ctor(void) {
    ++global_phase;
}

void __avm_run_local_dtors(void) {
    while (next_slot != __avm_local_dtor_slots_start &&
           (next_slot - 1)->global_phase == global_phase) {
        --next_slot;
        next_slot->destroy();
    }
}

void __avm_before_global_dtor(void) {
    __avm_run_local_dtors();
    if (global_phase)
        --global_phase;
}
