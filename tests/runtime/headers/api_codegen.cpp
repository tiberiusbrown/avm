#include <avm.h>
#include <stdio.h>
#include <string.h>

void *ram_copy(void *d, const void *s, size_t n) {
  return memcpy(d, s, n);
}
void *explicit_copy(void *d, const void AVM_PROGMEM *s, size_t n) {
  return memcpy_P(d, s, n);
}
size_t ram_length(const char *s) { return strlen(s); }
size_t explicit_length(const char AVM_PROGMEM *s) { return strlen_P(s); }
avm_text_cursor_t unified_draw(const char AVM_PROGMEM *s) {
  return avm_draw_text(1, 2, s);
}
avm_text_cursor_t explicit_draw(const char AVM_PROGMEM *s) {
  return avm_draw_text_P(1, 2, s);
}
avm_text_cursor_t unified_drawf(const char AVM_PROGMEM *s, int n) {
  return avm_draw_textf(1, 2, s, n);
}
avm_text_cursor_t explicit_drawf(const char AVM_PROGMEM *s, int n) {
  return avm_draw_textf_P(1, 2, s, n);
}
int ram_snprintf(char *d, size_t n, const char *s, int x) {
  return snprintf(d, n, s, x);
}
int explicit_snprintf(char *d, size_t n, const char AVM_PROGMEM *s, int x) {
  return snprintf_P(d, n, s, x);
}

// RAM entry points use AS0, while explicit program-memory calls retain AS1.
// IR: call{{.*}} @llvm.avm.memcpy(
// IR: call addrspace(1) void @llvm.memcpy.p0.p1.i16
// IR: call{{.*}} @llvm.avm.strlen(
// IR: call{{.*}} @llvm.avm.strlen.p(
// IR-COUNT-2: call{{.*}} @llvm.avm.draw.text.p
// IR-COUNT-2: call{{.*}} @llvm.avm.draw.textfv.p
// IR: call{{.*}} @llvm.avm.vsnprintf(
// IR: call{{.*}} @llvm.avm.vsnprintf.p(
// ASM: sys memcpy
// ASM: sys memcpy_p
// ASM: sys strlen
// ASM: sys strlen_p
// ASM-COUNT-2: sys draw_text_p
// ASM-COUNT-2: sys draw_textfv_p
// ASM: sys vsnprintf
// ASM: sys vsnprintf_p
// ASM-NOT: {{^[ \t]*call}}
