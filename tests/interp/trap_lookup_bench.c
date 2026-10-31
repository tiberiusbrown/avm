/* Lookup benchmark fixture. Each round, the host writes a probe count and program
 * addresses once the image reports ready, then sets go. main looks each probe up
 * with __avm_trap_lookup, and the host times every call. The probes name ordinary
 * functions, a long-named function, and high-address functions. */
#include <avm.h>
#include <avm/trap.h>

#define BENCH_READY ((volatile uint8_t *)0x0300)
#define BENCH_GO ((volatile uint8_t *)0x0301)
#define BENCH_DONE ((volatile uint8_t *)0x0302)
#define BENCH_COUNT ((volatile uint8_t *)0x0303)
#define BENCH_PROBES ((volatile uint32_t *)0x0400)
#define BENCH_RESULTS ((avm_trap_location_t *)0x0500)
#define BENCH_KEEP ((volatile uint8_t *)0x0304)

__attribute__((noinline)) void bench_probe_00(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_01(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_02(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_03(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_04(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_05(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_06(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_07(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_08(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_09(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_10(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_11(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_12(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_13(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_14(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_15(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_16(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_17(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_18(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_19(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_20(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_21(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_22(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_23(void) {
    __asm__ volatile("");
}

__attribute__((noinline)) void bench_probe_with_a_deliberately_long_identifier_for_name_length_measurement_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx(void) {
    __asm__ volatile("");
}

__attribute__((noinline, section(".high_text"))) void bench_high_0(void) {
    __asm__ volatile("");
}

__attribute__((noinline, section(".high_text"))) void bench_high_1(void) {
    __asm__ volatile("");
}

__attribute__((noinline, section(".high_text"))) void bench_high_2(void) {
    __asm__ volatile("");
}

__attribute__((noinline, section(".high_text"))) void bench_high_3(void) {
    __asm__ volatile("");
}

int main(void) {
    uint8_t i;
    /* The host never sets BENCH_KEEP. The call keeps every probe function linked. */
    if (*BENCH_KEEP == 0x5a) {
        bench_probe_00();
        bench_probe_01();
        bench_probe_02();
        bench_probe_03();
        bench_probe_04();
        bench_probe_05();
        bench_probe_06();
        bench_probe_07();
        bench_probe_08();
        bench_probe_09();
        bench_probe_10();
        bench_probe_11();
        bench_probe_12();
        bench_probe_13();
        bench_probe_14();
        bench_probe_15();
        bench_probe_16();
        bench_probe_17();
        bench_probe_18();
        bench_probe_19();
        bench_probe_20();
        bench_probe_21();
        bench_probe_22();
        bench_probe_23();
        bench_probe_with_a_deliberately_long_identifier_for_name_length_measurement_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx();
        bench_high_0();
        bench_high_1();
        bench_high_2();
        bench_high_3();
    }
    for (;;) {
        *BENCH_READY = 1;
        while (*BENCH_GO == 0) {
        }
        *BENCH_READY = 0;
        for (i = 0; i < *BENCH_COUNT; ++i)
            __avm_trap_lookup(BENCH_PROBES[i], &BENCH_RESULTS[i]);
        *BENCH_DONE = 1;
        while (*BENCH_GO != 0) {
        }
        *BENCH_DONE = 0;
    }
    return 0;
}
