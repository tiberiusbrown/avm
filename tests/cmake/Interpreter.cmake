# Exercise real AVR helpers with independent host arithmetic, SRAM guards and
# register/SREG preservation checks, including both values of the text T bit.
find_package(Python3 COMPONENTS Interpreter REQUIRED)
add_executable(avm_format_long_long_tests interp/format_long_long.cpp)
target_compile_features(avm_format_long_long_tests PRIVATE cxx_std_17)
target_link_libraries(avm_format_long_long_tests PRIVATE ardensdebuggerlib)
avm_add_check(avm_format_long_long_tests_run
    COMMAND "$<TARGET_FILE:avm_format_long_long_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_BINARY_DIR}/interp/interp.lst"
    COMMAND "$<TARGET_FILE:avm_format_long_long_tests>"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.hex"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.lst"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/format/generate_long_long.py" --check
    DEPENDS avm_format_long_long_tests avm_interpreter avm_interpreter_fxc
    USES_TERMINAL VERBATIM)

# The runner can be built independently; avm_tests_run builds and runs all images.
set(AVM_PUSH16_TEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/interp")
avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/audio.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/audio.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/audio.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/audio.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/audio.bin"
    ENTRY _start)
add_executable(avm_audio_tests interp/audio.cpp)
target_compile_features(avm_audio_tests PRIVATE cxx_std_17)
target_link_libraries(avm_audio_tests PRIVATE ardensdebuggerlib)
set(audio_hardware_hexes)
foreach(preset MINI FXC)
    set(hardware_dir "${CMAKE_CURRENT_BINARY_DIR}/audio_hardware/${preset}")
    avm_add_firmware(avm_audio_firmware_${preset} DIRECTORY "${hardware_dir}"
        PREAMBLE "#define AVM_DEVICE_ARDUBOY_${preset}\n")
    list(APPEND audio_hardware_hexes "${hardware_dir}/interp.hex")
endforeach()
avm_add_check(avm_audio_hardware_checks DEPENDS ${audio_hardware_hexes})
find_package(Python3 COMPONENTS Interpreter QUIET)
set(audio_large_inputs)
if(Python3_Interpreter_FOUND)
    set(audio_large_dir "${CMAKE_CURRENT_BINARY_DIR}/audio_large")
    add_custom_command(
        OUTPUT "${audio_large_dir}/audio_large.h"
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/audio/generate_large_asset.py"
            "${audio_large_dir}/audio_large.h"
        DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/audio/generate_large_asset.py"
            "${PROJECT_SOURCE_DIR}/tools/avm_music.py" VERBATIM)
    foreach(language C CXX)
        if(language STREQUAL "C")
            set(extension c)
        else()
            set(extension cpp)
        endif()
        avm_add_object(
            OUTPUT "${audio_large_dir}/${language}.o"
            SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/audio_large.${extension}"
            LANGUAGE ${language}
            INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include" "${audio_large_dir}"
            COMPILE_OPTIONS -O2
            DEPENDS avm_sysroot "${audio_large_dir}/audio_large.h"
                "${CMAKE_CURRENT_SOURCE_DIR}/interp/audio_large.c")
        avm_add_image(
            OBJECTS "${audio_large_dir}/${language}.o"
            OUTPUT_ELF "${audio_large_dir}/${language}.elf"
            OUTPUT_IMAGE "${audio_large_dir}/${language}.bin"
            ENTRY _start
            LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a" "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
            GC_SECTIONS DEPENDS avm_sysroot)
        list(APPEND audio_large_inputs "${audio_large_dir}/${language}.bin")
    endforeach()
endif()
# Direct compiled playlist fixture; generated song headers must be current before
# compilation. This replaces demo UI navigation/rendering, not asset/API checks.
set(audio_playlist_headers
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/music.h"
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/songs/z1overw.h"
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/songs/ff1town.h"
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/songs/ff1overw.h"
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/songs/ff1matya.h")
avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/audio_playlist.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/audio_playlist.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -O2
    DEPENDS avm_sysroot ${audio_playlist_headers})
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/audio_playlist.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/audio_playlist.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/audio_playlist.bin"
    ENTRY _start
    LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a" "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS DEPENDS avm_sysroot)

