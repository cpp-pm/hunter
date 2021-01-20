# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-SPIRV-Tools)

# DOCUMENTATION_START {
hunter_add_package(SPIRV-Tools)
find_package(SPIRV-Tools CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC SPIRV-Tools::SPIRV-Tools)
# DOCUMENTATION_END }
