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
