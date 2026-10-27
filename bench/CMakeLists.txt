set(AVM_BENCH_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(AVM_BENCH_SOURCE "${AVM_BENCH_DIR}/avm_bench.cpp")
set(AVM_BENCH_INSTRUCTION_SOURCE "${AVM_BENCH_DIR}/instructions.asm")
set(AVM_BENCH_INSTRUCTION_NAMES "${AVM_BENCH_DIR}/benchmark_names.txt")
set(AVM_BENCH_C_DIR "${AVM_BENCH_DIR}/c")
set(AVM_BENCH_C_DISASSEMBLY_DIR "${AVM_BENCH_C_DIR}/asm")
set(AVM_BENCH_C_MIR_SOURCE_DIR "${AVM_BENCH_C_DIR}")
set(AVM_BENCH_CXX_DIR "${AVM_BENCH_DIR}/cpp")
set(AVM_BENCH_CXX_DISASSEMBLY_DIR "${AVM_BENCH_CXX_DIR}/asm")
set(AVM_BENCH_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}")
set(AVM_BENCH_INSTRUCTION_OBJECT
    "${AVM_BENCH_BUILD_DIR}/instructions.o")
set(AVM_BENCH_INSTRUCTION_ELF
    "${AVM_BENCH_BUILD_DIR}/instructions.elf")
set(AVM_BENCH_INSTRUCTION_IMAGE
    "${AVM_BENCH_BUILD_DIR}/instructions.bin")
set(AVM_BENCH_C_BINARY_DIR "${AVM_BENCH_BUILD_DIR}/c")
set(AVM_BENCH_C_MIR_BINARY_DIR "${AVM_BENCH_C_BINARY_DIR}/mir")
set(AVM_BENCH_CXX_BINARY_DIR "${AVM_BENCH_BUILD_DIR}/cpp")
set(AVM_BENCH_BASELINE_SOURCE "${AVM_BENCH_DIR}/baseline.c")
set(AVM_BENCH_BASELINE_OBJECT
    "${AVM_BENCH_BUILD_DIR}/__avm_bench_baseline.o")
set(AVM_BENCH_BASELINE_ELF
    "${AVM_BENCH_BUILD_DIR}/__avm_bench_baseline.elf")
set(AVM_BENCH_BASELINE_IMAGE
    "${AVM_BENCH_BUILD_DIR}/__avm_bench_baseline.bin")
set(AVM_BENCH_BASELINE_DISASSEMBLY
    "${AVM_BENCH_BUILD_DIR}/__avm_bench_baseline.asm")

# Build the single instruction-benchmark image. Its DEBUG_BREAK-delimited
# intervals and benchmark_names.txt entries are consumed sequentially by the
# benchmark runner.
avm_add_object(
    OUTPUT "${AVM_BENCH_INSTRUCTION_OBJECT}"
    SOURCE "${AVM_BENCH_INSTRUCTION_SOURCE}"
    LANGUAGE ASM
)
avm_add_image(
    OBJECTS "${AVM_BENCH_INSTRUCTION_OBJECT}"
    OUTPUT_ELF "${AVM_BENCH_INSTRUCTION_ELF}"
    OUTPUT_IMAGE "${AVM_BENCH_INSTRUCTION_IMAGE}"
    ENTRY _start
)

# Each source in bench/c is a complete freestanding program with exactly one
# pair of __avm_debug_break() calls around the code being measured.
file(GLOB AVM_BENCH_C_SOURCES CONFIGURE_DEPENDS
    "${AVM_BENCH_C_DIR}/*.c")
file(GLOB AVM_BENCH_C_HEADERS CONFIGURE_DEPENDS
    "${AVM_BENCH_C_DIR}/*.h")
file(GLOB AVM_BENCH_TRIG_HEADERS CONFIGURE_DEPENDS
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/*.h")
file(GLOB AVM_BENCH_C_MIR_SOURCES CONFIGURE_DEPENDS
    "${AVM_BENCH_C_MIR_SOURCE_DIR}/*.c")
file(GLOB AVM_BENCH_CXX_SOURCES CONFIGURE_DEPENDS
    "${AVM_BENCH_CXX_DIR}/*.cpp")

set(AVM_BENCH_IMAGE_OUTPUTS
    "${AVM_BENCH_INSTRUCTION_IMAGE}"
    "${AVM_BENCH_BASELINE_IMAGE}")
set(AVM_BENCH_DISASSEMBLY_OUTPUTS
    "${AVM_BENCH_BASELINE_DISASSEMBLY}")

# The adjacent DEBUG_BREAK calls measure the overhead subtracted from every C
# benchmark. Compile this committed source exactly like the measured programs.
avm_add_object(
    OUTPUT "${AVM_BENCH_BASELINE_OBJECT}"
    SOURCE "${AVM_BENCH_BASELINE_SOURCE}"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    DEPENDS avm_sysroot
)
avm_add_image(
    OBJECTS "${AVM_BENCH_BASELINE_OBJECT}"
    OUTPUT_ELF "${AVM_BENCH_BASELINE_ELF}"
    OUTPUT_IMAGE "${AVM_BENCH_BASELINE_IMAGE}"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0_test.o"
    LIBRARIES
        "${AVM_SYSROOT_DIR}/lib/libavm.a"
        "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    DISASSEMBLY "${AVM_BENCH_BASELINE_DISASSEMBLY}"
    GC_SECTIONS
    DEPENDS avm_sysroot
)

foreach(AVM_BENCH_C_SOURCE IN LISTS AVM_BENCH_C_SOURCES)
    get_filename_component(AVM_BENCH_NAME
        "${AVM_BENCH_C_SOURCE}" NAME_WE)
    set(AVM_BENCH_OBJECT
        "${AVM_BENCH_C_BINARY_DIR}/${AVM_BENCH_NAME}.o")
    set(AVM_BENCH_ELF
        "${AVM_BENCH_C_BINARY_DIR}/${AVM_BENCH_NAME}.elf")
    set(AVM_BENCH_IMAGE
        "${AVM_BENCH_C_BINARY_DIR}/${AVM_BENCH_NAME}.bin")
    set(AVM_BENCH_DISASSEMBLY
        "${AVM_BENCH_C_DISASSEMBLY_DIR}/${AVM_BENCH_NAME}.asm")

    avm_add_object(
        OUTPUT "${AVM_BENCH_OBJECT}"
        SOURCE "${AVM_BENCH_C_SOURCE}"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        DEPENDS avm_sysroot ${AVM_BENCH_C_HEADERS} ${AVM_BENCH_TRIG_HEADERS}
    )
    avm_add_image(
        OBJECTS "${AVM_BENCH_OBJECT}"
        OUTPUT_ELF "${AVM_BENCH_ELF}"
        OUTPUT_IMAGE "${AVM_BENCH_IMAGE}"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0_test.o"
        LIBRARIES
            "${AVM_SYSROOT_DIR}/lib/libavm.a"
            "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        DISASSEMBLY "${AVM_BENCH_DISASSEMBLY}"
        GC_SECTIONS
        DEPENDS avm_sysroot
    )
    list(APPEND AVM_BENCH_IMAGE_OUTPUTS "${AVM_BENCH_IMAGE}")
    list(APPEND AVM_BENCH_DISASSEMBLY_OUTPUTS
        "${AVM_BENCH_DISASSEMBLY}")
    if(AVM_BENCH_NAME MATCHES "^math_")
        list(APPEND AVM_MATH_BENCH_OUTPUTS "${AVM_BENCH_IMAGE}" "${AVM_BENCH_DISASSEMBLY}")
    endif()
    if(AVM_BENCH_NAME MATCHES "^math_(trig_|sin|cos|tan)")
        list(APPEND AVM_TRIG_BENCH_OUTPUTS "${AVM_BENCH_IMAGE}" "${AVM_BENCH_DISASSEMBLY}")
    endif()
endforeach()

# Fast iteration on runtime math without compiling every diagnostic MIR dump.
add_custom_target(avm_math_bench_images DEPENDS ${AVM_MATH_BENCH_OUTPUTS}
    "${AVM_BENCH_BASELINE_IMAGE}")
add_custom_target(avm_trig_bench_images DEPENDS ${AVM_TRIG_BENCH_OUTPUTS}
    "${AVM_BENCH_BASELINE_IMAGE}")
add_custom_target(avm_trig_bench_run
    COMMAND "$<TARGET_FILE:avm_bench>" --c-only --filter "^math_(trig_|sin|cos|tan)"
        --c-output "${CMAKE_CURRENT_BINARY_DIR}/trig-cycles.txt"
    DEPENDS avm_bench avm_trig_bench_images USES_TERMINAL VERBATIM)

# C++ benchmarks use the same startup and baseline as C, but exercise C++
# calls, object layout, and lifetime code generation.
foreach(AVM_BENCH_CXX_SOURCE IN LISTS AVM_BENCH_CXX_SOURCES)
    get_filename_component(AVM_BENCH_NAME
        "${AVM_BENCH_CXX_SOURCE}" NAME_WE)
    set(AVM_BENCH_OBJECT
        "${AVM_BENCH_CXX_BINARY_DIR}/${AVM_BENCH_NAME}.o")
    set(AVM_BENCH_ELF
        "${AVM_BENCH_CXX_BINARY_DIR}/${AVM_BENCH_NAME}.elf")
    set(AVM_BENCH_IMAGE
        "${AVM_BENCH_CXX_BINARY_DIR}/${AVM_BENCH_NAME}.bin")
    set(AVM_BENCH_DISASSEMBLY
        "${AVM_BENCH_CXX_DISASSEMBLY_DIR}/${AVM_BENCH_NAME}.asm")

    avm_add_object(
        OUTPUT "${AVM_BENCH_OBJECT}"
        SOURCE "${AVM_BENCH_CXX_SOURCE}"
        LANGUAGE CXX
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        DEPENDS avm_sysroot
    )
    avm_add_image(
        OBJECTS "${AVM_BENCH_OBJECT}"
        OUTPUT_ELF "${AVM_BENCH_ELF}"
        OUTPUT_IMAGE "${AVM_BENCH_IMAGE}"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0_test.o"
        LIBRARIES
            "${AVM_SYSROOT_DIR}/lib/libavm.a"
            "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        DISASSEMBLY "${AVM_BENCH_DISASSEMBLY}"
        GC_SECTIONS
        DEPENDS avm_sysroot
    )
    list(APPEND AVM_BENCH_IMAGE_OUTPUTS "${AVM_BENCH_IMAGE}")
    list(APPEND AVM_BENCH_DISASSEMBLY_OUTPUTS
        "${AVM_BENCH_DISASSEMBLY}")
endforeach()

# Sources under bench/c/mir are diagnostic-only. Compile them with the regular
# AVM C pipeline while capturing LLVM's pass-by-pass MIR dump in the build tree.
set(AVM_BENCH_MIR_OUTPUTS)
foreach(AVM_BENCH_C_MIR_SOURCE IN LISTS AVM_BENCH_C_MIR_SOURCES)
    get_filename_component(AVM_BENCH_MIR_NAME
        "${AVM_BENCH_C_MIR_SOURCE}" NAME_WE)
    set(AVM_BENCH_MIR_OBJECT
        "${AVM_BENCH_C_MIR_BINARY_DIR}/${AVM_BENCH_MIR_NAME}.o")
    set(AVM_BENCH_MIR_OUTPUT
        "${AVM_BENCH_C_MIR_BINARY_DIR}/${AVM_BENCH_MIR_NAME}.mir")

    avm_add_object(
        OUTPUT "${AVM_BENCH_MIR_OBJECT}"
        SOURCE "${AVM_BENCH_C_MIR_SOURCE}"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        COMPILE_OPTIONS
            -fno-color-diagnostics
            -mllvm -filter-print-funcs=avm_test_main
            -mllvm -print-before-all
            -mllvm -print-after-all
        STDERR_OUTPUT "${AVM_BENCH_MIR_OUTPUT}"
        DEPENDS avm_sysroot ${AVM_BENCH_C_HEADERS}
    )
    list(APPEND AVM_BENCH_MIR_OUTPUTS
        "${AVM_BENCH_MIR_OBJECT}"
        "${AVM_BENCH_MIR_OUTPUT}")
endforeach()

add_custom_target(avm_bench_mir
    DEPENDS ${AVM_BENCH_MIR_OUTPUTS})

add_custom_target(avm_bench_images
    DEPENDS
        "${AVM_BENCH_INSTRUCTION_NAMES}"
        ${AVM_BENCH_IMAGE_OUTPUTS}
        ${AVM_BENCH_DISASSEMBLY_OUTPUTS}
)

# The manifest shares the existing image rules; requesting the mix does not
# depend on the all-images, MIR, or test targets.
set(AVM_BENCH_MIX_MANIFEST "${AVM_BENCH_DIR}/instruction_mix_benchmarks.txt")
set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${AVM_BENCH_MIX_MANIFEST}")
file(STRINGS "${AVM_BENCH_MIX_MANIFEST}" AVM_BENCH_MIX_LINES)
set(AVM_BENCH_MIX_IMAGES "${AVM_BENCH_BASELINE_IMAGE}")
set(AVM_BENCH_MIX_ENTRIES)
foreach(line IN LISTS AVM_BENCH_MIX_LINES)
    string(REGEX REPLACE "#.*$" "" line "${line}")
    string(STRIP "${line}" line)
    if(line STREQUAL "")
        continue()
    endif()
    if(line IN_LIST AVM_BENCH_MIX_ENTRIES)
        message(FATAL_ERROR "Duplicate instruction-mix workload: ${line}")
    endif()
    list(APPEND AVM_BENCH_MIX_ENTRIES "${line}")
    if(line MATCHES "^[A-Za-z0-9_]+\\.c$")
        set(source_dir "${AVM_BENCH_C_DIR}")
        set(binary_dir "${AVM_BENCH_C_BINARY_DIR}")
    elseif(line MATCHES "^[A-Za-z0-9_]+\\.cpp$")
        set(source_dir "${AVM_BENCH_CXX_DIR}")
        set(binary_dir "${AVM_BENCH_CXX_BINARY_DIR}")
    else()
        message(FATAL_ERROR "Invalid instruction-mix workload: ${line}")
    endif()
    if(NOT EXISTS "${source_dir}/${line}")
        message(FATAL_ERROR "Missing instruction-mix workload: ${line}")
    endif()
    get_filename_component(stem "${line}" NAME_WE)
    list(APPEND AVM_BENCH_MIX_IMAGES "${binary_dir}/${stem}.bin")
endforeach()
if(NOT AVM_BENCH_MIX_ENTRIES)
    message(FATAL_ERROR "Instruction-mix manifest is empty")
endif()

# Reuse the authoritative MC decoder. Only MC/Support libraries are needed;
# there is no LLVM code generator or LLDB dependency in the profiling library.
add_library(avm_instruction_mix_lib STATIC instruction_mix.cpp)
target_compile_features(avm_instruction_mix_lib PUBLIC cxx_std_17)
target_include_directories(avm_instruction_mix_lib PRIVATE
    "${PROJECT_SOURCE_DIR}/deps/llvm-project/llvm/include"
    "${CMAKE_BINARY_DIR}/llvm-build/include")
target_link_libraries(avm_instruction_mix_lib PUBLIC ardensdebuggerlib
    LLVMAVMDisassembler LLVMAVMDesc LLVMAVMInfo LLVMMCDisassembler LLVMMC LLVMSupport)

add_executable(avm_bench "${AVM_BENCH_SOURCE}")
set_target_properties(avm_bench PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
target_compile_features(avm_bench PRIVATE cxx_std_17)
find_package(Threads REQUIRED)
target_link_libraries(avm_bench PRIVATE avm_instruction_mix_lib Threads::Threads)
string(REGEX REPLACE "^-" "" AVM_BENCH_DISPLAY_OPT "${AVM_OPT_LEVEL}")
target_compile_definitions(avm_bench PRIVATE
    AVM_BENCH_OPT_LEVEL="${AVM_BENCH_DISPLAY_OPT}"
    AVM_BENCH_COMPILER_BIN="$<TARGET_FILE:clang>"
    AVM_BENCH_MIX_MANIFEST="${AVM_BENCH_MIX_MANIFEST}"
    AVM_BENCH_MIX_OUTPUT="${AVM_BENCH_DIR}/instruction_mix.txt"
    AVM_BENCH_BOUNDARY_METADATA="${AVM_INTERPRETER_BOUNDARY_METADATA}"
    AVM_BENCH_INSTRUCTIONS_BIN="${AVM_BENCH_INSTRUCTION_IMAGE}"
    AVM_BENCH_INSTRUCTION_NAMES="${AVM_BENCH_INSTRUCTION_NAMES}"
    AVM_BENCH_INSTRUCTION_OUTPUT="${AVM_BENCH_DIR}/cycles_instruction.txt"
    AVM_BENCH_C_DIR="${AVM_BENCH_C_DIR}"
    AVM_BENCH_C_BIN_DIR="${AVM_BENCH_C_BINARY_DIR}"
    AVM_BENCH_CXX_DIR="${AVM_BENCH_CXX_DIR}"
    AVM_BENCH_CXX_BIN_DIR="${AVM_BENCH_CXX_BINARY_DIR}"
    AVM_BENCH_BASELINE_BIN="${AVM_BENCH_BASELINE_IMAGE}"
    AVM_BENCH_INTERPRETER_HEX="${AVM_INTERPRETER_HEX}"
    AVM_BENCH_C_OUTPUT="${AVM_BENCH_DIR}/cycles_c.txt"
    AVM_BENCH_CXX_OUTPUT="${AVM_BENCH_DIR}/cycles_cpp.txt"
)
add_dependencies(avm_bench
    avm_interpreter
)

add_custom_target(avm_instruction_mix
    COMMAND "$<TARGET_FILE:avm_bench>" --instruction-mix
    DEPENDS avm_bench avm_interpreter_boundary ${AVM_BENCH_MIX_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Profiling representative AVM instruction mix"
    USES_TERMINAL VERBATIM)

avm_add_object(OUTPUT "${AVM_BENCH_BUILD_DIR}/mix_fixture.o"
    SOURCE "${PROJECT_SOURCE_DIR}/tests/instruction_mix_fixture.asm" LANGUAGE ASM)
avm_add_image(OBJECTS "${AVM_BENCH_BUILD_DIR}/mix_fixture.o"
    OUTPUT_ELF "${AVM_BENCH_BUILD_DIR}/mix_fixture.elf"
    OUTPUT_IMAGE "${AVM_BENCH_BUILD_DIR}/mix_fixture.bin" ENTRY _start)
add_executable(avm_instruction_mix_tests "${PROJECT_SOURCE_DIR}/tests/instruction_mix_test.cpp")
target_link_libraries(avm_instruction_mix_tests PRIVATE avm_instruction_mix_lib)
add_custom_target(avm_instruction_mix_tests_run
    COMMAND "$<TARGET_FILE:avm_instruction_mix_tests>" "${AVM_INTERPRETER_HEX}"
        "${AVM_INTERPRETER_BOUNDARY_METADATA}" "${AVM_BENCH_BASELINE_IMAGE}"
        "${AVM_BENCH_BUILD_DIR}/mix_fixture.bin"
    DEPENDS avm_instruction_mix_tests avm_interpreter_boundary
        "${AVM_BENCH_BASELINE_IMAGE}" "${AVM_BENCH_BUILD_DIR}/mix_fixture.bin"
    USES_TERMINAL VERBATIM)
add_dependencies(avm_validation_full avm_instruction_mix_tests_run)

# avm_bench itself is a normal build target; this target additionally runs the
# test suite, instruction benchmark image, and every C and C++ benchmark.
add_custom_target(avm_bench_run
    COMMAND "$<TARGET_FILE:avm_bench>"
    DEPENDS
        avm_tests_run
        avm_bench
        avm_bench_images
        avm_bench_mir
        avm_instruction_mix
        ardurogue2
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Running AVM tests, instruction benchmarks, and compiled benchmarks"
    USES_TERMINAL
    VERBATIM
)

find_package(Python3 COMPONENTS Interpreter QUIET)
if(Python3_FOUND)
    add_custom_target(avm_runner_cli_tests_run
        COMMAND "${Python3_EXECUTABLE}" "${PROJECT_SOURCE_DIR}/tests/runner_cli_test.py"
            --build "${CMAKE_BINARY_DIR}"
        DEPENDS avm_tests avm_bench "${AVM_BENCH_C_BINARY_DIR}/math_sin.bin"
            "${AVM_BENCH_C_BINARY_DIR}/math_cos.bin"
            "${AVM_BENCH_BASELINE_IMAGE}"
            "${PROJECT_BINARY_DIR}/tests/c/O2/affine_store_values.bin"
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}" USES_TERMINAL VERBATIM)
    add_dependencies(avm_validation_full avm_runner_cli_tests_run)
endif()
