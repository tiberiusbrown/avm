extern "C" int main();
#include <stdlib.h>
struct G { ~G(); };
G::~G() { asm volatile("" : : "r"(this) : "memory"); }
G g;
int main() { return atexit(+[]{}); }
