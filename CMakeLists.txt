cmake_minimum_required(VERSION 3.20)

project(avm LANGUAGES C CXX ASM)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(AvmBuild)

# Build the AVM Clang/LLVM/LLD toolchain in-tree. The target includes a
# SelectionDAG code generator in addition to its MC and linker components.
set(LLVM_TARGETS_TO_BUILD              ""          CACHE STRING "" FORCE)
set(LLVM_EXPERIMENTAL_TARGETS_TO_BUILD "AVM"       CACHE STRING "" FORCE)
set(LLVM_ENABLE_PROJECTS               "clang;lld" CACHE STRING "" FORCE)
set(LLD_BUILD_ELF_ONLY                  ON          CACHE BOOL   "" FORCE)

# Do not place every LLVM command-line tool in the default build. Explicitly
# requested tools remain available as CMake targets.
set(LLVM_BUILD_TOOLS                   OFF         CACHE BOOL   "" FORCE)
set(CLANG_BUILD_TOOLS                  OFF         CACHE BOOL   "" FORCE)
set(LLD_BUILD_TOOLS                    OFF         CACHE BOOL   "" FORCE)
set(CLANG_ENABLE_STATIC_ANALYZER       OFF         CACHE BOOL   "" FORCE)
set(CLANG_ENABLE_ARCMT                 OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_TESTS                   OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_EXAMPLES                OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_BENCHMARKS              OFF         CACHE BOOL   "" FORCE)
set(LLVM_BUILD_DOCS                    OFF         CACHE BOOL   "" FORCE)
set(BUG_REPORT_URL "https://github.com/tiberiusbrown/llvm-project/issues/" CACHE STRING "" FORCE)

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

# Each SDK command is a native executable. Keep the AVM names beside the LLVM
# tools in the build tree, but install only the AVM names.
set(AVM_SDK_BUILD_BIN "${CMAKE_BINARY_DIR}/llvm-build/bin")
file(REMOVE "${AVM_SDK_BUILD_BIN}/avm-clang.py"
            "${AVM_SDK_BUILD_BIN}/avm-clang.cmd")
set(AVM_SDK_ALIAS_OUTPUTS)
foreach(AVM_SDK_ALIAS IN ITEMS
        "clang|clang" "ld|lld" "ar|llvm-ar" "mc|llvm-mc"
        "objdump|llvm-objdump" "readobj|llvm-readobj"
        "image|llvm-avm-image")
    string(REPLACE "|" ";" AVM_SDK_ALIAS_FIELDS "${AVM_SDK_ALIAS}")
    list(GET AVM_SDK_ALIAS_FIELDS 0 AVM_SDK_ALIAS_NAME)
    list(GET AVM_SDK_ALIAS_FIELDS 1 AVM_SDK_ALIAS_TARGET)
    set(AVM_SDK_ALIAS_OUTPUT
        "${AVM_SDK_BUILD_BIN}/avm-${AVM_SDK_ALIAS_NAME}${CMAKE_EXECUTABLE_SUFFIX}")
    add_custom_command(
        OUTPUT "${AVM_SDK_ALIAS_OUTPUT}"
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
                "$<TARGET_FILE:${AVM_SDK_ALIAS_TARGET}>"
                "${AVM_SDK_ALIAS_OUTPUT}"
        DEPENDS ${AVM_SDK_ALIAS_TARGET}
        VERBATIM)
    list(APPEND AVM_SDK_ALIAS_OUTPUTS "${AVM_SDK_ALIAS_OUTPUT}")
endforeach()
add_custom_target(avm_sdk_tools DEPENDS ${AVM_SDK_ALIAS_OUTPUTS})
add_dependencies(avm_toolchain avm_sdk_tools)

install(PROGRAMS ${AVM_SDK_ALIAS_OUTPUTS}
    DESTINATION bin COMPONENT avm-sdk)
install(DIRECTORY "${CMAKE_BINARY_DIR}/llvm-build/lib/clang/"
    DESTINATION lib/clang COMPONENT avm-sdk)
install(DIRECTORY "${AVM_SYSROOT_DIR}/"
    DESTINATION sysroot COMPONENT avm-sdk
    PATTERN ".runtime-stamp" EXCLUDE)

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
add_subdirectory(projects)
add_subdirectory(tests)
add_subdirectory(bench)
