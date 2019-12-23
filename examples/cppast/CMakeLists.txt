# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(cppast)

# DOCUMENTATION_START {
hunter_add_package(cppast)
find_package(cppast CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC cppast::cppast)
# DOCUMENTATION_END }
