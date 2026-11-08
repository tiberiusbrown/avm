# Verify sampled sqrt significands at both exponent parities, table neighbors
# and exponent/subnormal packing boundaries against host double sqrt. Check the
# large-angle reducer's exact integer product with deterministic mantissa samples.
add_library(avm_math_reference_kernel OBJECT
    math/errno_storage.c
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sqrt.c")
target_include_directories(avm_math_reference_kernel PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
target_compile_definitions(avm_math_reference_kernel PRIVATE
    sqrtf=avm_reference_sqrtf)
if(MSVC)
    target_compile_options(avm_math_reference_kernel PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_reference_kernel PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_math_reference_tests
    math/sqrt_reference.c math/sqrt_original.c)
if(MSVC)
    target_compile_options(avm_math_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_reference_tests PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
target_link_libraries(avm_math_reference_tests PRIVATE avm_math_reference_kernel)
add_executable(avm_math_reduction_tests math/rem_pio2_product_reference.c)
if(MSVC)
    target_compile_options(avm_math_reduction_tests PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_math_reduction_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_math_reduction_tests PRIVATE m)
endif()
if(NOT MSVC)
    target_link_libraries(avm_math_reference_tests PRIVATE m)
endif()
avm_add_check(avm_math_reference_tests_run
    COMMAND "$<TARGET_FILE:avm_math_reference_tests>"
    COMMAND "$<TARGET_FILE:avm_math_reduction_tests>"
    DEPENDS avm_math_reference_tests avm_math_reduction_tests
    USES_TERMINAL)
add_dependencies(avm_tests_run avm_math_reference_tests_run)

# Compile the production rounding kernels under distinct names so host libm
# supplies an independent reference, including signed zero and NaN handling.
add_library(avm_rounding_reference_kernels OBJECT
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_floor.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_ceil.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_round.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_trunc.c")
target_include_directories(avm_rounding_reference_kernels PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
target_compile_definitions(avm_rounding_reference_kernels PRIVATE
    floorf=avm_reference_floorf ceilf=avm_reference_ceilf
    roundf=avm_reference_roundf truncf=avm_reference_truncf)
if(MSVC)
    target_compile_options(avm_rounding_reference_kernels PRIVATE /fp:strict)
else()
    target_compile_options(avm_rounding_reference_kernels PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_rounding_reference_tests math/rounding_reference.c)
target_link_libraries(avm_rounding_reference_tests PRIVATE
    avm_rounding_reference_kernels)
if(NOT MSVC)
    target_link_libraries(avm_rounding_reference_tests PRIVATE m)
endif()
avm_add_check(avm_rounding_tests_run
    COMMAND "$<TARGET_FILE:avm_rounding_reference_tests>"
    COMMAND "${CMAKE_COMMAND}"
        "-DAVM_NM=$<TARGET_FILE:llvm-nm>"
        "-DAVM_OBJECT_DIR=${PROJECT_BINARY_DIR}/runtime/objects"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/math/check_rounding_shifts.cmake"
    DEPENDS avm_rounding_reference_tests avm_sysroot llvm-nm
    USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_rounding_tests_run)

# Run the production shortcuts, sqrt and angle reducer under private names;
# the harness uses host double libm as an independent binary32 reference.
add_library(avm_shortcuts_reference_kernels OBJECT
    math/errno_storage.c
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_remainder.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_remquo.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_rint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_nearbyint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_lrint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_lround.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_llrint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_llround.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_ilogb.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_logb.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fdim.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_nan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fmaxmag.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fminmag.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_round.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_gamma.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_erf.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sinh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_cosh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_tanh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_asinh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_acosh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_atanh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_exp2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_expm1.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log1p.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_cbrt.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_asin.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_acos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_decompose.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_hypot.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_atan2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_atan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_tan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_sin.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_cos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_sincos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log10.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_pow.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_exp.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_fmod.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sqrt.c"
    math/rem_pio2_reference_kernel.c
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/kf_rem_pio2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_scalbn.c")
target_include_directories(avm_shortcuts_reference_kernels PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
foreach(function lgammaf tgammaf erff erfcf remainderf remquof rintf nearbyintf lrintf lroundf llrintf llroundf ilogbf logbf fdimf nanf fmaxmagf fminmagf roundf sinhf coshf tanhf asinhf acoshf atanhf exp2f expm1f log1pf cbrtf asinf acosf ldexpf frexpf modff nextafterf nexttowardf hypotf atan2f atanf sinf cosf sincosf tanf logf log2f log10f powf expf fmodf sqrtf scalbnf scalblnf fminf fmaxf)
    target_compile_definitions(avm_shortcuts_reference_kernels PRIVATE
        "${function}=avm_reference_${function}")
endforeach()
if(MSVC)
    target_compile_options(avm_shortcuts_reference_kernels PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_shortcuts_reference_kernels PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_math_misc_reference_tests math/misc_reference.c)
target_link_libraries(avm_math_misc_reference_tests PRIVATE avm_shortcuts_reference_kernels)
if(MSVC)
    target_compile_options(avm_math_misc_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_misc_reference_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_math_misc_reference_tests PRIVATE m)
endif()
avm_add_check(avm_math_misc_tests_run
    COMMAND "$<TARGET_FILE:avm_math_misc_reference_tests>"
    DEPENDS avm_math_misc_reference_tests USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_math_misc_tests_run)

add_executable(avm_shortcuts_reference_tests math/shortcuts_reference.c)
target_link_libraries(avm_shortcuts_reference_tests PRIVATE avm_shortcuts_reference_kernels)
add_executable(avm_math_accuracy_probe math/accuracy_probe.c)
target_link_libraries(avm_math_accuracy_probe PRIVATE avm_shortcuts_reference_kernels)
add_executable(avm_c99_reference_tests math/c99_reference.c)
target_link_libraries(avm_c99_reference_tests PRIVATE avm_shortcuts_reference_kernels)
if(MSVC)
    target_compile_options(avm_c99_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_c99_reference_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_c99_reference_tests PRIVATE m)
endif()
avm_add_check(avm_c99_tests_run
    COMMAND "$<TARGET_FILE:avm_c99_reference_tests>"
    COMMAND "$<TARGET_FILE:clang>" --target=x86_64-w64-windows-gnu -std=c++17
        -fsyntax-only -nostdinc -I "${PROJECT_SOURCE_DIR}/runtime/include"
        "${CMAKE_CURRENT_SOURCE_DIR}/math/classify_host.cpp"
    DEPENDS avm_c99_reference_tests clang USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_c99_tests_run)
add_executable(avm_hypot_boundary_tests math/hypot_boundary_reference.c)
if(MSVC)
    target_compile_options(avm_hypot_boundary_tests PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_hypot_boundary_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_hypot_boundary_tests PRIVATE m)
endif()
avm_add_check(avm_hypot_boundary_tests_run
    COMMAND "$<TARGET_FILE:avm_hypot_boundary_tests>"
    DEPENDS avm_hypot_boundary_tests USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_hypot_boundary_tests_run)
if(NOT MSVC)
    target_link_libraries(avm_shortcuts_reference_tests PRIVATE m)
    target_link_libraries(avm_math_accuracy_probe PRIVATE m)
endif()
avm_add_check(avm_shortcuts_tests_run
    COMMAND "$<TARGET_FILE:avm_shortcuts_reference_tests>"
    DEPENDS avm_shortcuts_reference_tests USES_TERMINAL)
add_dependencies(avm_tests_run avm_shortcuts_tests_run)

if(Python3_FOUND)
    set(AVM_MATH_PYTHON_EXECUTABLE "${Python3_EXECUTABLE}" CACHE FILEPATH
        "Python interpreter with mpmath for high-precision math validation")
    avm_add_check(avm_math_accuracy_tests_run
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/accuracy_reference.py"
            --probe "$<TARGET_FILE:avm_math_accuracy_probe>"
            --output "${CMAKE_CURRENT_BINARY_DIR}/math-accuracy.json"
            --samples 10000 --rounds 2
        DEPENDS avm_math_accuracy_probe
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        COMMENT "Checking production math against 100-digit mpmath references"
        USES_TERMINAL VERBATIM)
endif()

# Exercise FF/FPOLY arithmetic, ISA behavior and active SPI stream timing.
add_executable(avm_fpoly_tests interp/fpoly.cpp)
target_compile_features(avm_fpoly_tests PRIVATE cxx_std_17)
target_link_libraries(avm_fpoly_tests PRIVATE ardensdebuggerlib)
avm_add_check(avm_fpoly_tests_run
    COMMAND "$<TARGET_FILE:avm_fpoly_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_BINARY_DIR}/interp/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/push16.bin"
    COMMAND "$<TARGET_FILE:avm_fpoly_tests>"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.hex"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/push16.bin" FXC
    DEPENDS avm_fpoly_tests avm_interpreter avm_interpreter_fxc
        "${AVM_PUSH16_TEST_DIR}/push16.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_fpoly_tests_run)

# These image lists never depend on avm_test_images or the unrelated hardware
# suites. O0 is deliberate: guest optimizer/codegen bugs can be O0-only.
avm_add_check(avm_math_fast_images DEPENDS ${AVM_MATH_FAST_IMAGES})
avm_add_check(avm_math_full_images DEPENDS ${AVM_MATH_FULL_IMAGES})
avm_add_check(avm_math_fast
    COMMAND "${CMAKE_COMMAND}" -E time "$<TARGET_FILE:avm_tests>" --filter "^math_" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_math_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_math_reduction_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_shortcuts_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_c99_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_math_misc_reference_tests>" --quick
    DEPENDS avm_math_fast_images avm_tests avm_math_reference_tests
        avm_math_reduction_tests avm_shortcuts_reference_tests avm_c99_reference_tests avm_math_misc_reference_tests avm_fpoly_tests_run
        avm_hypot_boundary_tests_run
    USES_TERMINAL VERBATIM)
avm_add_check(avm_math_full
    COMMAND "${CMAKE_COMMAND}" -E time "$<TARGET_FILE:avm_tests>" --filter "^math_"
    DEPENDS avm_math_full_images avm_tests avm_math_reference_tests_run
        avm_shortcuts_tests_run avm_c99_tests_run avm_math_misc_tests_run avm_rounding_tests_run avm_fpoly_tests_run
        avm_hypot_boundary_tests_run
    USES_TERMINAL VERBATIM)
avm_add_check(avm_trig_accelerators_run
    COMMAND "${CMAKE_COMMAND}"
        "-DAVM_OBJDUMP:FILEPATH=$<TARGET_FILE:llvm-objdump>"
        "-DAVM_OBJECT_DIR:PATH=${PROJECT_BINARY_DIR}/runtime/objects"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/math/check_trig_accelerators.cmake"
    DEPENDS avm_sysroot llvm-objdump
    VERBATIM)
add_dependencies(avm_math_fast avm_trig_accelerators_run)
add_dependencies(avm_math_full avm_trig_accelerators_run)
if(Python3_FOUND)
    avm_add_check(avm_math_accuracy_fast
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/accuracy_reference.py"
            --probe "$<TARGET_FILE:avm_math_accuracy_probe>"
            --profile fast --samples 64 --rounds 0
            --output "${CMAKE_CURRENT_BINARY_DIR}/math-accuracy-fast.json"
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/generate_reduction_table.py" --check
        DEPENDS avm_math_accuracy_probe USES_TERMINAL VERBATIM)
    add_dependencies(avm_math_fast avm_math_accuracy_fast)
    add_dependencies(avm_math_full avm_math_accuracy_tests_run)

endif()

# MSVC has no C99 complex language support; use an independent Linux reference
# through WSL on Windows. This never links host math into guest images.
if(WIN32)
    find_program(AVM_COMPLEX_WSL wsl)
    if(AVM_COMPLEX_WSL)
        set(complex_reference_options --wsl)
    endif()
endif()
if(NOT WIN32 OR AVM_COMPLEX_WSL)
    avm_add_check(avm_complex_reference_tests_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/math/run_complex_reference.py"
            --output "${CMAKE_CURRENT_BINARY_DIR}/complex-reference"
            ${complex_reference_options}
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
endif()
