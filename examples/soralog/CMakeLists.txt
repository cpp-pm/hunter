# Copyright (c) 2026, Dmitriy Khaustov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-soralog)

# DOCUMENTATION_START {
hunter_add_package(soralog)
find_package(soralog CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC soralog::soralog soralog::yaml)
# DOCUMENTATION_END }

set_target_properties(boo PROPERTIES CXX_STANDARD 20 CXX_STANDARD_REQUIRED YES)
