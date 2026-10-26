include_guard(GLOBAL)

function(avm_enable_llvm_pch directory)
    get_property(targets DIRECTORY "${directory}" PROPERTY BUILDSYSTEM_TARGETS)
    foreach(target IN LISTS targets)
        get_target_property(target_type "${target}" TYPE)
        if(target_type MATCHES "^(STATIC_LIBRARY|SHARED_LIBRARY|MODULE_LIBRARY|OBJECT_LIBRARY|EXECUTABLE)$")
            # Build each PCH with its target's own flags and definitions. Common
            # standard headers also work for LLVM's Clang, LLD and LLDB targets.
            # CMake's CMAKE_DISABLE_PRECOMPILE_HEADERS remains the opt-out.
            target_precompile_headers("${target}" PRIVATE
                "$<$<COMPILE_LANGUAGE:CXX>:<algorithm$<ANGLE-R>>"
                "$<$<COMPILE_LANGUAGE:CXX>:<memory$<ANGLE-R>>"
                "$<$<COMPILE_LANGUAGE:CXX>:<string$<ANGLE-R>>"
                "$<$<COMPILE_LANGUAGE:CXX>:<utility$<ANGLE-R>>"
                "$<$<COMPILE_LANGUAGE:CXX>:<vector$<ANGLE-R>>")
        endif()
    endforeach()

    get_property(subdirectories DIRECTORY "${directory}" PROPERTY SUBDIRECTORIES)
    foreach(subdirectory IN LISTS subdirectories)
        avm_enable_llvm_pch("${subdirectory}")
    endforeach()
endfunction()
