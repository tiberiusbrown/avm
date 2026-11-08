include(AvmFixtures)
find_package(Python3 COMPONENTS Interpreter REQUIRED)
find_package(Threads REQUIRED)
set(AVM_TEST_OPT_LEVELS O0 O1 O2 O3 Os Oz)
string(JOIN "," AVM_TEST_OPT_LEVELS_CSV ${AVM_TEST_OPT_LEVELS})
set(AVM_TEST_ADVANCE_LIMIT "60000000000000" CACHE STRING "Per-fixture emulated time limit in picoseconds")
set(AVM_ASM_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/interp/isa")
set(AVM_C_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(AVM_CXX_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(AVM_ASM_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/asm")
set(AVM_C_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/c")
set(AVM_CXX_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/cpp")
set(AVM_TEST_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/avm_tests.cpp")
set(AVM_EH_TEST_OPT_LEVELS O0 O2)
set(AVM_RTTI_TEST_OPT_LEVELS O0 O2)
set(AVM_RTTI_LTO_BIN_DIR "${AVM_CXX_TEST_BINARY_DIR}/rtti-lto")
file(GLOB_RECURSE AVM_ASM_TEST_SUPPORT_SOURCES CONFIGURE_DEPENDS "${AVM_ASM_TEST_DIR}/include/*")
file(GLOB fixture_registries CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/fixtures/*.cmake")
foreach(registry IN LISTS fixture_registries)
    include("${registry}")
endforeach()
get_property(AVM_TEST_IMAGE_OUTPUTS GLOBAL PROPERTY AVM_FIXTURE_IMAGES_core)
get_property(AVM_EH_TEST_IMAGES GLOBAL PROPERTY AVM_FIXTURE_IMAGES_eh)
get_property(AVM_RTTI_TEST_IMAGES GLOBAL PROPERTY AVM_FIXTURE_IMAGES_rtti)
get_property(AVM_MATH_FAST_IMAGES GLOBAL PROPERTY AVM_MATH_FAST_IMAGES)
get_property(AVM_MATH_FULL_IMAGES GLOBAL PROPERTY AVM_MATH_FULL_IMAGES)
get_property(fixture_manifest GLOBAL PROPERTY AVM_FIXTURE_MANIFEST)
file(GENERATE OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/fixtures.tsv" CONTENT "${fixture_manifest}")
avm_add_check(avm_test_images DEPENDS ${AVM_TEST_IMAGE_OUTPUTS})
avm_add_check(avm_eh_catch_all_images DEPENDS ${AVM_EH_TEST_IMAGES})
file(GLOB AVM_EH_SUPPORT_HEADERS CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/support/cpp/eh_*.h")
file(GLOB AVM_RTTI_SUPPORT_HEADERS CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/support/cpp/rtti_*.h")

# The runner discovers ASM, C, and C++ sources, maps each source to its adjacent
# name_output.txt file and corresponding generated image, loads the interpreter
# and image directly into arduboy_t, and compares cpu.serial_bytes.
add_executable(avm_tests "${AVM_TEST_SOURCE}")
set_target_properties(avm_tests PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
target_compile_features(avm_tests PRIVATE cxx_std_17)
find_package(Threads REQUIRED)
target_link_libraries(avm_tests PRIVATE ardensdebuggerlib Threads::Threads avm_runner_support)
target_compile_definitions(avm_tests PRIVATE
    AVM_TEST_MANIFEST="${CMAKE_CURRENT_BINARY_DIR}/fixtures.tsv"
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


avm_add_check(avm_tests_run
    COMMAND "$<TARGET_FILE:avm_tests>"
    DEPENDS avm_tests avm_test_images avm_push16_tests_run avm_stack_bounds_tests_run avm_audio_tests_run
        avm_display_system_tests_run avm_timer0_tests_run
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Running all AVM tests in-process"
    USES_TERMINAL
    VERBATIM
)
add_dependencies(avm_tests_run avm_format_long_long_tests_run)
add_dependencies(avm_tests_run avm_header_diagnostics_run)
add_dependencies(avm_tests_run avm_rtti_static_run)
add_dependencies(avm_tests_run avm_rtti_polymorphic_run)
add_dependencies(avm_tests_run avm_rtti_mixed_link_run)
add_dependencies(avm_tests_run avm_dynamic_cast_run)

# std::exception_ptr with RTTI: the typeid-driven make_exception_ptr path and rethrow_if_nested
# on polymorphic types. The fixture needs -frtti and -fexceptions, which the ordinary matrix omits.
avm_add_check(avm_rtti_exception_ptr_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^rtti_exception_ptr$" --opt O0,O2
    DEPENDS avm_tests avm_test_images
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_tests_run avm_rtti_exception_ptr_run)

include(cmake/CxxAbi.cmake)
include(cmake/Interpreter.cmake)
include(cmake/Debugger.cmake)
include(cmake/Math.cmake)
include(cmake/Headers.cmake)
include(cmake/Stdio.cmake)
add_subdirectory(termination)

# Host-only tools and compiler suites are part of the same validation inventory.
avm_add_check(avm_audio_tools_tests_run
    COMMAND "${Python3_EXECUTABLE}" -m pytest "${PROJECT_SOURCE_DIR}/tests/tools" -q
        -o "cache_dir=${CMAKE_CURRENT_BINARY_DIR}/pytest-cache"
        --basetemp "${CMAKE_CURRENT_BINARY_DIR}/pytest-tmp"
    VERBATIM)
# Every tool named in an AVM lit RUN line. The lld target provides ld.lld.
set(lit_tools FileCheck count llvm-config not split-file llc llvm-as llvm-dis
    llvm-dwarfdump llvm-mca llvm-nm llvm-readelf opt yaml2obj clang lld
    llvm-ar llvm-avm-image llvm-mc llvm-objcopy llvm-objdump llvm-readobj)
foreach(suite llvm clang lld)
    if(suite STREQUAL "llvm")
        set(lit_dir "${PROJECT_BINARY_DIR}/llvm-build/test")
    else()
        set(lit_dir "${PROJECT_BINARY_DIR}/llvm-build/tools/${suite}/test")
    endif()
    avm_add_check(avm_${suite}_tests_run
        COMMAND "${Python3_EXECUTABLE}" "${PROJECT_BINARY_DIR}/llvm-build/bin/llvm-lit"
            -sv --filter=AVM "${lit_dir}"
        DEPENDS ${lit_tools} VERBATIM)
endforeach()

set(core_fast_images ${AVM_TEST_IMAGE_OUTPUTS})
list(FILTER core_fast_images INCLUDE REGEX "/(asm/|O0/|O2/)")
avm_add_check(avm_core_fast_run
    COMMAND "$<TARGET_FILE:avm_tests>" --opt O0,O2
    DEPENDS avm_tests ${core_fast_images} VERBATIM)
