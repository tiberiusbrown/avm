extern "C" int main();
struct G {
    ~G() { asm volatile("" : : "r"(this) : "memory"); }
};
int main() { static G g; }
