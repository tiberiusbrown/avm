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
set(AVM_TEST_ADVANCE_LIMIT
    "20000000000000" CACHE STRING
    "Maximum emulated CPU cycles allowed for each AVM test")

# CONFIGURE_DEPENDS makes CMake regenerate when a test is added or removed.
file(GLOB AVM_ASM_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_ASM_TEST_DIR}/*.asm")
file(GLOB_RECURSE AVM_ASM_TEST_SUPPORT_SOURCES CONFIGURE_DEPENDS
    "${AVM_ASM_TEST_DIR}/include/*")
file(GLOB AVM_C_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_C_TEST_DIR}/*.c")
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
            if(AVM_TEST_NAME STREQUAL "separate_compilation")
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

        avm_add_object(
            OUTPUT "${AVM_TEST_OBJECT}"
            SOURCE "${AVM_TEST_SOURCE_FILE}"
            LANGUAGE ${AVM_TEST_LANGUAGE}
            INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
            COMPILE_OPTIONS "-${AVM_TEST_OPT_LEVEL}"
            DEPENDS avm_sysroot ${test_source_dependencies}
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
target_link_libraries(avm_tests PRIVATE ardensdebuggerlib)
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
    avm_test_images
    avm_interpreter
)

# Building avm_tests packages every current ASM, C, and C++ test. This target
# additionally runs the complete suite in one invocation.
add_custom_target(avm_tests_run
    COMMAND "$<TARGET_FILE:avm_tests>"
    DEPENDS avm_tests
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
