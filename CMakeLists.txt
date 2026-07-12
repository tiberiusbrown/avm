cmake_minimum_required(VERSION 3.20)

project(avm LANGUAGES C CXX ASM)

set(LLVM_TARGETS_TO_BUILD              ""    CACHE STRING "" FORCE)
set(LLVM_EXPERIMENTAL_TARGETS_TO_BUILD "AVM" CACHE STRING "" FORCE)
set(LLVM_ENABLE_PROJECTS               "lld" CACHE STRING "" FORCE)
set(LLVM_BUILD_TOOLS                   ON    CACHE BOOL   "" FORCE)

add_subdirectory(deps/llvm-project/llvm llvm-build)

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

find_package(Python3 REQUIRED COMPONENTS Interpreter)

set(AVM_TEST_HEADLESS_MS     "5000")
set(AVM_TEST_TIMEOUT_SECONDS "30")
set(AVM_TEST_SCRIPT          "${CMAKE_CURRENT_SOURCE_DIR}/tests/avm_tests.py")
set(AVM_ASM_TEST_DIR         "${CMAKE_CURRENT_SOURCE_DIR}/tests/asm")
set(AVM_TEST_WORK_DIR        "${CMAKE_CURRENT_BINARY_DIR}/tests/$<CONFIG>")
set(AVM_INTERPRETER_HEX      "${CMAKE_CURRENT_SOURCE_DIR}/interp/build/interp.hex")

# Build the required LLVM tools and Ardens, then run the unified AVM test
# driver. The driver currently processes tests/asm/*.asm files, but may later
# be extended to compile and run C/C++ tests as well.
add_custom_target(avm_tests
    COMMAND
        "${Python3_EXECUTABLE}"
        "${AVM_TEST_SCRIPT}"
        --llvm-mc "$<TARGET_FILE:llvm-mc>"
        --llvm-avm-image "$<TARGET_FILE:llvm-avm-image>"
        --ardens "$<TARGET_FILE:Ardens>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --asm-dir "${AVM_ASM_TEST_DIR}"
        --work-dir "${AVM_TEST_WORK_DIR}"
        --headless-ms "${AVM_TEST_HEADLESS_MS}"
        --timeout-seconds "${AVM_TEST_TIMEOUT_SECONDS}"
    DEPENDS
        llvm-mc
        llvm-avm-image
        Ardens
        "${AVM_TEST_SCRIPT}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    COMMENT "Running AVM tests with the Ardens debugger"
    USES_TERMINAL
    VERBATIM
)