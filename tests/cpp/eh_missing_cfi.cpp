// Negative fixture for a frame without unwind information. missing_cfi_middle is
// assembly with no .cfi directives, so the linker writes no FDE for it. The
// throw crosses that frame while it searches for a handler. The unwinder must
// fail without entering the catch above the frame. The output is M for the
// start, then H from the halt report. C would mean the catch ran, which is wrong.
#include <avm.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);
extern "C" void missing_cfi_middle(void);

// The runtime's halt spins, so the harness would wait for its time limit. Report
// the termination, then break, as the termination fixtures do.
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

// The frame has no CFI, so the unwinder cannot describe it. The records below
// give the linker its stack data: the frame size, the call, and a function marker.
__asm__(
    ".section .text.missing_cfi_middle,\"ax\",@progbits\n"
    ".globl missing_cfi_middle\n"
    ".type missing_cfi_middle, @function\n"
    "missing_cfi_middle:\n"
    "    call missing_cfi_thrower\n"
    "    ret\n"
    ".size missing_cfi_middle, .-missing_cfi_middle\n"
    ".pushsection .stack_sizes,\"o\",@progbits,.text.missing_cfi_middle\n"
    ".3byte missing_cfi_middle\n"
    ".uleb128 0\n"
    ".popsection\n"
    ".pushsection .avm.stackcalls,\"o\",@progbits,.text.missing_cfi_middle\n"
    ".3byte missing_cfi_middle\n"
    ".3byte missing_cfi_thrower\n"
    ".short 0\n"
    ".byte 0\n"
    ".popsection\n"
    ".pushsection .avm.stackcalls,\"o\",@progbits,.text.missing_cfi_middle\n"
    ".3byte missing_cfi_middle\n"
    ".3byte 0\n"
    ".short 0\n"
    ".byte 8\n"
    ".popsection\n");

namespace {

int catches = 0;

extern "C" __attribute__((noinline)) void missing_cfi_thrower(void) {
    throw 7;
}

__attribute__((noinline)) int above_missing_frame() {
    try {
        missing_cfi_middle();
    } catch (...) {
        ++catches;
        return 1;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('M');
    above_missing_frame();
    avm_debug_putc('X');
    return 0;
}
