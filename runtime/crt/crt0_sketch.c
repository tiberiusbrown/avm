extern void setup(void);
extern void loop(void);

__attribute__((noreturn, used, section(".text._start")))
void _start(void) {
    setup();
    for (;;)
        loop();
}
