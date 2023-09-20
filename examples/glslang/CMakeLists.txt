# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)
include("../common.cmake")

project(download-glslang)

# DOCUMENTATION_START {
hunter_add_package(glslang)
find_package(glslang CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC glslang::glslang)
# DOCUMENTATION_END }
