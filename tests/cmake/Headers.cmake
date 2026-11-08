# Inspect a dead-buffer caller with the clearing implementation visible at O3.
set(c23_explicit_ir "${CMAKE_CURRENT_BINARY_DIR}/c23/explicit.ll")
avm_add_object(OUTPUT "${c23_explicit_ir}"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/c23/explicit_codegen.c"
    LANGUAGE C INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -O3 -S -emit-llvm
    DEPENDS avm_sysroot "${PROJECT_SOURCE_DIR}/runtime/lib/string.c")
avm_add_check(avm_c23_explicit_check
    COMMAND "${CMAKE_COMMAND}" "-DINPUT:FILEPATH=${c23_explicit_ir}"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/c23/check_explicit.cmake"
    DEPENDS "${c23_explicit_ir}" VERBATIM)
add_dependencies(avm_tests_run avm_c23_explicit_check)
add_dependencies(avm_tests_run avm_termination_checks)

# Header integration belongs to the runtime repository rather than depending on
# its parent checkout from inside the LLVM fork's standalone lit suite.
set(header_api "${CMAKE_CURRENT_SOURCE_DIR}/runtime/headers/api_codegen.cpp")
set(header_api_options --target=avm-unknown-arduboyfx -nostdlibinc
    -I "${PROJECT_SOURCE_DIR}/runtime/include" -ffreestanding -std=c++20)
avm_add_check(avm_header_api_tests_run
    COMMAND "$<TARGET_FILE:clang>" ${header_api_options} -O0 -S -emit-llvm
        "${header_api}" -o "${CMAKE_CURRENT_BINARY_DIR}/header-api.ll"
    COMMAND "$<TARGET_FILE:FileCheck>" "${header_api}" --check-prefix=IR
        "--input-file=${CMAKE_CURRENT_BINARY_DIR}/header-api.ll"
    COMMAND "$<TARGET_FILE:clang>" ${header_api_options} -O2 -S
        "${header_api}" -o "${CMAKE_CURRENT_BINARY_DIR}/header-api.s"
    COMMAND "$<TARGET_FILE:FileCheck>" "${header_api}" --check-prefix=ASM
        "--input-file=${CMAKE_CURRENT_BINARY_DIR}/header-api.s"
    COMMAND "$<TARGET_FILE:clang>" ${header_api_options} -fsyntax-only
        -Xclang -verify -Xclang -verify-ignore-unexpected=note
        "${CMAKE_CURRENT_SOURCE_DIR}/runtime/headers/api_diagnostics.cpp"
    DEPENDS clang FileCheck VERBATIM)
