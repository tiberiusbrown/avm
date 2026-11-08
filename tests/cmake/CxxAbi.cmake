# Whole-program variants reuse the fixture registry's support units.
avm_fixture_variant(rtti_cross_unit DIRECTORY "${AVM_RTTI_LTO_BIN_DIR}/O2"
    OUTPUT_PREFIX AVM_RTTI_LTO COMPILE_OPTIONS -frtti -flto=full)
avm_fixture_variant(rtti_polymorphic_cross_unit DIRECTORY "${AVM_RTTI_LTO_BIN_DIR}/O2"
    OUTPUT_PREFIX AVM_RTTI_POLY_LTO COMPILE_OPTIONS -frtti -flto=full)

# The exception integration fixture is part of this matrix, because it names its
# type with typeid and throws it from the other unit. Its EH images are built in the
# EH matrix above.
avm_add_check(avm_rtti_static_images DEPENDS
    ${AVM_RTTI_TEST_IMAGES} "${AVM_RTTI_LTO_IMAGE}" "${AVM_RTTI_POLY_LTO_IMAGE}")

# Runs the static typeid fixtures at O0 and O2, the full-LTO cross-unit image, and the
# exception integration fixture. Each typeid descriptor is also checked in the packed
# image by rtti_static_verify.py.
# This block precedes the file's shared find_package(Python3) call, so it locates
# the interpreter itself. Its verifier commands would otherwise have no executable.
find_package(Python3 COMPONENTS Interpreter REQUIRED)
set(AVM_RTTI_STATIC_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_static_verify.py")
avm_check_cases(avm_rtti_static_run_cases_1
    "${Python3_EXECUTABLE}" -I "${AVM_RTTI_STATIC_VERIFY}" --elf
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_static.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_static.bin" --expect _ZTI5Alpha --expect _ZTI4Beta --expect _ZTI5Gamma --expect _ZTI5Delta --expect _ZTI8RttiPoly --expect _ZTIi --expect _ZTIN12_GLOBAL__N_19AnonymousE --observed global_alpha=_ZTI5Alpha
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_static.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_static.bin" --expect _ZTI5Alpha --expect _ZTI4Beta --expect _ZTI5Gamma --expect _ZTI5Delta --expect _ZTI8RttiPoly --expect _ZTIi --expect _ZTIN12_GLOBAL__N_19AnonymousE --observed global_alpha=_ZTI5Alpha --forbid malloc --forbid free
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_cross_unit.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_cross_unit.bin" --expect _ZTI11SharedAlpha --expect _ZTI10SharedBeta --expect _ZTI11SharedKeyed
    CASE "${AVM_RTTI_LTO_BIN_DIR}/O2/rtti_cross_unit.elf" --image "${AVM_RTTI_LTO_BIN_DIR}/O2/rtti_cross_unit.bin" --expect _ZTI11SharedAlpha --expect _ZTI10SharedBeta --expect _ZTI11SharedKeyed
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typeinfo_identity.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typeinfo_identity.bin" --expect _ZTI6Remote --expect _ZTI5Local
)
avm_add_check(avm_rtti_static_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^rtti_(static|cross_unit)$" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^rtti_cross_unit$" --opt O2
        --cpp-bin-dir "${AVM_RTTI_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_typeinfo_identity$" --opt O0,O2
    ${avm_rtti_static_run_cases_1}
    DEPENDS avm_tests avm_eh_catch_all_images avm_rtti_static_images llvm-avm-image
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
# Dynamic typeid and std::bad_typeid. The runner builds each fixture at O0 and O2, the
# cross-unit fixture is also linked with full LTO, and the verifiers decode each query
# from emulator RAM and the packed image. The corrupt target is verified only by patching,
# so the runner does not select it.
set(AVM_RTTI_POLY_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_polymorphic_verify.py")
set(AVM_RTTI_POLY_CORRUPT_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_polymorphic_corrupt_verify.py")
set(AVM_RTTI_BAD_TYPEID_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_bad_typeid_verify.py")
set(AVM_RTTI_POLY_PROBE_ARGS
    --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>"
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
set(AVM_RTTI_POLY_TYPES
    --expect _ZTIN12_GLOBAL__N_17DerivedE --expect _ZTIN12_GLOBAL__N_11CE
    --expect _ZTIN12_GLOBAL__N_11BE --expect _ZTIN12_GLOBAL__N_15CBaseE
    --expect _ZTIN12_GLOBAL__N_15SLeftE --expect _ZTIN12_GLOBAL__N_16SRightE
    --expect _ZTIN12_GLOBAL__N_15SBothE --expect _ZTIN12_GLOBAL__N_16VCBaseE
    --expect _ZTIN12_GLOBAL__N_16VCLeftE --expect _ZTIN12_GLOBAL__N_17VCRightE
    --expect _ZTIN12_GLOBAL__N_15VCTopE --expect _ZTIN12_GLOBAL__N_110HelperCtorE
    --expect _ZTIN12_GLOBAL__N_18CDerivedE --expect _ZTIN12_GLOBAL__N_18GDerivedE
    --expect _ZTIN12_GLOBAL__N_18VDiamondE --expect _ZTIN12_GLOBAL__N_19LeftRightE)
set(AVM_RTTI_POLY_LTO_TYPES
    --expect _ZTIN9rtti_poly13SharedDerivedE --expect _ZTIN9rtti_poly13InlineDerivedE)
avm_check_cases(avm_rtti_polymorphic_run_cases_1
    "${Python3_EXECUTABLE}" -I "${AVM_RTTI_POLY_VERIFY}" ${AVM_RTTI_POLY_PROBE_ARGS} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_polymorphic.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_polymorphic.elf" --trace 2 ${AVM_RTTI_POLY_TYPES}
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_polymorphic.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_polymorphic.elf" ${AVM_RTTI_POLY_TYPES}
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_polymorphic_high_address.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_polymorphic_high_address.elf" --high --secondary --expect _ZTIN12_GLOBAL__N_18HDerivedE
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_polymorphic_high_address.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_polymorphic_high_address.elf" --high --secondary --expect _ZTIN12_GLOBAL__N_18HDerivedE
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_polymorphic_cross_unit.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_polymorphic_cross_unit.elf" ${AVM_RTTI_POLY_LTO_TYPES}
    CASE "${AVM_RTTI_LTO_BIN_DIR}/O2/rtti_polymorphic_cross_unit.bin" --elf "${AVM_RTTI_LTO_BIN_DIR}/O2/rtti_polymorphic_cross_unit.elf" ${AVM_RTTI_POLY_LTO_TYPES}
)
avm_check_cases(avm_rtti_polymorphic_run_cases_2
    "${Python3_EXECUTABLE}" -I "${AVM_RTTI_POLY_CORRUPT_VERIFY}" --probe "$<TARGET_FILE:avm_eh_stack_probe>" --interpreter "${AVM_INTERPRETER_HEX}" --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}" --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_polymorphic_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_polymorphic_corrupt_target.elf" --scratch-dir "${AVM_CXX_TEST_BINARY_DIR}/rtti-corrupt-O0"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_polymorphic_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_polymorphic_corrupt_target.elf" --scratch-dir "${AVM_CXX_TEST_BINARY_DIR}/rtti-corrupt-O2"
)
avm_check_cases(avm_rtti_polymorphic_run_cases_3
    "${Python3_EXECUTABLE}" -I "${AVM_RTTI_BAD_TYPEID_VERIFY}" --probe "$<TARGET_FILE:avm_eh_stack_probe>" --interpreter "${AVM_INTERPRETER_HEX}" --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}" --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_bad_typeid.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_bad_typeid.elf" --throws 6
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_bad_typeid.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_bad_typeid.elf" --throws 6
)
avm_add_check(avm_rtti_polymorphic_run
    COMMAND "$<TARGET_FILE:avm_tests>"
        --filter "^rtti_polymorphic(_cross_unit|_high_address)?$" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>"
        --filter "^rtti_polymorphic_cross_unit$" --opt O2 --cpp-bin-dir "${AVM_RTTI_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^rtti_bad_typeid(_unhandled)?$" --opt O0,O2
    ${avm_rtti_polymorphic_run_cases_1}
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_RTTI_STATIC_VERIFY}"
        --elf "${AVM_RTTI_POLY_LTO_ELF}" --image "${AVM_RTTI_POLY_LTO_IMAGE}"
        --expect _ZTIN9rtti_poly13SharedDerivedE --expect _ZTIN9rtti_poly13InlineDerivedE
        --expect _ZTIN9rtti_poly6SharedE --expect _ZTIN9rtti_poly6InlineE
    ${avm_rtti_polymorphic_run_cases_2}
    ${avm_rtti_polymorphic_run_cases_3}
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_RTTI_STATIC_VERIFY}"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_bad_typeid.elf"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_bad_typeid.bin"
        --expect _ZTISt10bad_typeid --expect _ZTISt9exception
    DEPENDS avm_tests avm_eh_stack_probe avm_rtti_static_images llvm-avm-image llvm-objdump
        avm_interpreter
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)

# A mixed -frtti and -fno-rtti link. The high-address copy of the descriptor is selected
# in one order, and the vtable's marker must reject that link. The window copy first links.
set(AVM_RTTI_MIXED_LINK_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_mixed_link_verify.py")
avm_add_check(avm_rtti_mixed_link_run
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_RTTI_MIXED_LINK_VERIFY}"
        --clang "$<TARGET_FILE:clang>"
        --ld "$<TARGET_FILE_DIR:lld>/ld.lld"
        --sysroot-lib "${AVM_SYSROOT_DIR}/lib"
        --support-dir "${CMAKE_CURRENT_SOURCE_DIR}/support/cpp"
        --scratch-dir "${AVM_CXX_TEST_BINARY_DIR}/rtti-mixed-link"
    DEPENDS clang lld avm_sysroot
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)

# A mixed -frtti and -fno-rtti link with a live dynamic typeid. The selected vtable must name
# a valid descriptor, so the -fno-rtti copy is rejected at O0, O2, and full LTO, while the
# -frtti copy links and its image runs. A link without dynamic typeid, and a link whose typeid
# helper is collected, keep the -fno-rtti copy.
set(AVM_RTTI_MIXED_VTABLE_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_mixed_vtable_verify.py")
avm_add_check(avm_rtti_mixed_vtable_run
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_RTTI_MIXED_VTABLE_VERIFY}"
        --clang "$<TARGET_FILE:clang>"
        --ld "$<TARGET_FILE_DIR:lld>/ld.lld"
        --packer "$<TARGET_FILE:llvm-avm-image>"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --sysroot-lib "${AVM_SYSROOT_DIR}/lib"
        --support-dir "${CMAKE_CURRENT_SOURCE_DIR}/support/cpp"
        --scratch-dir "${AVM_CXX_TEST_BINARY_DIR}/rtti-mixed-vtable"
    DEPENDS clang lld llvm-avm-image avm_eh_stack_probe avm_interpreter avm_sysroot
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_rtti_polymorphic_run avm_rtti_mixed_vtable_run)

# dynamic_cast fixtures. The O0 and O2 images come from the RTTI loop above. The full-LTO
# cross-unit image is built here from the same support unit, so the class descriptors merge
# after the whole program is optimized. avm_dynamic_cast_run runs each fixture and the
# corruption target, checks each cast against the packed image and RAM, and measures the stack.
set(AVM_DYNAMIC_CAST_LTO_BIN_DIR "${AVM_CXX_TEST_BINARY_DIR}/dynamic-cast-lto")
avm_fixture_variant(rtti_dynamic_cast_cross_unit
    DIRECTORY "${AVM_DYNAMIC_CAST_LTO_BIN_DIR}/O2"
    OUTPUT_PREFIX AVM_DYNAMIC_CAST_LTO COMPILE_OPTIONS -frtti -flto=full)
avm_add_check(avm_dynamic_cast_lto_images DEPENDS "${AVM_DYNAMIC_CAST_LTO_IMAGE}")

set(AVM_DYNAMIC_CAST_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_dynamic_cast_verify.py")
set(AVM_DYNAMIC_CAST_CORRUPT_VERIFY
    "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_dynamic_cast_corrupt_verify.py")
set(AVM_DYNAMIC_CAST_STACK_REPORT
    "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_dynamic_cast_stack_report.py")
set(AVM_DYNAMIC_CAST_MUTATION_TEST
    "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_dynamic_cast_verify_mutation_test.py")
set(AVM_PROBE_SNAPSHOT_TEST
    "${CMAKE_CURRENT_SOURCE_DIR}/debug/avm_eh_stack_probe_snapshot_test.py")
set(AVM_DYNAMIC_CAST_PROBE_ARGS
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
set(AVM_DYNAMIC_CAST_CASES rtti_dynamic_cast rtti_dynamic_cast_cross_unit
    rtti_dynamic_cast_high_address rtti_dynamic_cast_construction)
# Every final image is measured: the class-cast fixtures and the corruption target, the handled and
# unhandled std::bad_cast fixtures, and the void-only images with and without GC. The void-only
# images are measured from __avm_dynamic_cast_to_void.
set(AVM_DYNAMIC_CAST_STACK_IMAGES)
foreach(AVM_DC_OPT IN ITEMS O0 O2)
    foreach(AVM_DC_CASE IN LISTS AVM_DYNAMIC_CAST_CASES ITEMS rtti_dynamic_cast_corrupt_target
            rtti_dynamic_cast_bad_cast)
        list(APPEND AVM_DYNAMIC_CAST_STACK_IMAGES --image
            "${AVM_CXX_TEST_BINARY_DIR}/${AVM_DC_OPT}/${AVM_DC_CASE}.bin")
    endforeach()
    list(APPEND AVM_DYNAMIC_CAST_STACK_IMAGES --unhandled
        "${AVM_CXX_TEST_BINARY_DIR}/${AVM_DC_OPT}/rtti_dynamic_cast_bad_cast_unhandled.bin")
    foreach(AVM_DC_VARIANT IN ITEMS nogc gc)
        list(APPEND AVM_DYNAMIC_CAST_STACK_IMAGES --void
            "${AVM_CXX_TEST_BINARY_DIR}/dynamic-cast-void/${AVM_DC_VARIANT}/${AVM_DC_OPT}/rtti_dynamic_cast_void_nogc.bin")
    endforeach()
endforeach()
list(APPEND AVM_DYNAMIC_CAST_STACK_IMAGES --image "${AVM_DYNAMIC_CAST_LTO_IMAGE}")
# Checks the opt-in snapshot fields of the host probe: stack arguments and a RAM range. The probe
# output and the guest memory must agree, and invalid requests must be rejected.
avm_add_check(avm_probe_snapshot_run
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_PROBE_SNAPSHOT_TEST}"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast.elf"
    DEPENDS avm_eh_stack_probe avm_interpreter avm_rtti_static_images
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)

avm_check_cases(avm_dynamic_cast_run_cases_1
    "${Python3_EXECUTABLE}" -I "${AVM_RTTI_BAD_TYPEID_VERIFY}" --kind cast ${AVM_DYNAMIC_CAST_PROBE_ARGS} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_bad_cast.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_bad_cast.elf" --throws 6
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_bad_cast.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_bad_cast.elf" --throws 6
)
avm_check_cases(avm_dynamic_cast_run_cases_2
    "${Python3_EXECUTABLE}" -I "${AVM_DYNAMIC_CAST_CORRUPT_VERIFY}" ${AVM_DYNAMIC_CAST_PROBE_ARGS} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_corrupt_target.elf" --scratch-dir "${AVM_CXX_TEST_BINARY_DIR}/dynamic-cast-corrupt-O0"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_corrupt_target.elf" --scratch-dir "${AVM_CXX_TEST_BINARY_DIR}/dynamic-cast-corrupt-O2"
)
avm_check_cases(avm_dynamic_cast_run_cases_3
    "${Python3_EXECUTABLE}" -I "${AVM_DYNAMIC_CAST_VERIFY}" --bin-dir "$<TARGET_FILE_DIR:llvm-objdump>" ${AVM_DYNAMIC_CAST_PROBE_ARGS} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast.elf" --secondary --min-virtual 1 --min-null 1 --min-nonzero 1
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast.elf" --secondary --min-virtual 1 --min-null 1 --min-nonzero 1
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_high_address.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_high_address.elf" --high --min-virtual 1 --min-nonzero 1
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_high_address.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_high_address.elf" --high --min-virtual 1 --min-nonzero 1
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_cross_unit.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_cross_unit.elf" --min-virtual 1 --min-nonzero 1
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_cross_unit.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_cross_unit.elf" --min-virtual 1 --min-nonzero 1
    CASE "${AVM_DYNAMIC_CAST_LTO_IMAGE}" --elf "${AVM_DYNAMIC_CAST_LTO_ELF}" --min-virtual 1 --min-nonzero 1
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_construction.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast_construction.elf" --min-null 1 --min-nonzero 1
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_construction.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/rtti_dynamic_cast_construction.elf" --min-null 1 --min-nonzero 1
)
avm_add_check(avm_dynamic_cast_run
    COMMAND "$<TARGET_FILE:avm_tests>"
        --filter "^rtti_dynamic_cast(_bad_cast|_cross_unit|_high_address|_construction)?$"
        --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^rtti_dynamic_cast_cross_unit$" --opt O2
        --cpp-bin-dir "${AVM_DYNAMIC_CAST_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^rtti_dynamic_cast_bad_cast_unhandled$" --opt O0,O2
    ${avm_dynamic_cast_run_cases_1}
    ${avm_dynamic_cast_run_cases_2}
    ${avm_dynamic_cast_run_cases_3}
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_DYNAMIC_CAST_MUTATION_TEST}"
        --bin-dir "$<TARGET_FILE_DIR:llvm-objdump>" ${AVM_DYNAMIC_CAST_PROBE_ARGS}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast.elf"
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_PROBE_SNAPSHOT_TEST}"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/rtti_dynamic_cast.elf"
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_DYNAMIC_CAST_STACK_REPORT}"
        ${AVM_DYNAMIC_CAST_PROBE_ARGS}
        ${AVM_DYNAMIC_CAST_STACK_IMAGES}
    DEPENDS avm_tests avm_eh_stack_probe avm_rtti_static_images avm_dynamic_cast_lto_images
        llvm-avm-image llvm-objdump avm_interpreter
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)

