#ifndef AVM_TRAP_H
#define AVM_TRAP_H

#include <stdint.h>

#ifdef __cplusplus
#include <cstddef>
extern "C" {
#else
#include <stddef.h>
#endif

/* Original 256-byte guest stack, copied by __avm_trap_entry. */
#define AVM_TRAP_STACK_SNAPSHOT_ADDR 0x0100
/* Interpreter-written 32-byte trap context. */
#define AVM_TRAP_CONTEXT_ADDR 0x0200
/* Original stack, reused as the fresh reporter stack after the copy. */
#define AVM_TRAP_STACK_BASE 0x0900
/* Reset guest SP established before __avm_trap_report runs. */
#define AVM_TRAP_STACK_TOP 0x0A00
#define AVM_TRAP_STACK_SIZE 256

#define AVM_TRAP_REASON_STACK_OVERFLOW 1
#define AVM_TRAP_REASON_INVALID_PRIMARY 2
#define AVM_TRAP_REASON_INVALID_SECONDARY 3

/* Packed layout written by the interpreter at AVM_TRAP_CONTEXT_ADDR. */
typedef struct __attribute__((packed)) avm_trap_context {
    uint8_t pc[3];        /* Raw interpreter VM_PC, little endian. */
    uint8_t reason;       /* AVM_TRAP_REASON_*. */
    uint16_t sp;          /* Original guest SP, little endian. */
    uint8_t flags;        /* Guest CC / GPIOR0. */
    uint8_t reserved0;    /* Zero. */
    uint16_t regs[8];     /* Guest r0-r7, little endian. */
    uint8_t reserved1[8]; /* Zero. */
} avm_trap_context_t;

#ifdef __cplusplus
static_assert(sizeof(avm_trap_context_t) == 32,
              "avm_trap_context_t must be 32 bytes");
static_assert(offsetof(avm_trap_context_t, pc) == 0, "pc offset");
static_assert(offsetof(avm_trap_context_t, reason) == 3, "reason offset");
static_assert(offsetof(avm_trap_context_t, sp) == 4, "sp offset");
static_assert(offsetof(avm_trap_context_t, flags) == 6, "flags offset");
static_assert(offsetof(avm_trap_context_t, regs) == 8, "regs offset");
static_assert(offsetof(avm_trap_context_t, reserved1) == 24,
              "reserved1 offset");
#else
_Static_assert(sizeof(avm_trap_context_t) == 32,
               "avm_trap_context_t must be 32 bytes");
_Static_assert(offsetof(avm_trap_context_t, pc) == 0, "pc offset");
_Static_assert(offsetof(avm_trap_context_t, reason) == 3, "reason offset");
_Static_assert(offsetof(avm_trap_context_t, sp) == 4, "sp offset");
_Static_assert(offsetof(avm_trap_context_t, flags) == 6, "flags offset");
_Static_assert(offsetof(avm_trap_context_t, regs) == 8, "regs offset");
_Static_assert(offsetof(avm_trap_context_t, reserved1) == 24,
               "reserved1 offset");
#endif

/* Default fatal-trap reporter. Never returns. */
__attribute__((noreturn)) void __avm_trap_report(
    avm_trap_context_t const *context);

#ifdef __cplusplus
}
#endif

#endif
