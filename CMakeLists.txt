cmake_minimum_required(VERSION 3.20)

project(avm LANGUAGES C CXX ASM)

# Build the AVM Clang/LLVM/LLD toolchain in-tree. The target includes a
# SelectionDAG code generator in addition to its MC and linker components.
set(LLVM_TARGETS_TO_BUILD              "host"      CACHE STRING "" FORCE)
set(LLVM_EXPERIMENTAL_TARGETS_TO_BUILD "AVM"       CACHE STRING "" FORCE)
set(LLVM_ENABLE_PROJECTS               "clang;lld" CACHE STRING "" FORCE)
set(LLVM_BUILD_TOOLS                   OFF         CACHE BOOL   "" FORCE)

# Do not place every LLVM command-line tool in the default build.
# Explicitly requested tools remain available as CMake targets.
set(LLVM_BUILD_TOOLS                   OFF         CACHE BOOL   "" FORCE)

# These parts of Clang are not needed for AVM compilation.
set(CLANG_ENABLE_STATIC_ANALYZER       OFF         CACHE BOOL   "" FORCE)
set(CLANG_ENABLE_ARCMT                 OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_TESTS                   OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_EXAMPLES                OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_BENCHMARKS              OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_DOCS                    OFF         CACHE BOOL   "" FORCE)

add_subdirectory(deps/llvm-project/llvm llvm-build)

add_custom_target(avm_toolchain
    DEPENDS
        clang
        llvm-ar
        llvm-mc
        llvm-objdump
        llvm-readobj
        lld
        llvm-avm-image
)

# LLD's CMake target is `lld`; on Windows the GNU driver is emitted as the
# ld.lld sibling alias.  Keep the invocation explicit and generator-safe.
set(AVM_LD_LLD "$<TARGET_FILE_DIR:lld>/ld.lld${CMAKE_EXECUTABLE_SUFFIX}")

# Build the target runtime, startup objects, libraries, and staged AVM sysroot.
add_subdirectory(runtime)

# Build only the Ardens debugger application. Keep Ardens's bundled LLVM
# integration disabled so it does not download or build its own LLVM tree.
set(ARDENS_LLVM      OFF CACHE BOOL "" FORCE)
set(ARDENS_DEBUGGER  ON  CACHE BOOL "" FORCE)
set(ARDENS_PLAYER    OFF CACHE BOOL "" FORCE)
set(ARDENS_FLASHCART OFF CACHE BOOL "" FORCE)
set(ARDENS_LIB       OFF CACHE BOOL "" FORCE)
set(ARDENS_LIBRETRO  OFF CACHE BOOL "" FORCE)
set(ARDENS_DIST      OFF CACHE BOOL "" FORCE)
set(ARDENS_BENCHMARK OFF CACHE BOOL "" FORCE)
set(ARDENS_CYCLES    OFF CACHE BOOL "" FORCE)
set(ARDENS_SDL       ON  CACHE BOOL "" FORCE)

# EXCLUDE_FROM_ALL prevents Ardens's unconditional integration_tests and
# library targets from entering the parent project's default build. The
# custom ALL target pulls in only the Ardens debugger executable and the
# libraries on which that executable depends.
add_subdirectory(deps/Ardens ardens-build EXCLUDE_FROM_ALL)
add_custom_target(avm_ardens_debugger ALL DEPENDS Ardens)

