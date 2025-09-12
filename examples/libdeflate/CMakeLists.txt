# Copyright (c) 2025, NeroBurner
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-libdeflate)

# DOCUMENTATION_START {
hunter_add_package(libdeflate)
find_package(libdeflate CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC libdeflate::libdeflate_static)
# DOCUMENTATION_END }
