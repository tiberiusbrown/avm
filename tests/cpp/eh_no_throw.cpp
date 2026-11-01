// Built with -fexceptions, but it never throws or catches. Nothing references
// the exception runtime, so the image must contain no AVEH3 block and no
// __avm_eh_metadata_ptr anchor.
extern "C" int avm_test_main(void);

namespace {

__attribute__((noinline)) int add_three(int value) {
    return value + 3;
}

} // namespace

extern "C" int avm_test_main(void) {
    return add_three(0) == 3 ? 0 : 1;
}