set(AVM_INTERPRETER_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/interp")
set(AVM_INTERPRETER_BUILD_DIR
    "${AVM_INTERPRETER_DIR}/build")
set(AVM_INTERPRETER_SOURCE
    "${AVM_INTERPRETER_DIR}/interp.asm")
set(AVM_INTERPRETER_BUILD_CMAKE
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake")
set(AVM_INTERPRETER_OBJECT
    "${AVM_INTERPRETER_BUILD_DIR}/interp.o")
set(AVM_INTERPRETER_ELF
    "${AVM_INTERPRETER_BUILD_DIR}/interp.elf")
set(AVM_INTERPRETER_MAP
    "${AVM_INTERPRETER_BUILD_DIR}/interp.map")
set(AVM_INTERPRETER_LISTING
    "${AVM_INTERPRETER_BUILD_DIR}/interp.lst")
set(AVM_INTERPRETER_HEX
    "${AVM_INTERPRETER_BUILD_DIR}/interp.hex")
set(AVM_INTERPRETER_SIZE_BINARY
    "${AVM_INTERPRETER_BUILD_DIR}/interp.size.bin")

set(AVM_INTERPRETER_MAX_SIZE 29696 CACHE STRING "")
set(AVM_AVR_GCC     "" CACHE FILEPATH "")
set(AVM_AVR_OBJCOPY "" CACHE FILEPATH "")
set(AVM_AVR_OBJDUMP "" CACHE FILEPATH "")

set(AVM_INTERPRETER_OUTPUTS
    "${AVM_INTERPRETER_OBJECT}"
    "${AVM_INTERPRETER_ELF}"
    "${AVM_INTERPRETER_MAP}"
    "${AVM_INTERPRETER_LISTING}"
    "${AVM_INTERPRETER_HEX}"
)

# Build through a CMake script rather than a platform-specific shell script.
# Tool discovery occurs when this target is built, so an AVR toolchain is not
# required merely to configure or build unrelated LLVM targets.
add_custom_command(
    OUTPUT ${AVM_INTERPRETER_OUTPUTS}
    COMMAND
        "${CMAKE_COMMAND}"
        "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
        "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
        "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
        "-DSOURCE:FILEPATH=${AVM_INTERPRETER_SOURCE}"
        "-DOUTPUT_OBJECT:FILEPATH=${AVM_INTERPRETER_OBJECT}"
        "-DOUTPUT_ELF:FILEPATH=${AVM_INTERPRETER_ELF}"
        "-DOUTPUT_MAP:FILEPATH=${AVM_INTERPRETER_MAP}"
        "-DOUTPUT_LISTING:FILEPATH=${AVM_INTERPRETER_LISTING}"
        "-DOUTPUT_HEX:FILEPATH=${AVM_INTERPRETER_HEX}"
        "-DTEMP_SIZE_BINARY:FILEPATH=${AVM_INTERPRETER_SIZE_BINARY}"
        "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
        -P "${AVM_INTERPRETER_BUILD_CMAKE}"
    DEPENDS
        "${AVM_INTERPRETER_SOURCE}"
        "${AVM_INTERPRETER_BUILD_CMAKE}"
    COMMENT "Building the AVR AVM interpreter"
    USES_TERMINAL
    VERBATIM
)

add_custom_target(avm_interpreter
    DEPENDS ${AVM_INTERPRETER_OUTPUTS}
)

# -----------------------------------------------------------------------------
# AVM assembly, C, and C++ test images and in-process test runner
# -----------------------------------------------------------------------------

set(AVM_ASM_TEST_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/tests/asm")
set(AVM_C_TEST_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/tests/c")
set(AVM_CXX_TEST_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/tests/cpp")
set(AVM_C_TEST_DISASSEMBLY_DIR
    "${AVM_C_TEST_DIR}/asm")
set(AVM_CXX_TEST_DISASSEMBLY_DIR
    "${AVM_CXX_TEST_DIR}/asm")
set(AVM_TEST_SOURCE
    "${CMAKE_CURRENT_SOURCE_DIR}/tests/avm_tests.cpp")
set(AVM_ASM_TEST_BINARY_DIR
    "${CMAKE_CURRENT_BINARY_DIR}/tests/asm")
set(AVM_C_TEST_BINARY_DIR
    "${CMAKE_CURRENT_BINARY_DIR}/tests/c")
set(AVM_CXX_TEST_BINARY_DIR
    "${CMAKE_CURRENT_BINARY_DIR}/tests/cpp")
set(AVM_TEST_ADVANCE_LIMIT
    "10000000000000" CACHE STRING
    "Maximum emulated CPU cycles allowed for each AVM test")

# llvm-objdump writes disassembly to stdout and has no portable output-file
# argument. Generate a small CMake script so custom commands can capture its
# output without shell-specific redirection.
set(AVM_DISASSEMBLE_SCRIPT
    "${CMAKE_CURRENT_BINARY_DIR}/DisassembleAvm.cmake")
file(WRITE "${AVM_DISASSEMBLE_SCRIPT}" [=[
if(NOT DEFINED AVM_OBJDUMP OR
   NOT DEFINED AVM_INPUT OR
   NOT DEFINED AVM_OUTPUT)
    message(FATAL_ERROR
        "AVM_OBJDUMP, AVM_INPUT, and AVM_OUTPUT must be defined")
endif()

execute_process(
    COMMAND
        "${AVM_OBJDUMP}"
        --disassemble
        --demangle
        --print-imm-hex
        "${AVM_INPUT}"
    OUTPUT_FILE "${AVM_OUTPUT}"
    ERROR_VARIABLE AVM_OBJDUMP_ERROR
    RESULT_VARIABLE AVM_OBJDUMP_RESULT
)

if(NOT AVM_OBJDUMP_RESULT EQUAL 0)
    message(FATAL_ERROR
        "llvm-objdump failed for ${AVM_INPUT}: ${AVM_OBJDUMP_ERROR}")
endif()
]=])

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
set(AVM_TEST_DISASSEMBLY_OUTPUTS)
foreach(AVM_TEST_ASM IN LISTS AVM_ASM_TEST_SOURCES)
    get_filename_component(AVM_TEST_NAME "${AVM_TEST_ASM}" NAME_WE)

    set(AVM_TEST_OBJECT
        "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.o")
    set(AVM_TEST_ELF
        "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.elf")
    set(AVM_TEST_IMAGE
        "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.bin")

    add_custom_command(
        OUTPUT "${AVM_TEST_OBJECT}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory
                "${AVM_ASM_TEST_BINARY_DIR}"
        COMMAND
            "$<TARGET_FILE:llvm-mc>"
            -triple=avm-unknown-arduboyfx
            -filetype=obj
            -I "${AVM_ASM_TEST_DIR}"
            "${AVM_TEST_ASM}"
            -o "${AVM_TEST_OBJECT}"
        DEPENDS
            llvm-mc
            "${AVM_TEST_ASM}"
            ${AVM_ASM_TEST_SUPPORT_SOURCES}
        COMMENT "Assembling AVM test ${AVM_TEST_NAME}"
        VERBATIM
    )

    add_custom_command(
        OUTPUT "${AVM_TEST_ELF}" "${AVM_TEST_IMAGE}"
        COMMAND
            "${AVM_LD_LLD}"
            -flavor gnu
            --entry=_start
            -o "${AVM_TEST_ELF}"
            "${AVM_TEST_OBJECT}"
        COMMAND
            "$<TARGET_FILE:llvm-avm-image>"
            "${AVM_TEST_ELF}"
            -o "${AVM_TEST_IMAGE}"
        DEPENDS
            lld
            llvm-avm-image
            "${AVM_TEST_OBJECT}"
        COMMENT "Linking and packaging AVM test ${AVM_TEST_NAME}"
        VERBATIM
    )

    list(APPEND AVM_TEST_IMAGE_OUTPUTS "${AVM_TEST_IMAGE}")
endforeach()

# Compile and package freestanding C and C++ tests. Each test is linked with
# crt0_test.o, which prints P or F from main's return value and terminates with
# SYS debug_break so the existing runner can compare serial output.
function(add_avm_compiled_test_images SOURCE_LIST LANGUAGE BINARY_DIR DISASSEMBLY_DIR)
    foreach(AVM_TEST_SOURCE_FILE IN LISTS ${SOURCE_LIST})
        get_filename_component(AVM_TEST_NAME
            "${AVM_TEST_SOURCE_FILE}" NAME_WE)

        set(AVM_TEST_OBJECT
            "${BINARY_DIR}/${AVM_TEST_NAME}.o")
        set(AVM_TEST_ELF
            "${BINARY_DIR}/${AVM_TEST_NAME}.elf")
        set(AVM_TEST_IMAGE
            "${BINARY_DIR}/${AVM_TEST_NAME}.bin")
        set(AVM_TEST_DISASSEMBLY
            "${DISASSEMBLY_DIR}/${AVM_TEST_NAME}.asm")

        set(AVM_TEST_LANGUAGE_FLAGS -std=c11)
        set(AVM_TEST_LANGUAGE_LABEL "C")
        if(LANGUAGE STREQUAL "CXX")
            set(AVM_TEST_LANGUAGE_FLAGS
                -std=c++17
                -fno-exceptions
                -fno-rtti
                -fno-threadsafe-statics
                -fno-use-cxa-atexit
            )
            set(AVM_TEST_LANGUAGE_LABEL "C++")
        endif()

        add_custom_command(
            OUTPUT "${AVM_TEST_OBJECT}"
            COMMAND "${CMAKE_COMMAND}" -E make_directory "${BINARY_DIR}"
            COMMAND
                "$<TARGET_FILE:clang>"
                --target=avm-unknown-arduboyfx
                -ffreestanding
                -fomit-frame-pointer
                -fno-stack-protector
                -fno-unwind-tables
                -fno-asynchronous-unwind-tables
                -ffunction-sections
                -fdata-sections
                -Os
                -Wall
                -Wextra
                -Werror
                ${AVM_TEST_LANGUAGE_FLAGS}
                -isystem "${AVM_SYSROOT_DIR}/include"
                -c "${AVM_TEST_SOURCE_FILE}"
                -o "${AVM_TEST_OBJECT}"
            DEPENDS
                clang
                avm_sysroot
                "${AVM_TEST_SOURCE_FILE}"
            COMMENT "Compiling AVM ${AVM_TEST_LANGUAGE_LABEL} test ${AVM_TEST_NAME}"
            VERBATIM
        )

        add_custom_command(
            OUTPUT
                "${AVM_TEST_ELF}"
                "${AVM_TEST_IMAGE}"
                "${AVM_TEST_DISASSEMBLY}"
            COMMAND "${CMAKE_COMMAND}" -E make_directory
                    "${DISASSEMBLY_DIR}"
            COMMAND
                "${AVM_LD_LLD}"
                -flavor gnu
                --entry=_start
                -o "${AVM_TEST_ELF}"
                "${AVM_SYSROOT_DIR}/lib/crt0_test.o"
                "${AVM_TEST_OBJECT}"
                "${AVM_SYSROOT_DIR}/lib/libavm.a"
                "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
            COMMAND
                "${CMAKE_COMMAND}"
                "-DAVM_OBJDUMP:FILEPATH=$<TARGET_FILE:llvm-objdump>"
                "-DAVM_INPUT:FILEPATH=${AVM_TEST_ELF}"
                "-DAVM_OUTPUT:FILEPATH=${AVM_TEST_DISASSEMBLY}"
                -P "${AVM_DISASSEMBLE_SCRIPT}"
            COMMAND
                "$<TARGET_FILE:llvm-avm-image>"
                "${AVM_TEST_ELF}"
                -o "${AVM_TEST_IMAGE}"
            DEPENDS
                lld
                llvm-objdump
                llvm-avm-image
                avm_sysroot
                "${AVM_TEST_OBJECT}"
                "${AVM_DISASSEMBLE_SCRIPT}"
            COMMENT "Linking, disassembling, and packaging AVM ${AVM_TEST_LANGUAGE_LABEL} test ${AVM_TEST_NAME}"
            VERBATIM
        )

        list(APPEND AVM_TEST_IMAGE_OUTPUTS "${AVM_TEST_IMAGE}")
        list(APPEND AVM_TEST_DISASSEMBLY_OUTPUTS
            "${AVM_TEST_DISASSEMBLY}")
    endforeach()

    set(AVM_TEST_IMAGE_OUTPUTS
        "${AVM_TEST_IMAGE_OUTPUTS}" PARENT_SCOPE)
    set(AVM_TEST_DISASSEMBLY_OUTPUTS
        "${AVM_TEST_DISASSEMBLY_OUTPUTS}" PARENT_SCOPE)
endfunction()

add_avm_compiled_test_images(
    AVM_C_TEST_SOURCES
    C
    "${AVM_C_TEST_BINARY_DIR}"
    "${AVM_C_TEST_DISASSEMBLY_DIR}")
add_avm_compiled_test_images(
    AVM_CXX_TEST_SOURCES
    CXX
    "${AVM_CXX_TEST_BINARY_DIR}"
    "${AVM_CXX_TEST_DISASSEMBLY_DIR}")

add_custom_target(avm_test_images
    DEPENDS
        ${AVM_TEST_IMAGE_OUTPUTS}
        ${AVM_TEST_DISASSEMBLY_OUTPUTS}
)

# The runner discovers ASM, C, and C++ sources, maps each source to its adjacent
# name_output.txt file and corresponding generated image, loads the interpreter
# and image directly into arduboy_t, and compares cpu.serial_bytes.
add_executable(avm_tests
    "${AVM_TEST_SOURCE}"
)
target_compile_features(avm_tests PRIVATE cxx_std_17)
target_link_libraries(avm_tests PRIVATE ardensdebuggerlib)
target_compile_definitions(avm_tests PRIVATE
    AVM_TEST_ASM_DIR="${AVM_ASM_TEST_DIR}"
    AVM_TEST_C_DIR="${AVM_C_TEST_DIR}"
    AVM_TEST_CXX_DIR="${AVM_CXX_TEST_DIR}"
    AVM_TEST_BIN_DIR="${AVM_ASM_TEST_BINARY_DIR}"
    AVM_TEST_C_BIN_DIR="${AVM_C_TEST_BINARY_DIR}"
    AVM_TEST_CXX_BIN_DIR="${AVM_CXX_TEST_BINARY_DIR}"
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
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    COMMENT "Running all AVM tests in-process"
    USES_TERMINAL
    VERBATIM
)

# -----------------------------------------------------------------------------
# AVM instruction-cycle benchmark
# -----------------------------------------------------------------------------

set(AVM_BENCH_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/bench")
set(AVM_BENCH_SOURCE
    "${AVM_BENCH_DIR}/avm_bench.cpp")
set(AVM_BENCH_ASM
    "${AVM_BENCH_DIR}/instructions.asm")
set(AVM_BENCH_BUILD_DIR
    "${CMAKE_CURRENT_BINARY_DIR}/bench")
set(AVM_BENCH_OBJECT
    "${AVM_BENCH_BUILD_DIR}/instructions.o")
set(AVM_BENCH_IMAGE
    "${AVM_BENCH_BUILD_DIR}/instructions.bin")
set(AVM_BENCH_ELF
    "${AVM_BENCH_BUILD_DIR}/instructions.elf")

# Assemble the benchmark bytecode as one AVM ET_REL object. LLD performs the
# link step; llvm-avm-image packages the resulting executable ELF.
add_custom_command(
    OUTPUT "${AVM_BENCH_OBJECT}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${AVM_BENCH_BUILD_DIR}"
    COMMAND
        "$<TARGET_FILE:llvm-mc>"
        -triple=avm-unknown-arduboyfx
        -filetype=obj
        -o "${AVM_BENCH_OBJECT}"
        "${AVM_BENCH_ASM}"
    DEPENDS
        llvm-mc
        "${AVM_BENCH_ASM}"
    COMMENT "Assembling AVM instruction benchmarks"
    VERBATIM
)

add_custom_command(
    OUTPUT "${AVM_BENCH_ELF}" "${AVM_BENCH_IMAGE}"
    COMMAND
        "${AVM_LD_LLD}"
        "${AVM_BENCH_OBJECT}"
        -o "${AVM_BENCH_ELF}"
    COMMAND
        "$<TARGET_FILE:llvm-avm-image>"
        "${AVM_BENCH_ELF}"
        -o "${AVM_BENCH_IMAGE}"
    DEPENDS
        lld
        llvm-avm-image
        "${AVM_BENCH_OBJECT}"
    COMMENT "Building the AVM instruction benchmark image"
    VERBATIM
)

add_custom_target(avm_bench_image
    DEPENDS "${AVM_BENCH_IMAGE}"
)

add_executable(avm_bench
    "${AVM_BENCH_SOURCE}"
)
target_compile_features(avm_bench PRIVATE cxx_std_17)
target_link_libraries(avm_bench PRIVATE ardensdebuggerlib)
target_compile_definitions(avm_bench PRIVATE
    AVM_BENCH_DIR="${AVM_BENCH_DIR}"
    AVM_BENCHMARK_DIR="${AVM_BENCH_DIR}"
    AVM_BENCH_INSTRUCTIONS_BIN="${AVM_BENCH_IMAGE}"
    AVM_BENCH_INTERPRETER_HEX="${AVM_INTERPRETER_HEX}"
)
add_dependencies(avm_bench
    avm_bench_image
    avm_interpreter
)

# Convenience target.  avm_bench itself is a normal build target; this target
# additionally runs it with the generated image and interpreter available at
# the compile-time paths above.
add_custom_target(avm_bench_run
    COMMAND "$<TARGET_FILE:avm_bench>"
    DEPENDS avm_tests_run avm_bench
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    COMMENT "Running AVM tests and instruction-cycle benchmarks"
    USES_TERMINAL
    VERBATIM
)
