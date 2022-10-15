# 3.9.6 is the last version of cmake that can be compiled using c++98
cmake_minimum_required(VERSION 3.9.6 FATAL_ERROR)

project(cpp-project-template
    VERSION 0.1.0
    LANGUAGES C CXX
)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
include(CheckOSType)
include(SetRuntimeDir)

configure_file(${PROJECT_SOURCE_DIR}/resources/version.rc.in version.rc @ONLY)
configure_file(${PROJECT_SOURCE_DIR}/config.h.in config.h @ONLY)
include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_executable(cpp-project-template
    src/main.cpp
    ${CMAKE_BINARY_DIR}/version.rc
)