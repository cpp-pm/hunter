# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-spirv-cross)

# DOCUMENTATION_START {
hunter_add_package(spirv-cross)
find_package(spirv_cross_core CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC spirv-cross-core)
# DOCUMENTATION_END }
