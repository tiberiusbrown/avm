/* Split multiples are defined once alongside the large reducer's table. */
#ifndef AVM_SMALL_PIO2_H
#define AVM_SMALL_PIO2_H
struct avm_small_multiple { float high, low; };
#ifdef __AVM__
extern const __attribute__((address_space(1))) struct avm_small_multiple avm_small_pio2[653];
#else
extern const struct avm_small_multiple avm_small_pio2[653];
#endif
#endif
