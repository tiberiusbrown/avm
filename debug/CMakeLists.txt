set(AVM_LLDB_EXE
    "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}")
set(AVM_DEBUG_RUNTIME_DIR "${AVM_SDK_BUILD_BIN}/avm")
set(AVM_DEBUG_RUNTIME_ELF "${AVM_DEBUG_RUNTIME_DIR}/interp.elf")
set(AVM_DEBUG_RUNTIME_BOUNDARY
    "${AVM_DEBUG_RUNTIME_DIR}/interp-boundary.json")
add_custom_command(
    OUTPUT "${AVM_LLDB_EXE}"
           "${AVM_DEBUG_RUNTIME_ELF}"
           "${AVM_DEBUG_RUNTIME_BOUNDARY}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${AVM_DEBUG_RUNTIME_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "$<TARGET_FILE:lldb>" "${AVM_LLDB_EXE}"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_INTERPRETER_ELF}" "${AVM_DEBUG_RUNTIME_ELF}"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_INTERPRETER_BOUNDARY_METADATA}"
            "${AVM_DEBUG_RUNTIME_BOUNDARY}"
    DEPENDS lldb avm_interpreter_boundary avm_interpreter_sdk avm_sdk_tools
    VERBATIM)
add_custom_target(avm_lldb DEPENDS
    "${AVM_LLDB_EXE}"
    "${AVM_DEBUG_RUNTIME_ELF}"
    "${AVM_DEBUG_RUNTIME_BOUNDARY}")
add_dependencies(avm_toolchain avm_lldb)

add_executable(avm_prof AvmProf.cpp)
set_target_properties(avm_prof PROPERTIES
    OUTPUT_NAME "avm-prof"
    RUNTIME_OUTPUT_DIRECTORY "${AVM_SDK_BUILD_BIN}")
target_compile_features(avm_prof PRIVATE cxx_std_17)
target_include_directories(avm_prof PRIVATE
    "${PROJECT_SOURCE_DIR}/deps/llvm-project/lldb/include"
    "${CMAKE_BINARY_DIR}/llvm-build/tools/lldb/include")
target_link_libraries(avm_prof PRIVATE avm_profile liblldb)
add_dependencies(avm_prof avm_sdk_tools avm_lldb)
add_dependencies(avm_toolchain avm_prof)
install(TARGETS avm_prof RUNTIME DESTINATION bin COMPONENT avm-sdk)
install(FILES "${AVM_DEBUG_RUNTIME_ELF}"
    DESTINATION bin/avm COMPONENT avm-sdk)
install(PROGRAMS "${AVM_LLDB_EXE}" DESTINATION bin COMPONENT avm-sdk)
install(FILES "${AVM_DEBUG_RUNTIME_BOUNDARY}"
    DESTINATION bin/avm COMPONENT avm-sdk)
install(TARGETS liblldb RUNTIME DESTINATION bin COMPONENT avm-sdk
    LIBRARY DESTINATION bin COMPONENT avm-sdk)
