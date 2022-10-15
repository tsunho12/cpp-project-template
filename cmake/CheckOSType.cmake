# check os type
if(WIN32)
    set(OS_WINDOWS TRUE)
elseif(UNIX)
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(OS_LINUX TRUE)
    endif()
endif()