# Independent processes cover the same comprehensive suite. No console pool:
# Ninja may run these alongside one another, including on Windows.
function(avm_add_audio_run target suite image)
    avm_add_check(${target}
        COMMAND "$<TARGET_FILE:avm_audio_tests>" --suite "${suite}"
            "${AVM_INTERPRETER_HEX}" "${PROJECT_BINARY_DIR}/interp/interp.lst" "${image}"
        DEPENDS avm_audio_tests avm_interpreter "${image}" ${ARGN}
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        VERBATIM)
endfunction()
avm_add_audio_run(avm_audio_core_isa_run core-isa "${AVM_PUSH16_TEST_DIR}/audio.bin")
avm_add_audio_run(avm_audio_core_audio_run core-audio "${AVM_PUSH16_TEST_DIR}/audio.bin"
    avm_audio_hardware_checks)
# Compile the demo source as an isolated integration fixture through the same
# public driver as external applications; no install or package update is needed.
avm_add_program(avm_audio_demo_fixture
    SOURCES "${PROJECT_SOURCE_DIR}/projects/audio_demo/main.c"
    STARTUP crt0_sketch.o COMPILE_OPTIONS -std=c11 -flto=full
    LINK_OPTIONS -flto=full -Wl,--lto-O2)
get_target_property(audio_demo_fixture avm_audio_demo_fixture AVM_IMAGE)
avm_add_audio_run(avm_audio_demo_integration_run demo "${audio_demo_fixture}" avm_audio_demo_fixture)
avm_add_audio_run(avm_audio_playlist_assets_run playlist-assets "${AVM_PUSH16_TEST_DIR}/audio_playlist.bin")
avm_add_audio_run(avm_audio_formatter_run formatter "${AVM_C_TEST_BINARY_DIR}/O0/audio.bin")
avm_add_check(avm_audio_tests_run DEPENDS avm_audio_core_isa_run avm_audio_core_audio_run
    avm_audio_demo_integration_run avm_audio_playlist_assets_run avm_audio_formatter_run)
if(Python3_Interpreter_FOUND)
    avm_add_audio_run(avm_audio_export_c_run export-c "${audio_large_dir}/C.bin")
    avm_add_audio_run(avm_audio_export_cpp_run export-cpp "${audio_large_dir}/CXX.bin")
    add_dependencies(avm_audio_tests_run avm_audio_export_c_run avm_audio_export_cpp_run)
endif()

# All five hardware configurations receive isolated Timer0 ISR, clock,
# pending-tick, button-polling and exact cycle-count validation.
avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/timer0.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/timer0.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/timer0.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/timer0.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/timer0.bin"
    ENTRY _start)
add_executable(avm_timer0_tests interp/timer0.cpp)
target_compile_features(avm_timer0_tests PRIVATE cxx_std_17)
target_link_libraries(avm_timer0_tests PRIVATE ardensdebuggerlib)
set(timer0_commands)
set(timer0_outputs)
foreach(wiring FX MINI FXC split shared)
    set(timer0_dir "${CMAKE_CURRENT_BINARY_DIR}/timer0/${wiring}")
    set(timer0_defines "")
    if(wiring STREQUAL "split")
        # Swap UP and B across ports, including their input initialization.
        set(timer0_defines "#define AVM_BUTTON_UP_PIN PINB\n#define AVM_BUTTON_UP_PORT PORTB\n#define AVM_BUTTON_UP_DDR DDRB\n#define AVM_BUTTON_UP_BIT 4\n#define AVM_BUTTON_B_PIN PINF\n#define AVM_BUTTON_B_PORT PORTF\n#define AVM_BUTTON_B_DDR DDRF\n#define AVM_BUTTON_B_BIT 7\n")
    elseif(wiring STREQUAL "shared")
        # Permute shared-port direction bits and exchange A/B pins.
        set(timer0_defines "#define AVM_BUTTON_UP_BIT 6\n#define AVM_BUTTON_RIGHT_BIT 7\n#define AVM_BUTTON_A_PIN PINB\n#define AVM_BUTTON_A_PORT PORTB\n#define AVM_BUTTON_A_DDR DDRB\n#define AVM_BUTTON_A_BIT 4\n#define AVM_BUTTON_B_PIN PINE\n#define AVM_BUTTON_B_PORT PORTE\n#define AVM_BUTTON_B_DDR DDRE\n#define AVM_BUTTON_B_BIT 6\n")
    else()
        set(timer0_defines "#define AVM_DEVICE_ARDUBOY_${wiring}\n")
    endif()
    avm_add_firmware(avm_timer0_firmware_${wiring} DIRECTORY "${timer0_dir}"
        PREAMBLE "${timer0_defines}")
    list(APPEND timer0_outputs "${timer0_dir}/interp.hex" "${timer0_dir}/interp.lst")
    list(APPEND timer0_commands
        COMMAND "$<TARGET_FILE:avm_timer0_tests>"
            "${timer0_dir}/interp.hex" "${timer0_dir}/interp.lst"
            "${AVM_PUSH16_TEST_DIR}/timer0.bin" "${wiring}")
