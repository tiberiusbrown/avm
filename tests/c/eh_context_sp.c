#include "../../runtime/lib/eh_unwind_internal.h"

_Static_assert(sizeof(((struct avm_eh_context *)0)->sp_depth) == 1,
               "stored exception SP must occupy one byte");
_Static_assert(sizeof(struct avm_eh_context) == AVM_EH_CONTEXT_SIZE,
               "context size matches its byte layout");

int avm_test_main(void) {
    struct avm_eh_context context = {0};
    context.pc_low = 0x1234;
    context.pc_high = 0xab;
    context.r[0] = 0x5678;
    context.r[3] = 0x9abc;
    for (uint16_t depth = 0; depth <= 255; ++depth) {
        uint16_t sp = AVM_EH_STACK_TOP - depth;
        context.sp_depth = 0x55;
        uint8_t accepted = avm_eh_set_context_sp(&context, sp);
        if (accepted != (depth <= AVM_EH_SP_MAX_DEPTH))
            return 1;
        if (accepted && (context.sp_depth != depth || avm_eh_context_sp(&context) != sp ||
                         avm_eh_context_has_frame(&context) != (depth != 0)))
            return 2;
        if (!accepted && context.sp_depth != 0x55)
            return 3;
    }
    const uint16_t invalid[] = {0, AVM_EH_STACK_BASE - 1, AVM_EH_STACK_BASE,
                                AVM_EH_STACK_TOP + 1, 0xffff};
    for (uint8_t i = 0; i < sizeof invalid / sizeof invalid[0]; ++i)
        if (avm_eh_set_context_sp(&context, invalid[i]))
            return 4;
    context.sp_depth = 254;
    if (avm_eh_context_has_frame(&context))
        return 5;
    context.sp_depth = 255;
    if (avm_eh_context_has_frame(&context))
        return 6;
    return context.pc_low != 0x1234 || context.pc_high != 0xab ||
           context.r[0] != 0x5678 || context.r[3] != 0x9abc;
}
