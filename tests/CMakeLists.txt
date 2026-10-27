set(AVM_ASM_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/asm")
set(AVM_C_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/c")
set(AVM_CXX_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cpp")
set(AVM_TEST_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/avm_tests.cpp")
set(AVM_ASM_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/asm")
set(AVM_C_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/c")
set(AVM_CXX_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/cpp")
# Compile every C and C++ fixture at each supported optimization setting.
set(AVM_TEST_OPT_LEVELS O0 O1 O2 O3 Os Oz)
string(JOIN "," AVM_TEST_OPT_LEVELS_CSV ${AVM_TEST_OPT_LEVELS})
# The O0 draw_text_clipping reference renderer needs about 25 emulated seconds.
# Ardens advance() takes picoseconds; allow 60 seconds for each fixture.
set(AVM_TEST_ADVANCE_LIMIT
    "60000000000000" CACHE STRING
    "Maximum emulated time in picoseconds allowed for each AVM test")

# CONFIGURE_DEPENDS makes CMake regenerate when a test is added or removed.
file(GLOB AVM_ASM_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_ASM_TEST_DIR}/*.asm")
file(GLOB_RECURSE AVM_ASM_TEST_SUPPORT_SOURCES CONFIGURE_DEPENDS
    "${AVM_ASM_TEST_DIR}/include/*")
file(GLOB AVM_C_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_C_TEST_DIR}/*.c")
file(GLOB AVM_C_TEST_HEADERS CONFIGURE_DEPENDS "${AVM_C_TEST_DIR}/*.h")
list(APPEND AVM_C_TEST_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/math/accuracy_policy.h")
file(GLOB AVM_CXX_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_CXX_TEST_DIR}/*.cpp")

set(AVM_TEST_IMAGE_OUTPUTS)

foreach(AVM_TEST_ASM IN LISTS AVM_ASM_TEST_SOURCES)
    get_filename_component(AVM_TEST_NAME "${AVM_TEST_ASM}" NAME_WE)
    set(AVM_TEST_OBJECT "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.o")
    set(AVM_TEST_ELF "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.elf")
    set(AVM_TEST_IMAGE "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.bin")

    avm_add_object(
        OUTPUT "${AVM_TEST_OBJECT}"
        SOURCE "${AVM_TEST_ASM}"
        LANGUAGE ASM
        INCLUDE_DIRS "${AVM_ASM_TEST_DIR}"
        DEPENDS ${AVM_ASM_TEST_SUPPORT_SOURCES}
    )
    avm_add_image(
        OBJECTS "${AVM_TEST_OBJECT}"
        OUTPUT_ELF "${AVM_TEST_ELF}"
        OUTPUT_IMAGE "${AVM_TEST_IMAGE}"
        ENTRY _start
    )
    list(APPEND AVM_TEST_IMAGE_OUTPUTS "${AVM_TEST_IMAGE}")
endforeach()

# Compile and package freestanding C and C++ tests. Each test is linked with
# crt0_test.o, which prints P or F from main's return value and terminates with
# SYS debug_break so the runner can compare serial output.
foreach(AVM_TEST_LANGUAGE C CXX)
    if(AVM_TEST_LANGUAGE STREQUAL "C")
        set(AVM_COMPILED_TEST_SOURCES ${AVM_C_TEST_SOURCES})
        set(AVM_COMPILED_TEST_BINARY_DIR "${AVM_C_TEST_BINARY_DIR}")
    else()
        set(AVM_COMPILED_TEST_SOURCES ${AVM_CXX_TEST_SOURCES})
        set(AVM_COMPILED_TEST_BINARY_DIR "${AVM_CXX_TEST_BINARY_DIR}")
    endif()

    foreach(AVM_TEST_OPT_LEVEL IN LISTS AVM_TEST_OPT_LEVELS)
      set(AVM_OPT_TEST_BINARY_DIR
          "${AVM_COMPILED_TEST_BINARY_DIR}/${AVM_TEST_OPT_LEVEL}")
      foreach(AVM_TEST_SOURCE_FILE IN LISTS AVM_COMPILED_TEST_SOURCES)
        get_filename_component(AVM_TEST_NAME
            "${AVM_TEST_SOURCE_FILE}" NAME_WE)
        set(AVM_TEST_OBJECT
            "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.o")
        set(AVM_TEST_ELF
            "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.elf")
        set(AVM_TEST_IMAGE
            "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.bin")
        set(test_objects "${AVM_TEST_OBJECT}")
        set(test_support_sources)
        set(test_source_dependencies)

        if(AVM_TEST_LANGUAGE STREQUAL "CXX")
            if(AVM_TEST_NAME MATCHES "^math_(native|c99_exact|c99_classify|c99_functions|hyperbolic|misc)$")
                list(APPEND test_source_dependencies "${AVM_C_TEST_DIR}/${AVM_TEST_NAME}.c")
            elseif(AVM_TEST_NAME MATCHES "^(ctype|string_(search|progmem_search))$")
                list(APPEND test_source_dependencies
                    "${AVM_C_TEST_DIR}/${AVM_TEST_NAME}.c")
            elseif(AVM_TEST_NAME STREQUAL "display_system")
                list(APPEND test_source_dependencies
                    "${AVM_C_TEST_DIR}/display_system.c")
            elseif(AVM_TEST_NAME STREQUAL "separate_compilation")
                set(test_support_sources
                    "${AVM_CXX_TEST_DIR}/support/separate_compilation_impl.cpp")
                list(APPEND test_source_dependencies
                    "${AVM_CXX_TEST_DIR}/support/separate_compilation.h")
            elseif(AVM_TEST_NAME STREQUAL "multiple_translation_units")
                set(test_support_sources
                    "${AVM_CXX_TEST_DIR}/support/multiple_translation_units_a.cpp"
                    "${AVM_CXX_TEST_DIR}/support/multiple_translation_units_b.cpp")
                list(APPEND test_source_dependencies
                    "${AVM_CXX_TEST_DIR}/support/multiple_translation_units.h")
            endif()
        endif()

        set(test_compile_options "-${AVM_TEST_OPT_LEVEL}")
        if(AVM_TEST_NAME STREQUAL "ff_fixed")
            list(APPEND test_compile_options -mllvm -verify-machineinstrs)
        endif()
        # Exercise whole-program virtual, member-pointer, and lifetime dispatch in the
        # emulator as well as retaining the ordinary compilation matrix.
        if(AVM_TEST_LANGUAGE STREQUAL "CXX" AND
           AVM_TEST_OPT_LEVEL STREQUAL "O2" AND
           AVM_TEST_NAME MATCHES "^(virtual_dispatch|member_pointers|global_lifetime|local_static_lifetime|interleaved_lifetime)$")
            list(APPEND test_compile_options -flto=full)
        endif()

        avm_add_object(
            OUTPUT "${AVM_TEST_OBJECT}"
            SOURCE "${AVM_TEST_SOURCE_FILE}"
            LANGUAGE ${AVM_TEST_LANGUAGE}
            INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
            COMPILE_OPTIONS ${test_compile_options}
            DEPENDS avm_sysroot ${test_source_dependencies} ${AVM_C_TEST_HEADERS}
        )
        foreach(test_support_source IN LISTS test_support_sources)
            get_filename_component(test_support_name
                "${test_support_source}" NAME_WE)
            set(test_support_object
                "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}_${test_support_name}.o")
            avm_add_object(
                OUTPUT "${test_support_object}"
                SOURCE "${test_support_source}"
                LANGUAGE CXX
                INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
                COMPILE_OPTIONS "-${AVM_TEST_OPT_LEVEL}"
                DEPENDS avm_sysroot ${test_source_dependencies}
            )
            list(APPEND test_objects "${test_support_object}")
        endforeach()
        set(test_link_options)
        if(AVM_TEST_NAME STREQUAL "member_pointer_high_address")
            # Keep data and ordinary code below 64 KiB while placing the
            # member-function target at the reported failing address.
            list(APPEND test_link_options
                "--image-base=0x100"
                "--section-start=.data=0x100"
                "--section-start=.text=0x200"
                "--section-start=.rodata=0x1000"
                "--section-start=.high_member_text=0x101F6")
        elseif(AVM_TEST_NAME STREQUAL "progmem_address_hoisting")
            # Exercise high program bases, low-word carries and wide offsets.
            list(APPEND test_link_options
                "--image-base=0x100"
                "--section-start=.data=0x100"
                "--section-start=.text=0x200"
                "--section-start=.rodata=0x10000"
                "--section-start=.high_program_bytes=0x1FFFC")
        endif()
        avm_add_image(
            OBJECTS ${test_objects}
            OUTPUT_ELF "${AVM_TEST_ELF}"
            OUTPUT_IMAGE "${AVM_TEST_IMAGE}"
            ENTRY _start
            STARTUP "${AVM_SYSROOT_DIR}/lib/crt0_test.o"
            LIBRARIES
                "${AVM_SYSROOT_DIR}/lib/libavm.a"
                "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
            GC_SECTIONS
            LINK_OPTIONS ${test_link_options}
            DEPENDS avm_sysroot
        )
        list(APPEND AVM_TEST_IMAGE_OUTPUTS "${AVM_TEST_IMAGE}")
        if(AVM_TEST_NAME MATCHES "^math_")
            list(APPEND AVM_MATH_FULL_IMAGES "${AVM_TEST_IMAGE}")
            if(AVM_TEST_OPT_LEVEL MATCHES "^(O0|O2)$")
                list(APPEND AVM_MATH_FAST_IMAGES "${AVM_TEST_IMAGE}")
            endif()
        endif()
      endforeach()
    endforeach()
endforeach()

add_custom_target(avm_test_images DEPENDS ${AVM_TEST_IMAGE_OUTPUTS})

# The runner discovers ASM, C, and C++ sources, maps each source to its adjacent
# name_output.txt file and corresponding generated image, loads the interpreter
# and image directly into arduboy_t, and compares cpu.serial_bytes.
add_executable(avm_tests "${AVM_TEST_SOURCE}")
set_target_properties(avm_tests PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
target_compile_features(avm_tests PRIVATE cxx_std_17)
find_package(Threads REQUIRED)
target_link_libraries(avm_tests PRIVATE ardensdebuggerlib Threads::Threads)
target_compile_definitions(avm_tests PRIVATE
    AVM_TEST_ASM_DIR="${AVM_ASM_TEST_DIR}"
    AVM_TEST_C_DIR="${AVM_C_TEST_DIR}"
    AVM_TEST_CXX_DIR="${AVM_CXX_TEST_DIR}"
    AVM_TEST_BIN_DIR="${AVM_ASM_TEST_BINARY_DIR}"
    AVM_TEST_C_BIN_DIR="${AVM_C_TEST_BINARY_DIR}"
    AVM_TEST_CXX_BIN_DIR="${AVM_CXX_TEST_BINARY_DIR}"
    AVM_TEST_OPT_LEVELS="${AVM_TEST_OPT_LEVELS_CSV}"
    AVM_TEST_INTERPRETER_HEX="${AVM_INTERPRETER_HEX}"
    AVM_TEST_ADVANCE_LIMIT=${AVM_TEST_ADVANCE_LIMIT}ull
)
add_dependencies(avm_tests
    avm_interpreter
)

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
    file(GENERATE OUTPUT "${hardware_dir}/preset.asm"
        CONTENT "#define AVM_DEVICE_ARDUBOY_${preset}\n#include \"${PROJECT_SOURCE_DIR}/interp/interp.asm\"\n")
    add_custom_command(
        OUTPUT "${hardware_dir}/interp.hex"
        COMMAND "${CMAKE_COMMAND}"
            "-DSOURCE:FILEPATH=${hardware_dir}/preset.asm"
            "-DOUTPUT_OBJECT:FILEPATH=${hardware_dir}/interp.o"
            "-DOUTPUT_ELF:FILEPATH=${hardware_dir}/interp.elf"
            "-DOUTPUT_MAP:FILEPATH=${hardware_dir}/interp.map"
            "-DOUTPUT_LISTING:FILEPATH=${hardware_dir}/interp.lst"
            "-DOUTPUT_HEX:FILEPATH=${hardware_dir}/interp.hex"
            "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
            "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
            "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
            "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
            -P "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
        DEPENDS "${PROJECT_SOURCE_DIR}/interp/interp.asm" "${PROJECT_SOURCE_DIR}/interp/native_math.inc"
            "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
            "${hardware_dir}/preset.asm"
        VERBATIM)
    list(APPEND audio_hardware_hexes "${hardware_dir}/interp.hex")
endforeach()
add_custom_target(avm_audio_hardware_checks DEPENDS ${audio_hardware_hexes})
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
add_custom_target(avm_audio_tests_run
    COMMAND "$<TARGET_FILE:avm_audio_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/audio.bin"
        "${PROJECT_SOURCE_DIR}/projects/audio_demo/build/audio_demo.bin"
        "${AVM_C_TEST_BINARY_DIR}/O0/audio.bin"
        ${audio_large_inputs}
    DEPENDS avm_audio_tests avm_interpreter avm_audio_hardware_checks avm_audio_demo
        "${AVM_PUSH16_TEST_DIR}/audio.bin" "${AVM_C_TEST_BINARY_DIR}/O0/audio.bin" ${audio_large_inputs}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

# Exercise the real Timer0 ISR and watchdog on every device preset and on
# both compile-time button paths. The guest spins without calling any SYS.
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
    file(GENERATE OUTPUT "${timer0_dir}/preset.asm"
        CONTENT "${timer0_defines}#include \"${PROJECT_SOURCE_DIR}/interp/interp.asm\"\n")
    add_custom_command(
        OUTPUT "${timer0_dir}/interp.hex" "${timer0_dir}/interp.lst"
        COMMAND "${CMAKE_COMMAND}"
            "-DSOURCE:FILEPATH=${timer0_dir}/preset.asm"
            "-DOUTPUT_OBJECT:FILEPATH=${timer0_dir}/interp.o"
            "-DOUTPUT_ELF:FILEPATH=${timer0_dir}/interp.elf"
            "-DOUTPUT_MAP:FILEPATH=${timer0_dir}/interp.map"
            "-DOUTPUT_LISTING:FILEPATH=${timer0_dir}/interp.lst"
            "-DOUTPUT_HEX:FILEPATH=${timer0_dir}/interp.hex"
            "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
            "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
            "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
            "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
            -P "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
        DEPENDS "${PROJECT_SOURCE_DIR}/interp/interp.asm" "${PROJECT_SOURCE_DIR}/interp/native_math.inc"
            "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
            "${timer0_dir}/preset.asm"
        VERBATIM)
    list(APPEND timer0_outputs "${timer0_dir}/interp.hex" "${timer0_dir}/interp.lst")
    list(APPEND timer0_commands
        COMMAND "$<TARGET_FILE:avm_timer0_tests>"
            "${timer0_dir}/interp.hex" "${timer0_dir}/interp.lst"
            "${AVM_PUSH16_TEST_DIR}/timer0.bin" "${wiring}")
endforeach()
add_custom_target(avm_timer0_tests_run
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
add_custom_target(avm_push16_tests_run
    COMMAND "$<TARGET_FILE:avm_push16_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
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
add_custom_target(avm_stack_bounds_tests_run
    COMMAND "$<TARGET_FILE:avm_stack_bounds_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
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

set(display_system_outputs)
set(display_system_commands)
set(display_type 0)
foreach(controller SSD1306 SSD1309 SH1106)
    math(EXPR display_type "${display_type} + 1")
    set(controller_dir "${AVM_DISPLAY_TEST_DIR}/${controller}")
    file(GENERATE OUTPUT "${controller_dir}/preset.asm"
        CONTENT "#define AVM_DISPLAY_${controller}\n#include \"${PROJECT_SOURCE_DIR}/interp/interp.asm\"\n")
    add_custom_command(
        OUTPUT "${controller_dir}/interp.hex" "${controller_dir}/interp.lst"
        COMMAND "${CMAKE_COMMAND}"
            "-DSOURCE:FILEPATH=${controller_dir}/preset.asm"
            "-DOUTPUT_OBJECT:FILEPATH=${controller_dir}/interp.o"
            "-DOUTPUT_ELF:FILEPATH=${controller_dir}/interp.elf"
            "-DOUTPUT_MAP:FILEPATH=${controller_dir}/interp.map"
            "-DOUTPUT_LISTING:FILEPATH=${controller_dir}/interp.lst"
            "-DOUTPUT_HEX:FILEPATH=${controller_dir}/interp.hex"
            "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
            "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
            "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
            "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
            -P "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
        DEPENDS "${PROJECT_SOURCE_DIR}/interp/interp.asm" "${PROJECT_SOURCE_DIR}/interp/native_math.inc"
            "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
            "${controller_dir}/preset.asm"
        VERBATIM)
    list(APPEND display_system_outputs
        "${controller_dir}/interp.hex" "${controller_dir}/interp.lst")
    list(APPEND display_system_commands
        COMMAND "$<TARGET_FILE:avm_display_system_tests>"
            "${controller_dir}/interp.hex" "${controller_dir}/interp.lst"
            "${AVM_DISPLAY_TEST_DIR}/display_system.bin"
            "${AVM_DISPLAY_TEST_DIR}/display_system.asm" "${display_type}")
endforeach()
add_custom_target(avm_display_system_tests_run
    ${display_system_commands}
    DEPENDS avm_display_system_tests ${display_system_outputs}
        "${AVM_DISPLAY_TEST_DIR}/display_system.bin"
        "${AVM_DISPLAY_TEST_DIR}/display_system.asm"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

add_custom_target(avm_tests_run
    COMMAND "$<TARGET_FILE:avm_tests>"
    DEPENDS avm_tests avm_test_images avm_push16_tests_run avm_stack_bounds_tests_run avm_audio_tests_run
        avm_display_system_tests_run avm_timer0_tests_run
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Running all AVM tests in-process"
    USES_TERMINAL
    VERBATIM
)

# A small, independently built debug image exercises nested frames, a live
# global and local, both pointer spaces, button input, and delayed display
# transfer. Keep both an unoptimized and an optimized DWARF variant.
set(AVM_DEBUG_FIXTURE_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/fixture.c")
set(AVM_DEBUG_FIXTURE_OUTPUTS)
foreach(AVM_DEBUG_OPT IN ITEMS O0 O2)
    set(AVM_DEBUG_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/${AVM_DEBUG_OPT}")
    set(AVM_DEBUG_OBJECT "${AVM_DEBUG_DIR}/fixture.o")
    set(AVM_DEBUG_ELF "${AVM_DEBUG_DIR}/fixture.elf")
    set(AVM_DEBUG_IMAGE "${AVM_DEBUG_DIR}/fixture.bin")
    avm_add_object(
        OUTPUT "${AVM_DEBUG_OBJECT}"
        SOURCE "${AVM_DEBUG_FIXTURE_SOURCE}"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        COMPILE_OPTIONS -g "-${AVM_DEBUG_OPT}"
        DEPENDS avm_sysroot
    )
    avm_add_image(
        OBJECTS "${AVM_DEBUG_OBJECT}"
        OUTPUT_ELF "${AVM_DEBUG_ELF}"
        OUTPUT_IMAGE "${AVM_DEBUG_IMAGE}"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
        LIBRARIES
            "${AVM_SYSROOT_DIR}/lib/libavm.a"
            "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        GC_SECTIONS
        DEPENDS avm_sysroot
    )
    list(APPEND AVM_DEBUG_FIXTURE_OUTPUTS "${AVM_DEBUG_ELF}" "${AVM_DEBUG_IMAGE}")
endforeach()
add_custom_target(avm_debug_images DEPENDS ${AVM_DEBUG_FIXTURE_OUTPUTS})

set(AVM_PROF_ASM_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/prof-asm")
avm_add_object(
    OUTPUT "${AVM_PROF_ASM_DIR}/fixture.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/prof_fixture.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PROF_ASM_DIR}/fixture.o"
    OUTPUT_ELF "${AVM_PROF_ASM_DIR}/fixture.elf"
    OUTPUT_IMAGE "${AVM_PROF_ASM_DIR}/fixture.bin"
    ENTRY _start)
add_custom_target(avm_prof_asm_fixture
    DEPENDS "${AVM_PROF_ASM_DIR}/fixture.elf")
add_custom_target(avm_debug_verify
    COMMAND "$<TARGET_FILE:llvm-dwarfdump>" --verify
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
    COMMAND "$<TARGET_FILE:llvm-dwarfdump>" --verify
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O2/fixture.elf"
    DEPENDS avm_debug_images llvm-dwarfdump
    USES_TERMINAL VERBATIM)

# The debug sections must not change the bytes loaded by the interpreter.
set(AVM_NODEBUG_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/nodebug")
avm_add_object(
    OUTPUT "${AVM_NODEBUG_DIR}/fixture.o"
    SOURCE "${AVM_DEBUG_FIXTURE_SOURCE}"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -O0
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_NODEBUG_DIR}/fixture.o"
    OUTPUT_ELF "${AVM_NODEBUG_DIR}/fixture.elf"
    OUTPUT_IMAGE "${AVM_NODEBUG_DIR}/fixture.bin"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a"
              "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS
    DEPENDS avm_sysroot)
add_custom_target(avm_debug_image_equivalence
    COMMAND "${CMAKE_COMMAND}" -E compare_files
        "${AVM_NODEBUG_DIR}/fixture.bin"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.bin"
    DEPENDS "${AVM_NODEBUG_DIR}/fixture.bin" avm_debug_images
    USES_TERMINAL VERBATIM)

# A second image tests C++ types and a live code address beyond 64 KiB.
set(AVM_DEBUG_CPP_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/cpp")
avm_add_object(
    OUTPUT "${AVM_DEBUG_CPP_DIR}/fixture.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/fixture.cpp"
    LANGUAGE CXX
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -g -O0
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_DEBUG_CPP_DIR}/fixture.o"
    OUTPUT_ELF "${AVM_DEBUG_CPP_DIR}/fixture.elf"
    OUTPUT_IMAGE "${AVM_DEBUG_CPP_DIR}/fixture.bin"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a"
              "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS
    LINK_OPTIONS "--image-base=0x100"
                 "--section-start=.data=0x100"
                 "--section-start=.text=0x200"
                 "--section-start=.rodata=0x1000"
                 "--section-start=.high_debug_text=0x10100"
                 "--section-start=.high_debug_rodata=0x11000"
    DEPENDS avm_sysroot)
add_custom_target(avm_debug_cpp_verify
    COMMAND "$<TARGET_FILE:llvm-dwarfdump>" --verify
        "${AVM_DEBUG_CPP_DIR}/fixture.elf"
    DEPENDS "${AVM_DEBUG_CPP_DIR}/fixture.elf" llvm-dwarfdump
    USES_TERMINAL VERBATIM)

find_package(Python3 COMPONENTS Interpreter QUIET)
if(Python3_Interpreter_FOUND)
    add_custom_target(avm_music_tests_run
        COMMAND "${Python3_EXECUTABLE}" -m unittest discover -s tests/audio -v
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}" VERBATIM)
    add_dependencies(avm_audio_tests_run avm_music_tests_run)
    add_custom_target(avm_prof_integration_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/prof_integration.py"
            "${AVM_SDK_BUILD_BIN}/avm-prof${CMAKE_EXECUTABLE_SUFFIX}"
            "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
            "${AVM_DEBUG_CPP_DIR}/fixture.elf"
            "${AVM_NODEBUG_DIR}/fixture.elf"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O2/fixture.elf"
            "${AVM_PROF_ASM_DIR}/fixture.elf"
            "${CMAKE_CURRENT_BINARY_DIR}/debug"
        DEPENDS avm_prof avm_lldb avm_debug_images
                avm_debug_cpp_verify avm_debug_image_equivalence
                avm_prof_asm_fixture
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
    add_custom_target(avm_lldb_integration_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/integration.py"
            "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
            "${AVM_DEBUG_CPP_DIR}/fixture.elf"
            "${CMAKE_CURRENT_BINARY_DIR}/debug"
        DEPENDS avm_lldb avm_debug_images avm_debug_cpp_verify
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
    add_custom_target(avm_lldb_long_replay_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/long_replay.py"
            "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
            "${CMAKE_CURRENT_BINARY_DIR}/debug"
        DEPENDS avm_lldb avm_debug_images
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
endif()

add_executable(avm_boundary_probe debug/boundary_probe.cpp)
target_compile_features(avm_boundary_probe PRIVATE cxx_std_17)
target_link_libraries(avm_boundary_probe PRIVATE ardensdebuggerlib)
add_dependencies(avm_boundary_probe avm_debug_images avm_interpreter_boundary)
add_custom_target(avm_boundary_probe_run
    COMMAND "$<TARGET_FILE:avm_boundary_probe>"
        "${AVM_INTERPRETER_HEX}"
        "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.bin"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
    DEPENDS avm_boundary_probe
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

add_executable(avm_prof_throughput debug/prof_throughput.cpp)
target_compile_features(avm_prof_throughput PRIVATE cxx_std_17)
target_link_libraries(avm_prof_throughput PRIVATE avm_debug_emulator)
add_dependencies(avm_prof_throughput avm_debug_images
                 avm_interpreter_boundary)
add_custom_target(avm_prof_throughput_run
    COMMAND "$<TARGET_FILE:avm_prof_throughput>"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.bin"
        "${AVM_INTERPRETER_HEX}"
        "${AVM_INTERPRETER_BOUNDARY_METADATA}"
    DEPENDS avm_prof_throughput
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

# Verify the production sqrt kernel against host double sqrt for every binary32
# significand and exponent parity, plus exponent/subnormal packing cases. Check
# the large-angle reducer's exact integer product for every normalized mantissa.
add_library(avm_math_reference_kernel OBJECT
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sqrt.c")
target_include_directories(avm_math_reference_kernel PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
target_compile_definitions(avm_math_reference_kernel PRIVATE
    sqrtf=avm_reference_sqrtf)
if(MSVC)
    target_compile_options(avm_math_reference_kernel PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_reference_kernel PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_math_reference_tests
    math/sqrt_reference.c math/sqrt_original.c)
if(MSVC)
    target_compile_options(avm_math_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_reference_tests PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
target_link_libraries(avm_math_reference_tests PRIVATE avm_math_reference_kernel)
add_executable(avm_math_reduction_tests math/rem_pio2_product_reference.c)
if(MSVC)
    target_compile_options(avm_math_reduction_tests PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_math_reduction_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_math_reduction_tests PRIVATE m)
endif()
if(NOT MSVC)
    target_link_libraries(avm_math_reference_tests PRIVATE m)
endif()
add_custom_target(avm_math_reference_tests_run
    COMMAND "$<TARGET_FILE:avm_math_reference_tests>"
    COMMAND "$<TARGET_FILE:avm_math_reduction_tests>"
    DEPENDS avm_math_reference_tests avm_math_reduction_tests
    USES_TERMINAL)
add_dependencies(avm_tests_run avm_math_reference_tests_run)

# Compile the production rounding kernels under distinct names so host libm
# supplies an independent reference, including signed zero and NaN handling.
add_library(avm_rounding_reference_kernels OBJECT
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_floor.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_ceil.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_round.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_trunc.c")
target_include_directories(avm_rounding_reference_kernels PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
target_compile_definitions(avm_rounding_reference_kernels PRIVATE
    floorf=avm_reference_floorf ceilf=avm_reference_ceilf
    roundf=avm_reference_roundf truncf=avm_reference_truncf)
if(MSVC)
    target_compile_options(avm_rounding_reference_kernels PRIVATE /fp:strict)
else()
    target_compile_options(avm_rounding_reference_kernels PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_rounding_reference_tests math/rounding_reference.c)
target_link_libraries(avm_rounding_reference_tests PRIVATE
    avm_rounding_reference_kernels)
if(NOT MSVC)
    target_link_libraries(avm_rounding_reference_tests PRIVATE m)
endif()
add_custom_target(avm_rounding_tests_run
    COMMAND "$<TARGET_FILE:avm_rounding_reference_tests>"
    COMMAND "${CMAKE_COMMAND}"
        "-DAVM_NM=$<TARGET_FILE:llvm-nm>"
        "-DAVM_OBJECT_DIR=${PROJECT_BINARY_DIR}/runtime/objects"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/math/check_rounding_shifts.cmake"
    DEPENDS avm_rounding_reference_tests avm_sysroot llvm-nm
    USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_rounding_tests_run)

# Run the production shortcuts, sqrt and angle reducer under private names;
# the harness uses host double libm as an independent binary32 reference.
add_library(avm_shortcuts_reference_kernels OBJECT
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_remainder.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_remquo.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_rint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_nearbyint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_lrint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_lround.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_llrint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_llround.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_ilogb.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_logb.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fdim.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_nan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fmaxmag.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fminmag.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_round.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sinh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_cosh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_tanh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_asinh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_acosh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_atanh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_exp2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_expm1.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log1p.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_cbrt.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_asin.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_acos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_decompose.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_hypot.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_atan2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_atan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_tan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_sin.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_cos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_sincos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log10.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_pow.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_exp.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_fmod.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sqrt.c"
    math/rem_pio2_reference_kernel.c
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/kf_rem_pio2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_scalbn.c")
target_include_directories(avm_shortcuts_reference_kernels PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
foreach(function remainderf remquof rintf nearbyintf lrintf lroundf llrintf llroundf ilogbf logbf fdimf nanf fmaxmagf fminmagf roundf sinhf coshf tanhf asinhf acoshf atanhf exp2f expm1f log1pf cbrtf asinf acosf ldexpf frexpf modff nextafterf hypotf atan2f atanf sinf cosf sincosf tanf logf log2f log10f powf expf fmodf sqrtf scalbnf fminf fmaxf)
    target_compile_definitions(avm_shortcuts_reference_kernels PRIVATE
        "${function}=avm_reference_${function}")
endforeach()
if(MSVC)
    target_compile_options(avm_shortcuts_reference_kernels PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_shortcuts_reference_kernels PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_math_misc_reference_tests math/misc_reference.c)
target_link_libraries(avm_math_misc_reference_tests PRIVATE avm_shortcuts_reference_kernels)
if(MSVC)
    target_compile_options(avm_math_misc_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_misc_reference_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_math_misc_reference_tests PRIVATE m)
endif()
add_custom_target(avm_math_misc_tests_run
    COMMAND "$<TARGET_FILE:avm_math_misc_reference_tests>"
    DEPENDS avm_math_misc_reference_tests USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_math_misc_tests_run)

add_executable(avm_shortcuts_reference_tests math/shortcuts_reference.c)
target_link_libraries(avm_shortcuts_reference_tests PRIVATE avm_shortcuts_reference_kernels)
add_executable(avm_math_accuracy_probe math/accuracy_probe.c)
target_link_libraries(avm_math_accuracy_probe PRIVATE avm_shortcuts_reference_kernels)
add_executable(avm_c99_reference_tests math/c99_reference.c)
target_link_libraries(avm_c99_reference_tests PRIVATE avm_shortcuts_reference_kernels)
if(MSVC)
    target_compile_options(avm_c99_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_c99_reference_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_c99_reference_tests PRIVATE m)
endif()
add_custom_target(avm_c99_tests_run
    COMMAND "$<TARGET_FILE:avm_c99_reference_tests>"
    COMMAND "$<TARGET_FILE:clang>" --target=x86_64-w64-windows-gnu -std=c++17
        -fsyntax-only -nostdinc -I "${PROJECT_SOURCE_DIR}/runtime/include"
        "${CMAKE_CURRENT_SOURCE_DIR}/math/classify_host.cpp"
    DEPENDS avm_c99_reference_tests clang USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_c99_tests_run)
add_executable(avm_hypot_boundary_tests math/hypot_boundary_reference.c)
if(MSVC)
    target_compile_options(avm_hypot_boundary_tests PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_hypot_boundary_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_hypot_boundary_tests PRIVATE m)
endif()
add_custom_target(avm_hypot_boundary_tests_run
    COMMAND "$<TARGET_FILE:avm_hypot_boundary_tests>"
    DEPENDS avm_hypot_boundary_tests USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_hypot_boundary_tests_run)
if(NOT MSVC)
    target_link_libraries(avm_shortcuts_reference_tests PRIVATE m)
    target_link_libraries(avm_math_accuracy_probe PRIVATE m)
endif()
add_custom_target(avm_shortcuts_tests_run
    COMMAND "$<TARGET_FILE:avm_shortcuts_reference_tests>"
    DEPENDS avm_shortcuts_reference_tests USES_TERMINAL)
add_dependencies(avm_tests_run avm_shortcuts_tests_run)

if(Python3_FOUND)
    set(AVM_MATH_PYTHON_EXECUTABLE "${Python3_EXECUTABLE}" CACHE FILEPATH
        "Python interpreter with mpmath for high-precision math validation")
    add_custom_target(avm_math_accuracy_tests_run
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/accuracy_reference.py"
            --probe "$<TARGET_FILE:avm_math_accuracy_probe>"
            --output "${CMAKE_CURRENT_BINARY_DIR}/math-accuracy.json"
            --samples 10000 --rounds 2
        DEPENDS avm_math_accuracy_probe
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        COMMENT "Checking production math against 100-digit mpmath references"
        USES_TERMINAL VERBATIM)
endif()

# Exercise the real FPOLY handler, active SPI stream and Timer1 interruption.
add_executable(avm_fpoly_tests interp/fpoly.cpp)
target_compile_features(avm_fpoly_tests PRIVATE cxx_std_17)
target_link_libraries(avm_fpoly_tests PRIVATE ardensdebuggerlib)
add_custom_target(avm_fpoly_tests_run
    COMMAND "$<TARGET_FILE:avm_fpoly_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/push16.bin"
    COMMAND "$<TARGET_FILE:avm_fpoly_tests>"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.hex"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/push16.bin" FXC
    DEPENDS avm_fpoly_tests avm_interpreter avm_interpreter_fxc
        "${AVM_PUSH16_TEST_DIR}/push16.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_fpoly_tests_run)

# These image lists never depend on avm_test_images or the unrelated hardware
# suites. O0 is deliberate: guest optimizer/codegen bugs can be O0-only.
add_custom_target(avm_math_fast_images DEPENDS ${AVM_MATH_FAST_IMAGES})
add_custom_target(avm_math_full_images DEPENDS ${AVM_MATH_FULL_IMAGES})
add_custom_target(avm_math_fast
    COMMAND "${CMAKE_COMMAND}" -E time "$<TARGET_FILE:avm_tests>" --filter "^math_" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_math_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_math_reduction_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_shortcuts_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_c99_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_math_misc_reference_tests>" --quick
    DEPENDS avm_math_fast_images avm_tests avm_math_reference_tests
        avm_math_reduction_tests avm_shortcuts_reference_tests avm_c99_reference_tests avm_math_misc_reference_tests avm_fpoly_tests_run
        avm_hypot_boundary_tests_run
    USES_TERMINAL VERBATIM)
add_custom_target(avm_math_full
    COMMAND "${CMAKE_COMMAND}" -E time "$<TARGET_FILE:avm_tests>" --filter "^math_"
    DEPENDS avm_math_full_images avm_tests avm_math_reference_tests_run
        avm_shortcuts_tests_run avm_c99_tests_run avm_math_misc_tests_run avm_rounding_tests_run avm_fpoly_tests_run
        avm_hypot_boundary_tests_run
    USES_TERMINAL VERBATIM)
add_custom_target(avm_trig_accelerators_run
    COMMAND "${CMAKE_COMMAND}"
        "-DAVM_OBJDUMP:FILEPATH=$<TARGET_FILE:llvm-objdump>"
        "-DAVM_OBJECT_DIR:PATH=${PROJECT_BINARY_DIR}/runtime/objects"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/math/check_trig_accelerators.cmake"
    DEPENDS avm_sysroot llvm-objdump
    VERBATIM)
add_dependencies(avm_math_fast avm_trig_accelerators_run)
add_dependencies(avm_math_full avm_trig_accelerators_run)
if(Python3_FOUND)
    add_custom_target(avm_math_accuracy_fast
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/accuracy_reference.py"
            --probe "$<TARGET_FILE:avm_math_accuracy_probe>"
            --profile fast --samples 64 --rounds 0
            --output "${CMAKE_CURRENT_BINARY_DIR}/math-accuracy-fast.json"
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/generate_reduction_table.py" --check
        DEPENDS avm_math_accuracy_probe USES_TERMINAL VERBATIM)
    add_dependencies(avm_math_fast avm_math_accuracy_fast)
    add_dependencies(avm_math_full avm_math_accuracy_tests_run)
    add_custom_target(avm_validation_full DEPENDS avm_tests_run avm_math_accuracy_tests_run)
else()
    add_custom_target(avm_validation_full DEPENDS avm_tests_run)
endif()