# dynamic_cast<void*> in a program without RTTI. The fixture is built with -fno-rtti at O0 and O2,
# and each object is linked twice: without --gc-sections, where no archive member is collected,
# and with it. The image is linked with the ordinary archive resolution, so no --whole-archive is
# used. avm_dynamic_cast_nogc_run re-links each object, checks each ELF and its RTTI slot, runs
# both images, and checks the class-cast negative control.
set(AVM_DYNAMIC_CAST_NOGC_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/runtime/cxxabi/cpp/rtti_dynamic_cast_void_nogc.cpp")
set(AVM_DYNAMIC_CAST_NOGC_BIN_DIR "${AVM_CXX_TEST_BINARY_DIR}/dynamic-cast-void")
set(AVM_DYNAMIC_CAST_NOGC_IMAGES)
foreach(AVM_NOGC_OPT IN ITEMS O0 O2)
    set(AVM_NOGC_OBJECT
        "${AVM_DYNAMIC_CAST_NOGC_BIN_DIR}/${AVM_NOGC_OPT}/rtti_dynamic_cast_void_nogc.o")
    avm_add_object(
        OUTPUT "${AVM_NOGC_OBJECT}"
        SOURCE "${AVM_DYNAMIC_CAST_NOGC_SOURCE}"
        LANGUAGE CXX
        COMPILE_OPTIONS "-${AVM_NOGC_OPT}" -fno-rtti -fno-exceptions
        DEPENDS avm_sysroot
    )
    foreach(AVM_NOGC_VARIANT IN ITEMS nogc gc)
        set(AVM_NOGC_DIR "${AVM_DYNAMIC_CAST_NOGC_BIN_DIR}/${AVM_NOGC_VARIANT}/${AVM_NOGC_OPT}")
        set(AVM_NOGC_ELF "${AVM_NOGC_DIR}/rtti_dynamic_cast_void_nogc.elf")
        set(AVM_NOGC_IMAGE "${AVM_NOGC_DIR}/rtti_dynamic_cast_void_nogc.bin")
        set(AVM_NOGC_GC_OPTIONS)
        if(AVM_NOGC_VARIANT STREQUAL "gc")
            set(AVM_NOGC_GC_OPTIONS GC_SECTIONS)
        endif()
        avm_add_image(
            OBJECTS "${AVM_NOGC_OBJECT}"
            OUTPUT_ELF "${AVM_NOGC_ELF}"
            OUTPUT_IMAGE "${AVM_NOGC_IMAGE}"
            ENTRY _start
            STARTUP "${AVM_SYSROOT_DIR}/lib/crt0_test.o"
            LIBRARIES
                "${AVM_SYSROOT_DIR}/lib/libavm.a"
                "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
            # The text services name __avm_text_state as a compiler-only anchor, which no
            # relocation uses. Without --gc-sections, the runtime's trap report keeps the
            # undefined anchor, and llvm-avm-image rejects any global undefined symbol. The
            # anchor is defined as an absolute zero, which nothing reads, in both variants,
            # so they differ only by --gc-sections.
            LINK_OPTIONS --defsym=__avm_text_state=0
            ${AVM_NOGC_GC_OPTIONS}
            DEPENDS avm_sysroot
        )
        list(APPEND AVM_DYNAMIC_CAST_NOGC_IMAGES "${AVM_NOGC_IMAGE}")
    endforeach()
endforeach()
avm_add_check(avm_dynamic_cast_nogc_images DEPENDS ${AVM_DYNAMIC_CAST_NOGC_IMAGES})

set(AVM_DYNAMIC_CAST_NOGC_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/rtti_dynamic_cast_nogc_verify.py")
avm_add_check(avm_dynamic_cast_nogc_run
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_DYNAMIC_CAST_NOGC_VERIFY}"
        --bin-dir "$<TARGET_FILE_DIR:llvm-objdump>"
        --clang "$<TARGET_FILE:clang>"
        --ld "$<TARGET_FILE_DIR:lld>/ld.lld"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --void-dir "${AVM_DYNAMIC_CAST_NOGC_BIN_DIR}"
        --sysroot-lib "${AVM_SYSROOT_DIR}/lib"
        --scratch-dir "${AVM_CXX_TEST_BINARY_DIR}/dynamic-cast-void-negative"
    DEPENDS avm_dynamic_cast_nogc_images clang lld llvm-objdump llvm-nm llvm-readobj
        avm_eh_stack_probe avm_interpreter avm_sysroot
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_dynamic_cast_run avm_dynamic_cast_nogc_run avm_probe_snapshot_run)

# Checks the AVEH5 block of each exception-enabled image against the linked ELF,
# and checks that a program which never references the runtime has none.
set(AVM_EH_VERIFY_ARGS)
foreach(AVM_TEST_OPT_LEVEL IN LISTS AVM_EH_TEST_OPT_LEVELS)
    foreach(AVM_EH_VERIFY_NAME IN ITEMS eh_catch_all eh_call8 eh_cleanup eh_typed)
        set(AVM_EH_ELF "${AVM_CXX_TEST_BINARY_DIR}/${AVM_TEST_OPT_LEVEL}/${AVM_EH_VERIFY_NAME}.elf")
        set(AVM_EH_IMAGE "${AVM_CXX_TEST_BINARY_DIR}/${AVM_TEST_OPT_LEVEL}/${AVM_EH_VERIFY_NAME}.bin")
        list(APPEND AVM_EH_VERIFY_ARGS --eh-elf "${AVM_EH_ELF}" --eh-image "${AVM_EH_IMAGE}")
    endforeach()
endforeach()
find_package(Python3 COMPONENTS Interpreter REQUIRED)

# The O2 link-time-optimized variants of the frame-sensitive fixtures. They live
# in their own image directory, so the runners select them with --cpp-bin-dir.
set(AVM_EH_LTO_BIN_DIR "${AVM_CXX_TEST_BINARY_DIR}/lto")
set(AVM_EH_LTO_IMAGES)
foreach(AVM_EH_LTO_NAME IN ITEMS eh_catch_all eh_dynamic_handler eh_cleanup eh_cleanup_object eh_typed eh_preserve_none
        eh_inheritance eh_inheritance_cross_unit eh_virtual_inheritance eh_virtual_cross_unit
        eh_pointer_conversion eh_pointer_cross_unit
        eh_rethrow eh_rethrow_cleanup eh_rethrow_inheritance eh_rethrow_cross_unit)
    avm_fixture_variant(${AVM_EH_LTO_NAME} DIRECTORY "${AVM_EH_LTO_BIN_DIR}/O2"
        OUTPUT_PREFIX AVM_EH_LTO COMPILE_OPTIONS -fexceptions -flto=full)
    list(APPEND AVM_EH_LTO_IMAGES "${AVM_EH_LTO_IMAGE}")
endforeach()

avm_add_check(avm_eh_catch_all_lto_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_catch_all$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    # A class-typed throw whose destructor is passed to __cxa_throw. Its
    # descriptor and destructor are program addresses, and LTO must keep them.
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_cleanup_object$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_preserve_none$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    DEPENDS avm_tests "${AVM_EH_LTO_BIN_DIR}/O2/eh_catch_all.bin"
        "${AVM_EH_LTO_BIN_DIR}/O2/eh_cleanup_object.bin"
        "${AVM_EH_LTO_BIN_DIR}/O2/eh_preserve_none.bin"
    VERBATIM
)

set(AVM_EH_NO_THROW_ELF "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_no_throw.elf")
set(AVM_EH_NO_THROW_IMAGE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_no_throw.bin")
avm_add_check(avm_eh_metadata_verify
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_metadata_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>"
        ${AVM_EH_VERIFY_ARGS}
        --no-eh-elf "${AVM_EH_NO_THROW_ELF}" --no-eh-image "${AVM_EH_NO_THROW_IMAGE}"
    DEPENDS avm_eh_catch_all_images llvm-avm-image
    VERBATIM
)

# Flash-resident RTTI: program-space placement, descriptor pointers, one descriptor
# per type across translation units, every class hierarchy form, and the header
# captured by a throw whose descriptor and destructor lie above 0xFFFF.
set(AVM_EH_RTTI_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_rtti_verify.py")
avm_check_cases(avm_eh_rtti_verify_cases_1
    "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}" --elf
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_object.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_object.bin" --expect _ZTIN12_GLOBAL__N_16ThrownE
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup_object.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup_object.bin" --expect _ZTIN12_GLOBAL__N_16ThrownE
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_cleanup_object.elf" --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_cleanup_object.bin" --expect _ZTIN12_GLOBAL__N_16ThrownE
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_identity.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_identity.bin" --expect _ZTI6Shared --expect _ZTI8Distinct
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_hierarchy.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_hierarchy.bin" --expect _ZTIN12_GLOBAL__N_15PlainE --expect _ZTIN12_GLOBAL__N_15BaseAE --expect _ZTIN12_GLOBAL__N_15BaseBE --expect _ZTIN12_GLOBAL__N_16SingleE --expect _ZTIN12_GLOBAL__N_18MultipleE --expect _ZTIN12_GLOBAL__N_111PolymorphicE --expect _ZTIN12_GLOBAL__N_111VirtualBaseE
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_high_address.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_high_address.bin" --expect _ZTIN12_GLOBAL__N_13FarE --high _ZTIN12_GLOBAL__N_13FarE --probe "$<TARGET_FILE:avm_eh_stack_probe>" --interpreter "${AVM_INTERPRETER_HEX}" --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}" --thrown-type _ZTIN12_GLOBAL__N_13FarE --destructor _ZN12_GLOBAL__N_13FarD2Ev --size 2
)
avm_add_check(avm_eh_rtti_verify
    ${avm_eh_rtti_verify_cases_1}
    DEPENDS avm_eh_catch_all_images ${AVM_EH_LTO_IMAGES} avm_eh_stack_probe
        llvm-avm-image
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)

# Landing-pad SP, throw context, corrupted metadata, and stack measurements. Each
# step runs the probe and compares the emulator state with the machine code and
# with the packed block. Every step fails the target on a mismatch.
set(AVM_EH_HARDENING_DIR "${AVM_CXX_TEST_BINARY_DIR}")
set(AVM_EH_PROBE_RUN
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
set(AVM_EH_BIN_DIR "$<TARGET_FILE_DIR:llvm-avm-image>")
avm_check_cases(avm_eh_hardening_run_cases_1
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py" --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN} --image
    CASE "${AVM_EH_HARDENING_DIR}/O0/eh_dynamic_handler.bin" --elf "${AVM_EH_HARDENING_DIR}/O0/eh_dynamic_handler.elf" --function dynamic_handler --callee throw_eight --callee throw_five
    CASE "${AVM_EH_HARDENING_DIR}/O2/eh_dynamic_handler.bin" --elf "${AVM_EH_HARDENING_DIR}/O2/eh_dynamic_handler.elf" --function dynamic_handler --callee throw_eight --callee throw_five
)
avm_check_cases(avm_eh_hardening_run_cases_2
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_corruption_verify.py" ${AVM_EH_PROBE_RUN} --image
    CASE "${AVM_EH_HARDENING_DIR}/O0/eh_corrupt_target.bin" --elf "${AVM_EH_HARDENING_DIR}/O0/eh_corrupt_target.elf" --nm "$<TARGET_FILE_DIR:llvm-avm-image>/llvm-nm"
    CASE "${AVM_EH_HARDENING_DIR}/O2/eh_corrupt_target.bin" --elf "${AVM_EH_HARDENING_DIR}/O2/eh_corrupt_target.elf" --nm "$<TARGET_FILE_DIR:llvm-avm-image>/llvm-nm"
)
avm_add_check(avm_eh_hardening_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_dynamic_handler$" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_dynamic_handler$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    ${avm_eh_hardening_run_cases_1}
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_throw_context_verify.py"
        --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O0/eh_catch_all.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O0/eh_catch_all.elf"
        --thrower inner --caller demo_main --entry outer
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
        --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O2/eh_call8.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O2/eh_call8.elf"
        --function near_caller --callee throw_near --encoding call8
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_throw_context_verify.py"
        --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O2/eh_catch_all.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O2/eh_catch_all.elf"
        --thrower inner --caller middle --entry inner
    ${avm_eh_hardening_run_cases_2}
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_stack_report.py"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image-dir "${AVM_EH_HARDENING_DIR}"
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        ${AVM_EH_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)

avm_add_check(avm_eh_catch_all_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_" --opt O0,O2
    DEPENDS avm_tests avm_eh_catch_all_images avm_eh_metadata_verify
    VERBATIM
)

# The AVEH5 index: the lookup bound, checked on synthetic blocks of 1 to 256 functions.
avm_add_check(avm_eh_index_run
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_index_complexity_verify.py"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_index_run)

# The phase-two shortcut: direct, cleanup, unhandled, and combined throws, at O0 and O2.
avm_check_cases(avm_eh_fastpath_run_cases_1
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_unwind_fastpath_verify.py" --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" --probe "$<TARGET_FILE:avm_eh_stack_probe>" --interpreter "${AVM_INTERPRETER_HEX}" --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}" --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_catch_all.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_catch_all.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_catch_all.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_catch_all.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_unhandled.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_unhandled.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_no_handler.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_no_handler.elf"
)
avm_add_check(avm_eh_fastpath_run
    ${avm_eh_fastpath_run_cases_1}
    DEPENDS avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_fastpath_run)
add_dependencies(avm_eh_catch_all_run avm_eh_catch_all_lto_run avm_eh_hardening_run)

# Stage 2 cleanup fixtures. The cleanup chain of the first throw is checked against
# the machine code, the packed AVEH5 block, and the probe's events, at O0, O2, and
# LTO/O2. Each cleanup frame's landing SP is checked: the zero, two, and eight
# argument-byte cases, the r3-based frame, and the relaxed call8 and call16 sites.
# The termination fixtures run here too, since their output is the halt report.
set(AVM_EH_CLEANUP_PROBE_RUN
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
set(AVM_EH_CLEANUP_IMAGE_DIRS
    "${AVM_CXX_TEST_BINARY_DIR}/O0"
    "${AVM_CXX_TEST_BINARY_DIR}/O2"
    "${AVM_EH_LTO_BIN_DIR}/O2")
set(AVM_EH_CLEANUP_COMMANDS)
foreach(AVM_CLEANUP_DIR IN LISTS AVM_EH_CLEANUP_IMAGE_DIRS)
    avm_check_cases(avm_eh_cleanup_run_cases_1
        "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py" --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN} --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin" --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf" --function
        CASE leaf --callee __cxa_throw
        CASE middle --callee leaf
        CASE stack_argument_frame --callee eight_arguments
        CASE five_argument_frame --callee five_arguments
        CASE dynamic_frame --callee eight_arguments
        CASE near_frame --callee near_throw --encoding call8
        CASE far_frame --callee far_throw --encoding call16
    )
    list(APPEND AVM_EH_CLEANUP_COMMANDS
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_cleanup_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --frame leaf --frame middle --frame outer --frame demonstration
        ${avm_eh_cleanup_run_cases_1}
    )
endforeach()

avm_check_cases(avm_eh_cleanup_run_cases_2
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_corruption_verify.py" --cleanup ${AVM_EH_PROBE_RUN} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_corrupt_target.elf" --nm "$<TARGET_FILE_DIR:llvm-avm-image>/llvm-nm"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup_corrupt_target.elf" --nm "$<TARGET_FILE_DIR:llvm-avm-image>/llvm-nm"
)
avm_add_check(avm_eh_cleanup_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_cleanup" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_cleanup$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    ${AVM_EH_CLEANUP_COMMANDS}
    ${avm_eh_cleanup_run_cases_2}
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_stack_report.py"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image-dir "${AVM_CXX_TEST_BINARY_DIR}"
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        avm_eh_metadata_verify ${AVM_EH_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_cleanup_run avm_eh_rtti_verify)

# Stage 3 typed catch fixtures. Exact matching is checked at O0, O2, and LTO/O2. The
# probe reports each landing context, and eh_typed_verify checks its selector, its
# first matching clause, and its pad against the packed AVEH5 block and the machine
# code. The block fixture covers malformed metadata, and the high-address fixture
# places its descriptors above program address 0xFFFF.
avm_check_cases(avm_eh_typed_run_cases_1
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_typed_verify.py" --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typed.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typed.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_typed.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_typed.elf"
)
avm_add_check(avm_eh_typed_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_typed" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_typed$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_block_validation$" --opt O0,O2
    ${avm_eh_typed_run_cases_1}
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_metadata_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>"
        --eh-elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.elf"
        --eh-image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.bin"
        --eh-elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typed.elf"
        --eh-image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typed.bin"
        --eh-elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_typed.elf"
        --eh-image "${AVM_EH_LTO_BIN_DIR}/O2/eh_typed.bin"
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        ${AVM_EH_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_typed_run)

# Linear rethrow (throw;). The O0 and O2 images run every rethrow fixture: the single-unit
# and cross-unit lifecycles, the cleanup and inheritance cases, the standard exceptions, and
# the expected-termination cases. The full-LTO images of the single-unit and cross-unit
# fixtures run at O2. The lifecycle verifier checks the probe trace of each linear rethrow
# against the exception protocol, the corruption verifier checks where each malformed state
# halts, and the metadata verifier checks the AVEH5 blocks of the rethrow images.
set(AVM_EH_RETHROW_DIR "${AVM_CXX_TEST_BINARY_DIR}")
set(AVM_EH_RETHROW_LTO_IMAGES)
foreach(AVM_EH_RETHROW_LTO_NAME IN ITEMS eh_rethrow eh_rethrow_cleanup eh_rethrow_inheritance
        eh_rethrow_cross_unit)
    list(APPEND AVM_EH_RETHROW_LTO_IMAGES "${AVM_EH_LTO_BIN_DIR}/O2/${AVM_EH_RETHROW_LTO_NAME}.bin")
endforeach()
set(AVM_EH_RETHROW_VERIFY_ARGS
    --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>"
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
avm_check_cases(avm_eh_rethrow_run_cases_1
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_rethrow_verify.py" ${AVM_EH_RETHROW_VERIFY_ARGS} --image
    CASE "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow.bin" --elf "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow.elf" --min-rethrows 2
    CASE "${AVM_EH_RETHROW_DIR}/O2/eh_rethrow.bin" --elf "${AVM_EH_RETHROW_DIR}/O2/eh_rethrow.elf" --min-rethrows 2
    CASE "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow_cleanup.bin" --elf "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow_cleanup.elf"
    CASE "${AVM_EH_RETHROW_DIR}/O2/eh_rethrow_cleanup.bin" --elf "${AVM_EH_RETHROW_DIR}/O2/eh_rethrow_cleanup.elf"
    CASE "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow_inheritance.bin" --elf "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow_inheritance.elf"
    CASE "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow_cross_unit.bin" --elf "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow_cross_unit.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow.elf" --min-rethrows 2
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow_cleanup.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow_cleanup.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow_inheritance.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow_inheritance.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow_cross_unit.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow_cross_unit.elf"
)
avm_add_check(avm_eh_rethrow_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_rethrow" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_rethrow$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_rethrow_cleanup$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_rethrow_inheritance$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_rethrow_cross_unit$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    ${avm_eh_rethrow_run_cases_1}
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_rethrow_corrupt_verify.py"
        ${AVM_EH_RETHROW_VERIFY_ARGS}
        --image-dir "${AVM_EH_RETHROW_DIR}"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_metadata_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>"
        --eh-elf "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow.elf"
        --eh-image "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow.bin"
        --eh-elf "${AVM_EH_RETHROW_DIR}/O2/eh_rethrow.elf"
        --eh-image "${AVM_EH_RETHROW_DIR}/O2/eh_rethrow.bin"
        --eh-elf "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow_inheritance.elf"
        --eh-image "${AVM_EH_RETHROW_DIR}/O0/eh_rethrow_inheritance.bin"
        --eh-elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow_cross_unit.elf"
        --eh-image "${AVM_EH_LTO_BIN_DIR}/O2/eh_rethrow_cross_unit.bin"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_stack_report.py"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image-dir "${AVM_CXX_TEST_BINARY_DIR}"
        --opt O0 --opt O2
        --fixture eh_rethrow --fixture eh_rethrow_cleanup --fixture eh_rethrow_inheritance
        --fixture eh_rethrow_standard --fixture eh_rethrow_cross_unit
        --fixture eh_rethrow_unhandled
    DEPENDS avm_tests avm_eh_catch_all_images avm_eh_stack_probe llvm-avm-image llvm-nm
        llvm-objdump ${AVM_EH_RETHROW_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_rethrow_run)

# Boundary sampling on a guest that never finishes. The self-loop fixture ends only at the
# cycle limit, so the probe must report "did not finish" and record every execution of its
# jump, although each execution leaves the guest state unchanged. The fixture is linked
# outside the terminating asm matrix, which globs tests/asm only.
set(AVM_EH_PROBE_FIXTURE_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/fixtures")
set(AVM_EH_PROBE_SELF_LOOP_OBJECT "${AVM_EH_PROBE_FIXTURE_DIR}/eh_probe_self_loop.o")
set(AVM_EH_PROBE_SELF_LOOP_ELF "${AVM_EH_PROBE_FIXTURE_DIR}/eh_probe_self_loop.elf")
set(AVM_EH_PROBE_SELF_LOOP_IMAGE "${AVM_EH_PROBE_FIXTURE_DIR}/eh_probe_self_loop.bin")
avm_add_object(
    OUTPUT "${AVM_EH_PROBE_SELF_LOOP_OBJECT}"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/fixtures/eh_probe_self_loop.asm"
    LANGUAGE ASM
)
avm_add_image(
    OBJECTS "${AVM_EH_PROBE_SELF_LOOP_OBJECT}"
    OUTPUT_ELF "${AVM_EH_PROBE_SELF_LOOP_ELF}"
    OUTPUT_IMAGE "${AVM_EH_PROBE_SELF_LOOP_IMAGE}"
    ENTRY _start
)
avm_add_check(avm_eh_probe_boundary_images DEPENDS "${AVM_EH_PROBE_SELF_LOOP_IMAGE}")
avm_add_check(avm_eh_probe_boundary_run
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_probe_boundary_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image "${AVM_EH_PROBE_SELF_LOOP_IMAGE}"
        --elf "${AVM_EH_PROBE_SELF_LOOP_ELF}"
    DEPENDS avm_eh_stack_probe avm_interpreter_boundary avm_eh_probe_boundary_images
        llvm-avm-image
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_probe_boundary_run)

# Base catches, with nonvirtual and virtual bases. The O0 and O2 fixtures also run through
# avm_eh_catch_all_run. This target adds the whole-program and cross-unit LTO runs, the
# packed base edges, the selector and adjustment of each handler against the emulator, and
# the corrupted RTTI fields, which must each fail a throw. Every probe run uses the
# interpreter boundary.
set(AVM_EH_INHERITANCE_PROBE_RUN
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
set(AVM_EH_INHERITANCE_CORRUPT_DIR "${CMAKE_CURRENT_BINARY_DIR}/eh_inheritance_corrupt")
avm_check_cases(avm_eh_inheritance_run_cases_1
    "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}" --elf
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance.bin" --expect _ZTIN12_GLOBAL__N_14PairE --expect _ZTIN12_GLOBAL__N_17DerivedE --expect _ZTIN12_GLOBAL__N_13TopE --expect _ZTIN12_GLOBAL__N_114PrivateDerivedE --edge _ZTIN12_GLOBAL__N_17DerivedE:_ZTIN12_GLOBAL__N_14BaseE:0:public --edge _ZTIN12_GLOBAL__N_14PairE:_ZTIN12_GLOBAL__N_14LeftE:0:public --edge _ZTIN12_GLOBAL__N_14PairE:_ZTIN12_GLOBAL__N_15RightE:2:public --edge _ZTIN12_GLOBAL__N_13TopE:_ZTIN12_GLOBAL__N_13MidE:2:public --edge _ZTIN12_GLOBAL__N_13MidE:_ZTIN12_GLOBAL__N_12LoE:0:public --edge _ZTIN12_GLOBAL__N_13MidE:_ZTIN12_GLOBAL__N_12HiE:2:public --edge _ZTIN12_GLOBAL__N_114PrivateDerivedE:_ZTIN12_GLOBAL__N_111PrivateBaseE:0:nonpublic
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_high_address.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_high_address.bin" --expect _ZTIN12_GLOBAL__N_14BothE --expect _ZTIN12_GLOBAL__N_13FarE --high _ZTIN12_GLOBAL__N_14BothE --edge _ZTIN12_GLOBAL__N_14BothE:_ZTIN12_GLOBAL__N_13FarE:0:public --edge _ZTIN12_GLOBAL__N_14BothE:_ZTIN12_GLOBAL__N_17FartherE:2:public
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance_cross_unit.elf" --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance_cross_unit.bin" --expect _ZTI6Joined --expect _ZTI4Lead --expect _ZTI5Trail --edge _ZTI6Joined:_ZTI4Lead:0:public --edge _ZTI6Joined:_ZTI5Trail:2:public
)
avm_check_cases(avm_eh_inheritance_run_cases_2
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_verify.py" --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_cross_unit.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_cross_unit.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance_cross_unit.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance_cross_unit.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_high_address.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_high_address.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_high_address.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_high_address.elf"
)
avm_check_cases(avm_eh_inheritance_run_cases_3
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_corrupt_verify.py" ${AVM_EH_INHERITANCE_PROBE_RUN} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_corrupt_target.elf" --scratch-dir "${AVM_EH_INHERITANCE_CORRUPT_DIR}/O0"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_corrupt_target.elf" --scratch-dir "${AVM_EH_INHERITANCE_CORRUPT_DIR}/O2"
)
avm_add_check(avm_eh_inheritance_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_inheritance" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_inheritance$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_inheritance_cross_unit$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    ${avm_eh_inheritance_run_cases_1}
    ${avm_eh_inheritance_run_cases_2}
    ${avm_eh_inheritance_run_cases_3}
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        ${AVM_EH_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_inheritance_run)

# Virtual base catches. The O0 and O2 fixtures also run through avm_eh_catch_all_run. This
# target adds the whole-program LTO/O2 and cross-unit runs, the RTTI edges of the virtual
# classes with their vtable-slot displacements, the high-address vtable and descriptor, the
# independent virtual-offset verifier, and the malformed virtual RTTI and vptr fields.
set(AVM_EH_VIRTUAL_RTTI_ARGS_O0
    --expect _ZTIN12_GLOBAL__N_17DerivedE --expect _ZTIN12_GLOBAL__N_18PrecededE
    --expect _ZTIN12_GLOBAL__N_17DiamondE --expect _ZTIN12_GLOBAL__N_14Top3E
    --expect _ZTIN12_GLOBAL__N_116SecondaryDerivedE --expect _ZTIN12_GLOBAL__N_112MixedDerivedE
    --expect _ZTIN12_GLOBAL__N_19BothPathsE --expect _ZTIN12_GLOBAL__N_114PrivateVirtualE
    --expect _ZTIN12_GLOBAL__N_116ProtectedVirtualE --expect _ZTIN12_GLOBAL__N_110MixedPlainE
    --expect _ZTIN12_GLOBAL__N_16HolderE --expect _ZTIN12_GLOBAL__N_16NvPairE
    --edge _ZTIN12_GLOBAL__N_17DerivedE:_ZTIN12_GLOBAL__N_14BaseE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_18PrecededE:_ZTIN12_GLOBAL__N_16FillerE:3:public
    --edge _ZTIN12_GLOBAL__N_18PrecededE:_ZTIN12_GLOBAL__N_14BaseE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_17DiamondE:_ZTIN12_GLOBAL__N_14LeftE:0:public
    --edge _ZTIN12_GLOBAL__N_17DiamondE:_ZTIN12_GLOBAL__N_15RightE:5:public
    --edge _ZTIN12_GLOBAL__N_14LeftE:_ZTIN12_GLOBAL__N_16SharedE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_15RightE:_ZTIN12_GLOBAL__N_16SharedE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_14Top3E:_ZTIN12_GLOBAL__N_16Other2E:0:public
    --edge _ZTIN12_GLOBAL__N_14Top3E:_ZTIN12_GLOBAL__N_14Mid2E:5:public
    --edge _ZTIN12_GLOBAL__N_14Mid2E:_ZTIN12_GLOBAL__N_14Mid1E:0:public
    --edge _ZTIN12_GLOBAL__N_14Mid1E:_ZTIN12_GLOBAL__N_14CoreE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_112MixedDerivedE:_ZTIN12_GLOBAL__N_16Other2E:0:public
    --edge _ZTIN12_GLOBAL__N_112MixedDerivedE:_ZTIN12_GLOBAL__N_16Chain2E:5:public
    --edge _ZTIN12_GLOBAL__N_16Chain2E:_ZTIN12_GLOBAL__N_15Left2E:0:public
    --edge _ZTIN12_GLOBAL__N_15Left2E:_ZTIN12_GLOBAL__N_16SharedE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_116SecondaryDerivedE:_ZTIN12_GLOBAL__N_17PrimaryE:0:public
    --edge _ZTIN12_GLOBAL__N_116SecondaryDerivedE:_ZTIN12_GLOBAL__N_19SecondaryE:5:public
    --edge _ZTIN12_GLOBAL__N_19SecondaryE:_ZTIN12_GLOBAL__N_16SharedE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_19BothPathsE:_ZTIN12_GLOBAL__N_110PublicPathE:0:public
    --edge _ZTIN12_GLOBAL__N_19BothPathsE:_ZTIN12_GLOBAL__N_111PrivatePathE:5:public
    --edge _ZTIN12_GLOBAL__N_110PublicPathE:_ZTIN12_GLOBAL__N_16SharedE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_111PrivatePathE:_ZTIN12_GLOBAL__N_16SharedE:-9:nonpublic+virtual
    --edge _ZTIN12_GLOBAL__N_114PrivateVirtualE:_ZTIN12_GLOBAL__N_16SharedE:-9:nonpublic+virtual
    --edge _ZTIN12_GLOBAL__N_116ProtectedVirtualE:_ZTIN12_GLOBAL__N_16SharedE:-9:nonpublic+virtual
    --edge _ZTIN12_GLOBAL__N_110MixedPlainE:_ZTIN12_GLOBAL__N_112VirtualPlainE:0:public
    --edge _ZTIN12_GLOBAL__N_110MixedPlainE:_ZTIN12_GLOBAL__N_15PlainE:5:public
    --edge _ZTIN12_GLOBAL__N_112VirtualPlainE:_ZTIN12_GLOBAL__N_15PlainE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_16HolderE:_ZTIN12_GLOBAL__N_17PayloadE:-9:public+virtual
    --edge _ZTIN12_GLOBAL__N_16NvPairE:_ZTIN12_GLOBAL__N_16NvLeftE:0:public
    --edge _ZTIN12_GLOBAL__N_16NvPairE:_ZTIN12_GLOBAL__N_17NvRightE:2:public)
set(AVM_EH_VIRTUAL_CORRUPT_DIR "${CMAKE_CURRENT_BINARY_DIR}/eh_virtual_corrupt")
avm_check_cases(avm_eh_virtual_run_cases_1
    "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}" --elf
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_virtual_inheritance.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_virtual_inheritance.bin" ${AVM_EH_VIRTUAL_RTTI_ARGS_O0}
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_virtual_inheritance.elf" --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_virtual_inheritance.bin" ${AVM_EH_VIRTUAL_RTTI_ARGS_O0}
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_virtual_cross_unit.elf" --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_virtual_cross_unit.bin" --expect _ZTI5VMost --expect _ZTI4VMid --expect _ZTI5VBase --edge _ZTI5VMost:_ZTI4VMid:0:public --edge _ZTI4VMid:_ZTI5VBase:-9:public+virtual
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_virtual_high_address.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_virtual_high_address.bin" --expect _ZTIN12_GLOBAL__N_17FartherE --expect _ZTIN12_GLOBAL__N_13FarE --high _ZTIN12_GLOBAL__N_17FartherE --high-symbol _ZTVN12_GLOBAL__N_17FartherE --edge _ZTIN12_GLOBAL__N_17FartherE:_ZTIN12_GLOBAL__N_13FarE:-9:public+virtual
)
avm_check_cases(avm_eh_virtual_run_cases_2
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_virtual_verify.py" --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_virtual_inheritance.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_virtual_inheritance.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_virtual_inheritance.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_virtual_inheritance.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_virtual_inheritance.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_virtual_inheritance.elf"
)
avm_check_cases(avm_eh_virtual_run_cases_3
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_corrupt_verify.py" --virtual ${AVM_EH_INHERITANCE_PROBE_RUN} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_virtual_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_virtual_corrupt_target.elf" --scratch-dir "${AVM_EH_VIRTUAL_CORRUPT_DIR}/O0"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_virtual_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_virtual_corrupt_target.elf" --scratch-dir "${AVM_EH_VIRTUAL_CORRUPT_DIR}/O2"
)
avm_add_check(avm_eh_virtual_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_virtual" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_virtual_inheritance$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_virtual_cross_unit$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_virtual_lattice$" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_virtual_lattice_unhandled$" --opt O0,O2
    ${avm_eh_virtual_run_cases_1}
    ${avm_eh_virtual_run_cases_2}
    ${avm_eh_virtual_run_cases_3}
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_stack_report.py"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image-dir "${AVM_CXX_TEST_BINARY_DIR}"
        --fixture eh_virtual_inheritance --fixture eh_virtual_cross_unit
        --fixture eh_virtual_high_address --fixture eh_virtual_corrupt_target
        --fixture eh_virtual_lattice --fixture eh_virtual_lattice_unhandled
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        ${AVM_EH_LTO_IMAGES} avm_eh_metadata_verify
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_virtual_run)

set(AVM_EH_POINTER_CORRUPT_DIR "${CMAKE_CURRENT_BINARY_DIR}/eh_pointer_corrupt")
# Pointer conversions in typed catches. The fixtures run at O0 and O2, and the cross-unit
# and converted-value fixtures also run at full LTO O2. The stack report covers each fixture's
# probe peak. The verifiers below decode the selected clauses, the conversion modes, and the
# converted values from the emulator, and compare them with an independent model.
avm_check_cases(avm_eh_pointer_conversion_run_cases_1
    "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}" --elf
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_conversion.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_conversion.bin" --pointer _ZTIPN12_GLOBAL__N_14PairE:0x0:_ZTIN12_GLOBAL__N_14PairE --pointer _ZTIPU3AS1Ki:0x81:_ZTIi --pointer _ZTIPFvvE:0x80:_ZTIFvvE --pointer _ZTIPDoFvvE:0xc0:_ZTIFvvE --marker _ZTIRPN12_GLOBAL__N_14PairE:_ZTIPN12_GLOBAL__N_14PairE
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_pointer_conversion.elf" --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_pointer_conversion.bin" --pointer _ZTIPN12_GLOBAL__N_14PairE:0x0:_ZTIN12_GLOBAL__N_14PairE --pointer _ZTIPDoFvvE:0xc0:_ZTIFvvE --marker _ZTIRPN12_GLOBAL__N_14PairE:_ZTIPN12_GLOBAL__N_14PairE
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_cross_unit.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_cross_unit.bin" --expect _ZTI8PDerived --edge _ZTI8PDerived:_ZTI5PBase:0:public --edge _ZTI8PDerived:_ZTI6PRight:2:public --pointer _ZTIP8PDerived:0x0:_ZTI8PDerived --marker _ZTIRP8PDerived:_ZTIP8PDerived
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_pointer_cross_unit.elf" --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_pointer_cross_unit.bin" --expect _ZTI8PDerived --edge _ZTI8PDerived:_ZTI5PBase:0:public --edge _ZTI8PDerived:_ZTI6PRight:2:public --pointer _ZTIP8PDerived:0x0:_ZTI8PDerived
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_high_address.elf" --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_high_address.bin" --expect _ZTIPFvvE --expect _ZTIPU3AS1Ki --high _ZTIPFvvE --high _ZTIPU3AS1Ki --high-symbol _ZN12_GLOBAL__N_110high_tableE --pointer _ZTIPFvvE:0x80:_ZTIFvvE --pointer _ZTIPU3AS1Ki:0x81:_ZTIi --marker _ZTIRPU3AS1Ki:_ZTIPU3AS1Ki
)
avm_check_cases(avm_eh_pointer_conversion_run_cases_2
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_pointer_conversion_verify.py" --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_conversion.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_conversion.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_pointer_conversion.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_pointer_conversion.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_pointer_conversion.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_pointer_conversion.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_cross_unit.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_cross_unit.elf"
    CASE "${AVM_EH_LTO_BIN_DIR}/O2/eh_pointer_cross_unit.bin" --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_pointer_cross_unit.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_high_address.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_high_address.elf"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_pointer_high_address.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_pointer_high_address.elf"
)
avm_check_cases(avm_eh_pointer_conversion_run_cases_3
    "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_pointer_corrupt_verify.py" ${AVM_EH_INHERITANCE_PROBE_RUN} --image
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_pointer_corrupt_target.elf" --scratch-dir "${AVM_EH_POINTER_CORRUPT_DIR}/O0"
    CASE "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_pointer_corrupt_target.bin" --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_pointer_corrupt_target.elf" --scratch-dir "${AVM_EH_POINTER_CORRUPT_DIR}/O2"
)
avm_add_check(avm_eh_pointer_conversion_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_pointer_" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_pointer_conversion$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_pointer_cross_unit$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    # The RTTI of the pointer fixtures: the flag words, the pointees, the markers, the cross-unit
    # edges, and the descriptors above 0xFFFF. The main fixture is checked at O0, at O2, and with LTO.
    ${avm_eh_pointer_conversion_run_cases_1}
    ${avm_eh_pointer_conversion_run_cases_2}
    ${avm_eh_pointer_conversion_run_cases_3}
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_stack_report.py"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image-dir "${AVM_CXX_TEST_BINARY_DIR}"
        --fixture eh_pointer_conversion --fixture eh_pointer_cross_unit
        --fixture eh_pointer_high_address --fixture eh_pointer_corrupt_target
        --fixture eh_pointer_depth_unhandled
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        ${AVM_EH_LTO_IMAGES} avm_eh_metadata_verify
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_pointer_conversion_run)
