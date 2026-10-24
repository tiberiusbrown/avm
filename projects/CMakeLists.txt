set(AVM_SDK_ROOT "${CMAKE_BINARY_DIR}/avm-sdk-install")

# The SDK installer is a custom target, but in-tree projects depend on the
# installed executables and libraries by path. Declare those install products
# so Ninja can find the command that creates them in a clean build.
set(AVM_SDK_INSTALL_BYPRODUCTS)
foreach(AVM_SDK_ALIAS_OUTPUT IN LISTS AVM_SDK_ALIAS_OUTPUTS)
    get_filename_component(AVM_SDK_ALIAS_FILENAME
        "${AVM_SDK_ALIAS_OUTPUT}" NAME)
    list(APPEND AVM_SDK_INSTALL_BYPRODUCTS
        "${AVM_SDK_ROOT}/bin/${AVM_SDK_ALIAS_FILENAME}")
endforeach()
list(APPEND AVM_SDK_INSTALL_BYPRODUCTS
    "${AVM_SDK_ROOT}/bin/avm/interp.hex"
    "${AVM_SDK_ROOT}/bin/avm/interp.fxc.hex"
    "${AVM_SDK_ROOT}/sysroot/lib/crt0.o"
    "${AVM_SDK_ROOT}/sysroot/lib/crt0_test.o"
    "${AVM_SDK_ROOT}/sysroot/lib/crt0_sketch.o"
    "${AVM_SDK_ROOT}/sysroot/lib/libavm.a"
    "${AVM_SDK_ROOT}/sysroot/lib/libavm-builtins.a")

add_custom_target(avm_sdk_install
    BYPRODUCTS ${AVM_SDK_INSTALL_BYPRODUCTS}
    COMMAND "${CMAKE_COMMAND}" --install "${CMAKE_BINARY_DIR}"
        --config RelWithDebInfo --component avm-sdk --prefix "${AVM_SDK_ROOT}"
    DEPENDS avm_sdk
    COMMENT "Installing the AVM SDK for projects"
    VERBATIM
)

add_subdirectory(ardurogue2)
add_dependencies(ardurogue2 avm_sdk_install)

add_subdirectory(audio_demo)
add_dependencies(avm_audio_demo avm_sdk_install)
