set(AVM_TERM_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/fixtures")
set(AVM_TERM_RESULT_DIR "${CMAKE_CURRENT_BINARY_DIR}/results")
set(AVM_TERM_HELPER
    "${CMAKE_CURRENT_SOURCE_DIR}/RunLinkFixture.cmake")

function(avm_term_source stem extension content)
    file(GENERATE
        OUTPUT "${AVM_TERM_SOURCE_DIR}/${stem}.${extension}"
        CONTENT "${content}"
    )
endfunction()

avm_term_source(unused c [=[
int main(void) { return 0; }
]=])
avm_term_source(exit_only c [=[
#include <stdlib.h>
int main(void) { exit(5); }
]=])
avm_term_source(immediate_only c [=[
#include <stdlib.h>
int main(void) { _Exit(5); }
]=])
avm_term_source(abort_only c [=[
#include <stdlib.h>
int main(void) { abort(); }
]=])
avm_term_source(plain c [=[
#include <stdlib.h>
static void f(void) {}
int main(void) { return atexit(f); }
]=])
avm_term_source(mixed cpp [=[
extern "C" int main();
#include <stdlib.h>
struct G { ~G(); };
G::~G() { asm volatile("" : : "r"(this) : "memory"); }
G g;
int main() { return atexit(+[]{}); }
]=])
avm_term_source(local_only cpp [=[
extern "C" int main();
struct G {
    ~G() { asm volatile("" : : "r"(this) : "memory"); }
};
int main() { static G g; }
]=])
avm_term_source(globals_only cpp [=[
extern "C" int main();
#include <stdlib.h>
struct G { ~G(); };
G::~G() { asm volatile("" : : "r"(this) : "memory"); }
G g;
int main() { return 0; }
]=])
avm_term_source(cpp_exit_only cpp [=[
extern "C" int main();
#include <stdlib.h>
struct G { ~G(); };
G::~G() { asm volatile("" : : "r"(this) : "memory"); }
G g;
int main() { exit(3); }
]=])
avm_term_source(bare__Exit c [=[
#include <stdlib.h>
void _start(void) { _Exit(5); }
]=])
avm_term_source(bare_abort c [=[
#include <stdlib.h>
void _start(void) { abort(); }
]=])
avm_term_source(dead_registration c [=[
#include <stdlib.h>
static void f(void) {}
void dead(void) { atexit(f); }
int main(void) { return 0; }
]=])
avm_term_source(safe c [=[
#include <stdlib.h>
volatile unsigned char input;
__attribute__((noinline))
static void a(void) {
    volatile unsigned char x[20];
    x[input % 20] = 1;
}
__attribute__((noinline))
static void b(void) {
    volatile unsigned char x[30];
    x[input % 30] = 2;
}
int main(void) { return atexit(input ? a : b); }
]=])
avm_term_source(registrar_pointer c [=[
#include <stdlib.h>
volatile unsigned char input;
__attribute__((noinline))
static void a(void) {
    volatile unsigned char x[20];
    x[input % 20] = 1;
}
__attribute__((noinline))
static void b(void) {
    volatile unsigned char x[30];
    x[input % 30] = 2;
}
int main(void) {
    int (*reg)(void (*)(void)) = atexit;
    return reg(input ? a : b);
}
]=])
avm_term_source(unknown c [=[
#include <stdlib.h>
void (*volatile target)(void);
int main(void) { return atexit(target); }
]=])
avm_term_source(overflow c [=[
#include <stdlib.h>
volatile unsigned char input;
__attribute__((noinline))
static void callback(void) {
    volatile unsigned char frame[240];
    frame[input % 240] = 1;
}
int main(void) { return atexit(callback); }
]=])

set(AVM_TERM_CHECK_OUTPUTS)

function(avm_term_case name source extension)
    cmake_parse_arguments(CASE
        "EXPECT_FAILURE"
        "CAPACITY;STARTUP"
        "FLAGS"
        ${ARGN}
    )

    if(CASE_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR
            "Unknown termination fixture options: "
            "${CASE_UNPARSED_ARGUMENTS}")
    endif()

    set(src "${AVM_TERM_SOURCE_DIR}/${source}.${extension}")
    set(elf "${AVM_TERM_RESULT_DIR}/${name}.elf")
    set(report "${AVM_TERM_RESULT_DIR}/${name}.log")

    if(extension STREQUAL "cpp")
        set(language_option -std=c++17)
    else()
        set(language_option -std=c99)
    endif()

    set(extra_options)
    if(DEFINED CASE_CAPACITY)
        list(APPEND extra_options
            "-Wl,--avm-atexit-capacity=${CASE_CAPACITY}")
    endif()
    if(CASE_STARTUP)
        list(APPEND extra_options "--avm-startup=${CASE_STARTUP}")
    endif()

    if(CASE_EXPECT_FAILURE)
        set(outputs "${report}")
    else()
        set(outputs "${elf}" "${report}")
    endif()

    add_custom_command(
        OUTPUT ${outputs}
        COMMAND "${CMAKE_COMMAND}"
            "-DAVM_REPORT:FILEPATH=${report}"
            "-DAVM_OUTPUT_ELF:FILEPATH=${elf}"
            "-DAVM_LINKER:FILEPATH=${AVM_SDK_BUILD_BIN}/avm-ld${CMAKE_EXECUTABLE_SUFFIX}"
            "-DAVM_EXPECT_FAILURE:BOOL=${CASE_EXPECT_FAILURE}"
            -P "${AVM_TERM_HELPER}"
            --
            "$<TARGET_FILE:clang>"
            --target=avm-unknown-arduboyfx
            -O2
            "${language_option}"
            "${src}"
            --avm-no-image
            "-B$<TARGET_FILE_DIR:lld>"
            "-Wl,--avm-print-stack-usage,--avm-print-stack-gaps"
            ${extra_options}
            ${CASE_FLAGS}
            -o "${elf}"
        DEPENDS
            avm_sdk
            "${src}"
            "${AVM_TERM_HELPER}"
        COMMENT "Linking AVM termination fixture ${name}"
        VERBATIM
    )

    list(APPEND AVM_TERM_CHECK_OUTPUTS ${outputs})
    set(AVM_TERM_CHECK_OUTPUTS
        "${AVM_TERM_CHECK_OUTPUTS}" PARENT_SCOPE)
endfunction()

avm_term_case(unused unused c CAPACITY 32)
avm_term_case(exit_only exit_only c CAPACITY 32)
avm_term_case(immediate_only immediate_only c CAPACITY 32)
avm_term_case(abort_only abort_only c CAPACITY 32)

foreach(capacity IN ITEMS 1 4 8 32 255)
    avm_term_case("plain_${capacity}" plain c CAPACITY "${capacity}")
endforeach()

avm_term_case(mixed_32 mixed cpp CAPACITY 32)
avm_term_case(mixed_4 mixed cpp CAPACITY 4)
avm_term_case(local_only local_only cpp)
avm_term_case(globals_only globals_only cpp)
avm_term_case(cpp_exit_only cpp_exit_only cpp)
avm_term_case(default_capacity plain c)
avm_term_case(bare__Exit bare__Exit c STARTUP none)
avm_term_case(bare_abort bare_abort c STARTUP none)

avm_term_case(invalid_0 plain c CAPACITY "0" EXPECT_FAILURE)
avm_term_case(invalid_neg1 plain c CAPACITY "-1" EXPECT_FAILURE)
avm_term_case(invalid_256 plain c CAPACITY "256" EXPECT_FAILURE)
avm_term_case(invalid_oops plain c CAPACITY "oops" EXPECT_FAILURE)
avm_term_case(invalid_1x plain c CAPACITY "1x" EXPECT_FAILURE)
avm_term_case(dead_registration dead_registration c)

foreach(opt IN ITEMS O0 O2 Oz)
    foreach(lto IN ITEMS OFF ON)
        set(label "${opt}")
        set(fixture_flags "-${opt}")
        if(lto)
            string(APPEND label "_lto")
            list(APPEND fixture_flags -flto=full)
        endif()

        avm_term_case("safe_${label}" safe c FLAGS ${fixture_flags})
        avm_term_case("registrar_pointer_${label}" registrar_pointer c FLAGS ${fixture_flags})
        avm_term_case("unknown_${label}" unknown c FLAGS ${fixture_flags})
        avm_term_case("overflow_${label}" overflow c EXPECT_FAILURE FLAGS ${fixture_flags})
    endforeach()
endforeach()

find_package(Python3 COMPONENTS Interpreter REQUIRED)
add_custom_target(avm_termination_checks
    COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_SOURCE_DIR}/check_link.py"
        --work "${AVM_TERM_RESULT_DIR}"
    DEPENDS
        avm_sdk
        ${AVM_TERM_CHECK_OUTPUTS}
        "${CMAKE_CURRENT_SOURCE_DIR}/check_link.py"
    COMMENT "Checking AVM termination RAM layout and callback stack bounds"
    VERBATIM
)
