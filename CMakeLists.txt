cmake_minimum_required(VERSION 3.20)

project(avm LANGUAGES C CXX ASM)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(AvmBuild)

# Build the AVM Clang/LLVM/LLD toolchain in-tree. The target includes a
# SelectionDAG code generator in addition to its MC and linker components.
set(LLVM_TARGETS_TO_BUILD              "host"      CACHE STRING "" FORCE)
set(LLVM_EXPERIMENTAL_TARGETS_TO_BUILD "AVM"       CACHE STRING "" FORCE)
set(LLVM_ENABLE_PROJECTS               "clang;lld" CACHE STRING "" FORCE)

# Do not place every LLVM command-line tool in the default build. Explicitly
# requested tools remain available as CMake targets.
set(LLVM_BUILD_TOOLS                   OFF         CACHE BOOL   "" FORCE)
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
# ld.lld sibling alias. Keep the invocation explicit and generator-safe.
set(AVM_LD_LLD "$<TARGET_FILE_DIR:lld>/ld.lld${CMAKE_EXECUTABLE_SUFFIX}")
set(AVM_DISASSEMBLE_SCRIPT
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/DisassembleAvm.cmake")

# These paths are consumed by more than one feature subdirectory.
set(AVM_INTERPRETER_HEX
    "${CMAKE_CURRENT_SOURCE_DIR}/interp/build/interp.hex")

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
# library targets from entering the parent project's default build. The custom
# ALL target pulls in only the debugger and the libraries it requires.
add_subdirectory(deps/Ardens ardens-build EXCLUDE_FROM_ALL)
add_custom_target(avm_ardens_debugger ALL DEPENDS Ardens)

add_subdirectory(interp)
add_subdirectory(tests)
add_subdirectory(bench)
