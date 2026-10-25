foreach(kernel sf_floor sf_ceil sf_round sf_trunc)
    execute_process(
        COMMAND "${AVM_NM}" --undefined-only "${AVM_OBJECT_DIR}/math_${kernel}.o"
        RESULT_VARIABLE result
        OUTPUT_VARIABLE symbols
        ERROR_VARIABLE error)
    if(NOT result EQUAL 0)
        message(FATAL_ERROR "Cannot inspect ${kernel}: ${error}")
    endif()
    if(symbols MATCHES "__avm_(ashl|lshr|ashr)si3")
        message(FATAL_ERROR "${kernel} still calls a 32-bit shift helper: ${symbols}")
    endif()
endforeach()
message(STATUS "All four rounding kernels are free of 32-bit shift helpers")