endforeach()
avm_add_check(avm_timer0_tests_run
    ${timer0_commands}
    DEPENDS avm_timer0_tests ${timer0_outputs} "${AVM_PUSH16_TEST_DIR}/timer0.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)
avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/push16.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/push16.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/push16.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/push16.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/push16.bin"
    ENTRY _start)
add_executable(avm_push16_tests interp/push16.cpp)
target_compile_features(avm_push16_tests PRIVATE cxx_std_17)
target_link_libraries(avm_push16_tests PRIVATE ardensdebuggerlib)
avm_add_check(avm_push16_tests_run
    COMMAND "$<TARGET_FILE:avm_push16_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_BINARY_DIR}/interp/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/push16.bin"
    DEPENDS avm_push16_tests avm_interpreter "${AVM_PUSH16_TEST_DIR}/push16.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/stack_bounds.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/stack_bounds.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/stack_bounds.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/stack_bounds.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/stack_bounds.bin"
    DISASSEMBLY "${AVM_PUSH16_TEST_DIR}/stack_bounds.asm"
    ENTRY _start)
add_executable(avm_stack_bounds_tests interp/stack_bounds.cpp)
target_compile_features(avm_stack_bounds_tests PRIVATE cxx_std_17)
target_link_libraries(avm_stack_bounds_tests PRIVATE ardensdebuggerlib)
avm_add_check(avm_stack_bounds_tests_run
    COMMAND "$<TARGET_FILE:avm_stack_bounds_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_BINARY_DIR}/interp/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/stack_bounds.bin" "${AVM_PUSH16_TEST_DIR}/stack_bounds.asm"
    DEPENDS avm_stack_bounds_tests avm_interpreter "${AVM_PUSH16_TEST_DIR}/stack_bounds.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

set(AVM_DISPLAY_TEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/display_system")
avm_add_object(
    OUTPUT "${AVM_DISPLAY_TEST_DIR}/display_system.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/display_system.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_DISPLAY_TEST_DIR}/display_system.o"
    OUTPUT_ELF "${AVM_DISPLAY_TEST_DIR}/display_system.elf"
    OUTPUT_IMAGE "${AVM_DISPLAY_TEST_DIR}/display_system.bin"
    DISASSEMBLY "${AVM_DISPLAY_TEST_DIR}/display_system.asm"
    ENTRY _start)
add_executable(avm_display_system_tests interp/display_system.cpp)
target_compile_features(avm_display_system_tests PRIVATE cxx_std_17)
target_link_libraries(avm_display_system_tests PRIVATE ardensdebuggerlib)

set(AVM_TRAP_TEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/trap_dispatch")
avm_add_object(
    OUTPUT "${AVM_TRAP_TEST_DIR}/trap_dispatch.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_dispatch.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_TRAP_TEST_DIR}/trap_dispatch.o"
    OUTPUT_ELF "${AVM_TRAP_TEST_DIR}/trap_dispatch.elf"
    OUTPUT_IMAGE "${AVM_TRAP_TEST_DIR}/trap_dispatch.bin"
    DISASSEMBLY "${AVM_TRAP_TEST_DIR}/trap_dispatch.asm"
    ENTRY _start
    LIBRARIES
        "${AVM_SYSROOT_DIR}/lib/libavm.a"
        "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS
    DEPENDS avm_sysroot)
avm_add_object(
    OUTPUT "${AVM_TRAP_TEST_DIR}/trap_high_entry.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_high.c"
    LANGUAGE C
    DEPENDS avm_sysroot)
avm_add_object(
    OUTPUT "${AVM_TRAP_TEST_DIR}/trap_high.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_high.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_TRAP_TEST_DIR}/trap_high.o" "${AVM_TRAP_TEST_DIR}/trap_high_entry.o"
    OUTPUT_ELF "${AVM_TRAP_TEST_DIR}/trap_high.elf"
    OUTPUT_IMAGE "${AVM_TRAP_TEST_DIR}/trap_high.bin"
    DISASSEMBLY "${AVM_TRAP_TEST_DIR}/trap_high.asm"
    ENTRY _start
    LINK_OPTIONS "--section-start=.high_trap_text=0x10100")
add_executable(avm_trap_dispatch_tests interp/trap_dispatch.cpp)
target_compile_features(avm_trap_dispatch_tests PRIVATE cxx_std_17)
target_link_libraries(avm_trap_dispatch_tests PRIVATE ardensdebuggerlib)
avm_add_check(avm_trap_dispatch_tests_run
    COMMAND "$<TARGET_FILE:avm_trap_dispatch_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_BINARY_DIR}/interp/interp.lst"
        "${AVM_TRAP_TEST_DIR}/trap_dispatch.bin" "${AVM_TRAP_TEST_DIR}/trap_dispatch.asm"
        "${AVM_TRAP_TEST_DIR}/trap_high.bin" "${AVM_TRAP_TEST_DIR}/trap_high.asm"
    DEPENDS avm_trap_dispatch_tests avm_interpreter
        "${AVM_TRAP_TEST_DIR}/trap_dispatch.bin" "${AVM_TRAP_TEST_DIR}/trap_high.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

# Source-aware fatal traps use one fixture built with -g at -O0 and -O2, both
# with the default crash metadata, and at -O2 with NO_CRASH_INFO.
set(AVM_TRAP_SOURCE_TEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/trap_source")
foreach(variant IN ITEMS O0 O2 nometa)
    if(variant STREQUAL "O0")
        set(variant_options -g -O0)
        set(variant_crash_info)
    elseif(variant STREQUAL "O2")
        set(variant_options -g -O2)
        set(variant_crash_info)
    else()
        set(variant_options -g -O2)
        set(variant_crash_info NO_CRASH_INFO)
    endif()
    set(variant_dir "${AVM_TRAP_SOURCE_TEST_DIR}/${variant}")
    avm_add_object(
        OUTPUT "${variant_dir}/trap_source.o"
        SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_source.c"
        LANGUAGE C
        COMPILE_OPTIONS ${variant_options}
        DEPENDS avm_sysroot)
    avm_add_image(
        OBJECTS "${variant_dir}/trap_source.o"
        OUTPUT_ELF "${variant_dir}/trap_source.elf"
        OUTPUT_IMAGE "${variant_dir}/trap_source.bin"
        DISASSEMBLY "${variant_dir}/trap_source.asm"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
        LIBRARIES
            "${AVM_SYSROOT_DIR}/lib/libavm.a"
            "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        LINK_OPTIONS "--section-start=.high_text=0x10100"
        GC_SECTIONS
        ${variant_crash_info}
        DEPENDS avm_sysroot)
endforeach()
# A C++ fixture whose trapping function has a demangled name longer than 128
# bytes. It is built at -O0 with -g, so its lookup and fatal trap are verified
# against the complete name.
set(AVM_TRAP_LONG_NAME_DIR "${CMAKE_CURRENT_BINARY_DIR}/trap_long_name")
avm_add_object(
    OUTPUT "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_long_name.cpp"
    LANGUAGE CXX
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -g -O0
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.o"
    OUTPUT_ELF "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.elf"
    OUTPUT_IMAGE "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.bin"
    DISASSEMBLY "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.asm"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES
        "${AVM_SYSROOT_DIR}/lib/libavm.a"
        "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    LINK_OPTIONS "--section-start=.high_text=0x10100"
    GC_SECTIONS
    DEPENDS avm_sysroot)
# Lookup timing: a fixture whose driver looks up probes the host writes into RAM.
# main references every probe function, so garbage collection keeps them.
# It is run on demand, outside avm_tests_run, to report guest cycles.
set(AVM_TRAP_LOOKUP_BENCH_DIR "${CMAKE_CURRENT_BINARY_DIR}/trap_lookup_bench")
avm_add_object(
    OUTPUT "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_lookup_bench.c"
    LANGUAGE C
    COMPILE_OPTIONS -g -O2
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.o"
    OUTPUT_ELF "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.elf"
    OUTPUT_IMAGE "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.bin"
    DISASSEMBLY "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.asm"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES
        "${AVM_SYSROOT_DIR}/lib/libavm.a"
        "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    LINK_OPTIONS "--section-start=.high_text=0x10100"
    GC_SECTIONS
    DEPENDS avm_sysroot)
add_executable(avm_trap_lookup_bench interp/trap_lookup_bench.cpp)
target_compile_features(avm_trap_lookup_bench PRIVATE cxx_std_17)
target_link_libraries(avm_trap_lookup_bench PRIVATE ardensdebuggerlib)
avm_add_check(avm_trap_lookup_bench_run
    COMMAND "$<TARGET_FILE:avm_trap_lookup_bench>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_BINARY_DIR}/interp/interp.lst"
        "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.bin" "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.asm"
    DEPENDS avm_trap_lookup_bench avm_interpreter "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

add_executable(avm_trap_source_tests interp/trap_source_tests.cpp)
target_compile_features(avm_trap_source_tests PRIVATE cxx_std_17)
target_link_libraries(avm_trap_source_tests PRIVATE ardensdebuggerlib)
avm_add_check(avm_trap_source_tests_run
    COMMAND "$<TARGET_FILE:avm_trap_source_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_BINARY_DIR}/interp/interp.lst"
        "${AVM_TRAP_SOURCE_TEST_DIR}/O0/trap_source.bin" "${AVM_TRAP_SOURCE_TEST_DIR}/O0/trap_source.asm"
        "${AVM_TRAP_SOURCE_TEST_DIR}/O2/trap_source.bin" "${AVM_TRAP_SOURCE_TEST_DIR}/O2/trap_source.asm"
        "${AVM_TRAP_SOURCE_TEST_DIR}/nometa/trap_source.bin" "${AVM_TRAP_SOURCE_TEST_DIR}/nometa/trap_source.asm"
        "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.bin" "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.asm"
    DEPENDS avm_trap_source_tests avm_interpreter
        "${AVM_TRAP_SOURCE_TEST_DIR}/O0/trap_source.bin"
        "${AVM_TRAP_SOURCE_TEST_DIR}/O2/trap_source.bin"
        "${AVM_TRAP_SOURCE_TEST_DIR}/nometa/trap_source.bin"
        "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

set(display_system_outputs)
set(display_system_commands)
set(display_type 0)
foreach(controller SSD1306 SSD1309 SH1106)
    math(EXPR display_type "${display_type} + 1")
    set(controller_dir "${AVM_DISPLAY_TEST_DIR}/${controller}")
    avm_add_firmware(avm_display_firmware_${controller} DIRECTORY "${controller_dir}"
        PREAMBLE "#define AVM_DISPLAY_${controller}\n")
    list(APPEND display_system_outputs
        "${controller_dir}/interp.hex" "${controller_dir}/interp.lst")
    list(APPEND display_system_commands
        COMMAND "$<TARGET_FILE:avm_display_system_tests>"
            "${controller_dir}/interp.hex" "${controller_dir}/interp.lst"
            "${AVM_DISPLAY_TEST_DIR}/display_system.bin"
            "${AVM_DISPLAY_TEST_DIR}/display_system.asm" "${display_type}")
endforeach()
avm_add_check(avm_display_system_tests_run
    ${display_system_commands}
    DEPENDS avm_display_system_tests ${display_system_outputs}
        "${AVM_DISPLAY_TEST_DIR}/display_system.bin"
        "${AVM_DISPLAY_TEST_DIR}/display_system.asm"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

# Checks compile-time diagnostics that the AVM library headers must produce or
# avoid, such as assert with more or fewer than one expression.
set(AVM_HEADER_DIAGNOSTICS_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/runtime/headers/check_header_diagnostics.py")
avm_add_check(avm_header_diagnostics_run
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_HEADER_DIAGNOSTICS_VERIFY}"
        --clang "$<TARGET_FILE:clang>"
        --sysroot-include "${AVM_SYSROOT_DIR}/include"
        --source-dir "${CMAKE_CURRENT_SOURCE_DIR}/runtime/headers"
    DEPENDS clang avm_sysroot avm_runtime_checks
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
