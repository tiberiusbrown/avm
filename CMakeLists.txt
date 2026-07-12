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

find_package(Python3 REQUIRED COMPONENTS Interpreter)

set(AVM_TEST_HEADLESS_MS "5000" CACHE STRING "")
set(AVM_TEST_TIMEOUT_SECONDS "30" CACHE STRING "")

set(AVM_TEST_SCRIPT
    "${CMAKE_CURRENT_SOURCE_DIR}/tests/avm_tests.py")
set(AVM_ASM_TEST_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/tests/asm")
set(AVM_TEST_WORK_DIR
    "${CMAKE_CURRENT_BINARY_DIR}/tests/$<CONFIG>")

# Build the required LLVM tools, Ardens, and the AVR interpreter, then run the
# unified AVM test driver.
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
        avm_interpreter
        "${AVM_TEST_SCRIPT}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    COMMENT "Running AVM tests with the Ardens debugger"
    USES_TERMINAL
    VERBATIM
)