# Copyright (c) 2026, Michael Tesch
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cppduals)

# DOCUMENTATION_START {
hunter_add_package(cppduals)
find_package(cppduals CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo cppduals::duals)
# DOCUMENTATION_END }

set_target_properties(foo PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED YES)
