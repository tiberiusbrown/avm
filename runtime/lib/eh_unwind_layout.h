/* Byte offsets shared by the target runtime and host-side exception probes.
 * The target C structures are checked against these constants in eh_cxa.c
 * and eh_unwind.c. Assembly shims use the same offsets explicitly. */
#ifndef AVM_EH_UNWIND_LAYOUT_H
#define AVM_EH_UNWIND_LAYOUT_H

#define AVM_EH_CONTEXT_SIZE 12
#define AVM_EH_CONTEXT_SP_OFFSET 0
#define AVM_EH_CONTEXT_PC_OFFSET 1
#define AVM_EH_CONTEXT_PC_HIGH_OFFSET 3
#define AVM_EH_CONTEXT_R_OFFSET 4

#define AVM_EH_TYPE_OFFSET 12
#define AVM_EH_DESTRUCTOR_OFFSET 15
#define AVM_EH_SIZE_OFFSET 18
#define AVM_EH_STATE_OFFSET 20
#define AVM_EH_RESUME_OFFSET 21
#define AVM_EH_SELECTOR_OFFSET 33
#define AVM_EH_ADJUSTMENT_OFFSET 35
#define AVM_EH_BLOCK_OFFSET 37
#define AVM_EH_BLOCK_END_OFFSET 40
#define AVM_EH_FUNCTION_COUNT_OFFSET 43
#define AVM_EH_CONVERTED_OFFSET 45
#define AVM_EH_CONVERSION_OFFSET 48
#define AVM_EH_NEXT_OFFSET 49
#define AVM_EH_REFCOUNT_OFFSET 51
#define AVM_EH_HEADER_SIZE 53

#define AVM_EH_STACK_TOP 0x0a00
#define AVM_EH_STACK_BASE 0x0900
#define AVM_EH_SP_MAX_DEPTH 253
#define AVM_EH_STATE_MASK 0x7f
#define AVM_EH_RETHROW_PENDING 0x80

#endif
