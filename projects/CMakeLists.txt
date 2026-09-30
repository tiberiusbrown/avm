set(AVM_SDK_ROOT "${CMAKE_BINARY_DIR}/avm-sdk-install")

add_custom_target(avm_sdk_install
    COMMAND "${CMAKE_COMMAND}" --install "${CMAKE_BINARY_DIR}"
        --config RelWithDebInfo --component avm-sdk --prefix "${AVM_SDK_ROOT}"
    DEPENDS avm_sdk
    COMMENT "Installing the AVM SDK for projects"
    VERBATIM
)

add_subdirectory(ardurogue2)
add_dependencies(ardurogue2 avm_sdk_install)
