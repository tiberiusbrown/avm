// A rethrow from a call site that has no unwind metadata. The stub below is assembled
// without CFI and without an AVEH5 record, so its rethrow continuation names no frame. The
// caught exception is live when the stub calls __cxa_rethrow, so the runtime must read the
// rethrow site, find that it names no frame, and terminate without a handler or a cleanup.
// The output is the C marker, then the halt report.
#include <avm.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);
extern "C" void rethrow_from_bare_stub(void);

// The bare stub. It has no .stack_sizes entry, no CFI, and no call record, so the return
// PC of its __cxa_rethrow call lies outside every function that the unwinder can read.
asm(R"(
    .section .text.rethrow_from_bare_stub,"ax",@progbits
    .globl rethrow_from_bare_stub
    .type rethrow_from_bare_stub, @function
rethrow_from_bare_stub:
    call __cxa_rethrow
    ret
    .size rethrow_from_bare_stub, .-rethrow_from_bare_stub
)");

// The runtime's halt spins, so the harness would wait for its time limit. Report
// the termination, then break, as the termination fixtures do.
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

extern "C" int avm_test_main(void) {
    try {
        throw 8;
    } catch (int) {
        avm_debug_putc('C');
        rethrow_from_bare_stub();
        avm_debug_putc('X');
    }
    return 0;
}
