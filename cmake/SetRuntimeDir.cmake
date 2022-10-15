include(CMakeParseArguments)

# set runtime directory
function(set_runtime_dir)
    if(${ARGC} LESS 2)
        message(FATAL "invalid input arguments: ${ARGV}")
    endif()

    set(_idx 0)
    set(_max 0)
    math(EXPR _max "${ARGC}-1")
    set(_dir ${ARGV${_max}})

    while(_idx LESS _max)
        set(_target ${ARGV${_idx}})
        math(EXPR _idx "${_idx}+1")

        if(MSVC)
            set_target_properties(${_target} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${_dir})
            set_target_properties(${_target} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG ${_dir})
            set_target_properties(${_target} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RELEASE ${_dir})
            set_target_properties(${_target} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_MinSizeRel ${_dir})
            set_target_properties(${_target} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RelWithDebInfo ${_dir})
        else()
            set_target_properties(${_target} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${_dir}
            )
        endif()
    endwhile()
endfunction()