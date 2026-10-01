add_library(avm_debug_emulator STATIC AvmEmulator.cpp)
target_compile_features(avm_debug_emulator PUBLIC cxx_std_17)
target_include_directories(avm_debug_emulator PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(avm_debug_emulator PRIVATE
    "${PROJECT_SOURCE_DIR}/deps/llvm-project/llvm/include"
    "${CMAKE_BINARY_DIR}/llvm-build/include")
target_link_libraries(avm_debug_emulator PUBLIC ardensdebuggerlib LLVMSupport)

set(AVM_LLDB_EXE
    "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}")
set(AVM_DEBUG_RUNTIME_DIR "${AVM_SDK_BUILD_BIN}/avm")
set(AVM_DEBUG_RUNTIME_HEX "${AVM_DEBUG_RUNTIME_DIR}/interp.hex")
set(AVM_DEBUG_RUNTIME_BOUNDARY
    "${AVM_DEBUG_RUNTIME_DIR}/interp-boundary.json")
add_custom_command(
    OUTPUT "${AVM_LLDB_EXE}"
           "${AVM_DEBUG_RUNTIME_HEX}"
           "${AVM_DEBUG_RUNTIME_BOUNDARY}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${AVM_DEBUG_RUNTIME_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "$<TARGET_FILE:lldb>" "${AVM_LLDB_EXE}"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_INTERPRETER_HEX}" "${AVM_DEBUG_RUNTIME_HEX}"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_INTERPRETER_BOUNDARY_METADATA}"
            "${AVM_DEBUG_RUNTIME_BOUNDARY}"
    DEPENDS lldb avm_interpreter_boundary avm_sdk_tools
    VERBATIM)
add_custom_target(avm_lldb DEPENDS
    "${AVM_LLDB_EXE}"
    "${AVM_DEBUG_RUNTIME_HEX}"
    "${AVM_DEBUG_RUNTIME_BOUNDARY}")
add_dependencies(avm_toolchain avm_lldb)
install(PROGRAMS "${AVM_LLDB_EXE}" DESTINATION bin COMPONENT avm-sdk)
install(FILES "${AVM_DEBUG_RUNTIME_HEX}" "${AVM_DEBUG_RUNTIME_BOUNDARY}"
    DESTINATION bin/avm COMPONENT avm-sdk)
install(TARGETS liblldb RUNTIME DESTINATION bin COMPONENT avm-sdk
    LIBRARY DESTINATION bin COMPONENT avm-sdk)
