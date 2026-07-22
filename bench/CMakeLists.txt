set(AVM_BENCH_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(AVM_BENCH_SOURCE "${AVM_BENCH_DIR}/avm_bench.cpp")
set(AVM_BENCH_INSTRUCTION_SOURCE "${AVM_BENCH_DIR}/instructions.asm")
set(AVM_BENCH_INSTRUCTION_NAMES "${AVM_BENCH_DIR}/benchmark_names.txt")
set(AVM_BENCH_C_DIR "${AVM_BENCH_DIR}/c")
set(AVM_BENCH_C_DISASSEMBLY_DIR "${AVM_BENCH_C_DIR}/asm")
set(AVM_BENCH_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}")
set(AVM_BENCH_INSTRUCTION_OBJECT
    "${AVM_BENCH_BUILD_DIR}/instructions.o")
set(AVM_BENCH_INSTRUCTION_ELF
    "${AVM_BENCH_BUILD_DIR}/instructions.elf")
set(AVM_BENCH_INSTRUCTION_IMAGE
    "${AVM_BENCH_BUILD_DIR}/instructions.bin")
set(AVM_BENCH_C_BINARY_DIR "${AVM_BENCH_BUILD_DIR}/c")
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

add_custom_target(avm_bench_images
    DEPENDS
        "${AVM_BENCH_INSTRUCTION_NAMES}"
        ${AVM_BENCH_IMAGE_OUTPUTS}
        ${AVM_BENCH_DISASSEMBLY_OUTPUTS}
)

add_executable(avm_bench "${AVM_BENCH_SOURCE}")
set_target_properties(avm_bench PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
target_compile_features(avm_bench PRIVATE cxx_std_17)
target_link_libraries(avm_bench PRIVATE ardensdebuggerlib)
target_compile_definitions(avm_bench PRIVATE
    AVM_BENCH_INSTRUCTIONS_BIN="${AVM_BENCH_INSTRUCTION_IMAGE}"
    AVM_BENCH_INSTRUCTION_NAMES="${AVM_BENCH_INSTRUCTION_NAMES}"
    AVM_BENCH_INSTRUCTION_OUTPUT="${AVM_BENCH_DIR}/cycles_instruction.txt"
    AVM_BENCH_C_DIR="${AVM_BENCH_C_DIR}"
    AVM_BENCH_C_BIN_DIR="${AVM_BENCH_C_BINARY_DIR}"
    AVM_BENCH_BASELINE_BIN="${AVM_BENCH_BASELINE_IMAGE}"
    AVM_BENCH_INTERPRETER_HEX="${AVM_INTERPRETER_HEX}"
    AVM_BENCH_C_OUTPUT="${AVM_BENCH_DIR}/cycles_c.txt"
)
add_dependencies(avm_bench
    avm_bench_images
    avm_interpreter
)

# avm_bench itself is a normal build target; this target additionally runs the
# test suite, instruction benchmark image, and every C benchmark.
add_custom_target(avm_bench_run
    COMMAND "$<TARGET_FILE:avm_bench>"
    DEPENDS avm_tests_run avm_bench
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Running AVM tests, instruction benchmarks, and C benchmarks"
    USES_TERMINAL
    VERBATIM
)
