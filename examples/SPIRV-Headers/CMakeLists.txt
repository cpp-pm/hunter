# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-spirv-headers)

# DOCUMENTATION_START {
hunter_add_package(SPIRV-Headers)
find_package(SPIRV-Headers CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC SPIRV-Headers::SPIRV-Headers)
# DOCUMENTATION_END }
